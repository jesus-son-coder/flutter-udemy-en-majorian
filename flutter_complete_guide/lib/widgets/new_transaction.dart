import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                ),
                TextButton (
                  style: TextButton.styleFrom(primary: Colors.purple),
                  child: Text('Add Transaction'),
                  onPressed: () {
                    print(titleController.text);
                  },
                ),
                RaisedButton(
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: Text('Add Transaction'),
                  onPressed:  () {
                    print(amountController.text);
                  },
                ),
              ]
          ),
        )
    );
  }
}