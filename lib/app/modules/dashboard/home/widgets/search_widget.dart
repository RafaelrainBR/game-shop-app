import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String title;
  final Size size;

  const SearchWidget(
      {Key? key, this.title = "AppBarWidget", required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        bottom: 56,
      ),
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 50,
            color: Theme.of(context).primaryColor.withOpacity(0.23),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(child: SizedBox(height: 20)),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Pesquisar",
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
