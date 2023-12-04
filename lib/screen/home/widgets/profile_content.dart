import 'package:flutter/material.dart';

class ProfileContent extends StatefulWidget {
  final Map<String, dynamic> bio;
  final void Function(String fname, String lname, String fatName) onSave;
  const ProfileContent({super.key, required this.onSave, required this.bio});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final fatherName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.bio.isEmpty
              ? const SizedBox.shrink()
              : Row(
                  children: [
                    Text(
                        'Здравствуйте,\n${widget.bio["lastName"]} ${widget.bio["firstName"]} ${widget.bio["fatherName"]}'),
                  ],
                ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: firstName,
            decoration: const InputDecoration(
              labelText: 'Имя',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: lastName,
            decoration: const InputDecoration(
              labelText: 'Фамилия',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: fatherName,
            decoration: const InputDecoration(
              labelText: 'Отчество',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              widget.onSave(
                firstName.text.trim(),
                lastName.text.trim(),
                fatherName.text.trim(),
              );
            },
            child: const Text('Сохранить данные'),
          ),
        ],
      ),
    );
  }
}
