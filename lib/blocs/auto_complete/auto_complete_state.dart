part of 'auto_complete_bloc.dart';

abstract class AutoCompleteState extends Equatable {
  const AutoCompleteState();

  @override
  List<Object> get props => [];
}

class AutoCompleteLoading extends AutoCompleteState {}

class AutoCompleteLoaded extends AutoCompleteState {
  final List<PlaceAutocomplete> placeAutocomplete;

  const AutoCompleteLoaded({required this.placeAutocomplete});

  @override
  List<Object> get props => [placeAutocomplete];
}

class AutoCompleteError extends AutoCompleteState {}
