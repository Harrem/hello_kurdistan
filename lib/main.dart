import 'package:flutter/material.dart';

void main() {
  runApp(const Hello());
}

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("World Flags"),
          ),
          backgroundColor: Colors.indigo,
        ),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Container(
              height: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://i.pinimg.com/originals/9d/44/27/9d4427d526ce7ecfa2822e75d4c00762.jpg",
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Hello Kurdistan!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "The Kurdish flag is the most important symbol of cohesive Kurdish identity. Since it was first hoisted in 1946 to represent the concept of an independent Kurdistan (called the Republic of Mahabad and founded in Iranian territory) it has become a symbol of the national identity of Kurds.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
