import 'package:flutter/material.dart';
import 'package:menu_app/description.dart';

import 'data.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Restaurant Menu")),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.red, Colors.black, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Description(
                        image: data[index]["image"].toString(),
                        name: data[index]["name"].toString(),
                        price: data[index]["price"].toString(),
                        description: data[index]["description"].toString(),
                        category: data[index]["category"].toString(),
                        ingredients: (data[index]["ingredients"] as Iterable<dynamic>).toList().cast<String>(),
                      );
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        data[index]["image"].toString(),
                        height: 138,
                        width: 150,
                      ),
                      Text(
                        data[index]["name"].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rs.${data[index]["price"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
