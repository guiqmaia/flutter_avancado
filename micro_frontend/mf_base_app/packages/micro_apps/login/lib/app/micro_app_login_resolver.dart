import 'package:core/core.dart';
import 'package:login/app/pages/login_page.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/login': ((context, args) => const LoginPage()),
    };
  }
}
