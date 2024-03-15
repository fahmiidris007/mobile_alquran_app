part of 'intro_bloc.dart';

abstract class IntroState extends Equatable {
  const IntroState();
}

class IntroInitial extends IntroState {
  @override
  List<Object> get props => [];
}

//todo: input username
class InputUsernameState extends IntroState {
  final String name;

  const InputUsernameState(this.name);

  @override
  List<Object> get props => [name];
}
