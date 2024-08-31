import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/HomeScreenController.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  @override
  void initState()
  {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async
    {
      await context.read<HomeScreenController>().fetchData();
    });
  }
  @override
  Widget build(BuildContext context)
  {
    final homeProvider = context.watch<HomeScreenController>();

    return Scaffold(
      body: ListView.builder(
          itemBuilder: (context, index) => Container(
            child: Center(
              child: Text("data"),
            ),
          )),
    );
  }
}
