import 'package:flutter/cupertino.dart';

class PageCupertino extends StatefulWidget {
  const PageCupertino({super.key});

  @override
  State<PageCupertino> createState() => _PageCupertinoState();
}

class _PageCupertinoState extends State<PageCupertino> {
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "IOS Context Menu",
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(currentValue.floor().toString()),
                CupertinoSlider(
                    max: 100,
                    min: 0,
                    divisions: 400,
                    value: currentValue,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    }),
              ],
            ),
            CupertinoButton.filled(
                child: const Text(
                  "Show Actions",
                ),
                onPressed: () async {
                  showPopup();
                }),
            CupertinoButton.filled(
                child: const Text("Show alertDialog"),
                onPressed: () {
                  showDialog();
                }),
            CupertinoButton.filled(
                onPressed: () {
                  showSurface();
                },
                child: const Text("Show pobup "))
          ],
        ),
      ),
    );
  }

  void showDialog() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text("Title of dialog"),
              content: const Text("Content of dialog"),
              actions: [
                CupertinoDialogAction(
                  child: CupertinoButton(
                      child: const Text("ok"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: CupertinoButton(
                      child: const Text("cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            ));
  }

  void showPopup() async {
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
  }

  void showSurface() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoPopupSurface(
            // isSurfacePainted: true,
            child: SizedBox(
              height: MediaQuery.of(context).size.height.toDouble() / 3,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("content of popup surface"),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                        "To close click me or click anywhere except the popup"),
                  )
                ],
              ),
            ),
          );
        });
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
