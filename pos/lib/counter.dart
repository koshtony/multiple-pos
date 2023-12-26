import 'package:flutter/material.dart';
import 'package:pos/home.dart';

class ItemCounter extends StatefulWidget {
  final List<String> names;

  const ItemCounter({super.key, required this.names});

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("counter"),
      ),
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: ((context, index) {
            return Card(
                child: Row(
              children: [
                Text(names[index]),
              ],
            ));
          })),
    );
  }
}
