import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const AppBarCustom({super.key, this.actions});


  @override
  Widget build(BuildContext context) {

    return AppBar(
      actions: actions,
      automaticallyImplyLeading: false,
      leading : IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
        Navigator.of(context).pop();
      },),
      toolbarHeight: kToolbarHeight,
      title: null,
      backgroundColor: Colors.white
    );
  }

  @override
  Size get preferredSize =>  const Size.fromHeight(kToolbarHeight);
}
