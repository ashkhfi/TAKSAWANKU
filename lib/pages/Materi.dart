import 'package:flutter/material.dart';
import '../model/materiModel.dart';
import '../model/materiModel.dart';
import 'viewMateri.dart';

class Materi extends StatefulWidget {
  const Materi({super.key});

  @override
  State<Materi> createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  final List<MateriModel> daftarMateri = [
    MateriModel(nama: 'Biologi Amphibia', file: 'assets/file/pengertian.pdf'),
    MateriModel(nama: 'Ordo Amphibia', file: 'assets/file/ordo.pdf'),
    MateriModel(nama: 'Morfologi Amphibia (Katak/Kodok)', file: 'assets/file/morfologi.pdf'),
    MateriModel(nama: 'Metamorfosis pada Amphibia (Katak/Kodok)', file: 'assets/file/metamorfosis.pdf'),
    // Add more materials as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Materi",
          style: TextStyle(color: Colors.grey[700]),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFAEED1),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: daftarMateri.length,
              itemBuilder: (context, index) {
                MateriModel materi = daftarMateri[index];
                return Card(
                  child: ListTile(
                    tileColor: const Color(0xFFFAEED1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: const Icon(Icons.book, size: 30),
                    title: Text(materi.nama),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewMateri(
                            title: materi.nama,
                            file: materi.file,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
