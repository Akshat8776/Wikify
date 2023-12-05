import 'package:freo_task/model/search_result.dart';
import 'package:freo_task/provider/result_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:freo_task/custom_widgets/result_card.dart';
import 'package:freo_task/custom_widgets/custom_message.dart';
// ignore: must_be_immutable
class SearchResultScreen extends StatelessWidget {
  final SearchResult searchResult;
  final String resultQuery;

   SearchResultScreen({super.key, required this.searchResult, required this.resultQuery});
  ScrollController listScrollController = ScrollController();
  ValueNotifier<IconData> ic=ValueNotifier(Icons.arrow_downward);
  @override
  Widget build(BuildContext context) {
    var searchResultData = searchResult.query;
    return Consumer<ResultProvider>(
      builder: (context, resultProvider, _) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                if(ic.value==Icons.arrow_downward) {
                  if (listScrollController.hasClients) {
                    final position = listScrollController.position.maxScrollExtent;
                    listScrollController.animateTo(
                      position,
                      duration: const Duration(seconds: 3),
                      curve: Curves.easeOut,
                    );
                    ic.value=Icons.arrow_upward;
                  }
                }
                else{
                  if (listScrollController.hasClients) {
                    final position = listScrollController.position.minScrollExtent;
                    listScrollController.animateTo(
                      position,
                      duration: const Duration(seconds: 3),
                      curve: Curves.easeOut,
                    );
                    ic.value=Icons.arrow_downward;
                  }
                }
              },
              isExtended: true,
              tooltip: "Scroll to Bottom",
              // child: Icon(Icons.account_circle_sharp),
              child:ValueListenableBuilder(
                  valueListenable: ic,
                  builder: (context, value, child){
                    return Icon(ic.value);
                  }
              )
          ),
          appBar: AppBar(
            // automaticallyImplyLeading: true,
            leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.white,),onPressed: ()=>Navigator.pop(context),),
            actions: [IconButton(icon: const Icon(Icons.info,color: Colors.white,),onPressed: (){
            showDialog(context: context, builder: (context) =>Message(message: "1. Tap on image to zoom.\n2. Tap on list item to launch respective wikipedia page",pos: true,));
          },),],
            // leading:
            title: Text("Results for '$resultQuery'",style: const TextStyle(color: Colors.white),),
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.white10,
          body: AnimationLimiter(

            child: ListView.builder(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: searchResult.query!.pages!.length,
                controller: listScrollController,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      horizontalOffset: -300,
                      verticalOffset: -850,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ResultCard(
                          page: searchResultData!.pages![index]
                        )
                      ),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}