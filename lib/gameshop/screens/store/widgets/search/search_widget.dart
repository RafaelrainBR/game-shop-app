import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gameshop/gameshop/screens/store/widgets/search/search_controller.dart';

class StoreSearchWidget extends StatefulWidget {
  final SearchController searchController;

  StoreSearchWidget({Key? key, required this.searchController})
      : super(key: key);

  @override
  _StoreSearchWidgetState createState() => _StoreSearchWidgetState();
}

class _StoreSearchWidgetState extends State<StoreSearchWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).primaryColor;
    final horizontalPadding = EdgeInsets.symmetric(horizontal: 20);

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 56),
      height: size.height * 0.2,
      decoration: _buildBoxDecoration(primaryColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          padding: horizontalPadding,
          margin: horizontalPadding,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: TextField(
            controller: widget.searchController.inputController,
            onChanged: widget.searchController.sendChanged,
            decoration: InputDecoration(
              hintText: "Pesquisar",
              hintStyle: TextStyle(color: primaryColor.withOpacity(0.5)),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(color) {
    final radius = Radius.circular(24);
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 15),
          blurRadius: 50,
          color: color.withOpacity(0.25),
        ),
      ],
    );
  }
}
