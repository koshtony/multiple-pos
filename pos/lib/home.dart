import 'package:flutter/material.dart';
import 'package:pos/api_ops.dart';
import 'package:pos/sales.dart';
import 'package:pos/models.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final names = getStocks();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("sales management system"),
          backgroundColor: Colors.blue,
        ),
        drawer: Row(
          children: [
            SidebarX(
                controller:
                    SidebarXController(selectedIndex: 0, extended: true),
                items: const [
                  SidebarXItem(icon: Icons.dashboard, label: "Dashboard"),
                  SidebarXItem(
                      icon: Icons.shopping_basket_sharp, label: "counter"),
                  SidebarXItem(icon: Icons.list, label: "sales"),
                ]),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              HomeCard(title: "Total stocks", names: names),
              HomeCard(title: "Total sales", names: names),
            ],
          ),
        ));
  }
}

class HomeCard extends StatelessWidget {
  final Future<List<Stocks>> names;
  const HomeCard({
    super.key,
    required this.title,
    required this.names,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(title),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ItemCounter(names: names),
              ));
            },
            child: Text("view"),
          )
        ],
      ),
    );
  }
}
