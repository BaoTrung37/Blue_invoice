import 'package:invoice_app/data/local/isar_db/isar_database.dart';
import 'package:invoice_app/injection/di.dart';

class AppConfig {
  factory AppConfig.getInstance() {
    return _instance;
  }
  AppConfig._();

  static final AppConfig _instance = AppConfig._();
  static const String appName = 'Invoice App';

  Future<void> init() async {
    configureDependencies();
    await getIt<IsarDatabase>().initIsarDataBase();
  }
}
