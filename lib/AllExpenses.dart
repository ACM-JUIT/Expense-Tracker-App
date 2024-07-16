import 'package:basecode/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllExpenses extends StatelessWidget {
  const AllExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Expenses', style: TextStyle(fontWeight: FontWeight.w700),),
        backgroundColor: const Color.fromRGBO(42, 124, 118, 1),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirestoreService.getAllExpensesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> expenseList = snapshot.data!.docs;

            if (expenseList.isEmpty) {
              return const Center(
                child: Text('No expenses added'),
              );
            }

            return ListView.builder(
              itemCount: expenseList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = expenseList[index];
                Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

                if (data == null) {
                  return const ListTile(
                    title: Text('No data'),
                  );
                }

                String? expenseName = data['name'] as String?;
                double? expenseAmount = data['amount'] as double?;

                if (expenseName == null || expenseAmount == null) {
                  return const ListTile(
                    title: Text('Invalid data'),
                  );
                }

                return ListTile(
                  title: Text(expenseName),
                  subtitle: Text('Amount: \$${expenseAmount.toStringAsFixed(2)}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}