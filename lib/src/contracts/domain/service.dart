

import 'package:get/get.dart' show GetxService;

abstract class Service extends GetxService {}

abstract class AsyncService<T> extends Service {
  Future<T> async();
}
