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
              onSubmitted: (_) => _submitData(context),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(context),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.green,
              onPressed: () => _submitData(context),
            )
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }

  void _submitData(BuildContext context) {
    final enteredTitle = titleController.text;
    final enteredAmount = double.tryParse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredAmount == null) {
      return;
    }

    onAdd(enteredTitle, enteredAmount);
    FocusScope.of(context).unfocus();
  }
}
