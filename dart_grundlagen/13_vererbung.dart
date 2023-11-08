void main() {
  Student student1 = Student();
  student1.setStudienjahr(3);

  int studienjahr = student1.getStudienjahr;

  print(studienjahr);

  student1.feiern();

  student1.setName("Peter");

  String name = student1.getName;

  print(name);

  // aus Mixin
  student1.lernen();
}

class Person {
  late String _name;
  late int _alter;

  // Getter
  String get getName => this._name;
  int get alter => this._alter;

  // Setter
  setName(String name) {
    this._name = name;
  }

  setAlter(int alter) {
    this._alter = alter;
  }

  // Methoden
  void laufen() {
    print("Person läuft");
  }
}

mixin Lernender {
  void lernen() {
    print("Student lernt");
  }
}

class Student extends Person with Lernender {
  late int _studienjahr;

  // Getter
  int get getStudienjahr => this._studienjahr;

  // Setter
  setStudienjahr(int studienjahr) {
    this._studienjahr = studienjahr;
  }

  // Methoden
  void feiern() {
    print("Person macht Party");
  }
}
