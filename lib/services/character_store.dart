import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/firestore_services.dart';
class CharacterStore extends ChangeNotifier {
  

   
   final List<Character> _characters = [];
   get characters => _characters;
    //add character
    void addCharacter(Character character) {
      FirestoreServices.addCharacter(character);
      
      _characters.add(character);
      notifyListeners();
    }
  
   //save character 
    Future<void> saveCharacter (Character character) async {
      await FirestoreServices.updateCharacter(character);
      return;
    }

   //remove character 
   void removeCharacter(Character character) async{
    await FirestoreServices.deleteCharacter(character);
    _characters.remove(character);
    notifyListeners();

   }


   //initially fetch characters 
void fetchCharacterOnce() async {
  if (characters.length == 0 ) {
    final snapshot = await FirestoreServices.getCharactersOnce();
    for (var doc in snapshot.docs) {
      _characters.add(doc.data());
    }
    notifyListeners();
  }
}








}