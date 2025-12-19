import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/models/employe_model.dart';
import 'package:riverpod_starter/state/employe_state.dart';

class EmployeViewmodel extends Notifier<EmployeState> {
  @override
  EmployeState build() {
    return EmployeState();
  }

  Future<void> addEmployes(EmployeeModel employe) async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(Duration(seconds: 2));

    final updatedEmployesList = [...state.lstEmployes, employe];
    state = state.copyWith(isLoading: false, lstEmployes: updatedEmployesList);
  }

  Future<void> loadEmployes() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(isLoading: false);
  }
}
