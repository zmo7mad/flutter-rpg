import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/services/firestore_services.dart';


var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});
 
  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

   final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

   @override
   void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
   }
   //handling vocation selection
   Vocation selectedVocation = Vocation.marauder;

    void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
    
    }

   //submit handler
    Future<void> handlesubmit() async {
    if (_nameController.text.trim().isEmpty)
    {
      // Show an error message or handle the empty name case
     showDialog(
      context: context, builder: (ctx) {
      return AlertDialog(
        title : const StyledHeading('the name field is empty'),
        content : const StyledText('a meaningful name is required to create a character'),
        actions: [
          StyledButton(
            onPressed:(){
              Navigator.pop(ctx);
             },
            child : const StyledHeading('close'),),
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
      }
    );
      return ;
    }
    if (_sloganController.text.trim().isEmpty)
    {
      // Show an error message or handle the empty name case
         showDialog(
      context: context, builder: (ctx) {
      return AlertDialog(
         
        title : const StyledHeading('the description field is empty'),
        content : const StyledText('remember to give your character a memorable description'),

        actions: [
          StyledButton(
            onPressed:(){
              Navigator.pop(ctx);
            } ,
            child : const StyledHeading('close') ,)
        ],
        actionsAlignment: MainAxisAlignment.center,

      );
      }
    );
      return ;
    }
    // Duplicate check using Firestore
    final exists = await FirestoreServices.characterExists(
      _nameController.text.trim(),
      _sloganController.text.trim(),
      selectedVocation,
    );
    if (exists) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading('Duplicate character'),
            content: const StyledText('A character with the same name, description, and vocation already exists.'),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const StyledHeading('close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }
    Provider.of<CharacterStore>(context, listen: false).addCharacter(
      Character(
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        id: uuid.v4(),
        vocation: selectedVocation,
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const Home(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledText('Character Creation'),
        centerTitle: true ,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              //welcome message
              Center(
                child:StyledHeading('Welcome new player')
              ),
              const SizedBox(height: 20),
              Center(
                child:StyledText('create a name and a description for your character', ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _nameController, 
                style:  GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodySmall),
                cursorColor:AppColors.highlightColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character Name'),
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(textStyle: 
                  Theme.of(context).textTheme.bodySmall),
                cursorColor:AppColors.highlightColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character description'),
                ),
              ),
              const SizedBox(height: 30,),
              // select vocation
              Center(
                child:StyledHeading('chooce a vocation'),
              ),
              const SizedBox(height: 20),
              Center(
                child:StyledText('this determines your available sklils '),
              ),
              const SizedBox(height: 20,),
              // vocation cards
              VocationCard(
                selected: selectedVocation == Vocation.marauder,
                onTap :updateVocation,
                vocation: Vocation.marauder,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.spectator,
                onTap :updateVocation,
                vocation: Vocation.spectator,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.prisoner,
                onTap :updateVocation,
                vocation: Vocation.prisoner,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.lawyer, 
                onTap: updateVocation, 
                vocation: Vocation.lawyer ,
                ),
              Center(
                child:StyledHeading('good luck adventurer!'),
              ),
              const SizedBox(height: 20),
              Center(
                child:StyledText('may the winds of fortune be at your back', ),
              ),
              Center(
                child: StyledButton(
                  onPressed: handlesubmit ,
                  child: StyledTitle(
                    'create character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}