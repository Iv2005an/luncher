import 'package:flutter/material.dart';
import 'package:luncher/generated/l10n.dart';

class Launcher extends StatefulWidget {
  const Launcher({super.key});

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    final pagesNames = [
      S.of(context).restaurants,
      S.of(context).wishes,
      S.of(context).offers
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(pagesNames[currentPageIndex]),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Scaffold(
                        appBar: AppBar(
                          title: Text(S.of(context).settings),
                        ),

                        // TODO: Add settings screen
                        body: const Placeholder());
                  },
                ));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: [
        // TODO: Add restaurants screen
        const Placeholder(),

        // TODO: Add wishes screen
        const Placeholder(),

        // TODO: Add offers screen
        const Placeholder(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (pageIndex) => setState(() {
                currentPageIndex = pageIndex;
              }),
          selectedIndex: currentPageIndex,
          destinations: [
            NavigationDestination(
                icon: const Icon(Icons.food_bank_outlined),
                selectedIcon: const Icon(Icons.food_bank),
                label: pagesNames[0]),
            NavigationDestination(
                icon: const Icon(Icons.fastfood_outlined),
                selectedIcon: const Icon(Icons.fastfood),
                label: pagesNames[1]),
            NavigationDestination(
                icon: const Icon(Icons.summarize_outlined),
                selectedIcon: const Icon(Icons.summarize),
                label: pagesNames[2]),
          ]),
    );
  }
}
