import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/place_autocomplete_model.dart';
import '../../repositories/repositories.dart';

part 'auto_complete_event.dart';
part 'auto_complete_state.dart';

class AutoCompleteBloc extends Bloc<AutoCompleteEvent, AutoCompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesStreamSubscription;

  AutoCompleteBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(AutoCompleteLoading());

  @override
  Stream<AutoCompleteState> mapEventToState(
      AutoCompleteEvent event) async* {
    if (event is LoadAutocomplete) {
      yield* _mapLoadAutoCompleteToState(event);
    }
  }

  Stream<AutoCompleteState> _mapLoadAutoCompleteToState(
      LoadAutocomplete loadAutocomplete) async* {
    _placesStreamSubscription?.cancel();

    final List<PlaceAutocomplete> autoComplete =
        await _placesRepository.getAutoCompete(loadAutocomplete.searchInput);

    yield AutoCompleteLoaded(placeAutocomplete: autoComplete);
  }
}
