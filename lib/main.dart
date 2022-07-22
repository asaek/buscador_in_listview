import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_listview/providers/providers.dart';
import 'package:search_listview/screens/screens.dart';

void main() => runApp(AppBusquedaListViewProvider());

class AppBusquedaListViewProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BuscadorProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
