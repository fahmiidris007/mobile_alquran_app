part of 'bookmark_bloc.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();
}

class BookmarkInitial extends BookmarkState {
  @override
  List<Object> get props => [];
}

class BookmarkLoading extends BookmarkState {
  @override
  List<Object> get props => [];
}

class BookmarkLoaded extends BookmarkState {
  final List<SurahBookmark> bookmarks;
  const BookmarkLoaded(this.bookmarks);

  @override
  List<Object> get props => [bookmarks];
}

class BookmarkError extends BookmarkState {
  final String message;
  const BookmarkError(this.message);

  @override
  List<Object> get props => [message];
}
