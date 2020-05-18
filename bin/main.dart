import 'dart:io';

import 'package:colorize/colorize.dart';
import 'package:pp_tefeta/path_finder.dart';

void main(List<String> arguments) async {
  final startTime = DateTime.now();

  if (arguments.isEmpty) {
    errorExit('Missing file path in argument');
  }

  try {
    final filePath = arguments[0];
    final fileContent = await File(filePath).readAsString();
    if (fileContent.isEmpty) {
      errorExit('File is empty');
    }

    final fileLines = fileContent.trim().split('\n');
    if (fileLines.length < 2) {
      errorExit(
        'File must have minimum 2 lines, size (ex: 10x20) and maze in ascii',
      );
    }

    final sizes = fileLines.first.split('x');
    final gridRows = fileLines.sublist(1);

    final width = int.parse(sizes[0]);
    final height = int.parse(sizes[1]);

    if (width != gridRows[0].length || height != gridRows.length) {
      errorExit(
        'Size in file is not correct, found: ${gridRows[0].length}x${gridRows.length}',
      );
    }

    final pathFinder = PathFinder(width, height, gridRows, '1', '2', '*', '.');
    final isFind = pathFinder.startFind();

    print(pathFinder.toString());

    print('Executed in ${DateTime.now().difference(startTime).inMilliseconds}ms');
    if (!isFind) {
      errorExit('Cannot find path to exit :/');
    }
  } catch (e) {
    errorExit('$e');
  }
}

void errorExit(String err) {
  final colorize = Colorize('Error: $err')..red();
  stderr.writeln(colorize);
  exit(2);
}
