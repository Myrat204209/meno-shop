import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meno_shop/auth/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState.initial()) {
    on<AuthSendOtpRequested>(_onSendOtpRequested);
    on<AuthCheckOtpRequested>(_onCheckOtpRequested);
    on<AuthUserGetRequested>(_onUserGetRequested);
    on<AuthUserPutRequested>(_onUserPutRequested);
  }
  final AuthRepository _authRepository;
  FutureOr<void> _onSendOtpRequested(
    AuthSendOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));

      await _authRepository.sendOtp(
        sendOtp: AuthRequestBody(event.phone, null),
      );

      emit(state.copyWith(status: AuthStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AuthStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onCheckOtpRequested(
    AuthCheckOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));

      await _authRepository.checkOtp(
        checkOtp: AuthRequestBody(event.phone, event.otp),
      );

      emit(state.copyWith(
        status: AuthStatus.success,
        user: User.anonymous(phoneNumber: event.phone),
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AuthStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onUserGetRequested(
    AuthUserGetRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));

      final user = await _authRepository.getMe();

      emit(state.copyWith(
        status: AuthStatus.success,
        user: user,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AuthStatus.failure));
      addError(error, stackTrace);
    }
  }

  FutureOr<void> _onUserPutRequested(
    AuthUserPutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));

      final user = await _authRepository.putMe(userBody: event.userBody);

      emit(state.copyWith(
        status: AuthStatus.success,
        user: user,
      ));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: AuthStatus.failure));
      addError(error, stackTrace);
    }
  }
}