import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void dependencySetUp() {
  getIt.registerLazySingleton<PointRepository>(() => PointRepositoryImpl());
}