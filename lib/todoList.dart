import 'dart:ui';

import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Todos",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Divider(
                color: Colors.grey[100],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[200],
                ),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        isComplete = !isComplete;
                      });
                    },
                    leading: Container(
                      padding: EdgeInsets.all(2),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle),
                      child: isComplete
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : Container(),
                    ),
                    title: Text(
                      "Todo title",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[200],
                          fontWeight: FontWeight.w600),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
              context: context,
              child: SimpleDialog(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Row(
                  children: [
                    Text(
                      "Add Todo",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.grey,
                        size: 30,
                      ),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
                children: [
                  Divider(),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 18, height: 1.5, color: Colors.white),
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "eg. Go to gym",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Add"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
