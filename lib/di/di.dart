import 'package:get_it/get_it.dart';
import 'package:osp/di/db/database.dart';

GetIt getIt = GetIt.instance;

void setUpDatabase(){
    getIt.registerSingleton<BuildingsDatabase>(BuildingsDatabase.instance,signalsReady: true);
}