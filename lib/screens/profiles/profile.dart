import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profiles/skill_list.dart';
import 'package:flutter_rpg/screens/profiles/stats_table.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';
import 'heart.dart';  

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character,
    });
    final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
    title: StyledTitle(character.name),

   ),
   body: SingleChildScrollView(
    child : Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 30,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Stack(
            children: [
              
              Image.asset('${character.vocation.image}',
              width: 200,
              height: 200  ,
              
              
              ),
              Positioned(
                top: 10,
                right: -10,
                child: Heart(character: character),
              ),
            ],
          ),
          const SizedBox(width: 20, ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(character.vocation.title),
                StyledText(character.vocation.description),
              ],
            ),
          ), 
        ],

         ),
     

      const SizedBox(width: 40,),

      Padding(
        padding: EdgeInsets.all(15),
        child:Container(
          width: double.infinity,
          padding:EdgeInsets.all(15),
          color: AppColors.primaryAccent.withValues(alpha: 0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              const StyledHeading('Character details'),
              StyledText(character.slogan),
              const SizedBox(height : 10),

              const StyledHeading('weapon of choice'),
              StyledText(character.vocation.weapon),
              const SizedBox(height : 10),

              const StyledHeading('unique ability'),
              StyledText(character.vocation.ability),
              StyledText(character.vocation.ability2),
              const SizedBox(height : 10)
             ],
          ),

        )
        
        
        
        ),
        

        Container(
          alignment: Alignment.center,
          child : Column(
            children: [
              StatsTable(character),
              Skilllist(character),
            ],
          ),
        ),
        
        StyledButton(
          onPressed: () {
            Provider.of<CharacterStore>(context, listen: false)
            .saveCharacter(character);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const StyledHeading('character was saved'),
              showCloseIcon: true,
              duration: const Duration(seconds: 2),
              backgroundColor: AppColors.successColor,
              ),
            );
          },
          child : const StyledHeading('save character'),
        ),
        const SizedBox(height: 10,)
        ],
      ),
     
    ),
  );
  
}
}