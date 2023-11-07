void main() {
// Primitive Datentypen

  int meinInt = 30;

  double meineZahl = 3.4;

  bool meinBool = true;

  dynamic dynamisch;

  dynamisch = 666;

  print(dynamisch);

  dynamisch = "String";

  print(meinInt);
  print(meineZahl);
  print(meinBool);
  print(dynamisch);

// Komplexe Datentypen

  String meinString = "Das Haus ";

  String meinString_2 = "ist blau";

  String verkettet = meinString + meinString_2;

  print(verkettet);

  String multiline = '''Das
  ist 
  das 
  Haus
  vom
  Nikolaus''';

  print(multiline);

  int wert = 3;

  String beispiel = "Der Wert ist $wert";

  print(beispiel);
}
