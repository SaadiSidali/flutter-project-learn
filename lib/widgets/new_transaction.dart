import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _add;
  NewTransaction(this._add);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitDate() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    _add(titleController.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              // onChanged: (val) => titleInput = val,
              controller: titleController,
              decoration: InputDecoration(
                counterText: '0/100',
                labelText: 'Title',
              ),
              onSubmitted: (s) {
                submitDate();
              },
            ),
            TextField(
              onSubmitted: (s) {
                submitDate();
              },
              keyboardType: TextInputType.number,
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            FlatButton(
              textColor: Colors.purple,
              child: Text(
                'Submit',
              ),
              onPressed: submitDate,
            )
          ],
        ),
      ),
    );
  }
}
