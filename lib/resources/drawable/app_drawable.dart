/*SVG preferred one*/
import 'drawables.dart';

class AppDrawable extends Drawables {
  static final AppDrawable _instance = AppDrawable._internal();

  factory AppDrawable() {
    return _instance;
  }

  AppDrawable._internal();

  @override
  String get selorgLogo => "${imagePNGBasePath}logo_selorg.png";
  @override
  String get backgroundVectorCurve =>
      "${imagePNGBasePath}vector_gradient_curve.png";

  @override
  String get backgroundVectorWave =>
      "${imagePNGBasePath}Vectorbackground_wave.png";

  @override
  String get termsLogo => "${imageSvgBasePath}terms.svg";
  @override
  String get privacyLogo => "${imageSvgBasePath}privacy.svg";
  @override
  String get licenseLogo => "${imageSvgBasePath}license.svg";
  @override
  String get walletIcon => "${imageSvgBasePath}Wallet.svg";
  @override
  String get profileIcon => "${imageSvgBasePath}profile.svg";
  @override
  String get deliveryMan => "${imagePNGBasePath}ic_delivery_man.png";
  @override
  String get backgroundVectorCurveWeb =>
      "${imagePNGBasePath}backgroundVectorCurveWeb.png";
  @override
  String get backgroundVectorWaveWeb =>
      "${imagePNGBasePath}backgroundVectorWaveWeb.png";
  @override
  String get handDelivery => "${imagePNGBasePath}hand_delivery.png";
  @override
  String get newYearPoster => "${imageSvgBasePath}new_year_banner.svg";
  @override
  String get navCartIcon => "${imageSvgBasePath}BNB-cart-icon.svg";
  @override
  String get navCategoriesIcon => "${imageSvgBasePath}BNB-categories-icon.svg";
  @override
  String get navFreshIcon => "${imageSvgBasePath}BNB-fresh-icon.svg";
  @override
  String get navOffersIcon => "${imageSvgBasePath}BNB-offers-icon.svg";
  @override
  String get navSelorgIcon => "${imageSvgBasePath}BNB-selorg-icon.svg";
  @override
  String get freshVegesBanner =>
      "${imageSvgBasePath}homepage-fresh-vegies-banner.svg";
  @override
  String get selorgLogoWeb => "${imageSvgBasePath}selorg_logo_web.svg";

  @override
  String get navCartActive => "${imageSvgBasePath}cart_active.svg";

  @override
  String get navCategoriesActive => "${imageSvgBasePath}categories_active.svg";

  @override
  String get navSelorgActive => "${imageSvgBasePath}selorg_active.svg";
  @override
  String get playstore => "${imageSvgBasePath}playstore.svg";
  @override
  String get appStore => "${imageSvgBasePath}appstore.svg";
  @override
  String get locationpin => "${imagePNGBasePath}locationpin.png";
  @override
  String get tick => "${imagePNGBasePath}tick.png";

  @override
  String get indiaimg => "${imagePNGBasePath}India.png";
}
