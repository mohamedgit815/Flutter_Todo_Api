import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/custom_widgets.dart';

class OfflineBuilderScreen extends StatelessWidget {
  const OfflineBuilderScreen({Key? key}) : super(key: key);

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child:  Icon(Icons.wifi_off_outlined,size: 50.0,)),
          Center(child:  CustomText(text: "Check your Internet",fontSize: 24.0,)),
        ],
      ),
    );
  }
}

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({Key? key}) : super(key: key);

  @override
  Column build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>  [
        Text(
          'There are no bottons to push :)',
        ),
        Text(
          'Just turn off your internet.',
        ),
      ],
    );
  }
}