import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/global/global_bloc.dart';
import '../../../bloc/kartice/kartice_bloc.dart';
import '../../../router/routes.dart';
import '../../../style/colors.dart';
import '../../../style/images.dart';
import '../../../style/styles.dart';
import '../../../widgets/vec_button.dart';

class KarticeTab extends StatelessWidget {
  const KarticeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<KarticeBloc>(
      create: (context) => KarticeBloc(globalBloc: GlobalBloc.instance),
      child: const _KarticeTab(),
    );
  }
}

class _KarticeTab extends StatelessWidget {
  const _KarticeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kartice'),
      ),
    );
  }
}
