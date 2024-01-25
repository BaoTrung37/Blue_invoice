/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/LeagueSpartan-Bold.ttf
  String get leagueSpartanBold => 'assets/fonts/LeagueSpartan-Bold.ttf';

  /// File path: assets/fonts/LeagueSpartan-Medium.ttf
  String get leagueSpartanMedium => 'assets/fonts/LeagueSpartan-Medium.ttf';

  /// List of all assets
  List<String> get values => [leagueSpartanBold, leagueSpartanMedium];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon-arrow-down.svg
  SvgGenImage get iconArrowDown =>
      const SvgGenImage('assets/icons/icon-arrow-down.svg');

  /// File path: assets/icons/icon-arrow-left.svg
  SvgGenImage get iconArrowLeft =>
      const SvgGenImage('assets/icons/icon-arrow-left.svg');

  /// File path: assets/icons/icon-arrow-right.svg
  SvgGenImage get iconArrowRight =>
      const SvgGenImage('assets/icons/icon-arrow-right.svg');

  /// File path: assets/icons/icon-calendar.svg
  SvgGenImage get iconCalendar =>
      const SvgGenImage('assets/icons/icon-calendar.svg');

  /// File path: assets/icons/icon-check.svg
  SvgGenImage get iconCheck => const SvgGenImage('assets/icons/icon-check.svg');

  /// File path: assets/icons/icon-delete.svg
  SvgGenImage get iconDelete =>
      const SvgGenImage('assets/icons/icon-delete.svg');

  /// File path: assets/icons/icon-moon.svg
  SvgGenImage get iconMoon => const SvgGenImage('assets/icons/icon-moon.svg');

  /// File path: assets/icons/icon-plus.svg
  SvgGenImage get iconPlus => const SvgGenImage('assets/icons/icon-plus.svg');

  /// File path: assets/icons/icon-sun.svg
  SvgGenImage get iconSun => const SvgGenImage('assets/icons/icon-sun.svg');

  /// File path: assets/icons/illustration-empty.svg
  SvgGenImage get illustrationEmpty =>
      const SvgGenImage('assets/icons/illustration-empty.svg');

  /// File path: assets/icons/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/icons/logo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        iconArrowDown,
        iconArrowLeft,
        iconArrowRight,
        iconCalendar,
        iconCheck,
        iconDelete,
        iconMoon,
        iconPlus,
        iconSun,
        illustrationEmpty,
        logo
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/favicon-32x32.png
  AssetGenImage get favicon32x32 =>
      const AssetGenImage('assets/images/favicon-32x32.png');

  /// File path: assets/images/image-avatar.jpg
  AssetGenImage get imageAvatar =>
      const AssetGenImage('assets/images/image-avatar.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [favicon32x32, imageAvatar];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/data.json
  String get data => 'assets/json/data.json';

  /// List of all assets
  List<String> get values => [data];
}

class $AssetsScreenshotsGen {
  const $AssetsScreenshotsGen();

  /// File path: assets/screenshots/Screenshot_1706179127.png
  AssetGenImage get screenshot1706179127 =>
      const AssetGenImage('assets/screenshots/Screenshot_1706179127.png');

  /// File path: assets/screenshots/Screenshot_1706179138.png
  AssetGenImage get screenshot1706179138 =>
      const AssetGenImage('assets/screenshots/Screenshot_1706179138.png');

  /// File path: assets/screenshots/Screenshot_1706179149.png
  AssetGenImage get screenshot1706179149 =>
      const AssetGenImage('assets/screenshots/Screenshot_1706179149.png');

  /// File path: assets/screenshots/Screenshot_1706179153.png
  AssetGenImage get screenshot1706179153 =>
      const AssetGenImage('assets/screenshots/Screenshot_1706179153.png');

  /// File path: assets/screenshots/Screenshot_1706179155.png
  AssetGenImage get screenshot1706179155 =>
      const AssetGenImage('assets/screenshots/Screenshot_1706179155.png');

  /// File path: assets/screenshots/Screenshot_1706179161.png
  AssetGenImage get screenshot1706179161 =>
      const AssetGenImage('assets/screenshots/Screenshot_1706179161.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        screenshot1706179127,
        screenshot1706179138,
        screenshot1706179149,
        screenshot1706179153,
        screenshot1706179155,
        screenshot1706179161
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsScreenshotsGen screenshots = $AssetsScreenshotsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
