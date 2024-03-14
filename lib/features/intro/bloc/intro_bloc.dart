import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    //todo: input username
    on<InputUsername>(_inputUsername);
  }

  late String name = '';

  void _inputUsername(InputUsername event, Emitter<IntroState> emit) {
    name = event.name;
    emit(InputUsernameState(name));
    debugPrint('|||| name: $name ||||');
  }
}
