import 'package:client/core/base/base_cache_manager/base_cache_manager.dart';
import 'package:client/core/services/one_signal/onesignal_service.dart';
import 'package:client/core/services/socket/socket_service.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:client/starter.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Assets.env.envDev);

  OneSignalService();

  SocketService().socketBuilder();

  Flavor.create(
    Environment.dev,
    color: Colors.green,
    name: "Dev",
    properties: {
      Keys.apiUrl: dotenv.env["BASE_URL"].toString(),
      Keys.apiKey: dotenv.env["API_KEY"].toString(),
      Keys.appTitle: dotenv.env["APP_TITLE"].toString(),
      logLevelKey: 5,
    },
  );

  setupApp();
}
