import 'package:flutter/material.dart';
import 'package:taskwanku1/model/model_materi.dart';
import 'package:taskwanku1/pages/isiMateri.dart';

class Materi extends StatelessWidget {
  const Materi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = [
      modelMateri(judul: "Materi 1", isi: "Isi Materi 1"),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
              child: Container(
                width: double.maxFinite,
                height: 70.0,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                    child: Text(
                  "Materi",
                  style: TextStyle(fontSize: 30, color: Colors.orange),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 90, 30, 30),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // aksi yang diinginkan saat container ditekan
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (_) => IsiMateri()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.all(Radius.circular(15))),
                        elevation: 10,

                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(30),

                          ),
                          margin: EdgeInsets.only(bottom: 15),
                          child: ListTile(
                            title: Text(item[index].judul),
                            leading: Icon(Icons.book),
                            iconColor: Colors.orange,
                            trailing: Text("baca", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
