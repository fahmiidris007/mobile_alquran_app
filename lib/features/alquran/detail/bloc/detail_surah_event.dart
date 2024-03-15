part of 'detail_surah_bloc.dart';

sealed class DetailSurahEvent extends Equatable {
  const DetailSurahEvent();

  @override
  List<Object> get props => [];
}

final class FetchDetailSurah extends DetailSurahEvent {
  final int surahNumber;
  const FetchDetailSurah(this.surahNumber);

  @override
  List<Object> get props => [surahNumber];
}
