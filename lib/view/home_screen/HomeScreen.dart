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
      body:
      // ListView.builder(
      //     itemCount: homeProvider.newsData?.articles?.length ?? 0,
      //     itemBuilder: (context, index) => Container(
      //       child: Center(
      //         child: Text(homeProvider.newsData?.articles?[index].title.toString() ?? "No Data"),
      //       ),
      //     )),
      Consumer<HomeScreenController>(
        builder: (context, value,child) =>
            value.isLoading ? Center(child: CircularProgressIndicator(),)
            : RefreshIndicator(
              onRefresh: () async {
                await context.read<HomeScreenController>().fetchData();
              },
              child: ListView.builder(
                        itemCount: value.newsData?.articles?.length ?? 0,
              itemBuilder: (context, index) => Container(
                child: Center(
                  child: Text(value.newsData?.articles?[index].title.toString() ?? "No Data"),
                ),
              )),
            ),

      ),
    );
  }
}
