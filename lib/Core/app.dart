import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/app_colors.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/app_constance.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/app_functions.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/navigator.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/offline_builder.dart';


class App {

  static final AppConstance constance = AppConstance();
  static final AppColor color = AppColor();
  static final AppNavigator navigator = AppNavigator();
  static final AppValidator validator = AppValidator();
  static final AppGeneral general = AppGeneral();

  static AnimatedConditionalBuilder conditional({
    required bool condition ,
    required WidgetBuilder builder ,
    required WidgetBuilder? fallback ,
    Duration? duration
  }) {
    return AnimatedConditionalBuilder(
        condition: condition,
        duration: duration ?? const Duration(milliseconds: 500),
        builder: builder,
        fallback: fallback
    );
  }


  /// Offline
  static OfflineBuilderScreen offlineBuilderScreen = const OfflineBuilderScreen();
  static OfflineWidget offlineWidget = const OfflineWidget();
}