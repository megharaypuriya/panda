
import 'package:panda/src/contracts/params.dart';

abstract class UseCase<T, P extends Params?> {
  T call(P params);
}

abstract class AsyncUseCase<T, P extends Params?> {
  Future<T> call(P params);
}
