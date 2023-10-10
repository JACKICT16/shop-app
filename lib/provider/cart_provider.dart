import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/cart_models.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, Map<String, CartModel>>(
        (ref) => CartNotifier());

class CartNotifier extends StateNotifier<Map<String, CartModel>> {
  CartNotifier() : super({});

  void addMenuToCart(
    String menuName,
    String menuId,
    List imageUrl,
    double menuPrice,
    String vendorId,
    int quantity,
    int menuQuantity,
  ) {
    if (state.containsKey(menuId)) {
      state = {
        ...state,
        menuId: CartModel(
          menuName: state[menuId]!.menuName,
          menuId: state[menuId]!.menuId,
          imageUrl: state[menuId]!.imageUrl,
          menuPrice: state[menuId]!.menuPrice,
          vendorId: state[menuId]!.vendorId,
          menuQuantity: state[menuId]!.menuQuantity,
          quantity: state[menuId]!.quantity,
        )
      };
    } else {
      state = {
        ...state,
        menuId: CartModel(
          menuName: menuName,
          menuId: menuId,
          imageUrl: imageUrl,
          menuPrice: menuPrice,
          vendorId: vendorId,
          menuQuantity: menuQuantity,
          quantity: quantity,
        )
      };
    }
  }

  void incrementItem(String menuId) {
    if (state.containsKey(menuId)) {
      state[menuId]!.quantity++;

      /// notify listeners that the state has changed
      state = {...state};
    }
  }

  void decrementItem(String menuId) {
    if (state.containsKey(menuId)) {
      state[menuId]!.quantity--;

      /// notify listeners that the state has changed
      state = {...state};
    }
  }

  void removeItem(String menuId) {
    state.remove(menuId);

    /// notify listeners that the state has changed
    state = {...state};
  }

  void removeAllItem() {
    state.clear();

    /// notify listeners that the state has changed
    state = {...state};
  }

  double calculateTotalAmount() {
    double totalAmonut = 0.0;
    state.forEach((menuId, cartItem) {
      totalAmonut += cartItem.quantity * cartItem.menuPrice;
    });

    return totalAmonut;
  }

  Map<String, CartModel> get getCartItems => state;
}
