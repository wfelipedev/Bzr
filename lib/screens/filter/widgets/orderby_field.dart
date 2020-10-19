import 'package:bzr/constants.dart';
import 'package:bzr/models/filter.dart';
import 'package:flutter/material.dart';

class OrderByField extends StatelessWidget {
  final FormFieldSetter<OrderBy> onSaved;
  final OrderBy initialValue;

  OrderByField({this.initialValue, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return FormField<OrderBy>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                state.didChange(OrderBy.DATE);
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value == OrderBy.DATE
                        ? Colors.transparent
                        : kPrimaryColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  color: state.value == OrderBy.DATE
                      ? kPrimaryColor
                      : Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: state.value == OrderBy.DATE
                          ? Colors.grey[400]
                          : Colors.transparent,
                      blurRadius: 20,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  'Data',
                  style: TextStyle(
                    color: state.value == OrderBy.DATE
                        ? Colors.white
                        : kPrimaryColor,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                state.didChange(OrderBy.PRICE);
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value == OrderBy.PRICE
                        ? Colors.transparent
                        : kPrimaryColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  color: state.value == OrderBy.PRICE
                      ? kPrimaryColor
                      : Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: state.value == OrderBy.PRICE
                          ? Colors.grey[400]
                          : Colors.transparent,
                      blurRadius: 20,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  'Preço',
                  style: TextStyle(
                    color: state.value == OrderBy.PRICE
                        ? Colors.white
                        : kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
