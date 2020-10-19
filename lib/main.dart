import 'package:bzr/blocs/drawer_bloc.dart';
import 'package:bzr/blocs/home_bloc.dart';
import 'package:bzr/constants.dart';
import 'package:bzr/screens/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBloc>(
          create: (_) => DrawerBloc(),
          dispose: (context, value) => value.dispose(),
        ),
        Provider<HomeBloc>(
          create: (_) => HomeBloc(),
          dispose: (context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bzr',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Poppins',
        ),
        home: BaseScreen(),
      ),
    );
  }
}
