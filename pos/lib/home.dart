import 'package:flutter/material.dart';
import 'package:pos/sales.dart';
import 'package:pos/models.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<Stocks> names = [
  Stocks(
    serial: "dec001",
    name: "soda",
    qty: 10,
    price: 30.0,
    cost: 25.0,
    image:
        "https://images.unsplash.com/photo-1561758033-48d52648ae8b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29jYSUyMGNvbGF8ZW58MHx8MHx8fDA%3D",
  ),
  Stocks(
    serial: "dec001",
    name: "soda",
    qty: 10,
    price: 30.0,
    cost: 25.0,
    image:
        "https://images.unsplash.com/photo-1561758033-48d52648ae8b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29jYSUyMGNvbGF8ZW58MHx8MHx8fDA%3D",
  ),
  Stocks(
    serial: "dec001",
    name: "soda",
    qty: 10,
    price: 30.0,
    cost: 25.0,
    image:
        "https://images.unsplash.com/photo-1561758033-48d52648ae8b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29jYSUyMGNvbGF8ZW58MHx8MHx8fDA%3D",
  ),
  Stocks(
    serial: "dec001",
    name: "soda",
    qty: 10,
    price: 30.0,
    cost: 25.0,
    image:
        "https://images.unsplash.com/photo-1561758033-48d52648ae8b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29jYSUyMGNvbGF8ZW58MHx8MHx8fDA%3D",
  )
];

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
  final List<Stocks> names;
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
