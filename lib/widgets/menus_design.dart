import 'package:flutter/material.dart';
import 'package:food_users_app/models/menus.dart';
//import 'package:food_users_app/models/sellers.dart';

class MenusDesignWidget extends StatefulWidget {
  Menus? model;
  BuildContext? context;
  MenusDesignWidget({this.model, this.context});
  @override
  _MenusDesignWidgetState createState() => _MenusDesignWidgetState();
}

class _MenusDesignWidgetState extends State<MenusDesignWidget> {
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
                widget.model!.menuTitle!,
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontFamily: "Train",
                ),
              ),
              Text(
                widget.model!.menuInfo!,
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
