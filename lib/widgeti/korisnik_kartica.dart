import 'package:flutter/material.dart';

import '../modeli/korisnik.dart';

class KorisnikKartica extends StatelessWidget {
  final Korisnik korisnik;
  final VoidCallback onDodir;
  final VoidCallback onDugiPritisak;

  const KorisnikKartica({
    super.key,
    required this.korisnik,
    required this.onDodir,
    required this.onDugiPritisak,
  });

  @override
  Widget build(BuildContext context) {
    final boje = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        leading: Hero(
          tag: 'korisnik-${korisnik.id}',
          child: CircleAvatar(
            radius: 24,
            backgroundColor: boje.primaryContainer,
            foregroundColor: boje.onPrimaryContainer,
            child: Text(
              korisnik.ime.isEmpty ? '?' : korisnik.ime[0].toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: Text(
          korisnik.ime,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          korisnik.email,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onDodir,
        onLongPress: onDugiPritisak,
      ),
    );
  }
}
