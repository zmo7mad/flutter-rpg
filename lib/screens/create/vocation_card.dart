import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.onTap,
    required this.selected,

    });
    final Vocation vocation;
    final void Function(Vocation) onTap;
    final bool selected;
  @override
  Widget build(BuildContext context) 
  { return GestureDetector(
    onTap: () {
      onTap(vocation);
    },
    child: Card(
      color : selected ? AppColors.backgroundColor: AppColors.primaryAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 20,
        ),
        child :Row ( 
          children: [
            // vocation image
            SizedBox(
              width: 80, // Set your desired width
              height: 120, // Set your desired height
              child: Image.asset(
                '${vocation.image}',
                colorBlendMode: BlendMode.color,
                color: !selected ? Colors.black.withValues(
                  alpha: 0.7,
                ) : null,
               fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeading(vocation.name),
                  StyledText(vocation.description),
                ],
              ),
            ),
          ],
        
          
          )
      )
    ),
    );
  }
}
