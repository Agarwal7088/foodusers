import 'package:flutter/material.dart';
import 'package:food_users_app/models/items.dart';
//import 'package:food_users_app/models/sellers.dart';

class ItemsDesignWidget extends StatefulWidget {
  Items? model;
  BuildContext? context;
  ItemsDesignWidget({this.model, this.context});
  @override
  _ItemsDesignWidgetState createState() => _ItemsDesignWidgetState();
}

class _ItemsDesignWidgetState extends State<ItemsDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          height: 285,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.thumbnailUrl!,
                height: 210.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                widget.model!.title!,
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontFamily: "Train",
                ),
              ),
              Text(
                widget.model!.shortInfo!,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontFamily: "Train",
                ),
              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
