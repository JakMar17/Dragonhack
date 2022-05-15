part of 'kartice_bloc.dart';

@immutable
class KarticeState {
  final bool initialized;
  final List<EventPayCard>? cards;
  final bool? isSuccessful;

  const KarticeState(
      {required this.initialized,
      required this.cards,
      required this.isSuccessful});

  const KarticeState.initial()
      : initialized = false,
        cards = null,
        isSuccessful = null;

  KarticeState copyWith(
      {bool? initialized, List<EventPayCard>? cards, bool? isSuccessful}) {
    return KarticeState(
        initialized: initialized ?? this.initialized,
        cards: cards ?? this.cards,
        isSuccessful: isSuccessful ?? this.isSuccessful);
  }
}
