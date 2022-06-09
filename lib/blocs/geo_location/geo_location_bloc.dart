import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import '../../repositories/repositories.dart';

part 'geo_location_event.dart';
part 'geo_location_state.dart';

class GeoLocationBloc extends Bloc<GeoLocationEvent, GeoLocationState> {
  final GeoLocationRepository _geoLocationRepository;
  StreamSubscription? _geoLocationStreamSubscription;

  GeoLocationBloc({required GeoLocationRepository geoLocationRepository})
      : _geoLocationRepository = geoLocationRepository,
        super(GeoLocationLoading());

  @override
  Stream<GeoLocationState> mapEventToState(
      GeoLocationEvent event) async* {
    if (event is LoadGeoLocation) {
      yield* _mapGeoLocationToState();
    } else if (event is UpdateGeoLocation) {
      yield* _mapUpdateGeoLocationToState(event);
    }
  }

  Stream<GeoLocationState> _mapGeoLocationToState() async* {
    _geoLocationStreamSubscription?.cancel();
    final Position position = await _geoLocationRepository.getCurrentLocation();

    add(UpdateGeoLocation(position: position));
  }

  Stream<GeoLocationState> _mapUpdateGeoLocationToState(
      UpdateGeoLocation updateGeoLocation) async* {
    yield GeoLocationLoaded(position: updateGeoLocation.position);
  }

  @override
  Future<void> close(){
    _geoLocationStreamSubscription?.cancel();
    return super.close();
  }
}
