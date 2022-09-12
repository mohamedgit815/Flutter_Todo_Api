import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_todo_api_app/View/AddItmes/main_add_item_screen.dart';

class RouteGenerators {

  static const String items = '/MainAddItems';


  // static MaterialPageRoute<dynamic> _materialPageRoute(Widget page) {
  //   return MaterialPageRoute( builder: ( _ ) => page );
  // }

  static CupertinoPageRoute<dynamic> _cupertinoPageRoute(Widget page) {
    return CupertinoPageRoute( builder: ( _ ) => page );
  }


  static Route<dynamic>? onGenerate(RouteSettings settings) {
    switch(settings.name) {


      case items : return _cupertinoPageRoute(const MainAddItemScreen());

      // case items :
      //   final MovieEntities _data = settings.arguments as MovieEntities;
      //   return _cupertinoPageRoute(MainMovieDetailsScreen(movieEntities: _data));



    }
    return null;
  }


}