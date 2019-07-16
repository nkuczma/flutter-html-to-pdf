import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'mail.dart';
import 'html_service.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

printColor(message) {
  print("\u001b[32m $message \u001b[0m");
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<void> generateExampleDocument() async {
 
    var htmlService = HtmlService('Natalia Kuczma');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    var targetPath = appDocDir.path;
    var targetFileName = "example-pdf";
    printColor(targetPath);
    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlService.returnFirstPage(), targetPath, targetFileName);
    printColor("plik wygenerowany");
    printColor(generatedPdfFile);
    try {
      List<File> attachments = [];
      attachments.addAll([generatedPdfFile]);
      var mailService = MailService();
      Duration timeLimit = Duration(seconds: 40);
      var result = await mailService
          .sendReimbursement(attachments)
          .timeout(timeLimit);
    }
    catch(e) {
      printColor(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: RaisedButton(
            child: Text("Send File"),
            onPressed: () {
              printColor('send document');
              generateExampleDocument();
            },
          ),
        ),
      ),
    );
  }
}
