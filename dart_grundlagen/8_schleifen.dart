void main() {
  int zahl = 1;

  // kopfgesteuert
  while (zahl <= 10) {
    print(zahl);
    zahl += 1;
  }

  print("--------------");

  int zahl2 = 1;
  //fussgesteuert
  do {
    print(zahl2);
    zahl2 += 1;
  } while (zahl2 < 1);

  print("--------------");

  List<int> liste = [2, 3, 4, 5, 6, 7, 4, 8];
  List<int> liste2 = [];

  for (int i = 1; i < liste.length; i++) {
    print(liste[i]);
  }

  print("--------------");

  liste.forEach((element) {
    print(element);
    element++;
    liste2.add(element);
  });

  print(liste2);
}
