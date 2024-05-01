import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helpers/logout.dart';
import '../../models/journal.dart';
import '../../services/journal_service.dart';
import '../commom/exception_dialog.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  final bool isEditing;
  final TextEditingController _contentController = TextEditingController();

  AddJournalScreen({
    super.key,
    required this.journal,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    //Se for um card vazio, nada será atribuído, se for um card existente o texto será apresentado
    _contentController.text = journal.content;
    return Scaffold(
      appBar: AppBar(
        title: Text(WeekDay(journal.createdAt).toString()),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal(context);
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }

  registerJournal(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString("accessToken");
      if (token != null) {
        String content = _contentController.text;

        journal.content = content;
        JournalService service = JournalService();

        if (isEditing) {
          service.register(journal, token).then(
            (value) {
              Navigator.pop(context, value);
            },
          ).catchError(
            (error) {
              logout(context);
            },
            test: (error) => error is TokenNotValidException,
          ).catchError((error) {
            showExceptionDialog(context, content: error.message);
          }, test: (error) => error is HttpException);

        } else {
          service.edit(journal.id, journal, token).then(
            (value) {
              Navigator.pop(context, value);
            },
          ).catchError(
            (error) {
              logout(context);
            },
            test: (error) => error is TokenNotValidException,
          ).catchError((error) {
            showExceptionDialog(context, content: error.message);
          }, test: (error) => error is HttpException);
        }
      }
    });
  }
}
