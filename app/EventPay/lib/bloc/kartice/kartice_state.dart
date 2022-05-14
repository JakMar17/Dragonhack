part of 'kartice_bloc.dart';

@immutable
class KarticeState {
  final bool initialized;
  final bool? isSuccessful;

  const KarticeState({required this.initialized, required this.isSuccessful});

  const KarticeState.initial()
      : initialized = false,
        isSuccessful = null;

  KarticeState copyWith({bool? initialized, bool? isSuccessful}) {
    return KarticeState(
        initialized: initialized ?? this.initialized,
        isSuccessful: isSuccessful ?? this.isSuccessful);
  }
}
