part of 'scan_bloc.dart';
abstract class ScanEvent { 
}
class TakePhoto extends ScanEvent {
  TakePhoto(String path);
}

class UploadPhoto extends ScanEvent {
  final String filePath;
  UploadPhoto(this.filePath);
}