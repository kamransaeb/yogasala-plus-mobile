import 'package:yogasala_plus_mobile/features/app/app_config.dart';
import 'package:yogasala_plus_mobile/bootstrap/bootstrap.dart';

Future<void> main() async {
  await Bootstrap.initialize(
    flavor: Flavor.prod,
    envPath: '.env.prod',
  );
}
