import 'package:flutter/material.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:spotimax/core/di/injector.dart';
import 'package:spotimax/core/permissions/requiring_permission_services_initializer.dart';
import 'package:spotimax/features/domain/settings/use_cases/get_language.dart';
import 'core/app/spotimax_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MetadataGod.initialize();
  await initInjector();  
  await injector.get<RequiringPermissionServicesInitializer>().initialize();

  final getLanguageResult = await injector.get<GetLanguage>().call(null);
  runApp(SpotiMaxApp(
    locale: getLanguageResult.result ?? 'en',
  ));
}
