import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';

import '../../models/user.dart';
import '../../services/auth_service.dart';
import '../../util/either.dart';
import '../../util/failures/backend_failure.dart';
import '../../util/failures/failure.dart';
import '../../util/failures/validation_failure.dart';
import '../../util/validator.dart';
import '../global/global_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final GlobalBloc _globalBloc;
  final AuthService _authService;
  SignInBloc({
    required GlobalBloc globalBloc,
    required AuthService authService,
  })  : _globalBloc = globalBloc,
        _authService = authService,
        super(const SignInState.initial()) {
    on<SubmitSignIn>(onSubmitSignIn);
    on<EmailChanged>(onEmailChanged);
    on<PasswordChanged>(onPasswordChanged);
  }

  void emailChanged(String value) => add(EmailChanged(value));
  void passwordChanged(String value) => add(PasswordChanged(value));
  void signIn() => add(SubmitSignIn());

  FutureOr<void> onSubmitSignIn(
    SubmitSignIn event,
    Emitter<SignInState> emit,
  ) async {
    if (!EPValidator.isValidEmail(state.email)) {
      emit(state.copyWith(failure: const EmailValidationFailure()));
      return;
    }
    if (!EPValidator.isValidPassword(state.password)) {
      emit(state.copyWith(failure: const PasswordValidationFailure()));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final Either<BackendFailure, EventPayUser> userOrFailure =
        await _authService.login(state.email, state.password);

    if (userOrFailure.isError()) {
      emit(state.copyWith(
        isLoading: false,
        signInSuccessful: false,
        failure: userOrFailure.error,
      ));
      return;
    }

    _globalBloc.updateUser(userOrFailure.value);
    final LocalStorage storage = LocalStorage('user');
    storage.setItem('user', userOrFailure);
    print(storage.getItem('user'));

    emit(state.copyWith(isLoading: false, signInSuccessful: true));
  }

  FutureOr<void> onEmailChanged(
    EmailChanged event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(email: event.value));
  }

  FutureOr<void> onPasswordChanged(
    PasswordChanged event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(password: event.value));
  }
}
