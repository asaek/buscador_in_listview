import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BusquedaListView(),
    );
  }
}

class BusquedaListView extends StatefulWidget {
  const BusquedaListView({
    Key? key,
  }) : super(key: key);

  @override
  State<BusquedaListView> createState() => _BusquedaListViewState();
}

class _BusquedaListViewState extends State<BusquedaListView> {
  TextEditingController editingController = TextEditingController();

  final List<String> duplicateItems =
      List<String>.generate(10000, (i) => "Item $i");

  List<String> items = [];

  @override
  void initState() {
    items.addAll(duplicateItems);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {},
              controller: editingController,
              decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(
                items[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
