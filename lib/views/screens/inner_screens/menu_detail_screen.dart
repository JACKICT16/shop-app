import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/provider/cart_provider.dart';

class MenuDetailScreen extends ConsumerStatefulWidget {
  final dynamic menuData;

  const MenuDetailScreen({super.key, required this.menuData});

  @override
  _MenuDetailScreenState createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends ConsumerState<MenuDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final _cartProvider = ref.read(cartProvider.notifier);
    final cartItem = ref.watch(cartProvider);
    final isInCart = cartItem.containsKey(widget.menuData['menuId']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.menuData['menuName'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      widget.menuData['menuImages'][0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.menuData['menuName'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    widget.menuData['menuPrice'].toStringAsFixed(2) + ' ฿',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.pink),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ExpansionTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Menu Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View more',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    children: [Text(widget.menuData['description'])],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        widget.menuData['storeImage'],
                      ),
                    ),
                    title: Text(
                      widget.menuData['shopName'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'see profile',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: isInCart
                  ? null
                  : () {
                      _cartProvider.addMenuToCart(
                        widget.menuData['menuName'],
                        widget.menuData['menuId'],
                        widget.menuData['menuImages'],
                        widget.menuData['menuPrice'],
                        widget.menuData['vendorId'],
                        widget.menuData['menuQuantity'],
                        widget.menuData['quantity'],
                      );
                      print(_cartProvider.getCartItems.values.first.menuName);
                    },
              child: Container(
                decoration: BoxDecoration(
                  color: isInCart ? Colors.grey : Colors.pink.shade900,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.shopping_cart,
                        color: Colors.white,
                      ),
                      Text(
                        isInCart ? "IN CART" : 'ADD TO CART',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.chat_bubble,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.phone,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
