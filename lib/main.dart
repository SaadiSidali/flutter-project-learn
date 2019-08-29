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
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
        title: 'Very Expensive Stuff',
        date: DateTime.now(),
        amount: 999),
  ];

  void _showAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (f) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A Very Cool Bar 😎'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          Builder(
            builder: (bb) => IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _showAddNewTransaction(context);
                }),
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
            TransactionList(_userTransactions),
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          _showAddNewTransaction(context);
        },
      ),
    );
  }
}
