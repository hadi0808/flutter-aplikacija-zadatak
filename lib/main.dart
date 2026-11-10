import 'package:flutter/material.dart';

import 'ekrani/popis_ekran.dart';

void main() {
  runApp(const MojaAplikacija());
}

class MojaAplikacija extends StatelessWidget {
  const MojaAplikacija({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Korisnički imenik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
      ),
      home: const PopisEkran(),
    );
  }
}
