import 'package:flutter_test/flutter_test.dart';
import 'package:korisnicki_imenik/modeli/korisnik.dart';

void main() {
  test('Korisnik.izJsona ispravno pretvara podatke', () {
    final korisnik = Korisnik.izJsona({
      'id': 1,
      'name': 'Ana Horvat',
      'username': 'ana',
      'email': 'ana@example.com',
      'phone': '12345',
      'website': 'example.com',
      'address': {'city': 'Koprivnica'},
      'company': {'name': 'Primjer d.o.o.'},
    });

    expect(korisnik.id, 1);
    expect(korisnik.ime, 'Ana Horvat');
    expect(korisnik.grad, 'Koprivnica');
    expect(korisnik.tvrtka, 'Primjer d.o.o.');
  });
}
