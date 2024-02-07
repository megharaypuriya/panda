

import 'package:get/get.dart'
    show
        AsyncInstanceBuilderCallback,
        Bindings,
        Get,
        Inst,
        InstanceBuilderCallback;
import 'package:meta/meta.dart';

abstract class Binding extends Bindings {
  @protected
  S put<S>(
    S dependency, {
    String? tag,
    bool permanent = false,
  }) =>
      Get.put<S>(dependency, tag: tag, permanent: permanent);

  @protected
  Future<S> putAsync<S>(
    AsyncInstanceBuilderCallback<S> builder, {
    String? tag,
    bool permanent = false,
  }) async =>
      Get.putAsync<S>(builder, tag: tag, permanent: permanent);

  @protected
  void lazyPut<S>(
    InstanceBuilderCallback<S> builder, {
    String? tag,
    bool fenix = false,
  }) =>
      Get.lazyPut<S>(builder, tag: tag, fenix: fenix);

  @protected
  S find<S>({String? tag}) => Get.find<S>(tag: tag);
}
