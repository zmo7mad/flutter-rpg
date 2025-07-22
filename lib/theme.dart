import 'package:flutter/material.dart';

class AppColors {
   static Color primaryColor = Color.fromRGBO(182, 182, 182, 1);
   static Color primaryAccent = const Color.fromARGB(255, 53, 52, 52);
   static Color secondaryColor = const Color.fromARGB(255, 164, 61, 50);
   static Color backgroundColor = const Color.fromARGB(255, 103, 37, 61);
   static Color textColor = const Color.fromARGB(255, 183, 183, 183); 
   static Color successColor = const Color.fromARGB(255, 39, 38, 38);
   static Color highlightColor = const Color.fromARGB(255, 255, 255, 255);
  static Color titleColor = const Color.fromARGB(255, 219, 219, 219);
}
//seed color 
ThemeData primarytheme = ThemeData(
colorScheme: ColorScheme.fromSeed(
  seedColor: AppColors.primaryColor,),

// scaffold color
  scaffoldBackgroundColor: AppColors.primaryAccent,

//appbar theme 
appBarTheme: AppBarTheme(
backgroundColor: AppColors.successColor,
foregroundColor: AppColors.textColor,
surfaceTintColor: Colors.transparent,
centerTitle: true,

),
textTheme: TextTheme() .copyWith(
  bodyMedium: TextStyle(
   color: AppColors.textColor,
   fontSize: 18, 
   letterSpacing: 1,
  ),
headlineMedium: TextStyle(
   color: AppColors.titleColor,
   fontSize :19 , 
   letterSpacing: 1,
   fontWeight: FontWeight.bold
  ),
  titleMedium: TextStyle(
   color: AppColors.highlightColor,
   fontSize: 20, 
   letterSpacing: 1,
  ),
  bodySmall: TextStyle(
    color : AppColors.textColor,
    fontSize: 20,
    letterSpacing: 1,

  )
),
//card theme
cardTheme: CardThemeData(
  color: AppColors.backgroundColor,
  surfaceTintColor: Colors.transparent,
  shape: const RoundedRectangleBorder() ,
  shadowColor: const Color.fromARGB(255, 0, 0, 0) ,
  margin: const EdgeInsets.only(bottom: 17)
  ),
   //input decoration theme
   inputDecorationTheme: InputDecorationTheme(
    filled : true,
    fillColor : AppColors.secondaryColor.withValues(alpha: 0.5),
    labelStyle:TextStyle(color:AppColors.textColor),
    prefixIconColor:AppColors.textColor,
   
    //border radius 
    border : OutlineInputBorder(
       borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
    
    ),
   
   ),
   //dialog theme
   dialogTheme: DialogThemeData(
     backgroundColor:AppColors.primaryAccent ,
   ),
   

);




