import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/menu_page.dart';
import 'pages/detail_page.dart';
import 'pages/order_page.dart';
import 'pages/profile_page.dart';
import 'pages/page_one.dart';
import 'pages/page_two.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => HomePage(),
  '/menu': (context) => MenuPage(),
  '/detail': (context) => DetailPage(),
  '/order': (context) => OrderPage(),
  '/profile': (context) => ProfilePage(),
  '/page_one': (context) => PageOne(),
  '/page_two': (context) => PageTwo(),
};
