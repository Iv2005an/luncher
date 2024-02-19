class HiveVkusnoitochkaConfig {
  static get restaurantBoxName => _getBoxName('restaurants');

  static const _fastfoodName = 'vkusnoitochka';
  static String _getBoxName(String modelsName) =>
      '${_fastfoodName}_${modelsName}_box';
}
