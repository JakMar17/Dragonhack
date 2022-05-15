import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/dogodki/dogodki_bloc.dart';
import '../../services/backend_service.dart';
import '../../style/colors.dart';
import '../../style/images.dart';
import '../../style/styles.dart';
import '../loading_indicator.dart';

class DogodkiTab extends StatelessWidget {
  const DogodkiTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogodkiBloc>(
      create: (context) => DogodkiBloc(backendService: BackendService.instance),
      child: const _DogodkiTab(),
    );
  }
}

class _DogodkiTab extends StatelessWidget {
  const _DogodkiTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DogodkiBloc bloc = BlocProvider.of<DogodkiBloc>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: EPColor.backgroud,
        middle: Text(
          "Dogodki",
          style: VecStyles.pageTitleTextStyle(context),
        ),
      ),
      child: BlocConsumer<DogodkiBloc, DogodkiState>(
        listener: (context, state) {
          if (state.failure != null) {
            showCupertinoDialog(
                context: context,
                builder: (context2) {
                  return CupertinoAlertDialog(
                    title: const Text("Can't load data"),
                    actions: <Widget>[
                      CupertinoDialogAction(
                          isDefaultAction: true,
                          child: const Text("Retry"),
                          onPressed: () {
                            Navigator.of(context2).pop();
                            BlocProvider.of<DogodkiBloc>(context).refresh();
                          })
                    ],
                  );
                });
          }
        },
        builder: (context, state) {
          if (!state.initialized) {
            return const Center(
              child: LoadingIndicator(
                radius: 25.0,
                dotRadius: 8.0,
              ),
            );
          }
          return const CustomScrollView(slivers: []);
        },
      ),
    );
  }
}
