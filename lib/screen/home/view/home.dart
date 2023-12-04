import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/screen/home/bloc/find_chat_bloc.dart';
import 'package:test_work/screen/home/widgets/login_content.dart';
import 'package:test_work/screen/home/widgets/profile_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc _bloc;
  @override
  void initState() {
    _bloc = HomeBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is HomeInitial) {
            return LoginContent(onLogin: () {
              _bloc.add(HomeLoginEvent());
            });
          }
          if (state is HomeProfile) {
            return ProfileContent(
              bio: state.data,
              onSave: (fname, lname, fatName) {
                _bloc.add(HomeSaveProfileEvent(
                  firstName: fname,
                  lastName: lname,
                  fatherName: fatName,
                ));
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
