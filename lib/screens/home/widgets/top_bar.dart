import 'package:bzr/constants.dart';
import 'package:bzr/screens/filter/filter_screen.dart';
import 'package:bzr/screens/home/widgets/bar_button.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        BarButton(
          label: 'Categorias',
          boxDecoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 20,
                offset: Offset(0, 2),
              )
            ],
          ),
          onPressed: () {},
        ),
        BarButton(
          label: 'Filtros',
          boxDecoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 20,
                offset: Offset(0, 2),
              )
            ],
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FilterScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
