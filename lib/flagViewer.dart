import 'package:flutter/material.dart';

class FlagViewer extends StatefulWidget {
  const FlagViewer({Key? key}) : super(key: key);

  @override
  State<FlagViewer> createState() => _FlagViewerState();
}

class _FlagViewerState extends State<FlagViewer> {
  List<Flag> flags = [
    Flag("United States Of America", Image.asset("assets/flagAmerica.png"),
        "someText"),
    Flag("Kurdistan", Image.asset("assets/flagkurdistan.png"), "someText"),
    Flag("Germany", Image.asset("assets/flagGerman.png"), "someText"),
    Flag("Germany", Image.asset("assets/flagGerman.png"), "someText"),
    Flag("Germany", Image.asset("assets/flagGerman.png"), "someText"),
    Flag("Britain", Image.asset("assets/flagBritain.png"), "someText")
  ];

  String txt = "Country";
  Image? img;
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
            myCard(),
            Expanded(
              child: ListView.builder(
                itemCount: flags.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        txt = flags[index].name!;
                        img = flags[index].img!;
                      });
                    },
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(flags[index].name!),
                          leading: FractionallySizedBox(
                              widthFactor: 0.2, child: flags[index].img!),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            )
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
                      child: img,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      txt,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
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
}

class Flag {
  String? name;
  Image? img;
  String? description;

  Flag(this.name, this.img, this.description);
}
