import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

final cachedRequest = Dio();

Future initCached() async {
  final dir = await getTemporaryDirectory();
  final cacheStore = HiveCacheStore(dir.path);
  final cacheOptions =
      CacheOptions(store: cacheStore, maxStale: const Duration(days: 7));
  cachedRequest.interceptors.add(DioCacheInterceptor(options: cacheOptions));
}
