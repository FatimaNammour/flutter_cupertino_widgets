import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentedControl extends StatefulWidget {
  const SegmentedControl({super.key});

  @override
  State<SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  int activeValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          const CupertinoNavigationBar(middle: Text("Segmented Control")),
      child: SafeArea(
        child: Column(
          children: [
            const Text("Just a cute Segmented Control 😅"),
            CupertinoSegmentedControl<int>(
              padding: const EdgeInsets.all(10),
              // pressedColor: CupertinoColors.white,
              groupValue: activeValue,
              children: {
                0: buildHeader(0),
                1: buildHeader(1),
                2: buildHeader(2),
                3: buildHeader(3),
              },
              onValueChanged: (index) {
                setState(() {
                  activeValue = index;
                });

                print(index);
              },
            ),
            Divider(),
            Text("Cupertino Buttons!"),
            CupertinoButton(
                child: const Text("Click me"),
                onPressed: () {
                  print("text Button");
                }),
            CupertinoButton.filled(
                child: const Text("Click me"),
                onPressed: () {
                  print("text Button");
                }),
            CupertinoButton(
                borderRadius: BorderRadius.circular(40),
                // borderRadius: BorderRadius.circular(0),
                color: CupertinoColors.activeOrange,
                child: const Text("Click me"),
                onPressed: () {
                  print("text Button");
                }),
            CupertinoButton.filled(
                // minSize: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: const Text("Click me"),
                onPressed: () {
                  print("text Button");
                }),
            SizedBox(
              height: 50,
              width: 100,
              child: CupertinoButton(
                  color: CupertinoColors.activeOrange,
                  padding: EdgeInsets.zero,
                  child: Text("Click me"),
                  pressedOpacity: 0.7,
                  onPressed: () {
                    print("text Button");
                  }),
            ),
            const CupertinoButton.filled(
              disabledColor: CupertinoColors.inactiveGray,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              onPressed: null,
              child: Text("Click me"),
            ),
            Container(
              color: CupertinoColors.activeBlue,
              child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    CupertinoIcons.add_circled,
                    size: 40,
                  ),
                  onPressed: () {
                    print("text Button");
                  }),
            ),
            Container(
              child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Row(
                    children: [
                      Text("with Icon"),
                      Icon(
                        CupertinoIcons.add,
                      ),
                    ],
                  ),
                  onPressed: () {
                    print("text Button");
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(int index) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(10),
      child: Text("Header $index"),
    );
  }
}
