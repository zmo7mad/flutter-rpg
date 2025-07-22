import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(
    this.character, {
    super.key,
  });

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          // Available points container
          Container(
            color: AppColors.primaryColor.withValues(alpha: 0.5),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                AnimatedRotation(
                  turns : turns,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(Icons.star, 
                  color: widget.character.points > 0 ? Colors.yellow:Colors.grey,
                  ),
                ),
                const SizedBox(width: 20),
                  Expanded(
                  child:Text('Stats points available',
                style: GoogleFonts.kanit(
                    color : widget.character.points > 0 ? Colors.white : Colors.grey,
                ),
                  ),),
                  StyledHeading(widget.character.points.toString()),
                const SizedBox(width: 20),
              ],
            ),
          ),
          Table(
            children:
            widget.character.StatsAsFormattedList.map((stat)
            {
             return TableRow(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),     
                color : AppColors.textColor.withValues(alpha: 0.2)
              ),
              children: [
                //stat title 
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                   padding: const EdgeInsets.all(8),
                   child : StyledTitle(stat['title']!),
                    ),
                   ),
                  
                 //stat value
                    TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                   padding: const EdgeInsets.all(10),
                   child : StyledHeading(stat['value']! ),
                    ),
                   ),
                //icon to increase the stat 
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: IconButton(
                       
                     icon: Icon(Icons.arrow_upward , color: AppColors.highlightColor,),
                     onPressed:() {
                     setState(() {
                        widget.character.increaseStat(stat['title']!);
                        turns += 0.5;
                     });


                     },
                  
                  ),
                ),
                   //icon to decrease the stat 
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: IconButton(
                     icon: Icon(Icons.arrow_downward , color: AppColors.highlightColor,),
                     onPressed:() {
                     setState(() {
                        widget.character.decreaseStat(stat['title']!);
                        turns -= 0.5;
                     });
                     },
                  ),
                ),

              ],
             );

            },).toList(),
          ),





        ],
      ),
    );
  }
}
