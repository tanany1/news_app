import 'package:flutter/cupertino.dart';
import 'package:news_app/data/api_manager.dart';
import 'package:news_app/model/sources_response.dart';

import '../../../../../../model/source.dart';

class TabsListViewModel extends ChangeNotifier {
  TabsListState state = TabsListState.loading;
  List<Source> sources =[];
  String errorMessage ="";

  Future<void> loadTabsList(String categoryId) async {
    state = TabsListState.loading;
    notifyListeners();
    try {
      SourcesResponse sourcesResponse =
          await ApiManager.loadTabsList(categoryId);
      state = TabsListState.success;
      sources= sourcesResponse.sources!;
      notifyListeners();
    } catch (exception) {
      ///hide loading
      state = TabsListState.error;
      errorMessage = exception.toString();
      notifyListeners();
    }
  }
}

enum TabsListState {
  success,
  loading,
  error;
}
