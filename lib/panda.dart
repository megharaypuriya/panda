library panda;

import 'package:panda/src/_internal/internal.dart';
import 'package:panda/src/contracts/presentation/view_model.dart';
import 'package:panda/src/services/connectivity_service.dart';
import 'package:panda/src/services/preferences_service.dart';
import 'package:panda/src/services/theme_mode_service.dart';
import 'package:get/get.dart';

export 'package:panda/src/contracts/binding.dart';
export 'package:panda/src/contracts/crud_operation.dart';
export 'package:panda/src/contracts/data/data_sources/local_data_source.dart';
export 'package:panda/src/contracts/data/data_sources/remote_data_source.dart';
export 'package:panda/src/contracts/data/model.dart';
export 'package:panda/src/contracts/domain/entity.dart';
export 'package:panda/src/contracts/domain/service.dart';
export 'package:panda/src/contracts/domain/usecase.dart';
export 'package:panda/src/contracts/params.dart';
export 'package:panda/src/contracts/presentation/middleware.dart';
export 'package:panda/src/contracts/presentation/page.dart';
export 'package:panda/src/contracts/presentation/screen.dart';
export 'package:panda/src/contracts/presentation/view.dart';
export 'package:panda/src/contracts/presentation/view_model.dart';
export 'package:panda/src/contracts/repository.dart';
export 'package:panda/src/services/connectivity_service.dart';
export 'package:panda/src/services/preferences_service.dart';
export 'package:panda/src/services/theme_mode_service.dart';

/// A pre registered [ViewModel], this allows [View] and [Screen] to non specify something custom.
class _ViewModel extends ViewModel {}

/// The glue between the Panda widgets and your app.
class Panda {
  const Panda._internal();

  /// The current [Panda], if one has been created.
  static Panda get instance => _instance;
  static const Panda _instance = Panda._internal();

  /// The place in where preregistered dependencies get registered.
  void initDependencies() {
    Get.put<BaseViewModel>(_ViewModel());
    Get.put(ThemeModeService());
  }

  Future<void> initAsyncServices() async {
    await Get.putAsync(() => ConnectivityService().init());
    await Get.putAsync(() => PreferencesService().init());
  }
}
