import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/responsive_builder.dart';
import 'package:flutter_bloc_todo_api_app/View/AddItmes/mobile_add_item_page.dart';

class MainUpdateItemScreen extends StatefulWidget {

  const MainUpdateItemScreen({Key? key}) : super(key: key);

  @override
  State<MainUpdateItemScreen> createState() => _MainUpdateItemScreenState();
}

class _MainUpdateItemScreenState extends State<MainUpdateItemScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
       LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints) {
            return ResponsiveBuilderScreen(
              mobile: MobileAddItemPage(constraints: constraints),
              deskTop: null,
              tablet: null,
            );
          }
    );
  }
}