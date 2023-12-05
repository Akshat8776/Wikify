import 'dart:convert';
import 'dart:io';
import 'package:freo_task/enums/states_enum.dart';
import 'package:freo_task/model/search_result.dart';
import 'package:freo_task/screens/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:freo_task/global/global.dart';

class ResultProvider extends ChangeNotifier {
  SearchResult? searchResult;
  Current_State state = Current_State.IDLE;
  bool cache = false;

  searchWord(String word, BuildContext ctx) async {
    word = word.trim();
    cache = false;
    state = Current_State.SEARCHING;
    notifyListeners();
    String fileName = "$word.json";
    var cacheDir = await getTemporaryDirectory();
    if (await File("${cacheDir.path}/$fileName").exists()) {
      var jsonData = File(cacheDir.path + "/" + fileName).readAsStringSync();
      searchResult = SearchResult.fromJson(json.decode(jsonData));
      state = Current_State.IDLE;
      notifyListeners();
      cache = true;
    } else {
      try {
        await http
            .get(Uri.parse(
                "https://${lang.value}.wikipedia.org//w/api.php?action=query&format=json&prop=extracts%7Cpageimages%7Cpageterms%7Cinfo&inprop=url&generator=prefixsearch&formatversion=2&piprop=thumbnail&pithumbsize=600&wbptterms=description&gpssearch=$word&exsentences=5&exintro=1&explaintext=1&gpslimit=50"))
            .then((value) async {
          state = Current_State.IDLE;
          notifyListeners();
          searchResult = SearchResult.fromJson(json.decode(value.body));
          var jsonResponse = value.body;
          var tempDir = await getTemporaryDirectory();
          File file = File(tempDir.path + "/" + fileName);
          file.writeAsString(jsonResponse, flush: true, mode: FileMode.write);
        });
      } on SocketException catch (_) {
        state = Current_State.NO_INTERNET;
        notifyListeners();
        Fluttertoast.showToast(
            msg: "Check your internet connection",
            toastLength: Toast.LENGTH_SHORT);
        return;
      }
    }
    if (searchResult!.query != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          ctx,
          MaterialPageRoute(
            builder: (context) => SearchResultScreen(
              searchResult: searchResult!,
              resultQuery: word,
            ),
          ));
      if (cache) {
        Fluttertoast.showToast(
            msg: "Cache loaded successfully", toastLength: Toast.LENGTH_SHORT);
      }
    } else {
      state = Current_State.NO_ITEM;
      notifyListeners();
    }
  }
}
