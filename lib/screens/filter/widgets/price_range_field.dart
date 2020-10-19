import 'package:brasil_fields/brasil_fields.dart';
import 'package:bzr/helpers/format_field.dart';
import 'package:bzr/models/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bzr/models/filter.dart';

class PriceRangeField extends StatelessWidget {
  final Filter filter;

  PriceRangeField({this.filter});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              prefixText: 'R\$ ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(40),
                ),
              ),
              labelText: 'Preço min.',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            initialValue: filter.minPrice?.toString(),
            onSaved: (value) {
              if (value.isEmpty)
                filter.minPrice = null;
              else
                filter.minPrice = int.parse(
                  getSanitizedText(value),
                );
            },
            validator: (text) {
              if (text.isNotEmpty &&
                  int.tryParse(getSanitizedText(text)) == null)
                return 'Insira valores válidos. =[';
              return null;
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              prefixText: 'R\$ ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(40),
                ),
              ),
              labelText: 'Preço max.',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              RealInputFormatter(centavos: false),
            ],
            initialValue: filter.maxPrice?.toString(),
            onSaved: (value) {
              if (value.isEmpty)
                filter.maxPrice = null;
              else
                filter.maxPrice = int.parse(
                  getSanitizedText(value),
                );
            },
            validator: (text) {
              if (text.isNotEmpty &&
                  int.tryParse(getSanitizedText(text)) == null)
                return 'Insira valores válidos. =[';
              return null;
            },
          ),
        )
      ],
    );
  }
}
