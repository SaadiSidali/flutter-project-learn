import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:self_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx,index)
        {
            return Card(
            elevation: 6,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.green,
                    width: 2,
                  )),
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  child: Text(
                    '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 24,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _userTransactions[index].title,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat().format(_userTransactions[index].date),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Colors.lightBlueAccent,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: _userTransactions.length,
        
      ),
    );
  }
}
