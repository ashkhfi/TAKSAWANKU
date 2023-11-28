import 'package:flutter/material.dart';

import '../main.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                'assets/onboarding.jpg',
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFFAEED1))),
                  onPressed:
                      _isLoading ? null : () => _navigateWithIndicator(context),
                  child: ElevatedButtonContent(isLoading: _isLoading),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateWithIndicator(BuildContext context) {
    setState(() {
      _isLoading = true;
    });

    // Delay untuk simulasi pindah halaman setelah beberapa detik (ganti sesuai kebutuhan)
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(_createRoute()); // Pindah halaman
    }).whenComplete(() {
      setState(() {
        _isLoading = true;
      });
    });
  }
}

class ElevatedButtonContent extends StatelessWidget {
  final bool isLoading;

  const ElevatedButtonContent({Key? key, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (!isLoading) // Tampilkan teks hanya jika tidak sedang dalam proses loading
          Text(
            "Mulai",
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        if (isLoading) // Tampilkan circular indicator jika sedang dalam proses loading
          const CircularProgressIndicator(
            backgroundColor: Color(0xFFFAEED1),
            color: Colors.white,
          ),
      ],
    );
  }
}

PageRouteBuilder _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 2.0;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var opacityAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: opacityAnimation,
        child: child,
      );
    },
  );
}
