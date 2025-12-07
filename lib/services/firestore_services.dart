import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytaskapp/model/taskmodel.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addTaskToFirebase(Taskmodel task) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .add(task.toMap());
  }

  Future<List<Taskmodel>> getTasksFromFirebase() async {
    final user = _auth.currentUser;
    if (user == null) return [];

    final snapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .get();

    return snapshot.docs
        .map((doc) => Taskmodel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> deleteTaskFromFirebase(String taskId) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }

  Future<void> updateTaskInFirebase(String taskId, Taskmodel task) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .doc(taskId)
        .update(task.toMap());
  }
}
