
import 'package:get/get.dart' show GetView;
import 'package:meta/meta.dart';
import 'package:panda/src/_internal/internal.dart';

@optionalTypeArgs
abstract class View<T extends BaseViewModel> extends GetView<T>
    with BaseViewMixin<T> {
  const View({super.key});
}
