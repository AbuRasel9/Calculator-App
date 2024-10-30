import 'package:flutter/material.dart';

class CalculationButton extends StatelessWidget {
  final String? buttonText;
  final void Function()? onTap;
  final Color? buttonColor;

  const CalculationButton(
      {super.key, this.buttonText, this.onTap, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: buttonText == "=" ? 150 : 70,
      padding: const EdgeInsets.all(0,),
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(
            10,
          )),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(

            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              15,
            ))),
        child: Text(
          buttonText ?? "",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
