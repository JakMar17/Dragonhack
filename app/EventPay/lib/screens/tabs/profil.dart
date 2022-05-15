import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/global/global_bloc.dart';
import '../../../bloc/profil/profil_bloc.dart';
import '../../router/routes.dart';
import '../../services/backend_service.dart';
import '../../style/colors.dart';
import '../../style/styles.dart';
import '../../util/failures/backend_failure.dart';
import '../../widgets/vec_button.dart';
import '../loading_indicator.dart';
import '../sign_in.dart';

final GlobalBloc _globalBloc = GlobalBloc.instance;

class ProfilTab extends StatelessWidget {
  const ProfilTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilBloc(
        backendService: BackendService.instance,
        globalBloc: _globalBloc,
      ),
      child: const _ProfilTab(),
    );
  }
}

class _ProfilTab extends StatelessWidget {
  const _ProfilTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilBloc bloc = BlocProvider.of<ProfilBloc>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: EPColor.backgroud,
        middle: Text(
          "Profil",
          style: EPStyles.pageTitleTextStyle(context),
        ),
      ),
      child: BlocConsumer<ProfilBloc, ProfilState>(
        listener: ((context, state) {
          if (state.failure is BackendFailure) {
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
                            bloc.reset();
                          })
                    ],
                  );
                });
          }
        }),
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: LoadingIndicator(
                dotRadius: 8,
                radius: 24,
              ),
            );
          }
          if (state.initialized == false || state.failure != null) {
            return const SizedBox();
          }
          return Stack(
            children: const [
              CustomScrollView(
                slivers: [],
              ),
            ],
          );
        },
      ),
    );
  }
}
