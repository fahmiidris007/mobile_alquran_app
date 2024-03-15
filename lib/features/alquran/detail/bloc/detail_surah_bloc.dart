import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_alquran_app/data/datasource/remote/api_service.dart';
import 'package:mobile_alquran_app/data/models/surah_detail.dart';

part 'detail_surah_event.dart';
part 'detail_surah_state.dart';

class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  DetailSurahBloc() : super(DetailSurahInitial()) {
    on<FetchDetailSurah>(_onFetchDetailSurah);
  }

  Future<void> _onFetchDetailSurah(
    FetchDetailSurah event,
    Emitter<DetailSurahState> emit,
  ) async {
    emit(DetailSurahLoading());
    try {
      final surahDetail = await ApiServices().getDetailSurah(event.surahNumber);
      emit(DetailSurahLoaded(surahDetail));
    } catch (e) {
      emit(DetailSurahError(e.toString()));
    }
  }
}
