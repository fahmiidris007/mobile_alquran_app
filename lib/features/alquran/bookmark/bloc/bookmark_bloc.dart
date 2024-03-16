import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_alquran_app/data/datasource/local/database_repo.dart';
import 'package:mobile_alquran_app/data/models/surah_bookmark.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(BookmarkInitial()) {
    on<FetchBookmark>(_onFetchBookmark);
    on<AddBookmark>(_onAddBookmark);
    on<RemoveBookmark>(_onRemoveBookmark);
  }

  final DatabaseHelper _databaseRepo = DatabaseHelper();
  bool isBookmarked = false;

  Future<void> _onFetchBookmark(FetchBookmark event, Emitter<BookmarkState> emit) async {
    emit(BookmarkLoading());
    try {
      final result = await _databaseRepo.getSurah();
      emit(BookmarkLoaded(result));
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  Future<void> _onAddBookmark(AddBookmark event, Emitter<BookmarkState> emit) async {
    emit(BookmarkLoading());
    try {
      await _databaseRepo.insertSurah(event.bookmark);
      isBookmarked = true;
      final result = await _databaseRepo.getSurah();
      emit(BookmarkLoaded(result));
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  Future<void> _onRemoveBookmark(RemoveBookmark event, Emitter<BookmarkState> emit) async {
    emit(BookmarkLoading());
    try {
      await _databaseRepo.deleteSurah(event.id);
      isBookmarked = false;
      final result = await _databaseRepo.getSurah();
      emit(BookmarkLoaded(result));
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }
}
