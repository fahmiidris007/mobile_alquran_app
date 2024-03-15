part of 'intro_bloc.dart';

abstract class IntroEvent extends Equatable {
  const IntroEvent();
}

//todo: input username
class InputUsername extends IntroEvent {
  final String name;

  const InputUsername(this.name);

  @override
  List<Object> get props => [name];
}
