void main() {
  print("vor");
  plus(2, 5);

  print("----------");

  int ergebnis = minus(b: 6, a: 10);
  print(ergebnis);
  int ergebnis2 = minus(a: 20, b: ergebnis);
  print(ergebnis2);

  print("danach");
}

void plus(int a, int b) {
  print(a + b);
}

int minus({required int a, required int b}) {
  return a - b;
}
