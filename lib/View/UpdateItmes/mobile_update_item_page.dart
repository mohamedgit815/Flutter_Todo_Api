import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/custom_widgets.dart';

class MobileUpdateItemPage extends StatefulWidget {
  final BoxConstraints constraints;
  const MobileUpdateItemPage({Key? key ,required this.constraints}) : super(key: key);

  @override
  State<MobileUpdateItemPage> createState() => _MobileUpdateItemPageState();
}

class _MobileUpdateItemPageState extends State<MobileUpdateItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Update Tasks"),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              hintText: "title"
            ),
          ),
          Expanded(child: TextField(
            maxLines: 1000,
            decoration: InputDecoration(
                hintText: "Body"
            ),
          )),
        ],
      )
    );
  }
}
