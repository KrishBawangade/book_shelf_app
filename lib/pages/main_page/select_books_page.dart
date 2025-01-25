import 'package:book_shelf_app/pages/main_page/widgets/single_book_item_widget.dart';
import 'package:book_shelf_app/providers/books_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectBooksPage extends StatelessWidget {
  const SelectBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    iconSize: 18,
                    style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: Theme.of(context).colorScheme.surface),
                  ),
                  const SizedBox(height: 16),
                  Text("Let's Build Your Shelfie!",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          height: 1.2)),
                  const SizedBox(height: 8),
                  Text(
                    "Pick 5-8 books or tv shows that you love the most to create a Shelfie as unique as you are!",
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  SearchBar(
                    elevation: WidgetStateProperty.resolveWith(
                      (states) {
                        return 0;
                      },
                    ),
                    backgroundColor: WidgetStateProperty.resolveWith(
                      (states) {
                        return Theme.of(context).colorScheme.surface;
                      },
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.search),
                    ),
                    hintText: "Search for books and tv shows",
                    hintStyle: WidgetStateProperty.resolveWith(
                        (Set<WidgetState> states) {
                      return TextStyle(
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14);
                    }),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Stack(
                      children: [
                        !booksProvider.isLoading
                            ? SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 75.0),
                                  child: Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    children:
                                        booksProvider.bookList.map((bookData) {
                                      return SingleBookItemWidget(
                                          bookData: bookData);
                                    }).toList(),
                                  ),
                                ),
                              )
                            : const Center(child: CircularProgressIndicator()),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHigh,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: AnimatedOpacity(
                                      duration: Duration(milliseconds: 300),
                                      opacity: booksProvider
                                                  .selectedBookList.length !=
                                              6
                                          ? 0.3
                                          : 1,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 58, 58, 58),
                                              disabledBackgroundColor:
                                                  const Color.fromARGB(
                                                      195, 105, 105, 105)),
                                          onPressed: booksProvider
                                                      .selectedBookList
                                                      .length !=
                                                  6
                                              ? null
                                              : () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                                booksProvider.selectedBookList
                                                            .length != 6
                                                    ? booksProvider
                                                                .selectedBookList
                                                                .length == 5
                                                        ? "Select 1 more"
                                                        : "Select 5-8 books or tv shows"
                                                    : "Create my shelfie",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                    )),
                                  ],
                                ),
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
