import 'package:flutter/material.dart';
import 'package:hello_kurdistan/jsonModelTest/Countries.dart';

class FlagViewer extends StatefulWidget {
  @required
  Country country;
  FlagViewer(this.country, {Key? key}) : super(key: key);

  @override
  State<FlagViewer> createState() => _FlagViewerState(country);
}

class _FlagViewerState extends State<FlagViewer> {
  @required
  Country country;
  _FlagViewerState(this.country);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text("FlagViewer"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            borderOnForeground: true,
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(country.flag),
                    ),
                  ),
                  const Divider(color: Colors.transparent),
                  Text(
                    country.name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Divider(color: Colors.transparent),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Official Name: Republic of Cyprus",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey[600]),
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
