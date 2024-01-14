import 'package:flutter/material.dart';
import 'package:pos/home.dart';
import 'package:pos/models.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          children: [
            categoryMenu(
                name: "phillips bulb", desc: "phillips bulb 100 wats", qty: 10),
            Container(
                height: 100,
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryItemMenu(
                        name: "bulb",
                        image:
                            'https://images.unsplash.com/photo-1532007271951-c487760934ae?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGxpZ2h0JTIwYnVsYnxlbnwwfHwwfHx8MA%3D%3D',
                        qty: 10,
                        isClicked: true),
                    categoryItemMenu(
                        name: "bulb",
                        image:
                            'https://images.unsplash.com/photo-1532007271951-c487760934ae?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGxpZ2h0JTIwYnVsYnxlbnwwfHwwfHx8MA%3D%3D',
                        qty: 10,
                        isClicked: false),
                  ],
                )),
            Expanded(
              flex: 5,
              child: FutureBuilder(
                  future: names,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      const Text("No data");
                    } else if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0),
                        padding: const EdgeInsets.all(8.0),
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: ((context, index) {
                          return products(
                              image: snapshot.data![index].image,
                              name: snapshot.data![index].name,
                              category: snapshot.data![index].name,
                              price: snapshot.data![index].price);
                        }),
                      );
                    } else if (snapshot.hasError) {
                      return const Text("Data cannot be loaded");
                    }

                    return Container(
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }),
            ),
          ],
        )),
        Expanded(
            child: Column(children: [
          const Text("Order Items",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white)),
          const SizedBox(height: 20),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.black26),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sub Total ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          Text("Ksh ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("VAT ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          Text("Ksh ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: 2,
                          width: double.infinity,
                          color: Colors.white24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          Text("Ksh ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ))
                        ],
                      )
                    ],
                  ))),
          Expanded(
            child: ListView(children: [
              soldMenu(
                  name: "soda",
                  image:
                      "https://images.unsplash.com/photo-1561758033-48d52648ae8b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29jYSUyMGNvbGF8ZW58MHx8MHx8fDA%3D",
                  qty: "4",
                  price: "400"),
              soldMenu(
                  name: "soda",
                  image:
                      "https://images.unsplash.com/photo-1561758033-48d52648ae8b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29jYSUyMGNvbGF8ZW58MHx8MHx8fDA%3D",
                  qty: "4",
                  price: "400"),
              soldMenu(
                  name: "soda",
                  image:
                      "https://images.unsplash.com/photo-1561758033-48d52648ae8b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29jYSUyMGNvbGF8ZW58MHx8MHx8fDA%3D",
                  qty: "4",
                  price: "400")
            ]),
          )
        ]))
      ],
    );
  }

  Widget categoryMenu(
      {required String name, required String desc, required int qty}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 8),
            Text(desc,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 8),
            Text(qty.toString() + " pcs",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
        Expanded(flex: 1, child: Container(width: double.infinity)),
        Expanded(flex: 1, child: searchItem())
      ],
    );
  }

  Widget searchItem() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12,
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 10),
            Text("search", style: TextStyle(color: Colors.white))
          ],
        ));
  }
}

Widget categoryItemMenu(
    {required String name,
    required int qty,
    required String image,
    required bool isClicked}) {
  return Container(
    width: 180,
    margin: const EdgeInsets.only(right: 26),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 7, 7, 7),
        border: isClicked
            ? Border.all(color: Colors.lightGreen, width: 3)
            : Border.all(color: Colors.black87, width: 3)),
    child: Row(children: [
      Text(name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      const SizedBox(width: 8.0),
      Text(qty.toString(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8.0),
      Image.network(image, width: 30)
    ]),
  );
}

Widget products({
  required String image,
  required String name,
  required String category,
  required double price,
}) {
  return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color.fromARGB(255, 33, 30, 33),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 10),
          Text(name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ksh ${price.toString()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
              Text(category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ))
            ],
          )
        ],
      ));
}

Widget soldMenu(
    {required String name,
    required String image,
    required String qty,
    required String price}) {
  return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.black45,
      ),
      child: Row(
        children: [
          Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover))),
          const SizedBox(width: 10),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white10,
                  ),
                )
              ])),
          Text('$qty x',
              style: const TextStyle(
                  fontSize: 6,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))
        ],
      ));
}
