import 'dart:io';
import 'dart:ui';

import 'package:eventpay/widgets/vec_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/global/global_bloc.dart';
import '../bloc/kartice/kartice_bloc.dart';
import '../models/card.dart';
import '../router/routes.dart';
import '../services/backend_service.dart';
import '../style/colors.dart';
import '../style/images.dart';
import '../style/styles.dart';
import '../util/failures/backend_failure.dart';
import '../util/failures/failure.dart';
import '../util/failures/validation_failure.dart';
import '../widgets/vec_card.dart';
import 'loading_indicator.dart';

class KarticaDetailsScreen extends StatelessWidget {
  const KarticaDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => KarticeBloc(globalBloc: GlobalBloc.instance),
        child: const _KarticaDetailsScreen());
  }
}

class _KarticaDetailsScreen extends StatelessWidget {
  const _KarticaDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KarticeBloc, KarticeState>(
      builder: (context, state) {
        /* print("state: ${state.cards}");
        final List<EventPayCard>? card = state.cards; */
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: EPColor.backgroud,
            middle: Text(
              "Super event 12",
              style: EPStyles.pageTitleTextStyle(context),
            ),
          ),
          child: BlocBuilder<KarticeBloc, KarticeState>(
            builder: (context, state) {
              if (!state.initialized && state.isSuccessful == null) {
                return const Center(
                  child: LoadingIndicator(
                    radius: 25.0,
                    dotRadius: 8.0,
                  ),
                );
              } else if (state.isSuccessful == false) {
                return Container(
                    color: EPColor.resolveColor(context, EPColor.backgroud));
              }
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        SizedBox(
                          height: 200,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              SvgPicture.asset(EPImage.logo, fit: BoxFit.cover),
                              ClipRRect(
                                // Clip it cleanly.
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.1),
                                    alignment: Alignment.center,
                                    child: Text('CHOCOLATE'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24.0)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            width: double.infinity,
                            height: 170,
                          ),
                          Positioned(
                            top: 21,
                            left: 90,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.stack.imgur.com/YLy3V.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              width: 128,
                              height: 128,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "23.00€",
                      style: TextStyle(
                        fontSize: 50,
                        color: EPColor.highlightColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "DATUM",
                      style: TextStyle(
                        fontSize: 16,
                        color: EPColor.highlightColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "3. 5. 2022 - 24. 5. 2022",
                      style: TextStyle(
                        fontSize: 26,
                        color: EPColor.highlightColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "LOKACIJA",
                      style: TextStyle(
                        fontSize: 16,
                        color: EPColor.highlightColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "ROŽNA DOLINA",
                      style: TextStyle(
                        fontSize: 26,
                        color: EPColor.highlightColor,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: VecTextShadowButton.filled(
                            text: "POLNI KATICO",
                            textStyle: EPStyles.buttonTextStyle(context),
                            color: EPColor.backgroud,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: VecTextShadowButton.filled(
                            color: EPColor.backgroud,
                            text: "TRANSAKCIJE",
                            textStyle: EPStyles.buttonTextStyle(context),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: VecTextShadowButton.filled(
                            color: EPColor.backgroud,
                            text: "PRIKAŽI CENIK",
                            textStyle: EPStyles.buttonTextStyle(context),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

String getBackendFailureMessage(Failure failure) {
  if (failure is PreconditionFailedBackendFailure) {
    return "You don't have a vehicle added!";
  } else {
    return "Something went wrong. Please try again later.";
  }
}

String getValidationMessage(Failure failure) {
  if (failure is AddressValidationFailure) {
    return "Please enter valid address";
  } else if (failure is DateValidationFailure) {
    return "Please enter valid date";
  } else if (failure is IntegerParsingFailure) {
    return "Please enter valid number of available seats";
  } else if (failure is PriceValidationFailure) {
    return "Please enter a valid price";
  } else {
    return "Unknown error";
  }
}
