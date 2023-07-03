import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String gender = '';

  final type = ['Admin', 'User'];
  String? chooseType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            firstNameTextField(context),
            const SizedBox(height: 18),
            lastNameTextField(context),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 36),
              child: Row(
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            genderRadio(),
            const SizedBox(height: 18),
            birthdayDateTime(context),
            const SizedBox(height: 18),
            phoneTextField(context),
            const SizedBox(height: 18),
            userTypeDropdown(context),
            const SizedBox(height: 90),
            saveButton(context)
          ],
        ),
      ),
    );
  }

  Container saveButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Save',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Container userTypeDropdown(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: DropdownButton(
          isExpanded: true,
          value: chooseType,
          hint: const Text('Select'),
          items: type
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              chooseType = value.toString();
            });
          }),
    );
  }

  Container phoneTextField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          label: Text('Phone'),
        ),
      ),
    );
  }

  Container birthdayDateTime(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            label: Text('Birthday'),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.calendar_month),
            )),
      ),
    );
  }

  Padding genderRadio() {
    return Padding(
      padding: const EdgeInsets.only(left: 34),
      child: Row(
        children: [
          Row(
            children: [
              Radio(
                value: 'MALE',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              Text('Male')
            ],
          ),
          const SizedBox(width: 30),
          Row(
            children: [
              Radio(
                value: 'FEMALE',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              Text('Female')
            ],
          ),
        ],
      ),
    );
  }

  Container lastNameTextField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          label: Text('LastName'),
        ),
      ),
    );
  }

  Container firstNameTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            label: Text('FirstName')),
      ),
    );
  }
}
