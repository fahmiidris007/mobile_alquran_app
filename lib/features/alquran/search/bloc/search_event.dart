part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class FetchSearch extends SearchEvent {
  final String query;
  FetchSearch(this.query);

  @override
  List<Object> get props => [query];
}
