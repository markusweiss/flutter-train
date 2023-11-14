import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  const ContainerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 8,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 20),
            height: 100,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(5)),
            child: const Text(
              "guten Tag",
              style: TextStyle(fontFamily: "Ruby", fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
