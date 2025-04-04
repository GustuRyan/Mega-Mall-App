import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String)? onItemSelected;

  const CustomSearchBar({Key? key, this.onItemSelected}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late SearchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SearchController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          backgroundColor: MaterialStateProperty.all(Color(0xFFFAFAFA)),
          controller: _controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onTap: () {
            _controller.openView();
          },
          onChanged: (_) {
            _controller.openView();
          },
          leading: const Icon(Icons.search),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'Item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                _controller.closeView(item);
              });
              if (widget.onItemSelected != null) {
                widget.onItemSelected!(item);
              }
            },
          );
        });
      },
    );
  }
}
