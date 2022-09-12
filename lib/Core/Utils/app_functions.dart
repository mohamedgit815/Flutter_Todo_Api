import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/app_colors.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/custom_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// Extension For BuildContext
extension MainContext on BuildContext {
//  AppLocalization? get translate => AppLocalization.of(this);
  ThemeData get theme => Theme.of(this);
  ModalRoute<Object?>? get modal => ModalRoute.of(this);
  bool get keyBoard => MediaQuery.of(this).viewInsets.bottom == 0;
  Size get mainSize => MediaQuery.of(this).size;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}


class AppGeneral {

  Locale switchLang(String lang){
    SharedPreferences.getInstance().then((value) async {
      await value.setString('lang', lang);
    });
    if(lang == 'english'){
      lang = 'en';
    } else if(lang == 'arabic'){
      lang = 'ar';
    } else if(lang == 'espanol') {
      lang = 'es';
    }
    return Locale(lang,'');
  }

  Center errorProvider(Object err){
    return Center(child: FittedBox(
        fit: BoxFit.scaleDown,
        child: CustomText(text: err.toString())),);
  }

  Center loadingProvider(){
    return const Center(child: CircularProgressIndicator.adaptive(),);
  }

  Visibility loadingVisibilityProvider(){
    return const Visibility(
        visible: false,
        child: CircularProgressIndicator.adaptive());
  }

  Center notFoundData(String text){
    return Center(child: FittedBox(
      fit: BoxFit.scaleDown,
      child: CustomText(
        text: text ,
        fontSize: 20.0,
        color: AppColor().lightMainColor,
      ),
    ),);
  }


  MaterialStateProperty<Color> materialStateColor(Color color){
    return MaterialStateProperty.all<Color>(color);
  }
}