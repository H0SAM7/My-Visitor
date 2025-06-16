import 'package:flutter/material.dart';
import 'package:my_visitor/features/home/presentation/search_models/governorate_model.dart';
import 'package:my_visitor/features/home/presentation/views/governorate_details_view.dart';

class CustomSearchBar extends StatelessWidget {
  final List<Governorate> governorates;

  const CustomSearchBar({super.key, required this.governorates});

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<Governorate>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Governorate>.empty();
        }
        return governorates.where((Governorate gov) => gov.name
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
      },
      displayStringForOption: (Governorate option) => option.name,
      fieldViewBuilder:
          (context, controller, focusNode, onFieldSubmitted) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: 'Search Governorates...',
            prefixIcon: Icon(Icons.search, color: Colors.orange),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.white,
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final Governorate option = options.elementAt(index);
                  return ListTile(
                    title: Text(option.name),
                    onTap: () {
                      onSelected(option);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              GovernorateDetailsView(governorate: option),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
