import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'find_chat_event.dart';
part 'find_chat_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoginEvent>((event, emit) async {
      emit(HomeLogin());
      final auth = FirebaseAuth.instance;
      final db = FirebaseFirestore.instance;
      try {
        await auth.signInAnonymously();
        final user = auth.currentUser;
        if (user != null) {
          final response = await db.collection('users').doc(user.uid).get();
          if (response.data() != null) {
            final doc = response.data();
            if (doc!.isNotEmpty) {
              emit(HomeProfile(data: doc));
              return;
            }
          }
          emit(HomeProfile(data: const {}));
        }
      } catch (e) {
        emit(HomeLoginFailure());
      }
    });
    on<HomeSaveProfileEvent>((event, emit) async {
      emit(HomeSaveProfile());
      final user = FirebaseAuth.instance.currentUser;
      final db = FirebaseFirestore.instance;
      if (user != null) {
        try {
          await db.collection('users').doc(user.uid).set({
            'firstName': event.firstName,
            'lastName': event.lastName,
            'fatherName': event.fatherName,
          });
          emit(HomeProfile(data: {
            'firstName': event.firstName,
            'lastName': event.lastName,
            'fatherName': event.fatherName,
          }));
        } catch (e) {
          emit(HomeLoginFailure());
        }
      }
    });
  }
}
