part of 'detail_surah_bloc.dart';

sealed class DetailSurahState extends Equatable {
  const DetailSurahState();

  @override
  List<Object> get props => [];
}

final class DetailSurahInitial extends DetailSurahState {}

final class DetailSurahLoading extends DetailSurahState {}

final class DetailSurahLoaded extends DetailSurahState {
  final SurahDetail surahDetail;
  const DetailSurahLoaded(this.surahDetail);

  @override
  List<Object> get props => [surahDetail];
}

final class DetailSurahError extends DetailSurahState {
  final String message;
  const DetailSurahError(this.message);

  @override
  List<Object> get props => [message];
}
