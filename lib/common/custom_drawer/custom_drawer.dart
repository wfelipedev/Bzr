import 'package:bzr/common/custom_drawer/widgets/custom_header.dart';
import 'package:bzr/common/custom_drawer/widgets/icon_section.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            CustomHeader(),
            IconSection(),
          ],
        ),
      ),
    );
  }
}
