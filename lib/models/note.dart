import 'package:isar/isar.dart';
// for generate new file with build_runner
part 'note.g.dart';

@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}
