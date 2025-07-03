import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/make_appointment/data/models/add_review_model_request.dart';
import 'package:patient_app/features/make_appointment/data/repos/add_review_repo.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit(this.addReviewRepo) : super(AddReviewInitial());
  final TextEditingController commentController = TextEditingController();
  final AddReviewRepo addReviewRepo;

  void addReview({required double rating, required String clinicId}) async {
    emit(AddReviewLoading());
    final result = await addReviewRepo.addReview(
      addReviewModelRequest: AddReviewModelRequest(
        rate: rating,
        comment: commentController.text,
        clinicId: clinicId,
      ),
    );
    result.fold(
      (apiErrorModel) => emit(AddReviewFailure(apiErrorModel: apiErrorModel)),
      (message) => emit(
        AddReviewSuccess(),
      ),
    );
  }
}
