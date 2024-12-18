import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String error;
  final Function? onRefreshClick;

  const AppError({
    super.key,
    required this.error,
    this.onRefreshClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(error),
        ElevatedButton(
            onPressed: () {
              onRefreshClick?.call();
            },
            child: const Text("Refresh"))
      ],
    );
  }
}
