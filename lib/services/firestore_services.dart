import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';

class FirestoreServices {
  
  static final ref = FirebaseFirestore.instance
  .collection('characters')
  .withConverter(
    fromFirestore: Character.fromFirestore,
    toFirestore: (Character c , _) => c.toFirestore()
  );



  //add a new character 
  static Future<void>addCharacter(Character character) async
   {
    await ref.doc(character.id).set(character);
  }

  // get characters once 
  static Future<QuerySnapshot<Character>> getCharactersOnce() async
   {
    return await ref.get();

  }
   


  //update a character 
   static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
    'stats':character.statsAsMap ,
    'points': character.points ,
    'skills':character.skills.map((s) => s.id).toList(),
    'isFav' : character.isFav,

    });

   }

  // delete a character
   static Future<void> deleteCharacter(Character character) async {
    await ref.doc(character.id).delete();
   }

  static Future<bool> characterExists(String name, String slogan, Vocation vocation) async {
  final snapshot = await ref
    .where('name', isEqualTo: name)
    .where('slogan', isEqualTo: slogan)
    .where('vocation', isEqualTo: vocation.toString())
    .get();
  return snapshot.docs.isNotEmpty;
}








} 