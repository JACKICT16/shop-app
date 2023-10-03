class CartModel {
  final String menuName;
  final String menuID;
  final List imageUrl;

  final double price;

  final String vendorId;

  CartModel(
      {required this.menuName,
      required this.menuID,
      required this.imageUrl,
      required this.price,
      required this.vendorId});
}
