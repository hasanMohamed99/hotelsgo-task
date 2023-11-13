part of 'hotel_cubit.dart';

abstract class HotelState {}

class HotelInitialState extends HotelState {}

class GetHotelsDataSucceedState extends HotelState {}

class GetHotelsDataLoadingState extends HotelState {}

class GetHotelsDataFailedState extends HotelState {
  final String error;

  GetHotelsDataFailedState(this.error);
}

class AppIsConnectedState extends HotelState {}

class AppIsDisconnectedState extends HotelState {}
