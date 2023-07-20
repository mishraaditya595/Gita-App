// import 'package:injectable/injectable.dart';
// import 'package:objectbox/objectbox.dart';
//
// import '../../objectbox.g.dart';
//
// @Singleton()
// class DBStore {
//   Store? _store;
//   Store? get store => _store;
//
//   Future<Store> getStore() async {
//     if (Admin.isAvailable()) {
//       final admin = Admin(_store!);
//     }
//     return _store ??= await openStore();
//   }
//
//   void close() {
//     _store?.close();
//   }
// }
