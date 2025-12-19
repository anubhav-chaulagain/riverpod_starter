// Reactive programming using Riverpod

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/state/student_state.dart';
import 'package:riverpod_starter/models/student_model.dart';

// 1. NotifierProvider
final studentViewModelProvider =
    NotifierProvider<StudentViewmodel, StudentState>(() {
      return StudentViewmodel();
    });

// 2. ViewModel
class StudentViewmodel extends Notifier<StudentState> {
  @override
  StudentState build() {
    // Initial state
    return StudentState(isLoading: false, lstStudents: []);
  }

  // 3. Add a student
  Future<void> addStudent(StudentModel student) async {
    // Set loading to true
    state = state.copyWith(isLoading: true);

    // Simulate delay
    await Future.delayed(Duration(seconds: 2));

    // Update the student list
    final updatedStudents = [...state.lstStudents, student];
    state = state.copyWith(isLoading: false, lstStudents: updatedStudents);
  }

  // 4. Load students
  Future<void> loadStudents() async {
    state = state.copyWith(isLoading: true);

    // Simulate fetching from API
    await Future.delayed(Duration(seconds: 2));

    state = state.copyWith(isLoading: false);
  }
}
