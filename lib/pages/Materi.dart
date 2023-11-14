import 'package:flutter/material.dart';
import '../model/materiModel.dart';
import 'ViewPDF.dart';

class Materi extends StatefulWidget {
  const Materi({super.key});

  @override
  State<Materi> createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  final List<MateriModel> daftarMateri = [
    MateriModel(
        nama: 'Pengertian Ambphibia', file: 'assets/file/pengertian.pdf'),
    MateriModel(nama: 'Ciri-ciri Ambphibia', file: 'assets/file/ciri.pdf'),
    MateriModel(nama: 'Ordo Ambphibia', file: 'assets/file/ordo.pdf'),
    // Tambahkan lebih banyak materi sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Materi"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: daftarMateri.length,
        itemBuilder: (context, index) {
          MateriModel materi = daftarMateri[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.book_rounded),
              title: Text(materi.nama),
              // Tambahkan aksi atau fungsi yang diinginkan saat ListTile diklik
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ViewPdf(title: materi.nama, file: materi.file)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
