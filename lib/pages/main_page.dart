import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    backgroundColor:  WidgetStateProperty.resolveWith(
                      (states) {
                        return Theme.of(context).colorScheme.surface;
                      },
                    ),
                    // padding:  WidgetStateProperty.resolveWith(
                    //   (states) {
                    //     return EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8);
                    //   },
                    // ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.search),
                    ),
                    hintText: "Search for books and tv shows",
                    hintStyle: WidgetStateProperty.resolveWith(
                        (Set<WidgetState> states) {
                      return TextStyle(color: Theme.of(context).hintColor, fontWeight: FontWeight.w500, fontSize: 14);
                    }),
                  ),
                  const SizedBox(height: 16),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
