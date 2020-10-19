import 'dart:async';

import 'package:bzr/blocs/drawer_bloc.dart';
import 'package:bzr/screens/account/account_screen.dart';
import 'package:bzr/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController _pageController = PageController();
  DrawerBloc _drawerBloc;
  StreamSubscription _drawerSubs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final DrawerBloc drawerBloc = Provider.of<DrawerBloc>(context);
    if (drawerBloc != _drawerBloc) {
      _drawerBloc = drawerBloc;
      _drawerSubs?.cancel();
      _drawerSubs = _drawerBloc.outPage.listen((page) {
        _pageController.jumpToPage(page);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _drawerSubs.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          Container(
            color: Colors.greenAccent,
          ),
          Container(
            color: Colors.pinkAccent,
          ),
          Container(
            color: Colors.redAccent,
          ),
          AccountScreen(),
        ],
      ),
    );
  }
}
