import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Skilllist extends StatefulWidget {
  const Skilllist(
    this.character,
    {super.key});

    final Character character;

  @override
  State<Skilllist> createState() => _SkilllistState();
}
class _SkilllistState extends State<Skilllist> {
late List<Skill> availableSkills;
late Skill selectedSkill;

@override
void initState() {

  availableSkills = allSkills.where((skill) {
    return skill.vocation == widget.character.vocation;
  }).toList();

  if (widget.character.skills.isEmpty) {
    selectedSkill = availableSkills[0];

  }
  if (widget.character.skills.isNotEmpty) {
    selectedSkill =widget.character.skills.first;
  }

  super.initState();
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child : Container(
        padding: const EdgeInsets.all(16),
        color : AppColors.primaryAccent.withValues(alpha: 1),
        child : Column(
          children: [
           const StyledHeading('choose an active skill'),
           const StyledText('skills are unique to your vocation'),
           const SizedBox(height: 20,),
           
           
           Row(
               children: availableSkills.map((skill){
                return Container(
                 margin: const EdgeInsets.all(5),
                 padding: const EdgeInsets.all(2),
                 color: skill == selectedSkill? Colors.yellow : Colors.transparent,
                child : GestureDetector(
                  onTap: () {
                   setState(() {
                     widget.character.updateSkill(skill);
                     selectedSkill = skill ;
                   });


                  },
                 child: Image.asset('${skill.image}' ,
                 width: 50,),
                ),
                );
               }).toList(),
                
                 
                
               
             
           ),
           const SizedBox(height: 10,),
           StyledText(selectedSkill.name),


          ],)

      )
    
       );
  }
  
}