import 'package:flutter_rpg/models/vocation.dart';


class Skill {


final String id;
final String name;
final String image;
final Vocation vocation;


Skill({
  required this.id,
  required this.name,
  required this.image,
  required this.vocation,

});
}

final List<Skill> allSkills = [
  Skill(
    id: '1',
    name: 'Quick Strike',
    image: 'assets/images/Skills/quick_attack.jpg', 
    vocation: Vocation.marauder,
  ),
   Skill(
    id: '2',
    name: 'AcendedTheft',
    image: 'assets/images/Skills/AcendedTheft.jpg', 
    vocation: Vocation.marauder,
  ),
  Skill(
    id: '3',
    name: 'Observe and Analyze',
    image: 'assets/images/Skills/observe.jpg',
    vocation: Vocation.spectator,
  ),
  Skill(
    id: '4',
    name: 'Brain Wash',
    image: 'assets/images/Skills/BrainWash.jpg',
    vocation: Vocation.lawyer,
  ),
  Skill(
    id: '5',
    name: 'Distortion',
    image: 'assets/images/Skills/distortion.jpg',
    vocation: Vocation.lawyer,
  ),
   Skill(
    id: '6',
    name: 'Dragon Might',
    image: 'assets/images/Skills/DragonMight.jpg', 
    vocation: Vocation.spectator,
  ),
  Skill(
    id: '7',
    name: 'Zombie Transformation',
    image: 'assets/images/Skills/zombie_transformation.jpg',
    vocation: Vocation.prisoner,
  ),
  Skill(
    id: '8',
    name: 'obtain follower',
    image: 'assets/images/Skills/followers.jpg',
    vocation: Vocation.prisoner,
  ),
  

];