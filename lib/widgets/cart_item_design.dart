import 'package:flutter/material.dart';
import 'package:food_users_app/models/items.dart';

class CartItemDesign extends StatefulWidget {
  final Items model;
  BuildContext context;
  final List<int>? separateItemsQuantitiesList;
  CartItemDesign({
    required this.model,
    required this.context,
    this.separateItemsQuantitiesList,
  });

  @override
  State<CartItemDesign> createState() => _CartItemDesignState();
}

class _CartItemDesignState extends State<CartItemDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 165,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Image.network(
                widget.model!.thumbnailUrl!,
                width: 140,
                height: 120,
              ),
              SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model!.title!,
                    style: TextStyle(
                        color: Colors.black, fontSize: 16, fontFamily: "Kiwi"),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        "x ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Kiwi"),
                      ),
                      Text(
                        widget.separateItemsQuantitiesList.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: "Acne"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Price: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Kiwi"),
                      ),
                      Text(
                        "c ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Kiwi"),
                      ),
                      Text(
                        widget.model!.price.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Kiwi"),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
