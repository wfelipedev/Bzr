import 'package:bzr/blocs/home_bloc.dart';
import 'package:bzr/common/custom_drawer/custom_drawer.dart';
import 'package:bzr/screens/home/widgets/search_dialog.dart';
import 'package:bzr/screens/home/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HomeBloc _homeBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final HomeBloc homeBloc = Provider.of<HomeBloc>(context);
    if (homeBloc != _homeBloc) _homeBloc = homeBloc;
  }

  @override
  Widget build(BuildContext context) {
    _openSearch(String currentSearch) async {
      final String search = await showDialog(
        context: context,
        builder: (context) => SearchDialog(currentSearch: currentSearch),
      );
      if (search != null) _homeBloc.setSearch(search);
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        title: StreamBuilder<String>(
          stream: _homeBloc.outSearch,
          initialData: '',
          builder: (context, snapshot) {
            if (snapshot.data.isEmpty)
              return Container();
            else
              return GestureDetector(
                onTap: () => _openSearch(snapshot.data),
                child: LayoutBuilder(
                  builder: (context, constrains) {
                    return Container(
                      child: Text(snapshot.data),
                      width: constrains.biggest.width,
                    );
                  },
                ),
              );
          },
        ),
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/menu2.svg'),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        centerTitle: true,
        actions: <Widget>[
          StreamBuilder<String>(
            stream: _homeBloc.outSearch,
            initialData: '',
            builder: (context, snapshot) {
              if (snapshot.data.isEmpty)
                return IconButton(
                  icon: SvgPicture.asset('assets/icons/search.svg'),
                  onPressed: () {
                    _openSearch('');
                  },
                );
              else
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _homeBloc.setSearch('');
                  },
                );
            },
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TopBar(),
        ],
      ),
    );
  }
}
