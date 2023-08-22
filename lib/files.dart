import 'package:flutter/material.dart';
import 'package:flutter_nested_navigation/router.dart';
import 'package:go_router/go_router.dart';

class FilesPage extends StatelessWidget {
  final int? pageNumber;
  const FilesPage({super.key, this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.primaries[pageNumber ?? 0],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Files",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text.rich(
            TextSpan(text: "Page Number: ", children: [
              TextSpan(
                text: (pageNumber ?? 0).toString(),
              )
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: pageNumber == null || pageNumber == 0
                    ? null
                    : () {
                        if (pageNumber == 1) {
                          context.pop();
                          return;
                        }
                        context.go(
                          "${NavRouter.routes.files}/${(pageNumber ?? 0) - 1}",
                        );
                      },
                child: const Text("Prev Page"),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: pageNumber == Colors.primaries.length - 1
                    ? null
                    : () {
                        context.go(
                          "${NavRouter.routes.files}/${(pageNumber ?? 0) + 1}",
                        );
                      },
                child: const Text("Next Page"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
