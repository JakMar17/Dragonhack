part of 'kartice_bloc.dart';

@immutable
abstract class _KarticeEvent {}

class _Initialize extends _KarticeEvent {}

class _Reset extends _KarticeEvent {}
