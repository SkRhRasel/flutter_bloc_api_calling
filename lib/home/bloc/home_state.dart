part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState{

  final String id;
  final String author;
  final String downloadUrl;


  HomeLoadedState(this.id, this.author, this.downloadUrl);


  @override
  // TODO: implement props
  List<Object?> get props => [id,author,downloadUrl];

}

class HomeNoInternetState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}