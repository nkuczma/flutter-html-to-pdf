import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:io';

class MailService {

  Future<List<SendReport>> sendReimbursement(List<File> files) async {
    String username = 'making-trip@makingwaves.com';
    // String password = 'password';

    final SmtpServer smtpServer = SmtpServer(
      "smtp.sendgrid.net",
      username: "azure_d7e73743ef19d3fbf59c55451f8ffc34@azure.com",
      password: "Mailowanie123!",
    );
    //smtpServer.
    // Create our message.
    final message = Message()
      ..from = Address(username, 'Making Trip')
      ..recipients.add('natalia.kuczma@makingwaves.com')
      ..subject = 'Your files are ready'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Congratulations!</h1>\n<p>We can put any text here !</p>";

    for (var file in files) {
      message.attachments.add(FileAttachment(file));
    }

    return await send(message, smtpServer);
  }
}