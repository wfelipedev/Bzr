import 'package:bzr/common/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
          title: Text('Minha conta'),
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/menu2.svg'),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
        ),
        drawer: CustomDrawer(),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              height: 150,
              child: SvgPicture.asset(
                'assets/icons/profile.svg',
              ),
            ),
          ],
        ));
  }
}
