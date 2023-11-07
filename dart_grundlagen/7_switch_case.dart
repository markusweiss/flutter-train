void main() {
  int alter = 19;

  switch (alter) {
    case 18:
      print("Du bist volljährig");
      break;
    case 17:
      print("Du bist zu jung");
      break;
    default:
      print("keine Ahnung");
  }

  String name = "Hans";

  switch (name) {
    case "Hans":
      print("Du bist Hans");
      break;
    case "Peter":
      print("Du bist Peter");
      break;
    default:
      print("keine Ahnung");
  }
}
