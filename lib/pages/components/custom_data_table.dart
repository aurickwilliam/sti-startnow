import 'package:flutter/material.dart';

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
        child: DataTable(
          
          // Specify the columns
          columns: columnNames.map((item) {
            return DataColumn(
              label: Text(
                item,
              )
            );
          }).toList(),
        
          // Specify Each Row
          // Automate this using map? when working on backend
          rows: dataTableValues.map((item) {
            return DataRow(
              cells: item.map((value){
                return DataCell(
                  Text(value)
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}