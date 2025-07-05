abstract class FileDownloadState {}

class FileDownloadInitial extends FileDownloadState {}

class FileDownloadLoading extends FileDownloadState {}

class FileDownloadSuccess extends FileDownloadState {}

class FileDownloadError extends FileDownloadState {
  final String message;
  FileDownloadError(this.message);
}
