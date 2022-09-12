import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/custom_widgets.dart';
import 'package:flutter_bloc_todo_api_app/Core/app.dart';
import 'package:flutter_bloc_todo_api_app/ViewModel/function_add_items.dart';

class MobileAddItemPage extends StatefulWidget {
  final BoxConstraints constraints;
  const MobileAddItemPage({Key? key ,required this.constraints}) : super(key: key);

  @override
  State<MobileAddItemPage> createState() => _MobileAddItemPageState();
}

class _MobileAddItemPageState extends State<MobileAddItemPage>
    with FunctionAddItemInputs , FunctionAddItemApi {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerTitle.dispose();
    controllerBody.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          if(controllerTitle.text.isEmpty || controllerBody.text.isEmpty) {
            customSnackBar(text: "Full every inputs ", context: context);
          } else {
            await uploadItem(name: controllerTitle.text, body: controllerTitle.text, context: context);
            controllerBody.clear();
            controllerTitle.clear();
          }
        },
      ),

      appBar: AppBar(
        title: const CustomText(text: "Add Tasks"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: controllerTitle,
            decoration: const InputDecoration(
              hintText: "title"
            ),
          ),
          Expanded(
              child: TextField(
                controller: controllerBody,
                maxLines: 1000,
                decoration: const InputDecoration(
                    hintText: "Body"
            ),
          )),
        ],
      )
    );
  }
}
