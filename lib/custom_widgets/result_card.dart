import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'launchUrl.dart';
import 'package:freo_task/model/pages.dart';

import 'load_image.dart';

// ignore: must_be_immutable
class ResultCard extends StatefulWidget {
  ResultCard({super.key, required this.page});
  Pages? page;
  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      elevation: 20,
      shadowColor: Colors.white38,
      child: GestureDetector(
          onLongPress: () {
            Fluttertoast.showToast(
                msg: widget.page!.title!, toastLength: Toast.LENGTH_SHORT);
            // print(widget.page!.terms!.description);
          },
          onTap: () {
            launchURL(widget.page!.url);
          },
          // contentPadding: const EdgeInsets.all(8.0),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                widget.page!.thumbnail != null
                    ? LoadImage(
                        url: widget.page!.thumbnail!.source!,
                      )
                    : Image.asset(
                        "assets/wikipedia_logo.png",
                        scale: 8,
                        height: 70,
                        width: 70,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Text(
                        widget.page!.title!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    widget.page!.terms != null
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text(widget.page!.terms!.description![0]),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
