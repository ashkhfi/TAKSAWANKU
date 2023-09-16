import 'package:flutter/material.dart';
import 'package:taskwanku1/pages/Tentang.dart';
import 'package:taskwanku1/pages/Pengantar.dart';
import '../pages/Tujuan.dart';
import './Pengantar.dart';
import './Tata_tertib.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return berandaPage();
  }
}

class berandaPage extends StatelessWidget {
  const berandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        navigatorKey: GlobalContextService.navigatorKey,
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                child: Container(
                  width: double.maxFinite,
                  height: 70.0,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                      child: Text(
                        "Beranda",
                        style: TextStyle(fontSize: 30, color: Colors.orange),
                      )),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconText(
                                    "assets/Tatatertib.png", "Tata Tertib", TataTertib()),
                                IconText("assets/tentang.png", "Tentang", Tentang()),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconText("assets/Pengantar.png", "Pengantar", Pengantar()),
                                IconText("assets/tujuan.png", "Petunjuk", Tujuan()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class GlobalContextService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

Widget dialog_beranda(String text) {
  return Dialog(
    child: Container(
      width: 200,
      height: 300,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    ),
  );
}

Widget IconText(String assets, String text, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.of( GlobalContextService.navigatorKey.currentContext!, rootNavigator: true).push(MaterialPageRoute(
        builder: (_) => page,
      ),
      );
    },
    child: Column(
      children: [
        Image(
          image: AssetImage(assets),
          width: 150,
          height: 150,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
        )
      ],
    ),
  );
}
