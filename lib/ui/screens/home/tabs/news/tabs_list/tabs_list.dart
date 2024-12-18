import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_details/tab_details.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_list/tabs_list_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../../data/api_manager.dart';
import '../../../../../../model/source.dart';
import '../../../../../widgets/app_error.dart';
import '../../../../../widgets/app_loader.dart';

class TabsList extends StatefulWidget {
  final String categoryId;

  const TabsList({super.key, required this.categoryId});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int currentTabIndex = 0;
  TabsListViewModel viewModel = TabsListViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadTabsList(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Builder(builder: (context) {
        viewModel = Provider.of(context, listen: true);
        if (viewModel.state == TabsListState.loading) {
          return const AppLoader();
        } else if (viewModel.state == TabsListState.success) {
          return tabsList(viewModel.sources);
        } else {
          return AppError(error: viewModel.errorMessage, onRefreshClick: (){
            viewModel.loadTabsList(widget.categoryId);
          },);
        }
      }),
    );
  }

  Widget tabsList(List<Source> sources) {
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
