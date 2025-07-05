import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../generated/l10n.dart';
import 'file_download_state.dart';

class FileDownloadCubit extends Cubit<FileDownloadState> {
  FileDownloadCubit() : super(FileDownloadInitial());

  Future<void> downloadAndOpenFile({required String url}) async {
    emit(FileDownloadLoading());

    try {
      final permissionStatus = await _requestStoragePermission();

      if (!permissionStatus.isGranted) {
        if (permissionStatus.isPermanentlyDenied) {
          await openAppSettings();
          return;
        }
        emit(FileDownloadError(S.current.storagePermissionDenied));
        return;
      }

      final dir = await _getDownloadDirectory();
      if (dir == null) {
        emit(FileDownloadError(S.current.downloadDirectoryNotFound));
        return;
      }

      final Uri uri = Uri.parse(url);
      String filename = uri.pathSegments.isNotEmpty
          ? uri.pathSegments.last
          : 'downloaded_file.pdf';

      if (!filename.contains('.')) {
        filename = '$filename.pdf';
      }

      final path = '${dir.path}/$filename';
      final file = File(path);

      if (await file.exists()) await file.delete();

      await Dio().download(url, path);

      await OpenFile.open(path);

      emit(FileDownloadSuccess());
    } catch (e) {
      emit(FileDownloadError(e.toString()));
    }
  }

  Future<PermissionStatus> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      if (sdkInt <= 28) {
        return await Permission.storage.request();
      } else if (sdkInt <= 32) {
        final status = await Permission.manageExternalStorage.request();
        if (status.isGranted) return status;
        return await Permission.storage.request();
      } else {
        return await Permission.videos.request();
      }
    } else {
      return PermissionStatus.granted;
    }
  }

  Future<Directory?> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      final downloadsDir = Directory('/storage/emulated/0/Download');
      if (await downloadsDir.exists()) return downloadsDir;
      return await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      return await getApplicationDocumentsDirectory();
    }
    return null;
  }
}
