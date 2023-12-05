import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_widgets/core/widgets/urls.dart';

class PobUbPage extends StatefulWidget {
  const PobUbPage({super.key});

  @override
  State<PobUbPage> createState() => _PobUbPageState();
}

class _PobUbPageState extends State<PobUbPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "IOS Context Menu",
        ),
      ),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const CupertinoSliverNavigationBar(
              largeTitle: Text("Pictures"),
              leading: Icon(CupertinoIcons.heart),
              trailing: Icon(CupertinoIcons.search),
              // padding: EdgeInsetsDirectional.zero,
            ),
          ];
        },
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 4,
            ),
            itemCount: imagesUrls.length,
            itemBuilder: (context, index) {
              final String url = imagesUrls[index];
              return CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    onPressed: () {},
                    trailingIcon: CupertinoIcons.heart,
                    child: const Text("favorite"),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {},
                    trailingIcon: CupertinoIcons.doc_on_doc,
                    child: const Text("copy link"),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {},
                    trailingIcon: CupertinoIcons.share,
                    child: const Text("share"),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {},
                    trailingIcon: CupertinoIcons.delete,
                    isDestructiveAction: true,
                    child: const Text("delete"),
                  ),
                ],
                child: buildItem(url),
              );
            }),
      ),
    );
  }

  Widget buildItem(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30), // Image border
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
