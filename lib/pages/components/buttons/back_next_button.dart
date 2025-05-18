import 'package:flutter/material.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/custom_outline_button.dart';

class BackNextButton extends StatelessWidget {
  final Function() nextPressed;
  final Function()? backPressed;

  const BackNextButton({
    super.key,
    required this.nextPressed,
    this.backPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: CustomOutlineButton(
            text: "Back", 
            onPressed: backPressed ?? () { Navigator.pop(context);}
          ),
        ),

        const SizedBox(width: 20,),

        Expanded(
          child: BottomButton(
            onPressed: () {
              nextPressed();
            }, 
            text: "Next",
          ),
        ),
      ],
    );
  }
}