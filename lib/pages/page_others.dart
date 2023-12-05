import 'package:flutter/cupertino.dart';

class PageCupertino extends StatefulWidget {
  const PageCupertino({super.key});

  @override
  State<PageCupertino> createState() => _PageCupertinoState();
}

class _PageCupertinoState extends State<PageCupertino> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "IOS Context Menu",
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            CupertinoButton.filled(
                child: const Text(
                  "Show Actions",
                ),
                onPressed: () async {
                  final String? retunedNumber = await showCupertinoModalPopup(
                      context: context, builder: buildActionSheet);
                  switch (retunedNumber) {
                    case "A":
                      print("User click on A");
                    case "B":
                      print("User click on B");
                    case "C":
                      print("User click on C");
                    case "D":
                      print("User click on D");
                    default:
                      print("User click on space");
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget buildActionSheet(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text(
        "Sheet Title",
      ),
      message: const Text(
        "Sheet Message",
      ),
      actions: [
        CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, "A");
            },
            child: const Text(
              "Add",
            )),
        CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, "B");
            },
            child: const Text(
              "Edit",
            )),
        CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context, "C");
            },
            child: const Text(
              "Delete",
            )),
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context, "D");
          },
          child: const Text(
            "Cancel",
          )),
    );
  }
}
