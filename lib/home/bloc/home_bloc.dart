import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api_calling/home/services/connectivityService.dart';
import 'package:flutter_bloc_api_calling/home/services/picsumPhotosService.dart';
import 'package:flutter_bloc_api_calling/utils/common_utils.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PicsumPhotosService _picsumPhotosService;
  final ConnectivityService _connectivityService;

  HomeBloc(this._picsumPhotosService, this._connectivityService) : super(HomeLoadingState()) {

    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
        print('No Internet');
        showToast('No Internet');
      }else{
        print('Yes Internet');
        add(LoadApiEvent());
      }
    });


    on<LoadApiEvent>((event, emit) async {
      emit(HomeLoadingState());
      final activity = await _picsumPhotosService.getPicsumPhotosActivity();
      emit(HomeLoadedState(activity.id, activity.author, activity.downloadUrl));
    });

    on<NoInternetEvent>((event, emit){
      emit(HomeNoInternetState());
    });
  }
}
