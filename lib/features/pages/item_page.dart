import 'package:flutter/material.dart';
import 'package:spots/features/pages/add_places.dart';

class ItemPage extends StatefulWidget {
  String itemname;
  ItemPage({super.key, required this.itemname});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => AddPlaces(),
                ),
              )),
      appBar: AppBar(
        title: Text(widget.itemname),
        actions: [],
      ),
      body: Center(
        child: Text("Add Places"),
      ),
    );
  }
}
