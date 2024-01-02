import 'package:flutter/material.dart';
import 'package:pos/counter.dart';

import 'package:pos/models.dart';

class ItemCounter extends StatefulWidget {
  const ItemCounter({super.key, required this.names});

  final List<Stocks> names;

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  String activePage = 'Counter';

  views() {
    if (activePage == 'Counter') {
      return const CounterPage();
    } else if (activePage == 'Sales') {
      return Container();
    } else if (activePage == 'Orders') {
      return Container();
    } else {
      return Container();
    }
  }

  navigatePage(String page) {
    setState(() {
      activePage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text("counter"),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 8, 8),
        body: Row(
          children: [
            Container(
              width: 70,
              padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
              height: MediaQuery.of(context).size.height,
              child: sideMenu(),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(top: 24, right: 12),
              padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 37, 34, 34),
              ),
              child: views(),
            ))
          ],
        ));
  }

  Widget sideMenu() {
    return Column(
      children: [
        Expanded(
            child: ListView(
          children: [
            sideMenuList(name: "Counter", icon: Icons.shopping_basket),
            const SizedBox(
              height: 20,
            ),
            sideMenuList(name: "Sales", icon: Icons.list),
            const SizedBox(
              height: 20,
            ),
            sideMenuList(name: "Orders", icon: Icons.shield_sharp)
          ],
        ))
      ],
    );
  }

  Widget sideMenuList({required String name, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: GestureDetector(
        onTap: () => navigatePage(name),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        activePage == name ? Colors.green : Colors.transparent),
                duration: const Duration(microseconds: 300),
                curve: Curves.slowMiddle,
                child: Column(
                  children: [
                    Icon(icon, color: Colors.white),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ))),
      ),
    );
  }
}
