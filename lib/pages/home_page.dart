import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spots/pages/item_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollViewController = ScrollController();

  bool scheduleSelected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollViewController,
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Theme.of(context).colorScheme.surface,
              ),
              title: Text(
                "Meerut",
                style: TextStyle(fontSize: 16),
              ),
            ),
            pinned: true,
            stretch: true,
            expandedHeight: size.height * 0.1,
            elevation: 0,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                  childAspectRatio: 1.5),
              itemCount: 30, // total number of items
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => ItemPage(itemname: "momos"),
                      )),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        borderRadius:
                            BorderRadius.circular(20)), // color of grid items
                    child: Center(
                      child: Text(
                        "Meerut",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
