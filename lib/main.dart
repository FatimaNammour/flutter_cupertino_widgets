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
      // color: CupertinoColors.activeGreen,
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        // backgroundColor: CupertinoColors.white,
        tabBar: CupertinoTabBar(
            // backgroundColor: CupertinoColors.white,
            activeColor: CupertinoColors.activeGreen,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble), label: "Chat"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: "Settings"),
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
                return const PobUbPage(
                    // title: "Page Tow",
                    // indexOfPage: index,
                    );
              });

            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return const PageCupertino(
                      // title: "Page Three",
                      // indexOfPage: index,
                      );
                },
              );
            case 3:
            default:
              return CupertinoTabView(
                builder: (context) {
                  return const SegmentedControl(
                      // title: "Page Three",
                      // indexOfPage: index,
                      );
                },
              );
          }
        },
      ),
    );
  }
}
