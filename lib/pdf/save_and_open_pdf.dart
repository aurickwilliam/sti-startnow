import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SaveAndOpenPdf {
  static Future<File> savePdf({required String name, required Document pdf}) async {

    // To check whether permission is given for this app or not.
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      // If not we will ask for permission first
      await Permission.storage.request(); 
    }

    Directory directory = Directory("");
    
    if (Platform.isAndroid) {
       // Redirects it to download folder in android
      directory = Directory("/storage/emulated/0/Download");
      // _directory = await getTemporaryDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    
    String baseName = name;
    String fileName = baseName;
    int count = 1;

    // Check if nag eexist na sa download folder ung file na un
    while (File('${directory.path}/$fileName').existsSync()) {
      final nameWithoutExtension = baseName.replaceAll(RegExp(r'\.pdf$'), '');
      fileName = '$nameWithoutExtension($count).pdf';
      count++;
    }

    // Specify kung saan isasave tas ung name niya
    final file = File('${directory.path}/$fileName');

    // Save ung file, iwrite na ung bytes
    await file.writeAsBytes(await pdf.save());

    // location kung nasaan
    debugPrint('${directory.path}/$name');

    return file;
  }

  static Future<void> openPdf(File file) async {
    // get the path
    final path = file.path;

    // open the path
    await OpenFile.open(path);
  }
}