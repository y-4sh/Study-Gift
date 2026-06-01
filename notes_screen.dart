import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadNote();
  }

  Future<void> loadNote() async {
    final prefs = await SharedPreferences.getInstance();

    controller.text =
        prefs.getString("note") ?? "";
  }

  Future<void> saveNote(String value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("note", value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      appBar: AppBar(
        title: const Text("Notes"),
        backgroundColor: Colors.transparent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: TextField(
          controller: controller,
          maxLines: null,

          onChanged: saveNote,

          decoration: InputDecoration(
            hintText: "Write your notes...",
            filled: true,
            fillColor: Colors.white10,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}