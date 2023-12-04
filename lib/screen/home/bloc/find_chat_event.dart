part of 'find_chat_bloc.dart';

abstract class HomeEvent extends Equatable {}

class HomeLoginEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeSaveProfileEvent extends HomeEvent {
  final String firstName;
  final String lastName;
  final String fatherName;

  HomeSaveProfileEvent({
    required this.firstName,
    required this.lastName,
    required this.fatherName,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        fatherName,
      ];
}
