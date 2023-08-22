import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  //1 Create a variable where the send data will be store
  Map<String, dynamic> todoItem;

  //2 Create a constructor of the page
  // maybe just maybe kind of classified what the object consist at
  DetailPage({required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("To do Name: "),
                Text(todoItem["todoName"]!),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("To do Description: "),
                Text(todoItem["todoDesc"]!),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("To do Name: "),
                Text(todoItem["place"]!),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context,{"action":1,"object":todoItem});

                    },
                    icon: Icon(Icons.delete),
                    label: Text("Delete")),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context,{"action":2,"object":todoItem});
                    },
                    icon: Icon(Icons.check),
                    label: todoItem["completed"] ? Text("Undo") : Text("Mark As Complete")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
