import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/features/make_appointment/data/models/add_review_model_request.dart';

abstract class AddReviewRepo {
  Future<Either<ApiErrorModel, String>> addReview(
      {required AddReviewModelRequest addReviewModelRequest});
}
