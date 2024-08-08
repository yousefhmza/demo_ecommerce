import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/local/cache_client.dart';
import '../../../core/services/local/storage_keys.dart';

class OnBoardingRepo extends BaseRepository {
  final CacheClient _cacheClient;

  OnBoardingRepo(this._cacheClient, super.networkInfo);

  bool get onBoardingSeen => _cacheClient.get(StorageKeys.onBoardingSeen) ?? false;

  Future<void> saveOnBoardingSeen() => _cacheClient.save(StorageKeys.onBoardingSeen, true);
}
