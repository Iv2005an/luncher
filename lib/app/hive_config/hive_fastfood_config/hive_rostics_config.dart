class HiveRosticsConfig {
  static get restaurantBoxName => _getBoxName('restaurants');

  static const _fastfoodName = 'rostics';
  static String _getBoxName(String modelsName) =>
      '${_fastfoodName}_${modelsName}_box';
}
