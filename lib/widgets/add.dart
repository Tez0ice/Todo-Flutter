import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});
  var todoName = TextEditingController();
  var todoDesc = TextEditingController();
  var place = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Page"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter todo Name",
            ),
            controller: todoName,
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter todo Description",
            ),
            controller: todoDesc,
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter place",
            ),
            controller: place,
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
              onPressed: () {
                print(todoName.text);
                print(todoDesc.text);
                print(place.text);

               var newItem = {
                 "todoName" : todoName.text,
                 "todoDesc" : todoDesc.text,
                 "place" : place.text,
                 "completed" : false
               };

                Navigator.pop(context,newItem);
              },
              child: Text("Add To do"))
        ],
      ),
    );
  }
}
