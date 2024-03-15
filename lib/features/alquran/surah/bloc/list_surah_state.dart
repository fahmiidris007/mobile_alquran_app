part of 'list_surah_bloc.dart';

sealed class ListSurahState extends Equatable {
  const ListSurahState();

  @override
  List<Object> get props => [];
}

final class ListSurahInitial extends ListSurahState {}

final class ListSurahLoading extends ListSurahState {}

final class ListSurahLoaded extends ListSurahState {
  final List<SurahList> listSurah;
  const ListSurahLoaded(this.listSurah);

  @override
  List<Object> get props => [listSurah];
}

final class ListSurahError extends ListSurahState {
  final String message;
  const ListSurahError(this.message);

  @override
  List<Object> get props => [message];
}
