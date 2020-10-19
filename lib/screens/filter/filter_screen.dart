import 'package:bzr/constants.dart';
import 'package:bzr/models/filter.dart';
import 'package:bzr/screens/filter/widgets/animated_button.dart';
import 'package:bzr/screens/filter/widgets/orderby_field.dart';
import 'package:bzr/screens/filter/widgets/price_range_field.dart';
import 'package:bzr/screens/filter/widgets/section_title.dart';
import 'package:bzr/screens/filter/widgets/vendor_type_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  Filter _filter = Filter(
    maxPrice: 1000,
    minPrice: 100,
    vendorType: VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL,
    orderBy: OrderBy.PRICE,
  );

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
        title: const Text('Filtrar Busca'),
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.all(16),
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 150,
                  child: SvgPicture.asset(
                    'assets/icons/searching_img.svg',
                  ),
                ),
                const SectionTitle(title: 'Ordenar por:'),
                OrderByField(
                  initialValue: _filter.orderBy,
                  onSaved: (value) {
                    _filter.orderBy = value;
                  },
                ),
                const SectionTitle(title: 'Preço (R\$):'),
                PriceRangeField(
                  filter: _filter,
                ),
                const SectionTitle(title: 'Tipo de anunciante:'),
                VendorTypeField(
                  initialValue: _filter.vendorType,
                  onSaved: (value) {
                    _filter.vendorType = value;
                  },
                ),
              ],
            ),
          ),
          AnimatedButton(
            scrollController: _scrollController,
            onTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (_filter.minPrice != null && _filter.maxPrice != null) {
                  if (_filter.maxPrice < _filter.minPrice) {
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text('Faixa de Preço invaliva. =['),
                        backgroundColor: kPrimaryColor,
                      ),
                    );
                    return;
                  }
                }
                //salvar e pesquisar anuncios
              }
            },
          )
        ],
      ),
    );
  }
}
