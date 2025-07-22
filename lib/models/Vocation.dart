enum Vocation {
   

  marauder(
     'Marauder pathway',
     'An agile , fast and deadly fighter',
     'assets/images/Vocations/marauder.jpg',
     'slim blade',
     'quick strike',
     'acended theft',

  ),

  spectator(
     'Spectator pathway',
     'A powerful and wise observer',
     'assets/images/Vocations/spectator.jpg',
     'a flame sword',
     'observe and analyze',
     'dragon might',
  ),

  lawyer(
    'Lawyer pathway',
    'a wise , determined manipulator',
    'assets/images/Vocations/lawyer.jpg',
    'a detective pistol',
    'brain wash',
    'distortion',
  ),

  prisoner(
     'Prisoner pathway',
     'an adpative and transformative fighter',
     'assets/images/Vocations/prisoner.jpg',
     'two pistols',
     'zombie transformation',
     'obtain followers',

  );

     const Vocation(
    this.title ,
    this.description,
    this.image,
    this.weapon,
    this.ability,
    this.ability2,
  );

 //fields

 
  final String title;
  final String description;
  final String image;
  final String weapon;
  final String ability;
  final String ability2;


}