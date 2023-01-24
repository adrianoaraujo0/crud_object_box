// ignore: depend_on_referenced_packages
import 'package:crud_object_box/model/tarefa.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBoxDatabase {
  /// The Store of this app.
  late final Store store;
  static late final Box<Tarefa>  tarefaBox;

  ObjectBoxDatabase._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<void> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "obx-example"));
    ObjectBoxDatabase._create(store);

    tarefaBox = store.box<Tarefa>();
  }
}