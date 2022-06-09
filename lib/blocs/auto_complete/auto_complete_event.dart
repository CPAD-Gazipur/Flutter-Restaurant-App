part of 'auto_complete_bloc.dart';

abstract class AutoCompleteEvent extends Equatable {
  const AutoCompleteEvent();

  @override
  List<Object> get props => [];
}

class LoadAutocomplete extends AutoCompleteEvent{
  final String searchInput;

  const LoadAutocomplete({this.searchInput = ''});

  @override
  List<Object> get props => [searchInput];
}
