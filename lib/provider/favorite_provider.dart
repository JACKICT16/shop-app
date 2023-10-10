import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/favorite_models.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, Map<String, FavoriteModel>>(
  (ref) {
    return FavoriteNotifier();
  },
);

class FavoriteNotifier extends StateNotifier<Map<String, FavoriteModel>> {
  FavoriteNotifier() : super({});

  void addMenuToFavorite(
    String menuName,
    String menuId,
    List imageUrl,
    double menuPrice,
    String vendorId,
  ) {
    state[menuId] = FavoriteModel(
      menuName: menuName,
      menuId: menuId,
      imageUrl: imageUrl,
      menuPrice: menuPrice,
      vendorId: vendorId,
    );

    /// notify listeners that the state has changed
    state = {...state};
  }

  void removeAllItems() {
    state.clear();

    /// notify listeners that the state has changed
    state = {...state};
  }

  void removeItem(String menuId) {
    state.remove(menuId);

    /// notify listeners that the state has changed
    state = {...state};
  }

  Map<String, FavoriteModel> get getFavoriteItem => state;
}
