import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/screens/create/create.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}



  class _HomeState extends State<Home> {


  @override
  void initState() {
    super.initState();
    Provider.of<CharacterStore>(context , listen: false)
    .fetchCharacterOnce();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledText('YOUR CHARACTERS'),
        centerTitle: true,

      ),
      body: 
      Container(
        padding: const EdgeInsets.all(50),
        child: Column(
     children: [
       StyledTitle('Character List' ),
       Container(
        height: 15,
       ),
      Expanded(
    child: Container(
        child: Consumer <CharacterStore>(
          builder: (context , value , child)  {
            
            return ListView.builder (
            padding: const EdgeInsets.all(10),
            itemCount: value.characters.length,
            itemBuilder: ( _,index) {
             return Dismissible(
              key: ValueKey(value.characters[index].id),
              onDismissed: (direction) {
                Provider.of<CharacterStore>(context , listen: false)
                .removeCharacter(value.characters[index]);
                
                },
              child: CharacterCard(value.characters[index]));
            },
            );
          }
        )
        )
        
      ),
         StyledButton(
            onPressed: () {
            Navigator.push(context,MaterialPageRoute(
              builder: (ctx) => const CreateScreen(),
              ));



            },
            child: StyledHeading('CREATE NEW CHARACTER', ),
         )
         ],
      )
      )
  
    );
    
  }
}