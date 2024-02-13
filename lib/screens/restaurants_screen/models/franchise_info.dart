import 'package:luncher/repositories/fastfood_repository/fastfood_repository.dart';

class FranchiseInfo {
  FranchiseInfo(
    this.franchiseRepository,
    this.assetLogo,
    this.assetPlacemark,
    this.assetPlacemarkWithoutLogo, {
    this.assetPlacemarkDisabled,
    this.assetPlacemarkSelected,
    this.monochromeAssetLogo = false,
  });
  final AbstractFranchiseRepository franchiseRepository;
  final String assetLogo;
  final bool monochromeAssetLogo;
  final String assetPlacemark;
  final String assetPlacemarkWithoutLogo;
  final String? assetPlacemarkDisabled;
  final String? assetPlacemarkSelected;
}
