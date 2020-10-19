import 'package:bzr/constants.dart';
import 'package:bzr/models/filter.dart';
import 'package:flutter/material.dart';

class VendorTypeField extends StatelessWidget {
  final FormFieldSetter<int> onSaved;
  final int initialValue;

  VendorTypeField({this.initialValue, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (state.value & VENDOR_TYPE_PARTICULAR != 0) {
                  if (state.value & VENDOR_TYPE_PROFESSIONAL != 0)
                    state.didChange(state.value & ~VENDOR_TYPE_PARTICULAR);
                  else
                    state.didChange(VENDOR_TYPE_PROFESSIONAL);
                } else {
                  state.didChange(state.value | VENDOR_TYPE_PARTICULAR);
                }
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value & VENDOR_TYPE_PARTICULAR != 0
                        ? Colors.transparent
                        : kPrimaryColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  color: state.value & VENDOR_TYPE_PARTICULAR != 0
                      ? kPrimaryColor
                      : Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: state.value & VENDOR_TYPE_PARTICULAR != 0
                          ? Colors.grey[400]
                          : Colors.transparent,
                      blurRadius: 20,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  'Particular',
                  style: TextStyle(
                    color: state.value & VENDOR_TYPE_PARTICULAR != 0
                        ? Colors.white
                        : kPrimaryColor,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (state.value & VENDOR_TYPE_PROFESSIONAL != 0) {
                  if (state.value & VENDOR_TYPE_PARTICULAR != 0)
                    state.didChange(state.value & ~VENDOR_TYPE_PROFESSIONAL);
                  else
                    state.didChange(VENDOR_TYPE_PARTICULAR);
                } else {
                  state.didChange(state.value | VENDOR_TYPE_PROFESSIONAL);
                }
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.value & VENDOR_TYPE_PROFESSIONAL != 0
                        ? Colors.transparent
                        : kPrimaryColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  color: state.value & VENDOR_TYPE_PROFESSIONAL != 0
                      ? kPrimaryColor
                      : Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: state.value & VENDOR_TYPE_PROFESSIONAL != 0
                          ? Colors.grey[400]
                          : Colors.transparent,
                      blurRadius: 20,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  'Profissional',
                  style: TextStyle(
                    color: state.value & VENDOR_TYPE_PROFESSIONAL != 0
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
