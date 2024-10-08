import 'dart:async';

import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'language_event.dart';

const kDefaultLocale = Locale('tk');

class LanguageBloc extends HydratedBloc<LanguageEvent, Locale> {
  LanguageBloc() : super(kDefaultLocale) {
    on<LanguageChanged>(_onLanguageChanged);
  }

  FutureOr<void> _onLanguageChanged(
    LanguageChanged event,
    Emitter<Locale> emit,
  ) async {
    try {
      emit(event.locale);
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  Locale? fromJson(JsonType json) {
    final languageCode = json['languageCode'];
    return languageCode != null ? Locale(languageCode) : kDefaultLocale;
  }

  @override
  JsonType? toJson(Locale state) => {'languageCode': state.languageCode};
}
