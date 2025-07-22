import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';

class Heart extends StatefulWidget {
  const Heart ({super.key , required this.character});
 
  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;
  @override
   void initState() {
     _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this
     );


     _sizeAnimation = TweenSequence([
        TweenSequenceItem<double>(
          tween : Tween(begin :25 , end : 40),
          weight : 50,
        ),
        TweenSequenceItem<double>(
          tween : Tween(begin :40 , end : 25),
          weight : 50,
        ),
     ]).animate(_controller);
  }
  Widget build(BuildContext context) {
    return AnimatedBuilder (
      animation: _controller,
      builder :(context , child ) {
     return Align(
      alignment: Alignment.centerRight,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: widget.character.isFav ? Colors.red : Colors.grey,
              size: _sizeAnimation.value,
            ),
            onPressed: () {
              setState(() {
                widget.character.toggleFav();
                _controller.reset();
                _controller.forward();
              });
            },
          );
        },
      ),
    );
      });
  }
}