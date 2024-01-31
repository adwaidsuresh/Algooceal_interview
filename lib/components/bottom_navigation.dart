import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:random_dog/provider/api_provider.dart';
import 'package:random_dog/view/cart_page.dart';
import 'package:random_dog/view/history_page.dart';
import 'package:random_dog/view/main_page.dart';

class BottomNavigation extends ConsumerWidget {
  BottomNavigation({super.key});

  final controller = PageController();

  final int selectedIndex = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 171),
      extendBody: true,
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        children: const [MainViewPage(), Cartpage(), History()],
        onPageChanged: (value) {
          ref.read(bottomProvider.notifier).state = value;
        },
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: const Color.fromARGB(95, 16, 17, 16),
        domeCircleColor: const Color.fromARGB(255, 168, 165, 164),
        selectedIndex: ref.watch(bottomProvider),
        onTabChange: (index) {
          ref.read(bottomProvider.notifier).state = index;
          controller.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear);
        },
        tabs: [
          MoltenTab(icon: const Icon(CupertinoIcons.home)),
          MoltenTab(icon: const Icon(CupertinoIcons.cart)),
          MoltenTab(icon: const Icon(CupertinoIcons.bookmark)),
        ],
      ),
    );
  }
}
