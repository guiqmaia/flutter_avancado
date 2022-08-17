import 'package:flutter/material.dart';

typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object? args);
var navigatorKey = GlobalKey<NavigatorState>();