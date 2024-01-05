import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_widgets/core/widgets/app_theme.dart';
import 'package:flutter_cupertino_widgets/pages/page_one.dart';
import 'package:flutter_cupertino_widgets/pages/page_others.dart';
import 'package:flutter_cupertino_widgets/pages/page_segmented.dart';
import 'package:flutter_cupertino_widgets/pages/pob_ub_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            activeColor: CupertinoColors.activeGreen,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "A"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: "B"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble), label: "C"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: "D"),
            ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) => PageTab(
                  title: "Page one",
                  indexOfPage: index,
                ),
              );
            case 1:
              return CupertinoTabView(builder: (context) {
                return const PobUbPage();
              });

            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return const PageCupertino();
                },
              );
            case 3:
            default:
              return CupertinoTabView(
                builder: (context) {
                  return const SegmentedControl();
                },
              );
          }
        },
      ),
    );
  }
}
