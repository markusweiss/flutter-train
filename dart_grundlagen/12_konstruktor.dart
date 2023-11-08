void main() {
  Car car1 = Car(color: "rot", ps: 140);

  print(car1.color);
  car1.drive();
}

class Car {
  Car({required this.color, required this.ps});

  final String color;
  final int ps;

  void drive() {
    print("Auto fährt");
  }
}
