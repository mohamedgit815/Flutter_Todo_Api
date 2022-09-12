import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/ProviderState/fetch_state.dart';
import 'package:flutter_bloc_todo_api_app/Core/ProviderState/switch_state.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/custom_widgets.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/route_builder.dart';
import 'package:flutter_bloc_todo_api_app/Core/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FunctionTodoApi {
  /// Delete Data
  Future<void> deleteItem({
    required BuildContext context , required String id}) async {
    return Dio().deleteUri(
        Uri.parse("${App.constance.baseUrl}/todo/$id")).then((value) {
      customSnackBar(text: "Item Deleted", context: context);
    }).catchError((err){
      customSnackBar(text: "This Item is\'t Their ", context: context);
    });
  }

}

class PaginationTodo {

  /// Pagination
  int limit = 10;
  int page = 1;
  bool loadMore = false;
  final String result = "results";

  String url() {
    return '${App.constance.baseUrl}/todo/page?_limit=$limit&_page=$page';
  }

  final fetchDataProv =
  ChangeNotifierProvider<FetchData>((ref) => FetchData());

  final scrollState = ChangeNotifierProvider<SwitchState>((ref) => SwitchState());

  final ScrollController scrollController = ScrollController(initialScrollOffset: 0);


  // Init State
  void initStateFunc(WidgetRef ref) {
    ref.read(fetchDataProv)
        .fetchDataByResult(url: url(), limit: limit, page: page++,result: result);

    scrollController.addListener(() {
      ref.read(scrollState).countState(scrollController.offset.toInt());

      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        ref.read(fetchDataProv)
            .fetchDataByResult(url: url(), limit: limit, page: page++ , result: result);
      }
    });
  }

}


class NavigatorTodo {
  /// Navigator
  Future<dynamic> navigateToAddItem(BuildContext context) async {
    App.navigator.pushNamedRouter(route: RouteGenerators.items, context: context);
  }
}


