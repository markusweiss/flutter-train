void main() {
  Car car1 = Car();
  car1.farbe = "rot";

  car1.sayColor();
  car1.drive();

  Car car2 = Car();
  car2.farbe = "blau";

  car2.sayColor();

  car2.drive();
}

class Car {
  //! Attribute
  late String farbe;

  //! Methoden
  void drive() {
    print("Auto in $farbe fährt");
  }

  void sayColor() {
    print(this.farbe);
  }
}
