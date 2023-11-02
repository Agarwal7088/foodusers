import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_users_app/assistantMethods/assistant_methods.dart';
import 'package:food_users_app/models/items.dart';
import 'package:food_users_app/widgets/app_bar.dart';
import 'package:food_users_app/widgets/cart_item_design.dart';
import 'package:food_users_app/widgets/progress_bar.dart';
import 'package:food_users_app/widgets/text_widget_header.dart';

class CartScreen extends StatefulWidget {
  final String? sellerUID;
  CartScreen({this.sellerUID});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    separateItemQuantities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        sellerUID: widget.sellerUID,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 10,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
              label: Text("Clear Cart"),
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.clear_all),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
              label: Text(
                "Check Out",
                style: TextStyle(fontSize: 16),
              ),
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.navigate_next),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: TextWidgetHeader(title: "Total Amount = 120"),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("items")
                  .where("itemID", whereIn: separateItemIDs())
                  .orderBy("publishedDate", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgress(),
                        ),
                      )
                    : snapshot.data!.docs.length == 0
                        ? Container()
                        : SliverList(delegate:
                            SliverChildBuilderDelegate((context, index) {
                            Items model = Items.fromJson(
                              snapshot.data!.docs[index].data()!
                                  as Map<String, dynamic>,
                            );
                            return CartItemDesign(
                              model: model,
                              context: context,
                              separateItemsQuantitiesList: [index],
                            );
                          }));
              }),
        ],
      ),
    );
  }
}
