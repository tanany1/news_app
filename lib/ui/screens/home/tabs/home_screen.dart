import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_list/tabs_list.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings_tab.dart';
import '../../../../model/category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget body;

  @override
  void initState() {
    super.initState();
    body = CategoriesTab(onCategoryClick: onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async {
          if(body is CategoriesTab){
            return true;
          }else{
            setState(() {
              body= CategoriesTab(onCategoryClick: onCategoryClick);
            });
            return false;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("Home Screen"),
            centerTitle: true,
          ),
          drawer: buildDrawer(),
          body: body,
        ),
      ),
    );
  }

  Drawer buildDrawer() => Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                color: Colors.green,
                padding: const EdgeInsets.all(32),
                child: const Center(
                    child: Text(
                  "News App",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ))),
            buildDrawerListItem(Icons.list, "Categories", () {
              setState(() {
                body = CategoriesTab(onCategoryClick: onCategoryClick);
                Navigator.pop(context);
              });
            }),
            buildDrawerListItem(Icons.settings, "Settings", () {
              setState(() {
                body = const SettingsTab();
                Navigator.pop(context);
              });
            })
          ],
        ),
      );

  Widget buildDrawerListItem(
      IconData iconData, String title, Function onClick) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 34,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 22),
            )
          ],
        ),
      ),
    );
  }

  void onCategoryClick(Category category) {
    setState(() {});
    body=TabsList(categoryId: category.backEndId);
  }
}
