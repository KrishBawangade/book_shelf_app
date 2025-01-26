import 'package:book_shelf_app/models/book_data_model.dart';
import 'package:book_shelf_app/providers/books_provider.dart';
import 'package:book_shelf_app/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class OrganizeBookShelfPage extends StatefulWidget {
  const OrganizeBookShelfPage({super.key});

  @override
  State<OrganizeBookShelfPage> createState() => _OrganizeBookShelfPageState();
}

class _OrganizeBookShelfPageState extends State<OrganizeBookShelfPage> {
  final TextEditingController _bookShelfNameController =
      TextEditingController();
  int? draggedIndex;
  List<BookDataModel> selectedBookList = [];

  @override
  void initState() {
    BooksProvider booksProvider = Provider.of(context, listen: false);
    selectedBookList = booksProvider.selectedBookList;
    _bookShelfNameController.text = "My Shelfie";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of(context);
    selectedBookList = booksProvider.selectedBookList;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppConstants.bookShelfBgImagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // App Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 18,
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          backgroundColor: Colors.white.withAlpha(40),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white.withAlpha(40),
                            ),
                            onPressed: () {},
                            child: Text("Customize",
                                style: TextStyle(color: Colors.white)),
                          ),
                          IconButton(
                            color: Colors.white.withAlpha(40),
                            iconSize: 18,
                            style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              backgroundColor: Colors.white.withAlpha(40),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Bookshelf Name
                  TextSelectionTheme(
                    data: TextSelectionThemeData(
                      selectionColor: const Color.fromARGB(255, 83, 83, 83).withAlpha(70), // Highlight color
                      selectionHandleColor: const Color.fromARGB(255, 83, 83, 83), // Handle color
                    ),
                    child: TextField(
                      controller: _bookShelfNameController,
                      cursorColor: Colors.white,
                      cursorHeight: 25,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                          height: 0.5
                          ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.3, color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Follow me on Fable @Eragon Dragoneel",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 32),

                  Stack(
                    children: [
                      SizedBox(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35.0, right: 35),
                          child: ReorderableGridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            dragWidgetBuilder: (index, child) {
                              // Customize the dragged widget
                              return Transform.scale(
                                scale:
                                    1.1, // Slightly enlarge the dragged widget
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                        // padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white.withAlpha(
                                              60), // Semi-transparent overlay
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: child,
                                        )), // Original child
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white.withAlpha(
                                            60), // Semi-transparent overlay
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:
                                  100, // Fixed width of each item
                              mainAxisExtent: 120,
                              mainAxisSpacing: 16, // Spacing between rows
                              crossAxisSpacing: 16, // Spacing between columns
                            ),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              BookDataModel bookData =
                                  selectedBookList.sublist(0, 3)[index];
                              return Container(
                                key: ValueKey(
                                    bookData.id), // Unique key for each item
                                height: 120, // Height of the grid item
                                width:
                                    80, // Width is determined by crossAxisExtent
                                color: Colors.grey.shade200,
                                child: CachedNetworkImage(
                                  imageUrl: bookData.cover_url,
                                  fit: BoxFit
                                      .cover, // Ensure the image fills the container
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                          child: Icon(Icons.error,
                                              color: Colors.red)),
                                ),
                              );
                            },
                            onReorder: (oldIndex, newIndex) {
                              setState(() {
                                // Bookshelf with Drag-and-Drop
                                BookDataModel bookData =
                                    selectedBookList[oldIndex];
                                selectedBookList.removeAt(oldIndex);
                                selectedBookList.insert(newIndex, bookData);
                                booksProvider.setSelectedBookList(
                                    bookList: selectedBookList);
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Image.asset(AppConstants.shelfImagePath,
                            width: double.infinity),
                      ),
                    ],
                  ),

                  Stack(
                    children: [
                      SizedBox(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35.0, right: 35),
                          child: ReorderableGridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            dragWidgetBuilder: (index, child) {
                              // Customize the dragged widget
                              return Transform.scale(
                                scale:
                                    1.1, // Slightly enlarge the dragged widget
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                        // padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white.withAlpha(
                                              60), // Semi-transparent overlay
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: child,
                                        )), // Original child
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white.withAlpha(
                                            60), // Semi-transparent overlay
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:
                                  100, // Fixed width of each item
                              mainAxisExtent: 120,
                              mainAxisSpacing: 16, // Spacing between rows
                              crossAxisSpacing: 16, // Spacing between columns
                            ),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              BookDataModel bookData =
                                  selectedBookList.sublist(3, 6)[index];
                              return Container(
                                key: ValueKey(
                                    bookData.id), // Unique key for each item
                                height: 120, // Height of the grid item
                                width:
                                    80, // Width is determined by crossAxisExtent
                                color: Colors.grey.shade200,
                                child: CachedNetworkImage(
                                  imageUrl: bookData.cover_url,
                                  fit: BoxFit
                                      .cover, // Ensure the image fills the container
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                          child: Icon(Icons.error,
                                              color: Colors.red)),
                                ),
                              );
                            },
                            onReorder: (oldIndex, newIndex) {
                              setState(() {
                                // Bookshelf with Drag-and-Drop
                                BookDataModel bookData =
                                    selectedBookList[oldIndex + 3];
                                selectedBookList.removeAt(oldIndex + 3);
                                selectedBookList.insert(newIndex + 3, bookData);
                                booksProvider.setSelectedBookList(
                                    bookList: selectedBookList);
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Image.asset(AppConstants.shelfImagePath,
                            width: double.infinity),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Text("Download",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface)),
                          )),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(AppConstants.fableImagePath, width: 24, height: 24,)),
                                const SizedBox(width:1.5,),
                                Text(
                                  "fable",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ]),
                              Text(
                                "fable.co/shelfie",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              )
                            ])
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
