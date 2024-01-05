import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_widgets/core/widgets/urls.dart';

class PobUbPage extends StatefulWidget {
  const PobUbPage({super.key});

  @override
  State<PobUbPage> createState() => _PobUbPageState();
}

class _PobUbPageState extends State<PobUbPage> {
  bool showTextField = false;
  TextEditingController searchController = TextEditingController();

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
            CupertinoSliverNavigationBar(
              largeTitle: const Text("Pictures"),
              leading: showTextField ? null : const Icon(CupertinoIcons.heart),
              trailing: showTextField
                  ? CupertinoSearchTextField(
                      suffixMode: OverlayVisibilityMode.always,
                      autocorrect: true,
                      autofocus: true,
                      suffixIcon: const Icon(
                        CupertinoIcons.clear_circled,
                        size: 20,
                      ),
                      onSuffixTap: () {
                        if (searchController.text.isEmpty) {
                          setState(() {
                            showTextField = false;
                          });
                        } else {
                          setState(() {
                            searchController.clear();
                          });
                        }
                      },
                      controller: searchController,
                    )
                  : CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          showTextField = true;
                        });
                      },
                      child: const Icon(
                        CupertinoIcons.search,
                        size: 35,
                      )),
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
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress != null
                ? const CupertinoActivityIndicator(
                    animating: true,
                    color: CupertinoColors.activeGreen,
                  )
                : child,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => child,
      ),
    );
  }
}
