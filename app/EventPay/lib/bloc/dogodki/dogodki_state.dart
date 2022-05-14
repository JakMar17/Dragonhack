part of 'dogodki_bloc.dart';

@immutable
class DogodkiState {
  final bool initialized;
  final int page;
  final int pageSize;
  final Failure? failure;

  const DogodkiState({
    required this.initialized,
    required this.page,
    required this.pageSize,
    required this.failure,
  });

  const DogodkiState.initial()
      : initialized = false,
        page = 0,
        pageSize = 10,
        failure = null;

  DogodkiState copyWith({
    bool? initialized,
    int? page,
    int? pageSize,
    Failure? failure,
  }) {
    return DogodkiState(
      initialized: initialized ?? this.initialized,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      failure: failure,
    );
  }
}
