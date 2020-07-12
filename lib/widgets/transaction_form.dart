import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final void Function(String title, double amount) onAdd;

  TransactionForm({
    Key key,
    @required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.green,
              onPressed: () {
                onAdd(
                  titleController.text,
                  double.tryParse(amountController.text),
                );
                FocusScope.of(context).unfocus();
              },
            )
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
