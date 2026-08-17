import 'dart:io';

void main() {
  Directory foldPath = Directory('codes/dart/');
  List<FileSystemEntity> files = foldPath.listSync();
  int totalCount = 0;
  int errorCount = 0;
  for (var file in files) {
    if (file.path.endsWith('build.dart')) continue;
    if (file is File && file.path.endsWith('.dart')) {
      totalCount++;
      try {
        Process.runSync('dart', [file.path]);
      } catch (e) {
        errorCount++;
        print('Error: $e');
        print('File: ${file.path}');
      }
    } else if (file is Directory) {
      List<FileSystemEntity> subFiles = file.listSync();
      for (var subFile in subFiles) {
        if (subFile is File && subFile.path.endsWith('.dart')) {
          totalCount++;
          try {
            Process.runSync('dart', [subFile.path]);
          } catch (e) {
            errorCount++;
            print('Error: $e');
            print('File: ${file.path}');
          }
        }
      }
    }
  }

  print('===== Build Complete =====');
  print('Total: $totalCount');
  print('Error: $errorCount');
}
