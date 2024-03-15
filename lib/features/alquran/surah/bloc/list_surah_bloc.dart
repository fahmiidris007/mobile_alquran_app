import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/data/datasource/remote/api_service.dart';
import 'package:mobile_alquran_app/data/models/surah_list.dart';

part 'list_surah_event.dart';
part 'list_surah_state.dart';

class ListSurahBloc extends Bloc<ListSurahEvent, ListSurahState> {
  ListSurahBloc() : super(ListSurahInitial()) {
    on<FetchListSurah>(_onFetchListSurah);
  }

  void _onFetchListSurah(
    FetchListSurah event,
    Emitter<ListSurahState> emit,
  ) async {
    emit(ListSurahLoading());
    try {
      final listSurah = await ApiServices().getSurahList();
      emit(ListSurahLoaded(listSurah));
    } catch (e) {
      debugPrint("error: $e.toString()");
      emit(ListSurahError(e.toString()));
    }
  }
}
