import 'dart:convert';

import 'package:flutter/material.dart';
import "add.dart";
import "details.dart";
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var todos = [
    // {
    //   "todoName": "Learn ListView",
    //   "todoDesc": "ListView,ListTitle,Card",
    //   "place": "Meeting Room"
    // },
    // {
    //   "todoName": "Lunch",
    //   "todoDesc": "1 hour 15 minutes",
    //   "place": "Own Choice"
    // },
    // {
    //   "todoName": "Navigation (part 2)",
    //   "todoDesc": "pass forward and pass back data",
    //   "place": "Meeting Room"
    // },
  ];
  @override
  void initState(){
    super.initState();
    loadData();
  }

  void loadData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedItem = prefs.getString("todos");
    if (savedItem != null){
      setState(() {
        todos = jsonDecode(savedItem);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do App"),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
              onPressed: () async{
                //await means to let the next page finish its operation
                var newItem = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPage()));

                if (newItem != null){
                  todos.add(newItem);

                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString("todos", jsonEncode(todos));
                  setState(() {
                    // could also means refreshing to change the state
                    // refreshing the todos
                    todos;
                  });
                }
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: todos[index]["completed"]! ? Icon(Icons.check): SizedBox(),
                title: Text(todos[index]["todoName"]!),
                subtitle: Text(todos[index]['place']!),
                trailing: Icon(Icons.chevron_right),
                onTap: () async{
                  var data = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPage(todoItem: todos[index],))
                  );
                  if (data != null){
                    if (data["action"] == 1){
                      todos.remove(data["object"]);
                      //Save

                      final SharedPreferences prefs = await SharedPreferences.getInstance();

                      prefs.setString("todos", jsonEncode(todos));

                      setState(() {
                        todos;
                      });
                    }

                    else{
                      var retrievedObject = data["object"];
                      for (var i = 0; i < todos.length; i++){
                        if (todos[i]["todoName"]! == retrievedObject["todoName"] &&
                            todos[i]["todoDesc"]! == retrievedObject["todoDesc"] &&
                            todos[i]["place"]! == retrievedObject["place"]
                        ){
                          todos[i]["completed"] = !todos[i]["completed"];
                          break;
                        }
                      }
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      //
                      //
                      prefs.setString("todos",jsonEncode(todos));

                      setState(() {
                        todos;
                      });
                    }
                    //endif
                  }
                },
              ),
            );
          }),
    );
  }
}
