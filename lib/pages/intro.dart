import 'package:animated_introduction/animated_introduction.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';




  final List<SingleIntroScreen> pages = [
  const SingleIntroScreen(
    imageWithBubble: false,
    imageHeightMultiple: 0.7,
    title: 'Selamat Datang!',
    description: 'Berikut mini tour aplikasi Takswanku\n\nSemoga dapat meningkatkan pengalaman Praktikum Taksonomi Hewan kalian ',
    imageAsset: 'assets/logo.png',
  ),
  const SingleIntroScreen(
    imageWithBubble: false,
    title: 'Menu Beranda',
    description: 'Terdapat 4 menu yang wajib kalian pelajari isinya sebelum melakukan praktikum ',
    imageAsset: 'assets/beranda.png',
  ),
  const SingleIntroScreen(
    imageWithBubble: false,
    title: 'Menu Materi',
    description: 'Kalian dapat mempelajari materi seputaran amphibi dengan mengklik salah satu dari keempat menu yang tersedia ',
    imageAsset: 'assets/materi.png',
  ),
  const SingleIntroScreen(
    imageWithBubble: false,
    title: "Menu Identifikasi",
    description: 'Tampilan akan mengarah ke website amphibiaweb.org Jelajahi beragam spesies amphibia dengan:\nKlik menu(pojok kanan atas)->Meet the Amphibians->Klik sesuai ordo yang ingin kalian jelajahi',
    imageAsset: 'assets/indentifikasi.png',
  ),
  const SingleIntroScreen(
    imageWithBubble: false,
    title: 'Menu Video',
    description: 'Klik tombol play untuk memutar video yang tersedia ',
    imageAsset: 'assets/video.png',
  ),
  const SingleIntroScreen(
    imageWithBubble: false,
    title: 'Menu Test',
    description: 'Masukan pin yang diberikan oleh Asisten Dosen untuk mengikuti test ',
    imageAsset: 'assets/tes.png',
  ),
];

/// Example page
class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedIntroduction(
      slides: pages,
      indicatorType: IndicatorType.line,
      doneText: "Done",
      onDone: () {
        Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Onboarding(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
      
      },
      topHeightForFooter: MediaQuery.sizeOf(context).height / 1.5,
      footerBgColor: Color(0xFFFAEED1),
      textColor: Colors.black87,
      activeDotColor: Colors.black,
      inactiveDotColor: Colors.black26,
    );
  }

}
