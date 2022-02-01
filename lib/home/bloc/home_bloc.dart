import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api_calling/home/services/boredService.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredServices _boredServices;

  HomeBloc(this._boredServices) : super(HomeLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      final activity = await _boredServices.getBoredActivity();
      emit(HomeLoadedState(activity.activity, activity.type, activity.participants));
    });
  }
}
