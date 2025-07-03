import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/cache/cache_keys.dart';
import 'package:patient_app/core/database/cache/secure_storage.dart';
import 'package:patient_app/features/make_appointment/data/models/make_appointment_request.dart';
import 'package:patient_app/features/make_appointment/data/repos/make_appointment_repo.dart';

part 'make_appointment_state.dart';

class MakeAppointmentCubit extends Cubit<MakeAppointmentState> {
  MakeAppointmentCubit(this.makeAppointmentRepo)
      : super(MakeAppointmentInitial());
  final TextEditingController commentConroller = TextEditingController();
  final MakeAppointmentRepo makeAppointmentRepo;
  DateTime? appointmentDate;
  FilePickerResult? pickedFile;
  String? selectedTimeSlot;
  void makeAppointment(
      {required String doctorName, required String clinicId}) async {
    final userId = await SecureStorage.instance.getData(key: CacheKeys.id);
    emit(MakeAppointmentLoading());
    final result = await makeAppointmentRepo.makeAppointment(
      makeAppointmentRequest: MakeAppointmentRequest(
        date: appointmentDate!.toIso8601String(),
        clinicId: clinicId,
        userId: userId!,
        doctorName: doctorName,
        complaint: commentConroller.text,
        type: "NewVisit",
        file: pickedFile?.files.first,
      ),
    );
    result.fold(
      (apiErrorModel) => emit(
        MakeAppointmentFailure(apiErrorModel: apiErrorModel),
      ),
      (message) => emit(
        MakeAppointmentSuccess(),
      ),
    );
  }

  void pickFileFromPhone() async {
    pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf', 'docx'],
    );
    emit(MakeAppointmentPickFile());
  }

  void removePickedFile() {
    pickedFile = null;
    emit(MakeAppointmentRemoveFile());
  }

  void changeAppointmentDate(DateTime? date) {
    appointmentDate = date;
    emit(MakeAppointmentChangeDate());
  }

  void selectTimeSlot(String time) {
    selectedTimeSlot = time;
    emit(MakeAppointmentTimeSlotSelected(time));
  }
}
