import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/models/skill.dart';
class Character with Stats
{

//constructor
Character({
 
 required this.name,
 required this.slogan,
 required this.id,
 required this.vocation,

});
// fields


 final Set<Skill> skills = {    };
 final String  name ;
 final String slogan;
 final String id;
 final Vocation vocation;
 bool _isFav = false;

 //getters
 bool get isFav =>_isFav;


void toggleFav() {
    _isFav = !_isFav;
  }

void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
   //character to firestore (map)
   Map<String , dynamic> toFirestore() {

    return {
      'name' :name,
      'slogan' : slogan,
      'isFav' : _isFav,
      'vocation' : vocation.toString(),
      'skill' : skills.map((s) => s.id).toList(),
      'stats' : statsAsMap,
      'points' : points,
    }; 
   }
   
   
   //character from firestore
   factory Character.fromFirestore(DocumentSnapshot<Map<String ,dynamic >> snapshot ,
   SnapshotOptions? options) 
   {
     //get data from snapshot
     final data = snapshot.data()!;
     
     
     //make character instance 
      Character character = Character(
        name: data ['name'],
      slogan: data['slogan'],
       id: snapshot.id,
        vocation: Vocation.values.firstWhere(
        (v) => v.toString() == data['vocation']) );

        //update skills 
        for (String id in data['skill']) {
          Skill skill = allSkills.firstWhere((skill) => skill.id ==id);
          character.updateSkill(skill);
        }
      // set isfav
      if (data['isFav'] == true)
      {
        character.toggleFav();
      }
      //assign stats and points 
      character.setStats(points: data['points'], stats: data['stats']);
      return character;
     
   }
}

 