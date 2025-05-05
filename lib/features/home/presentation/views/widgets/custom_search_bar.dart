import 'package:flutter/material.dart';
import 'package:my_visitor/constants.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 35,
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              hintText: 'Search...',
              backgroundColor: WidgetStateProperty.all(Colors.white),
              controller: controller,
            //  enabled: false,
              padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: Icon(
                Icons.search,
                color: orangeColor,
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Smaller rounded corners
                ),
              ),
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(0, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          },
        ),
      ),
    );
  }
}
