import 'package:flutter/material.dart';

class CusButton extends StatelessWidget {
  String text;
  void Function()? onTapFn;

  CusButton({required this.onTapFn, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFn,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 7, 255, 234),
            borderRadius: BorderRadius.circular(13)),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            //color: Colors.white,
          ),
        ),
      ),
    );
  }
}
