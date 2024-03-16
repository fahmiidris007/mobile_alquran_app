part of 'bookmark_bloc.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();
}

class FetchBookmark extends BookmarkEvent {
  @override
  List<Object> get props => [];
}

class AddBookmark extends BookmarkEvent {
  final SurahBookmark bookmark;
  const AddBookmark(this.bookmark);

  @override
  List<Object> get props => [bookmark];
}

class RemoveBookmark extends BookmarkEvent {
  final int id;
  const RemoveBookmark(this.id);

  @override
  List<Object> get props => [id];
}


