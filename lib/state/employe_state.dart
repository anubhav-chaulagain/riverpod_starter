import 'package:riverpod_starter/models/employe_model.dart';

class EmployeState {
  final bool isLoading;
  final List<EmployeeModel> lstEmployes;

  EmployeState({this.isLoading = false, this.lstEmployes = const []});

  // Copy with
  EmployeState copyWith({bool? isLoading, List<EmployeeModel>? lstEmployes}) {
    return EmployeState(
      isLoading: isLoading ?? this.isLoading,
      lstEmployes: lstEmployes ?? this.lstEmployes,
    );
  }
}
