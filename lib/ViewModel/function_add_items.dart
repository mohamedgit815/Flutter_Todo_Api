import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/custom_widgets.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/route_builder.dart';
import 'package:flutter_bloc_todo_api_app/Core/app.dart';

class FunctionAddItemApi {
  /// upload Data
  Future<void> uploadItem({
    required String name , required String body ,
    required BuildContext context }) async {
    return Dio().postUri(
        Uri.parse("${App.constance.baseUrl}/todo/"),data: {
      "name": name,
      "body": body
    }).then((value) {
      customSnackBar(text: "Item Uploaded", context: context);
    }).catchError((err){
      customSnackBar(text: "Check your Item", context: context);
    });
  }

}

class FunctionAddItemInputs {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerBody = TextEditingController();
}

class FunctionAddItemNavigator {
  Future<dynamic> navigateToTodo(BuildContext context) async {
    App.navigator.pushNamedRouter(route: RouteGenerators.items, context: context);
  }
}