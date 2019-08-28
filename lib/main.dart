import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:self_expenses/widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // String titleInput, amountInput;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _addNewTransaction(String title, double amount) {
    Transaction tx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(tx);
    });
  }

  final List<Transaction> _userTransactions = [
    Transaction(
      amount: 50,
      date: DateTime.now(),
      title: 'Shoes',
      id: 't1',
    ),
    Transaction(
      amount: 45,
      date: DateTime.now(),
      title: 'Gym Membership',
      id: 't2',
    ),
    Transaction(
        id: 't3',
        title: 'Very Expensive Panties',
        date: DateTime.now(),
        amount: 999),
  ];
  void _showAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.red,
        context: ctx,
        builder: (f) {
          return Text('stuff');
        });
  }

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('A Very Cool Bar 😎'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => showModalBottomSheet(builder: (f){return null;},context: buildContext),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
              Card(
                color: Colors.green,
                elevation: 14,
                child: Container(
                  height: 50,
                  width: 150,
                  child: Center(
                    child: Text(
                      'Place Holder',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              NewTransaction(_addNewTransaction),
              TransactionList(_userTransactions),
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () => showModalBottomSheet(context: buildContext,builder: (g){return Text('data');}),
        ),
      ),
    );
  }
}