import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CustomDataTable extends StatelessWidget {
  final List<List> dataTableValues;
  final List<String> columnNames;

  const CustomDataTable({
    super.key,
    required this.columnNames,
    required this.dataTableValues,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 5,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width
          ),
          child: DataTable(
            headingTextStyle: GoogleFonts.roboto(
              color: AppTheme.colors.primary,
              fontWeight: FontWeight.bold,
            ),
              
            // Specify the columns
            columns:
                columnNames.map((item) {
                  return DataColumn(label: Text(item));
                }).toList(),
              
            // Specify Each Row
            // Automate this using map? when working on backend
            rows:
                dataTableValues.map((item) {
                  return DataRow(
                    cells:
                        item.map((value) {
                          if (value is Widget) {
                            return DataCell(value);
                          }
                          return DataCell(Text(value.toString()));
                        }).toList(),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
