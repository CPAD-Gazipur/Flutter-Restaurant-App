part of 'geo_location_bloc.dart';


abstract class GeoLocationState extends Equatable {
  const GeoLocationState();

  @override
  List<Object?> get props => [];
}

class GeoLocationLoading extends GeoLocationState {}

class GeoLocationLoaded extends GeoLocationState {

  final Position position;

  const GeoLocationLoaded({required this.position});

  @override
  List<Object?> get props => [position];
}

class GeoLocationError extends GeoLocationState {}
