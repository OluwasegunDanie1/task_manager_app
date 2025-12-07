import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/taskmodel.dart';

class TaskProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Taskmodel> _task = [];
  List<Taskmodel> get task => _task;

  Future<void> addTaskToFirebase(Taskmodel taskModel) async {
    final user = _auth.currentUser;
    if (user == null) {
      debugPrint(' No user logged in');
      return;
    }

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .add(taskModel.toMap());

      await fetchTasksFromFirebase();
    } catch (e) {
      debugPrint('Error adding task: $e');
    }
  }

  Future<void> fetchTasksFromFirebase() async {
    final user = _auth.currentUser;
    if (user == null) {
      debugPrint(' No user logged in');
      return;
    }

    try {
      final QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .orderBy('dueDate')
          .get();

      _task = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Taskmodel.fromMap(data, doc.id);
      }).toList();

      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching tasks: $e');
    }
  }

  Future<void> deleteTask(String id) async {
    final user = _auth.currentUser;
    if (user == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .doc(id)
          .delete();

      _task.removeWhere((t) => t.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting task: $e');
    }
  }
}
