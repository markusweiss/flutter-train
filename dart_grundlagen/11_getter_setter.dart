void main() {
  Car car1 = Car();
  car1.setColor = "rot";

  car1.sayColor();
  car1.drive();

  Car car2 = Car();
  car2.setColor = "blau";

  String colorFromCar = car1.farbe;

  print(colorFromCar);

  car2.sayColor();

  car2.drive();

  //car1._legeGangEin();
}

class Car {
  //! Setter
  set setColor(String farbe) {
    this._farbe = farbe;
  }

  //! Getter
  String get farbe => this._farbe;

  //! Attribute Farbe private
  late String _farbe;

  //! Methoden
  void drive() {
    _legeGangEin();
    print("Auto in $_farbe fährt");
  }

  void _legeGangEin() {
    print("Gang 1");
  }

  void sayColor() {
    print(this._farbe);
  }
}
