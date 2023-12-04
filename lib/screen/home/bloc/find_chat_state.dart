part of 'find_chat_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLogin extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoginFailure extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeProfile extends HomeState {
  final Map<String, dynamic> data;

  HomeProfile({required this.data});
  @override
  List<Object?> get props => [data];
}

class HomeSaveProfile extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
