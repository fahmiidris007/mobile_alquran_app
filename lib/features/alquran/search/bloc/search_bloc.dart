import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_alquran_app/data/models/surah_search.dart';

import '../../../../data/datasource/remote/api_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<FetchSearch>(_onFetchSearch);
  }

  Future<void> _onFetchSearch(
    FetchSearch event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    try {
      final listSearch = await ApiServices().getSurahByQuery().then((value) {
        return value.where((element) => element.namaLatin!.toLowerCase().contains(event.query.toLowerCase())).toList();
      });
      emit(SearchLoaded(listSearch));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
