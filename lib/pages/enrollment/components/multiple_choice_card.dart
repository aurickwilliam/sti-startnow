import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class MultipleChoiceCard extends StatelessWidget {
  final String question;
  final List<String> choices;
  final String selectedItem;
  final Function(String) onChanged;

  const MultipleChoiceCard({
    super.key,
    required this.question,
    required this.choices,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Title
            Text(
              question,
              style: GoogleFonts.roboto(
                color: AppTheme.colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 10,),

            // Choices
            Column(
              children: choices.map((item) {
                
                // To change the design if it is selected
                bool isSelected = selectedItem == item;

                return Material(
                  color: AppTheme.colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      selected: isSelected,
                    
                      // Title or Text
                      title: Text(
                        item,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? AppTheme.colors.gold :  AppTheme.colors.black,
                        ),
                      ),
                    
                      // Radio Button
                      leading: Radio(
                        value: item, 
                        groupValue: selectedItem, 
                        onChanged: (value){
                          onChanged(item);
                        },
                        activeColor: isSelected ? AppTheme.colors.gold : AppTheme.colors.gray,
                      ),
                    
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: isSelected ? AppTheme.colors.gold : AppTheme.colors.gray,
                          width: 3,
                        )
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}