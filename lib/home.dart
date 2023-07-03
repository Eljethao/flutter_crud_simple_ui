import 'package:crud_ui/add_user.dart';
import 'package:crud_ui/edit_user.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => Column(
          children: [
            userCard(context),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUser(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Container userCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 50,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EljeThao Churching',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text('02098759831')
                ],
              )
            ],
          ),
          manageButton()
        ],
      ),
    );
  }

  Row manageButton() {
    return Row(
      children: [
        editIconButton(),
        deleteIconButton(),
      ],
    );
  }

  IconButton deleteIconButton() {
    return IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Delete'),
              content: Text('Do you want to delete this item?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK')),
              ],
            ),
          );
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ));
  }

  IconButton editIconButton() {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditUser(),
            ));
      },
      icon: Icon(
        Icons.edit,
        color: Colors.blue,
      ),
    );
  }
}
