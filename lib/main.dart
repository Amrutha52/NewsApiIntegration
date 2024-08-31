import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newapiintegration/MyHttpOverrides.dart';
import 'package:newapiintegration/view/home_screen/HomeScreen.dart';
import 'package:provider/provider.dart';

import 'controller/HomeScreenController.dart';

void main()
{
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

