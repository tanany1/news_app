
import 'package:flutter/material.dart';
import 'package:news_app/model/articles_response.dart';

import '../../../../../../data/api_manager.dart';
import '../../../../../../model/article.dart';

class TabDetailsViewModel extends ChangeNotifier{
  TabsDetailsState state =TabsDetailsState.loading;
  List<Article> articles=[];
  String errorMessage = " ";
 void loadArticles(String sourceId) async{
   try{
     state=TabsDetailsState.loading;
     notifyListeners();
     ArticlesResponse articlesResponse = await ApiManager.loadArticlesList(sourceId);
     state=TabsDetailsState.success;
     articles = articlesResponse.articles!;
     notifyListeners();
   }catch(exception){
     state=TabsDetailsState.error;
     errorMessage = exception.toString();
     notifyListeners();
   }

  }
}
enum TabsDetailsState {
  success,
  loading,
  error;
}
