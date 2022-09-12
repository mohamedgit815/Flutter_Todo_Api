import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo_api_app/Core/ProviderState/fetch_state.dart';
import 'package:flutter_bloc_todo_api_app/Core/Utils/custom_widgets.dart';
import 'package:flutter_bloc_todo_api_app/Core/app.dart';
import 'package:flutter_bloc_todo_api_app/Model/todo_model.dart';
import 'package:flutter_bloc_todo_api_app/ViewModel/function_todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MobileTodoPage extends ConsumerStatefulWidget {
  final BoxConstraints constraints;

  const MobileTodoPage({Key? key, required this.constraints}) : super(key: key);

  @override
  ConsumerState<MobileTodoPage> createState() => _MobileTodoPageState();
}

class _MobileTodoPageState extends ConsumerState<MobileTodoPage>
    with PaginationTodo , NavigatorTodo , FunctionTodoApi
{
  @override
  void initState() {
    super.initState();
    initStateFunc(ref);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    loadMore = false;
  }

  @override
  Widget build(BuildContext context) {

    if (loadMore) {
      ref.read(fetchDataProv)
          .fetchDataByResult(url: url(), limit: limit, page: page++ , result: result);
    }


    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Tasks"),
        centerTitle: true,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


      body: Consumer(
        builder: (context,WidgetRef provider , _) {
          return App.conditional(
            duration: const Duration(milliseconds: 0),
              condition: provider.watch(fetchDataProv).dataList.isEmpty,
              builder: (BuildContext context) {
                return const Center(child: CircularProgressIndicator.adaptive(),);
              } ,
              fallback: (BuildContext context) {
                return RefreshIndicator(
                  onRefresh: () async {
                    loadMore = true;
                    page = 1;
                    limit = 10;

                    setState(() {});

                    return ref.read(fetchDataProv).refreshData(page);
                  },
                  child: ListView.builder(
                    controller: scrollController ,
                    itemCount: provider.read(fetchDataProv).dataList.length,
                    itemBuilder: (BuildContext context,int i) {

                      final FetchData prov = provider.read(fetchDataProv);

                      final TodoModel model = TodoModel.fromJson(prov.dataList.elementAt(i));

                      int index = i;

                      if (prov.hasMore) {
                        index = i + 1;
                      } else {
                        index = i;
                      }

                      if (index < prov.dataList.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: ListTile(
                            key: ValueKey<String>(model.id),
                            title: CustomText(text: model.name),
                            subtitle: CustomText(text: model.body),
                            trailing: IconButton(
                                onPressed: () async {
                                  await deleteItem(context: context, id: model.id);
                                }, icon: const Icon(Icons.delete , color: Colors.red,)),
                            onTap: () async {

                            },
                          ),
                        );
                      } else {
                        return Visibility(
                            visible: !prov.hasMore ? false : true,
                            child: const Center(
                                child: CircularProgressIndicator()));
                      }



                    }),
                );
              }
          );
        }
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToAddItem(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
