import 'package:flutter/material.dart';

import '../modeli/korisnik.dart';
import '../usluge/korisnik_usluga.dart';
import '../widgeti/korisnik_kartica.dart';
import 'detalji_ekran.dart';

class PopisEkran extends StatefulWidget {
  const PopisEkran({super.key});

  @override
  State<PopisEkran> createState() => _PopisEkranState();
}

class _PopisEkranState extends State<PopisEkran> {
  final KorisnikUsluga _usluga = KorisnikUsluga();
  late Future<List<Korisnik>> _ucitavanje;

  @override
  void initState() {
    super.initState();
    _ucitavanje = _usluga.dohvatiKorisnike();
  }

  void _ponoviDohvat() {
    setState(() {
      _ucitavanje = _usluga.dohvatiKorisnike();
    });
  }

  // Gesta: povuci popis prema dolje da dohvatiš nove podatke.
  Future<void> _osvjezi() async {
    try {
      final korisnici = await _usluga.dohvatiKorisnike();
      if (!mounted) return;

      setState(() {
        _ucitavanje = Future.value(korisnici);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Popis je uspješno osvježen.')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Osvježavanje nije uspjelo.')),
      );
    }
  }

  void _otvoriDetalje(Korisnik korisnik) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetaljiEkran(korisnik: korisnik),
      ),
    );
  }

  void _prikaziKorisnickoIme(Korisnik korisnik) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Korisničko ime: ${korisnik.korisnickoIme}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Korisnički imenik')),
      body: FutureBuilder<List<Korisnik>>(
        future: _ucitavanje,
        builder: (context, snimka) {
          // Prvo stanje: učitavanje.
          if (snimka.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Drugo stanje: pogreška.
          if (snimka.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    const Text(
                      'Nije moguće dohvatiti korisnike.\nProvjeri internet i pokušaj ponovno.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _ponoviDohvat,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Pokušaj ponovno'),
                    ),
                  ],
                ),
              ),
            );
          }

          // Treće stanje: uspješan dohvat.
          final korisnici = snimka.data ?? const <Korisnik>[];
          if (korisnici.isEmpty) {
            return RefreshIndicator(
              onRefresh: _osvjezi,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 200),
                  Icon(Icons.people_outline, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Center(child: Text('Nema korisnika za prikaz.')),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _osvjezi,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 12, bottom: 18),
              itemCount: korisnici.length,
              itemBuilder: (context, index) {
                final korisnik = korisnici[index];
                return KorisnikKartica(
                  korisnik: korisnik,
                  onDodir: () => _otvoriDetalje(korisnik),
                  onDugiPritisak: () => _prikaziKorisnickoIme(korisnik),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
