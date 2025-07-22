import 'package:flutter/material.dart';
import 'package:flutter_rpg/theme.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.onPressed ,
    required this.child, 

    
    });
   final Function() onPressed ;
   final Widget child ;


  @override
  Widget build(BuildContext context) {
    return TextButton(
    onPressed: onPressed,
    child : Container(
      padding: const EdgeInsets.symmetric(vertical: 10, 
      horizontal :20),
      decoration: BoxDecoration(gradient: LinearGradient(
        colors:[AppColors.secondaryColor , AppColors.backgroundColor],
        begin : Alignment.topCenter ,
        end : Alignment.bottomCenter,
         ),
         borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child ,
    )

    );
  }
}