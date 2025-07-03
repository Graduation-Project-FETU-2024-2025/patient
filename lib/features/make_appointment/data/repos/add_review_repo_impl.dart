import 'package:dartz/dartz.dart';
import 'package:patient_app/core/database/api/api_consumer.dart';
import 'package:patient_app/core/database/api/api_error_handler.dart';
import 'package:patient_app/core/database/api/api_error_model.dart';
import 'package:patient_app/core/database/api/end_points.dart';
import 'package:patient_app/features/make_appointment/data/models/add_review_model_request.dart';
import 'package:patient_app/features/make_appointment/data/repos/add_review_repo.dart';

class AddReviewRepoImpl implements AddReviewRepo {
  final ApiConsumer apiConsumer;

  AddReviewRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, String>> addReview(
      {required AddReviewModelRequest addReviewModelRequest}) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.addReview,
        data: addReviewModelRequest.toJson(),
      );
      return right(response.data['message']);
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }
}
