import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference expenses = FirebaseFirestore.instance.collection('expenses');

  Future<void> addExpense(String name, double amount) async {
    await expenses.add({
      'name': name,
      'amount': amount,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> updateExpense(String docId, String name, double amount) {
    return expenses.doc(docId).update({
      'name': name,
      'amount': amount,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteExpense(String docId) {
    return expenses.doc(docId).delete();
  }

  static Stream<QuerySnapshot> getLatestExpensesStream() {
    return FirebaseFirestore.instance.collection('expenses')
      .orderBy('timestamp', descending: true)
      .limit(4)  // Limit the number of expenses to 4
      .snapshots();
  }

  static Stream<QuerySnapshot> getAllExpensesStream() {
    return FirebaseFirestore.instance.collection('expenses')
      .orderBy('timestamp', descending: true)
      .snapshots();
  }
}
