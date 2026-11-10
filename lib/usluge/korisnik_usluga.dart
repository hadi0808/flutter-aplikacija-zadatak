import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modeli/korisnik.dart';

class KorisnikUsluga {
  static final Uri _adresa = Uri.parse(
    'https://jsonplaceholder.typicode.com/users',
  );

  // Asinkroni dohvat popisa korisnika s javnog poslužitelja.
  Future<List<Korisnik>> dohvatiKorisnike() async {
    final odgovor = await http.get(_adresa).timeout(
      const Duration(seconds: 10),
    );

    if (odgovor.statusCode != 200) {
      throw Exception('Pogreška poslužitelja: ${odgovor.statusCode}');
    }

    final jsonPopis = jsonDecode(odgovor.body) as List<dynamic>;

    return jsonPopis
        .map((zapis) => Korisnik.izJsona(zapis as Map<String, dynamic>))
        .toList();
  }
}
