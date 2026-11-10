# Korisnički imenik

Jednostavna Flutter aplikacija za pregled korisnika. Na početnom ekranu prikazuje popis korisnika, a dodirom na korisnika otvara ekran s njegovim podacima (e-mail, telefon, grad, tvrtka i web stranica).

## Izvor podataka

Javni API bez prijave: https://jsonplaceholder.typicode.com/users

Podaci se preuzimaju pomoću paketa `http`, asinkrone metode `async/await` i pretvaraju u objekte klase `Korisnik` pomoću konstruktora `Korisnik.izJsona`. Prikaz koristi `FutureBuilder` koji obrađuje učitavanje, uspjeh i pogrešku. Popis prikazuje `ListView.builder`, a za prazan popis postoji zasebna poruka.

## Animacije i geste

- **Hero animacija**: avatar korisnika povećava se pri otvaranju detalja (`lib/widgeti/korisnik_kartica.dart` i `lib/ekrani/detalji_ekran.dart`). Prijelaz ekrana koristi `Navigator.push` u `lib/ekrani/popis_ekran.dart`.
- **Povlačenje prema dolje**: gesta `RefreshIndicator` ponovno dohvaća korisnike i prikazuje poruku o rezultatu (`lib/ekrani/popis_ekran.dart`).
- **Dugi pritisak**: dugim pritiskom na karticu prikazuje se korisničko ime u `SnackBar` poruci (`lib/widgeti/korisnik_kartica.dart` i `lib/ekrani/popis_ekran.dart`).

Aplikacija ne koristi `AnimationController` niti `StreamSubscription`: zbog toga nema takvih resursa koje treba osloboditi u `dispose`.

## Struktura

```text
lib/
  main.dart
  modeli/
    korisnik.dart
  usluge/
    korisnik_usluga.dart
  ekrani/
    popis_ekran.dart
    detalji_ekran.dart
  widgeti/
    korisnik_kartica.dart
pubspec.yaml
README.md
.gitignore
```

## Pokretanje

1. Instalirati Flutter SDK i otvoriti terminal u mapi projekta.
2. Ako su preuzete samo izvorne datoteke (nema mapa `android/`, `ios/`, `web/`), prvo pokrenuti `flutter create .` kako bi Flutter dodao datoteke za platforme.
3. Instalirati pakete naredbom `flutter pub get`.
4. Pokrenuti aplikaciju naredbom `flutter run` i odabrati uređaj ili preglednik. Za testiranje u Edgeu: `flutter run -d edge` (ako je Edge dostupan na računalu).
5. Prije predaje provjeriti projekt pomoću `flutter analyze` i po želji `flutter test`.

Za uspješan dohvat potrebna je internetska veza.

## Predaja

Projekt objaviti u **javnom GitHub repozitoriju**. Repozitorij treba sadržavati `lib/`, `pubspec.yaml` i `README.md` (preporučeno i ostale Flutter konfiguracijske datoteke). U GitHub ne slati `build/` i `.dart_tool/` jer su navedeni u `.gitignore`.

Uz poveznicu predati **2 do 3 stvarne snimke zaslona** iz pokrenute aplikacije: popis korisnika, detalji jednog korisnika i po mogućnosti poruka nakon dugog pritiska ili osvježavanja.
