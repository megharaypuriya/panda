
import 'package:meta/meta.dart';
import 'package:panda/src/contracts/domain/entity.dart';
import 'package:panda/src/contracts/params.dart';

@experimental
abstract class CrudOperation<T, ID extends Object, E extends Entity,
    P extends Params> {
  /// Saves a given entity.
  Future<T> save(E entity);

  /// Saves all given entities.
  Future<T> saveAll(List<E> entities);

  /// Retrieves an entity by its id.
  Future<E?> findById(ID id);

  /// Returns all entities with the given IDs.
  Future<List<E>?> findAllById(List<ID> ids, {P? params});

  /// Returns all entities.
  Future<List<E>?> findAll({P? params});

  /// Updates a single record by the given [id] with the new [entity] object.
  Future<T> update(ID id, E entity);

  /// Deletes a given entity.
  Future<T> delete(E entity);

  /// Deletes all entities managed by the repository.
  Future<T> deleteAll();

  /// Deletes all entities with the given IDs.
  Future<T> deleteAllById(List<ID> ids);

  /// Deletes a single record of the given [id].
  Future<T> deleteById(ID id);

  /// Returns whether an entity with the given id exists.
  bool existsById(ID id);
}
