class AddReviewModelRequest {
  final String clinicId;
  final double rate;
  final String comment;

  AddReviewModelRequest({
    required this.clinicId,
    required this.rate,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      "clinicId": clinicId,
      "rate": rate,
      "comment": comment,
    };
  }
}
