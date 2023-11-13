import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgo_task/shared/constants.dart';
import '../../model/hotel_model.dart';
import '../../modules/filter/filter.dart';
import '../../modules/sort/sort.dart';
import '../../shared/network/dio_helper.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final Connectivity connectivity;

  HotelCubit({required this.connectivity}) : super(HotelInitialState()) {
    monitorInternetConnection();
  }

  static HotelCubit get(context) => BlocProvider.of<HotelCubit>(context);

  List<HotelModel> hotelList = [];

  void getHotelsList() async {
    final isConnected = await checkInternetConnection();
    if (isConnected) {
      emit(GetHotelsDataLoadingState());
      DioHelper.getData(url: AppConstants.hotelsListEndpoint).then((value) {
        hotelList = (value.data as List)
            .map((x) => HotelModel.fromJson(x))
            .toList();
        emit(GetHotelsDataSucceedState());
      }).catchError((error) {
        emit(GetHotelsDataFailedState(error.toString()));
      });
    } else {
      emit(AppIsDisconnectedState());
    }
  }

  Future<void> monitorInternetConnection() async {
    final isConnected = await checkInternetConnection();
    if (isConnected) {
      emit(AppIsConnectedState());
    } else {
      emit(AppIsDisconnectedState());
    }

    connectivity.onConnectivityChanged.listen((result) {
      final isConnected = result != ConnectivityResult.none;
      if (isConnected) {
        emit(AppIsConnectedState());
        getHotelsList();
      } else {
        emit(AppIsDisconnectedState());
      }
    });

  }

  Future<bool> checkInternetConnection() async {
    final connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future displayFilterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.bottomSheetRadios),
        ),
      ),
      context: context,
      builder: (context) => const BottomSheetFilterCard(),
    );
  }

  Future displaySortBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.bottomSheetRadios),
        ),
      ),
      context: context,
      builder: (context) => const BottomSheetSortCard(),
    );
  }
}

