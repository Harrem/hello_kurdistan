import 'dart:convert';

import 'package:hello_kurdistan/flagViewer.dart';
import 'package:hello_kurdistan/jsonModelTest/Countries.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FlagList extends StatefulWidget {
  const FlagList({Key? key}) : super(key: key);

  @override
  State<FlagList> createState() => _FlagListState();
}

class _FlagListState extends State<FlagList> {
  // Countries? data;
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flag App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            // myCard(),
            Expanded(
              child: FutureBuilder(
                future: fetchData(),
                builder: (context, AsyncSnapshot<Countries> snapshot) {
                  if (snapshot.hasData) {
                    return myList(snapshot.data!);
                  }
                  return const Text("Loading Data...");
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget myCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FractionallySizedBox(
        widthFactor: 0.93,
        child: Column(
          children: [
            Container(
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
                      child: const Icon(Icons.flag),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10),
                  //   child: Text(
                  //     // txt,
                  //     style: const TextStyle(
                  //         fontSize: 20, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "The Kurdish flag is the most important symbol of cohesive Kurdish identity.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myList(Countries data) {
    return ListView.builder(
      itemCount: data.countrylist.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              // Navigator.push(context,FlagViewer(data.countrylist[index]));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FlagViewer(data.countrylist[index])));
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Expanded(
                        child: Image.network(data.countrylist[index].flag)),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.countrylist[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ListTile(
              //   title: Text(data.countrylist[index].name),
              //   leading: FractionallySizedBox(
              //     widthFactor: 0.2,
              //     child: Image.network(data.countrylist[index].flag),
              //   ),
              // ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Future<Countries> fetchData() async {
    Countries data;
    final response =
        await http.get(Uri.parse("https://restcountries.com/v3.1/all"));

    if (response.statusCode == 200) {
      data = Countries.fromJson(jsonDecode(response.body));
      return data;
    }
    throw Exception(
        "Failed to load Flags"); // return http.get(Uri.parse("https://flagcdn.com/en/codes.json"));
  }
}
