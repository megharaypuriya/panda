
import 'package:get/get.dart' show GetResponsiveView;
import 'package:meta/meta.dart';
import 'package:panda/src/_internal/internal.dart';

@optionalTypeArgs
abstract class Screen<T extends BaseViewModel> extends GetResponsiveView<T>
    with BaseViewMixin<T>, BaseScreenMixin<T> {
  Screen({
    super.alwaysUseBuilder,
    super.settings,
    super.key,
  });
}
