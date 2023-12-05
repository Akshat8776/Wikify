import 'dart:io';
import 'error_dialog.dart';
import 'package:freo_task/model/recents.dart';
import 'package:freo_task/provider/result_provider.dart';
import 'package:flutter/material.dart';

import 'package:freo_task/global/global.dart';
import 'custom_message.dart';

class CacheHistory extends StatefulWidget {
  final ResultProvider resultProvider;
  final List<Recents> recentList;
  final Function removeRecents;
  final Function removeRecentItem;
  final Function loadList;
  const CacheHistory(
      {super.key,
      required this.resultProvider,
      required this.loadList,
      required this.recentList,
      required this.removeRecentItem,
      required this.removeRecents});
  @override
  // ignore: library_private_types_in_public_api
  _CacheHistoryState createState() => _CacheHistoryState();
}

class _CacheHistoryState extends State<CacheHistory> {
  List<Recents>? list = List<Recents>.empty();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 25.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        ),
        height: screenHeight * 0.4,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Tap to search...",
                      style: TextStyle(color: textColor, fontSize: 17),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => Message(
                                  message:
                                      "1. Long Press on an item to delete.\n2. Switch to the theme and language as per your preference.\n3. Type in hindi if you have selected hindi language to get mouth watering results.",
                                  pos: true,
                                ));
                      },
                      icon: const Icon(
                        Icons.info,
                        color: Colors.white,
                      )),
                  if (widget.recentList.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: OutlinedButton(
                        onPressed: () async {
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => ErrorDialog(
                              message:
                                  "Are you sure you want to delete all items",
                              callBack: () {
                                Directory(cacheDirectory)
                                    .delete(recursive: true);
                                setState(() {
                                  widget.removeRecents();
                                  widget.loadList();
                                  widget.recentList.clear();
                                });
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Clear All",
                          style: TextStyle(color: Colors.red, fontSize: 17),
                        ),
                      ),
                    ),
                ],
              ),
              widget.recentList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text("Search something...",
                          style: TextStyle(color: textColor, fontSize: 17)),
                    )
                  : SizedBox(
                      height: screenHeight * .3,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: widget.recentList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  widget.resultProvider.searchWord(
                                      widget.recentList[index].title!, context);
                                },
                                onLongPress: () async {
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          ErrorDialog(
                                            message:
                                                "Are you sure you want to delete ${widget.recentList[index].title!}",
                                            callBack: () {
                                              Directory(cacheDirectory +
                                                      "/" +
                                                      widget.recentList[index]
                                                          .title! +
                                                      ".json")
                                                  .delete(recursive: true);
                                              widget.removeRecentItem(widget
                                                  .recentList[index].title!);
                                              widget.loadList();
                                            },
                                          ));
                                },
                                child: Text(
                                  widget.recentList[index].title!,
                                ),
                              ),
                            );
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
