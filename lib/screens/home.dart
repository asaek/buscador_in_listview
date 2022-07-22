import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_listview/providers/providers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BusquedaListView(),
    );
  }
}

class BusquedaListView extends StatelessWidget {
  // TextEditingController editingController = TextEditingController();

  // final List<String> duplicateItems =
  //     List<String>.generate(10000, (i) => "Item $i");

  // List<String> items = [];

  // @override
  // void initState() {
  //   items.addAll(duplicateItems);

  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  // void filterSearchResults(String query) {
  //   List<String> dummySearchList = [];

  //   dummySearchList.addAll(duplicateItems);

  //   if (query.isNotEmpty) {
  //     List<String> dummyListData = [];

  //     dummySearchList.forEach((item) {
  //       if (item.contains(query)) {
  //         dummyListData.add(item);
  //       }
  //     });

  //     setState(() {
  //       items.clear();
  //       items.addAll(dummyListData);
  //     });
  //     return;
  //   } else {
  //     setState(() {
  //       items.clear();
  //       items.addAll(duplicateItems);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final listaBusqueda =
        Provider.of<BuscadorProvider>(context, listen: true).getListaBusqueda;
    // final textoBuscado =
    //     Provider.of<BuscadorProvider>(context, listen: false).getBusqueda;

    // if (textoBuscado == '') {
    //   Provider.of<BuscadorProvider>(context, listen: false)
    //       .clearListaBusqueda();
    // }
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                Provider.of<BuscadorProvider>(context, listen: false)
                    .setBusqueda = value;
              },
              // controller: editingController,
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
            itemCount: listaBusqueda.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(
                listaBusqueda[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
