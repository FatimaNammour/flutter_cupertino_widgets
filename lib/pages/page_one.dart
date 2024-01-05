import 'package:flutter/cupertino.dart';

class PageTab extends StatefulWidget {
  const PageTab({required this.title, required this.indexOfPage, super.key});

  final String title;
  final int indexOfPage;
  @override
  State<PageTab> createState() => _PageTabState();
}

class _PageTabState extends State<PageTab> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title,
            style: const TextStyle(
                // color: CupertinoColors.black,
                fontWeight: FontWeight.bold)),
        trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Text("trailing button")),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            widget.title == "Page one" || widget.title.contains("stack")
                ? CupertinoButton.filled(
                    child: const Icon(CupertinoIcons.arrow_left_right),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(CupertinoPageRoute(builder: (context) {
                        return PageTab(
                            title: "stack page ${widget.indexOfPage + 1}",
                            indexOfPage: widget.indexOfPage + 1);
                      }));
                    })
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
