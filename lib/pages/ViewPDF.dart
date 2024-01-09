import 'package:flutter/material.dart';

class ViewPdf extends StatefulWidget {
  final String title;
  final String file;

  const ViewPdf({Key? key, required this.title, required this.file}) : super(key: key);

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  List<String> tatib = [
    'Persentasi kehadiran wajib 100%',
    'Praktikan wajib hadir 5 menit sebelum praktikum dimulai',
    'Praktikan wajib mengenakan jas lab',
    'Praktikan tidak diperkenankan untuk menyiksa hewan yang akan dijadikan sampel',
    'Praktikan dilarang membawa makanan dan minuman',
    'Praktikan agar mengikuti kegiatan praktikum dengan tenang dan tertib',
    'Praktikan dilarang merusak fasilitas laboratorium',
  ];

  List<String> petunjuk = [
    'Disiapkan sampel berupa satu ekor katak dan satu ekor kodok',
    'Sampel diletakkan di atas meja',
    'Diamati bagian kepala, badan dan alat gerak pada katak dan kodok yang ditemukan tersebut',
    'Dideskripsikan masing-masing bagian yang teramati',
    'Lakukan identifikasi sampel tersebut dengan cara:',
    'abc',
  ];

  String pengantar =
      'Puji syukur atas kehadirat Allah SWT. yang telah memberikan rahmat serta hidayah-Nya sehingga aplikasi ini dapat dikembangkan hingga selesai. Aplikasi penuntun praktikum ini dibuat untuk memudahkan praktikan dalam melaksanakan kegiatan praktikum, baik di dalam laboratorium ataupun di lapangan\n\nPengembang berharap aplikasi ini dapat digunakan sebagaimana mestinya sesuai dengan tujuan dibuatnya aplikasi ini. Pengembang juga berharap ada yang meneruskan untuk mengembangkan aplikasi ini agar semakin baik sebagai penuntun praktikum';

  String tentang =
      "Aplikasi ini merupakan produk skripsi yang berjudul Pengembangan Penuntun Praktikum Taksonomi Hewan pada Materi Amphibia oleh mahasiswa Pendidikan Biologi angkatan 2018, yaitu Imam Adeanto Nugroho (A1C418007), dengan Dosen Pembimbing Skripsi I Dr. Agus Subagyo, S.Si., M.Si serta Dosen Pembimbing Skripsi II M. Erick Sanjaya, S.Pd., M.Pd.\n\nAplikasi ini diharapkan mampu menjadi penuntun praktikum yang layak digunakan pada kegiatan praktikum Taksonomi Hewan khususnya pada materi Amphibia. Kedepannya diharapkan ada yang meneruskan pengembangan penuntun praktikum ini agar dapat digunakan pada materi praktikum yang lain";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(widget.title)),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(18),
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/bg.jpg'))),
        child: Column(
          children: [
            if (widget.title == 'Tentang') Text(tentang, textAlign: TextAlign.justify, style: TextStyle(fontSize: 18)),
            if (widget.title == 'Pengantar') Text(pengantar, textAlign: TextAlign.justify, style: TextStyle(fontSize: 18)),
            Column(
              children: widget.title == 'Tata Tertib'
                  ? tatib
                  .map(
                    (strone) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("\u2022", style: TextStyle(fontSize: 30)), //bullet text
                          SizedBox(width: 10), //space between bullet and text
                          Expanded(
                            child: Text(strone, style: TextStyle(fontSize: 20)),
                          ), //text
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ), //divider
                    ],
                  ),
                ),
              )
                  .toList()
                  : widget.title == 'Petunjuk'
                  ? petunjuk
                  .map(
                    (strone) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("\u2022", style: TextStyle(fontSize: 30)), //bullet text
                          SizedBox(width: 10), //space between bullet and text
                          Expanded(
                            child: Text(strone, style: TextStyle(fontSize: 20)),
                          ), //text
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ), //divider
                    ],
                  ),
                ),
              )
                  .toList()
                  : [],
            ),
          ],
        ),
      ),
    );
  }
}
