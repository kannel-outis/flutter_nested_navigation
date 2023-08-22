import 'package:flutter/material.dart';
import 'package:flutter_nested_navigation/router.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MyHomePage({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  final _bottomChildren = const <NavigationDestination>[
    NavigationDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.folder),
      icon: Icon(Icons.folder_outlined),
      label: 'Files',
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.person),
      icon: Icon(Icons.person_outlined),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_bottomChildren[_index].label),
      ),
      body: widget.navigationShell,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(NavRouter.routes.settings);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          _index = index;
          setState(() {});
          widget.navigationShell.goBranch(index);
        },
        selectedIndex: widget.navigationShell.currentIndex,
        destinations: _bottomChildren,
      ),
    );
  }
}
