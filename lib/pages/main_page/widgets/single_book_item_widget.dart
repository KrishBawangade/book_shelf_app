import 'package:book_shelf_app/models/book_data_model.dart';
import 'package:book_shelf_app/providers/books_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleBookItemWidget extends StatefulWidget {
  final BookDataModel bookData;

  const SingleBookItemWidget({super.key, required this.bookData});

  @override
  State<SingleBookItemWidget> createState() => _SingleBookItemWidgetState();
}

class _SingleBookItemWidgetState extends State<SingleBookItemWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of(context);
    _isSelected = booksProvider.selectedBookList.contains(widget.bookData);

    return Material(
      color: Colors.transparent, // Ensures the background is transparent
      borderRadius: BorderRadius.circular(15), // Matches the ClipRRect radius
      child: InkWell(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
            List<BookDataModel> selectedBookList =
                booksProvider.selectedBookList;
            bool isBookSelected = selectedBookList.contains(widget.bookData);

            if (isBookSelected) {
              selectedBookList.remove(widget.bookData);
              booksProvider.setSelectedBookList(bookList: selectedBookList);
            } else {
              if (selectedBookList.length == 6) {
                selectedBookList.removeLast();
              }
              selectedBookList.add(widget.bookData);
              booksProvider.setSelectedBookList(bookList: selectedBookList);
            }
          });
        },
        splashColor: Colors.blue.withAlpha(150), // Splash effect color
        borderRadius:
            BorderRadius.circular(15), // Rounded corners for the ripple
        child: Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
              border: _isSelected
                  ? Border.all(color: Colors.green, width: 2)
                  : null,
              borderRadius: _isSelected ? BorderRadius.circular(15) : null),
          child: Padding(
            padding: const EdgeInsets.all(0.5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  15), // Ensures rounded corners for content
              child: Stack(
                children: [
                  // Book cover image
                  CachedNetworkImage(
                    imageUrl: widget.bookData.cover_url,
                    fit: BoxFit.cover,
                  ),
                  // Overlay container to show splash effect
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isSelected = !_isSelected;
                            List<BookDataModel> selectedBookList =
                                booksProvider.selectedBookList;
                            bool isBookSelected =
                                selectedBookList.contains(widget.bookData);

                            if (isBookSelected) {
                              selectedBookList.remove(widget.bookData);
                              booksProvider.setSelectedBookList(
                                  bookList: selectedBookList);
                            } else {
                              if (selectedBookList.length == 6) {
                                selectedBookList.removeLast();
                              }
                              selectedBookList.add(widget.bookData);
                              booksProvider.setSelectedBookList(
                                  bookList: selectedBookList);
                            }
                          });
                        },
                        splashColor:
                            Colors.blue.withAlpha(150), // Splash effect color
                        borderRadius:
                            BorderRadius.circular(15), // Match border radius
                      ),
                    ),
                  ),
                  // Checkbox overlay
                  SizedBox(
                    width: 100,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Checkbox(
                        value: _isSelected,
                        fillColor: WidgetStateProperty.resolveWith((states) {
                          return _isSelected
                              ? Colors.green
                              : Colors.black.withAlpha(60);
                        }),
                        side: BorderSide.none,
                        onChanged: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
