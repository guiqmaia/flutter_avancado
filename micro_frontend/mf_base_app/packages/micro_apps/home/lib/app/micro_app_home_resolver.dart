import 'package:core/core.dart';
import 'package:home/app/pages/home_page.dart';

class MicroAppHomeResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_home';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/home': ((context, args) => const HomePage()),
    };
  }
}
