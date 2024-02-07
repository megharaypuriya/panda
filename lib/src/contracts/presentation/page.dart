

import 'package:get/get.dart' show GetPage;
import 'package:meta/meta.dart';

@optionalTypeArgs
abstract class Page<T> extends GetPage<T> {
  Page({
    required super.name,
    required super.page,
    super.title,
    super.participatesInRootNavigator,
    super.gestureWidth,
    super.maintainState,
    super.curve,
    super.alignment,
    super.parameters,
    super.opaque,
    super.transitionDuration,
    super.popGesture,
    super.binding,
    super.bindings,
    super.transition,
    super.customTransition,
    super.fullscreenDialog,
    super.children,
    super.middlewares,
    super.unknownRoute,
    super.arguments,
    super.showCupertinoParallax,
    super.preventDuplicates,
  });
}
