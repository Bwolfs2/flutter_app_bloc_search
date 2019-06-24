import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'home_bloc.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //add yours BLoCs controlles
      blocs: [
        Bloc((i) => HomeBloc()),
      ],
      //your main widget
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
