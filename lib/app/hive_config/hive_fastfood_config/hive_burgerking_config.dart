class HiveBurgerkingConfig {
  static get restaurantBoxName => _getBoxName('restaurants');

  static const _fastfoodName = 'burgerking';
  static String _getBoxName(String modelsName) =>
      '${_fastfoodName}_${modelsName}_box';
}
