class Korisnik {
  final int id;
  final String ime;
  final String korisnickoIme;
  final String email;
  final String telefon;
  final String web;
  final String grad;
  final String tvrtka;

  const Korisnik({
    required this.id,
    required this.ime,
    required this.korisnickoIme,
    required this.email,
    required this.telefon,
    required this.web,
    required this.grad,
    required this.tvrtka,
  });

  // Pretvara jedan JSON zapis s poslužitelja u objekt Korisnik.
  factory Korisnik.izJsona(Map<String, dynamic> json) {
    final adresa = json['address'] as Map<String, dynamic>? ?? {};
    final poduzece = json['company'] as Map<String, dynamic>? ?? {};

    return Korisnik(
      id: json['id'] as int,
      ime: json['name'] as String? ?? '',
      korisnickoIme: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      telefon: json['phone'] as String? ?? '',
      web: json['website'] as String? ?? '',
      grad: adresa['city'] as String? ?? '',
      tvrtka: poduzece['name'] as String? ?? '',
    );
  }
}
