import 'package:bzr/constants.dart';
import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  const IconTile({this.label, this.iconData, this.onTap, this.highlighted});

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          letterSpacing: .8,
          color: highlighted ? kPrimaryColor : Colors.black,
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? kPrimaryColor : Colors.black,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    );
  }
}
