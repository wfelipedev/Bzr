import 'package:bzr/common/custom_drawer/custom_drawer.dart';
import 'package:bzr/screens/home/widgets/search_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    _openSearch(String currentSearch) async {
      final String search = await showDialog(
        context: context,
        builder: (context) => SearchDialog(currentSearch: currentSearch),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bzr'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _openSearch('');
            },
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(249, 168, 38, 1),
      drawer: CustomDrawer(),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
