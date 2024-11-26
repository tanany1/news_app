import 'package:flutter/material.dart';
import '../../../../../data/api_manager.dart';
import '../../../../../model/source.dart';

class TabsList extends StatelessWidget {
  const TabsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.loadTabsList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return errorView(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return tabsList(snapshot.data!.sources ?? []);
          } else {
            return loadingView();
          }
        });
  }
}

Widget loadingView() {
  return const Center(child: CircularProgressIndicator());
}

Widget tabsList(List<Source> sources) {
  return const Text("Successful Api call");
}

Widget errorView(String error) {
  return Column(
    children: [
      Text(error),
      ElevatedButton(onPressed: () {}, child: const Text("Refresh"))
    ],
  );
}
