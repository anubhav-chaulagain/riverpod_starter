// Reactive programming using Riverpod

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/state/student_state.dart';
import 'package:riverpod_starter/models/student_model.dart';

final studentViewModelProvider =
    NotifierProvider<StudentViewmodel, StudentState>(() {
      return StudentViewmodel();
    });

class StudentViewmodel extends Notifier<StudentState> {
  @override
  StudentState build() {
    // Initial state
    return StudentState(isLoading: false, lstStudents: []);
  }

  Future<void> addStudent(StudentModel student) async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(Duration(seconds: 2));

    // Update the student list
    final updatedStudents = [...state.lstStudents, student];
    state = state.copyWith(isLoading: false, lstStudents: updatedStudents);
  }

  Future<void> loadStudents() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(Duration(seconds: 2));

    state = state.copyWith(isLoading: false);
  }
}
