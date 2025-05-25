
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final List<List> data = [
      [1 , 2175, "GEDC1009", "Ethics", "CS401", 3, "07:00AM", "10:00AM", "F", "402"],
      [2 , 1753, "COSC1010", "Fundamentals of Mobile Programming (LEC)", "CS401", 2, "09:00AM", "11:00AM", "TH", "402"],
      [3 , 2517, "GEDC1041", "Philippine Popular Culture", "CS401", 3, "010:00AM", "01:00PM", "T", "402"],
      [4 , 1749, "COSC1007", "Human-Computer Interaction(LAB)", "CS401", 1, "11:30AM", "01:00PM", "TH", "601"],
      [5 , 1709, "CITE1011", "Information Management (LAB)", "CS401", 1, "07:00AM", "10:00AM", "W", "603"],
      [6 , 1749, "COSC1007", "Human-Computer Interaction (LEC)", "CS401", 2, "07:00AM", "09:00AM", "TH", "402"],
      [7 , 1709, "CITE1011", "Information Management (LEC)", "CS401", 2, "07:00AM", "10:00AM", "S", "402"],
      [8 , 2811, "INTE1023", "Computer Systems Architecture", "CS401", 3, "09:00AM", "11:00AM", "S", "402"],
      [9 , 2536, "GEDC1045", "Great Books", "CS401", 3, "07:00AM", "10:00AM", "T", "402"],
      [10 , 1751, "COSC1009", "Design and Analysis of Algorithms", "CS401", 3, "10:00AM", "01:00PM", "F", "402"],
      [11 , 3065, "PHED1008", "P.E./PATHFIT 4: Team Sports", "CS401", 2, "11:00AM", "01:00PM", "S", "BC-4"],
      [12 , 1753, "COSC1010", "Fundamentals of Mobile Programming (LAB)", "CS401", 1, "10:00AM", "01:00PM", "W", "603"],
    ];

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
                      "CLS#",
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
                      2: Alignment.center,
                      3: Alignment.centerLeft,
                      4: Alignment.center,
                      5: Alignment.center,
                      6: Alignment.center,
                      7: Alignment.center,
                      8: Alignment.center,
                      9: Alignment.center,
                      10: Alignment.center,
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
                        "23",
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

    return SaveAndOpenPdf.savePdf(name: "pre-assessment-surname.pdf", pdf: pdf);
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
              tableCell(value: "REGULAR",),
            ]
          ),
          Row(
            children: [
              tableCell(value: "Program:", isBold: true),
              tableCell(value: "BSCS",),
              tableCell(value: "Year Level:", isBold: true),
              tableCell(value: student.enrollment.yearLevel!,),
              tableCell(value: "Allowed Units:", isBold: true),
              tableCell(value: "0",),
              tableCell(value: "Student Type:", isBold: true),
              tableCell(value: "OLD STUDENT",),
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