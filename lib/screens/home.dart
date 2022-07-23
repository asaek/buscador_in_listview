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
  @override
  Widget build(BuildContext context) {
    final listaBusqueda =
        Provider.of<BuscadorProvider>(context, listen: true).getListaBusqueda;

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
