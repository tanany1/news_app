import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/tabs/news/tab_details.dart';
import '../../../../../data/api_manager.dart';
import '../../../../../model/source.dart';
import '../../../../widgets/app_error.dart';
import '../../../../widgets/app_loader.dart';

class TabsList extends StatefulWidget {
  final String categoryId;
  const TabsList({super.key, required this.categoryId});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.loadTabsList(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return AppError(error: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return tabsList(snapshot.data!.sources ?? []);
          } else {
            return const AppLoader();
          }
        });
  }

  Widget tabsList(List<Source> sources) {
    // List <Widget> tabsWidgetList = [];
    // for (var source in sources){
    //   tabsWidgetList.add(tabWidget(source,true));
    // }
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            tabs: sources.map((source) {
              return tabWidget(
                source,
                currentTabIndex == sources.indexOf(source),
              );
            }).toList(),
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (newTabIndex) {
              setState(() {
                currentTabIndex = newTabIndex;
              });
            },
          ),
          Expanded(
            child: TabBarView(
              children: sources.map((source) {
                return TabDetails(
                  sourceId: source.id!,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
  Widget tabWidget(Source source, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 1),
          borderRadius: BorderRadius.circular(18),
          color: isSelected ? Colors.green : Colors.white),
      child: Text(
        source.name ?? "unknown source",
        style: TextStyle(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
