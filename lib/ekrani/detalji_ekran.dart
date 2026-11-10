import 'package:flutter/material.dart';

import '../modeli/korisnik.dart';

class DetaljiEkran extends StatelessWidget {
  final Korisnik korisnik;

  const DetaljiEkran({super.key, required this.korisnik});

  @override
  Widget build(BuildContext context) {
    final boje = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalji korisnika')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Hero(
                tag: 'korisnik-${korisnik.id}',
                child: CircleAvatar(
                  radius: 49,
                  backgroundColor: boje.primaryContainer,
                  foregroundColor: boje.onPrimaryContainer,
                  child: Text(
                    korisnik.ime.isEmpty ? '?' : korisnik.ime[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              korisnik.ime,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(
              '@${korisnik.korisnickoIme}',
              textAlign: TextAlign.center,
              style: TextStyle(color: boje.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text('E-mail'),
                    subtitle: Text(korisnik.email),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.phone_outlined),
                    title: const Text('Telefon'),
                    subtitle: Text(korisnik.telefon),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.location_city_outlined),
                    title: const Text('Grad'),
                    subtitle: Text(korisnik.grad),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.business_outlined),
                    title: const Text('Tvrtka'),
                    subtitle: Text(korisnik.tvrtka),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: const Text('Web stranica'),
                    subtitle: Text(korisnik.web),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
