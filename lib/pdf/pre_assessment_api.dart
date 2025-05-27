
import 'dart:io';

import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pdf/save_and_open_pdf.dart';

class PreAssessmentApi {
  // Method to create the pdf
  static Future<File> generatePreAssessment(Student student) async {
    // Document object
    final pdf = Document();
    
    // Sti logo
    final stiLogo = (await rootBundle.load("assets/img/sti_caloocan_logo.png")).buffer.asUint8List();

    // DUMMY ARRAY FOR SCHEDULE
    final List<List> data = [];

    student.enrollment.subjectList?.asMap().forEach((index, innerList) {
      data.add(
        [
          index + 1, 
          innerList.subjectCode,
          innerList.subject,
          innerList.section,
          innerList.units,
          innerList.startTime,
          innerList.endTime,
          innerList.day,
          innerList.room,
        ]
      );
    });

    double totalUnits(){
      double total = 0;

      student.enrollment.subjectList?.forEach((innerList) {
        total += innerList.units;
      });

      return total;
    }

    pdf.addPage(
      Page(
        margin: const EdgeInsets.all(30),
        build: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HEADER
            header(stiLogo),

            SizedBox(height: 20),

            Text(
              "Student Details:",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline
              )
            ),

            SizedBox(height: 10),

            // STUDENT INFORMATION
            studentTable(student),

            SizedBox(height: 10),

            Text(
              "Payment Information:",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline
              )
            ),

            SizedBox(height: 10),

            // PAYMENT INFORMATION
            TableHelper.fromTextArray(
              headers: [
                "Type of Payment:", 
                "Payment Location:", 
                "Reference/OR No.:", 
                "Amount:", 
                "Discount:", 
                "Contact No."
              ],
              data: [
                [
                  student.enrollment.paymentType, 
                  student.enrollment.paymentLocation, 
                  student.enrollment.referenceNo, 
                  "P${student.enrollment.amountPaid}", 
                  "", 
                  student.contactNo
                ]
              ],
              columnWidths: {
                0: FlexColumnWidth(1), // Type
                1: FlexColumnWidth(1), // location
                2: FlexColumnWidth(1), // reference
                3: FlexColumnWidth(1), // amount
                4: FlexColumnWidth(1), // discount mas pinalaki ko lang
                5: FlexColumnWidth(1), // contact
              },

              // HEADER
              headerStyle: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold
              ),
              headerAlignment: Alignment.centerLeft,

              // CELL
              cellStyle: TextStyle(
                fontSize: 8,
              ),

              border: TableBorder.all(
                width: 0.5
              )
            ),

            SizedBox(height: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Schedule:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                    )
                  ),

                  SizedBox(height: 10),

                  // SCHEDULE TABLE
                  TableHelper.fromTextArray(
                    headers: [
                      "#",
                      "CODE", 
                      "COURSE DESC",
                      "SECTION", 
                      "UNITS", 
                      "TIME",
                      "",
                      "DAY",
                      "RM"
                    ],
                    data: data,
                    border: null,

                    columnWidths: {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(5),
                      3: FlexColumnWidth(1),
                      4: FlexColumnWidth(1),
                      5: FlexColumnWidth(1),
                      6: FlexColumnWidth(1),
                      7: FlexColumnWidth(1),
                      8: FlexColumnWidth(1),
                    },

                    // HEADERS
                    headerStyle: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                    headerCellDecoration: BoxDecoration(
                      color: PdfColors.grey200
                    ),
                    
                    
                    // CELLS
                    cellStyle: TextStyle(
                      fontSize: 8
                    ),
                    cellAlignments: {
                      0: Alignment.center,
                      1: Alignment.center,
                      2: Alignment.centerLeft,
                      3: Alignment.center,
                      4: Alignment.center,
                      5: Alignment.center,
                      6: Alignment.center,
                      7: Alignment.center,
                      8: Alignment.center,
                    }
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        "Total Units:",
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold
                        )
                      ),

                      SizedBox(width: 5),

                      Text(
                        totalUnits().toString(),
                        style: TextStyle(
                          fontSize: 8,
                        )
                      )
                    ]
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        "Date Registered:",
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold
                        )
                      ),

                      SizedBox(width: 5),

                      Text(
                        DateTime.now().toString().substring(0, 10),
                        style: TextStyle(
                          fontSize: 8,
                        )
                      )
                    ]
                  )
                ]
              )
            ),

            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "*To secure the slot for enrollment make sure to settle the amount of P5000 as lower downpayment",
                    style: TextStyle(
                      fontSize: 8,
                    )
                  ),
                  
                  Text(
                    "*For Fullpayment scheme, please settle it upon enrollment on or before January 06, 2024.",
                    style: TextStyle(
                      fontSize: 8,
                    )
                  ),

                  Text(
                    "*Failure to settle the payment before the due date will be automatically re-assess to installment payment scheme.",
                    style: TextStyle(
                      fontSize: 8,
                    )
                  ),

                  SizedBox(height: 20),

                  Text(
                    " 109 Samson Road corner Caimito Street, Caloocan City 1400 | Tel. no. (+632) 294-4001",
                    style: TextStyle(
                      fontSize: 7,
                      fontStyle: FontStyle.italic
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );

    return SaveAndOpenPdf.savePdf(name: "pre-assessment-${student.lastName?.toLowerCase()}.pdf", pdf: pdf);
  }

  static Widget header(Uint8List stiLogo) {
    String getDateTime(){
      String date = DateTime.now().toString().substring(0, 10);
      String time = DateTime.now().toString().substring(11, 19);

      return "$date $time";
    }

    return Row(
      children: [
        Container(
          height: 75,
          width: 75,
          child: Image(
            MemoryImage(stiLogo),
          )
        ),

        SizedBox(width: 20),

        Expanded(
          child: Column(
            children: [
              Text(
                "Pre-assessment",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                "STI Caloocan Enrollment AY2024-2025 2nd Term",
                style: TextStyle(
                  fontSize: 10
                )
              ),
              Text(
                "109 Samson Road corner Caimito Street, Caloocan City 1400 | Tel. no. (+632) 294-4001",
                style: TextStyle(
                  fontSize: 7
                )
              )
            ]
          ),
        ),

        SizedBox(width: 20),

        Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              getDateTime(),
              style: TextStyle(
                fontSize: 10,
              )
            )
          )
        )
      ]
    );
  }

  static Widget studentTable(Student student){
    return Container(
      child: Column(

        children: [
          Row(
            children: [
              tableCell(value: "Student No.:", isBold: true),
              tableCell(value: student.studentNo!, ),
              tableCell(value: "Student Name:", isBold: true),
              tableCell(value: student.fullName, flex: 3),
              tableCell(value: "Status:", isBold: true),
              tableCell(value: student.enrollment.academicStatus ?? ' No Status',),
            ]
          ),
          Row(
            children: [
              tableCell(value: "Program:", isBold: true),
              tableCell(value: student.programAcronym,),
              tableCell(value: "Year Level:", isBold: true),
              tableCell(value: student.enrollment.yearLevel!,),
              tableCell(value: "Allowed Units:", isBold: true),
              tableCell(value: "0",),
              tableCell(value: "Student Type:", isBold: true),
              tableCell(value: student.enrollment.admissionType!,),
            ]
          )
        ]
      )
    );
  }

  static Widget tableCell({required String value, int flex = 1, bool isBold = false }){
    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5
          )
        ),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 8,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal
          )
        )
      )
    );
  }
}