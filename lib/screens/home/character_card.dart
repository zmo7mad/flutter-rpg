import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/profiles/profile.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:flutter_rpg/models/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character ,{super.key});
  final  Character character;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(
          color: Color.fromARGB(255, 163, 163, 163),
          width: 2
        )
        
      ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    child: Row(
      children: [
        Expanded(
          child: Hero(
            tag : character.id.toString(),
            child: Image.asset(
              '${character.vocation.image}',
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),

           Expanded(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(character.name),
                StyledText(character.vocation.title),
              ],
            ),
           ),
        
        IconButton(
          onPressed: () {
            Navigator.push(context , MaterialPageRoute
            (builder: (ctx)=> Profile(character:character,)));
          },
          icon: Icon(Icons.arrow_forward_rounded, color: AppColors.highlightColor),
        ),
      ],
    ),
  ),
);
  }
}