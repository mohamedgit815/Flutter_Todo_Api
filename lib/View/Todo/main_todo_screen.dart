import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/responsive_builder.dart';
import 'package:flutter_bloc_todo_api_app/View/Todo/mobile_todo_page.dart';

class MainTodoScreen extends StatefulWidget {

  const MainTodoScreen({Key? key}) : super(key: key);

  @override
  State<MainTodoScreen> createState() => _MainTodoScreenState();
}

class _MainTodoScreenState extends State<MainTodoScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  LayoutBuilder build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints) {
          return ResponsiveBuilderScreen(
            mobile: MobileTodoPage(constraints: constraints),
            deskTop: null,
            tablet: null,
          );
        }
    );
  }
}