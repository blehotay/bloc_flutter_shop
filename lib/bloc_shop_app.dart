import 'package:bloc_shop_app/features/shop/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class BlocShopApp extends StatefulWidget {
  final Widget? home;

  const BlocShopApp({Key? key, this.home}) : super(key: key);

  @override
  State<BlocShopApp> createState() => _BlocShopAppState();
}

class _BlocShopAppState extends State<BlocShopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {'/shop': (_) => const ShopAppScreen()},
        initialRoute: '/shop',
        home: widget.home);
  }
}
