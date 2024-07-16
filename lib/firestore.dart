import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference expenses = FirebaseFirestore.instance.collection('expenses');

  Future<void> addExpense(String name, double amount) async {
    await expenses.add({
      'name': name,
      'amount': amount,
      'timestamp': Timestamp.now(),
    });

    // Check and delete older expenses if there are more than 5
    QuerySnapshot snapshot = await expenses.orderBy('timestamp', descending: true).get();
    if (snapshot.docs.length > 4) {
      for (int i = 4; i < snapshot.docs.length; i++) {
        await snapshot.docs[i].reference.delete();
      }
    }
  }

  // UPDATE: Update an expense given a document ID
  Future<void> updateExpense(String docId, String name, double amount) {
    return expenses.doc(docId).update({
      'name': name,
      'amount': amount,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE: Delete an expense given a document ID
  Future<void> deleteExpense(String docId) {
    return expenses.doc(docId).delete();
  }

  static Stream<QuerySnapshot> getLatestExpensesStream() {
    return FirebaseFirestore.instance.collection('expenses')
      .orderBy('timestamp', descending: true)
      .limit(5)  // Limit the number of expenses to 5
      .snapshots();
  }

  static Stream<QuerySnapshot> getAllExpensesStream() {
    return FirebaseFirestore.instance.collection('expenses')
      .orderBy('timestamp', descending: true)
      .snapshots();
  }
}
