import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../services/backend_service.dart';
import '../../util/either.dart';
import '../../util/failures/backend_failure.dart';
import '../global/global_bloc.dart';

part 'kartice_event.dart';
part 'kartice_state.dart';

class KarticeBloc extends Bloc<_KarticeEvent, KarticeState> {
  late final StreamSubscription _offersSubscription;
  late final StreamSubscription _ridesSubscription;
  final GlobalBloc _globalBloc;
  KarticeBloc({required GlobalBloc globalBloc})
      : _globalBloc = globalBloc,
        super(const KarticeState.initial()) {
    on<_Initialize>(_onInitialize);
    on<_Reset>(_onReset);

    add(_Initialize());
  }

  @override
  Future<void> close() async {
    await _ridesSubscription.cancel();
    await _offersSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _onInitialize(
    _Initialize event,
    Emitter<KarticeState> emit,
  ) async {
    emit(state.copyWith(initialized: true));
  }

  FutureOr<void> _onReset(
    _Reset event,
    Emitter<KarticeState> emit,
  ) async {
    emit(const KarticeState.initial());
    add(_Initialize());
  }

  // Public API

  Future<void> refresh() async => add(_Initialize());

  void reset() async => add(_Reset());
}
