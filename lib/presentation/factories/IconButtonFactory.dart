import 'package:flutter/material.dart';

import '../../resources/ColorsRes.dart';


class IconButtonFactory {
//////////////////////////////////////////////////////////////
  ///<IconButton>
//////////////////////////////////////////////////////////////

  static const ICON_HEIGHT = 40.0;
  static const ICON_WIDTH = 40.0;

  static IconButton addBussinessIcon(Function onClick) {
    return _getIconActionButton(
        'assets/images/AddShop.png', true, 1.0, onClick);
  }

  static Image getFacebookIcon(
      {double height = ICON_HEIGHT, double width = ICON_WIDTH}) {
    return _getAssetImageSized('assets/images/facebook-logo.png',
        height: height, width: width);
  }

  static Image getAppleIcon(
      {double height = ICON_HEIGHT, double width = ICON_WIDTH}) {
    return _getAssetImageSized(
      'assets/images/apple-logo.png',
      height: height,
      width: width,
    );
  }

  static Image getGoogleIcon(
      {double height = ICON_HEIGHT, double width = ICON_WIDTH}) {
    return _getAssetImageSized(
      'assets/images/google-logo.png',
      height: height,
      width: width,
    );
  }

  static Image getGoogleImage(
      {double height = ICON_HEIGHT, double width = ICON_WIDTH}) {
    return _getAssetImageSized(
      'assets/images/google_image.png',
      height: height,
      width: width,
    );
  }

  static Image getRegistrationImage(String image,
      {double height = ICON_HEIGHT, double width = ICON_WIDTH}) {
    return _getAssetImageSized(
      image,
      height: height,
      width: width,
    );
  }

  static Image carouselIcon(
      {double height = ICON_HEIGHT, double width = ICON_WIDTH}) {
    return _getAssetImageSized(
      'assets/images/moreimages.png',
      height: height,
      width: width,
    );
  }



  static Widget logoImageIcon(bool active) {
    return Image.asset('assets/images/logo_menu.png');
  }

  static Widget editButton(Function onClick, {double size = 25.0}) {
    onClick as void Function();
    return InkWell(
      onTap: onClick,
      child: Container(
        child: Image.asset('assets/images/new_pencil.png',
            color: ColorsRes.primaryColor),
      ),
    );
  }

  static Widget saveButton(Function onClick, {double size = 25.0}) {
    onClick as void Function();
    return InkWell(
      onTap: onClick,
      child: Container(
        child: Icon(Icons.save_outlined,
            size: size, color: ColorsRes.primaryColor),
      ),
    );
  }

  static Widget editButtonRounded(Function onClick, {double size = 25.0}) {
    onClick as void Function(); //TODO check if this forced cast works properly
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsRes.backgroundColor,
            border: Border.all(color: ColorsRes.iconDisabledColor, width: 0.5)),
        child: Image.asset('assets/images/new_pencil.png',
            color: ColorsRes.iconDarkColor),
      ),
    );
  }

  static Image _getAssetImageSized(String path,
      {required double height, required double width}) {
    return Image(
      image: AssetImage(path),
      height: height,
      width: width,
    );
  }

  static Image _getAssetImage(String path, Color? color, double scaleFactor) {
    return Image(
      image: AssetImage(path),
      color: color,
      height: ICON_HEIGHT * scaleFactor,
      width: ICON_WIDTH * scaleFactor,
    );
  }

  static Image _getIconButton(
      String assetPath, bool active, double scaleFactor) {
    if (active) {
      return Image(
        image: AssetImage(assetPath),
        color: ColorsRes.primaryColor,
        alignment: Alignment.center,
        height: ICON_HEIGHT * scaleFactor,
        width: ICON_WIDTH * scaleFactor,
      );
    }

    return Image(
      image: AssetImage(assetPath),
      color: ColorsRes.iconUnactiveColor,
      alignment: Alignment.center,
      height: ICON_HEIGHT * scaleFactor,
      width: ICON_WIDTH * scaleFactor,
    );
  }

  static IconButton _getIconActionButton(
      String assetPath, bool active, double scaleFactor, Function onClick) {
    onClick as void Function(); //TODO check if this forced cast works properly
    return IconButton(
      padding: EdgeInsets.all(0),
      alignment: Alignment.center,
      icon: _getAssetImage(assetPath, null, scaleFactor),
      onPressed: onClick,
    );
  }

//////////////////////////////////////////////////////////////
  ///<IconButton>
//////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////
  ///<Icon>
//////////////////////////////////////////////////////////////
  static Icon _getTintedIcon(IconData iconData, double size, Color color) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }

  static Icon _getIcon(IconData iconData, double size) {
    return Icon(
      iconData,
      size: size,
    );
  }

  static ImageIcon _getImageIcon(String assetPath, double size, Color color) {
    return ImageIcon(
      AssetImage(assetPath),
      size: size,
      color: color,
    );
  }

  static Icon addressIcon() {
    return _getTintedIcon(Icons.location_on, 30.0, ColorsRes.primaryColor);
  }

  static Icon phoneIcon() {
    return _getTintedIcon(Icons.phone, 10.0, ColorsRes.iconFillColor);
  }

  static Icon commentIcon() {
    return _getTintedIcon(Icons.comment, 16.0, ColorsRes.iconFillColor);
  }

  static Icon shareIcon() {
    return _getTintedIcon(Icons.favorite_border, 16.0, ColorsRes.iconFillColor);
  }

  static ImageIcon validatedIcon() {
    return _getImageIcon(
        'assets/images/validated-icon.png', 18.0, ColorsRes.secondaryColor);
  }

  static ImageIcon validatedActiveIcon() {
    return _getImageIcon(
        'assets/images/validated-icon.png', 18.0, ColorsRes.iconActiveColor);
  }

  static ImageIcon validatedUnactiveIcon() {
    return _getImageIcon(
        'assets/images/validated-icon.png', 18.0, ColorsRes.iconLightColor);
  }

  static ImageIcon instagramIcon() {
    return _getImageIcon(
        'assets/images/instagram.png', 32.0, ColorsRes.primaryColor);
  }

  static ImageIcon webIcon() {
    return _getImageIcon('assets/images/web.png', 32.0, ColorsRes.primaryColor);
  }

  static ImageIcon addMapIcon() {
    return _getImageIcon(
        'assets/images/add-bussiness-icon.png', 38.0, ColorsRes.primaryColor);
  }

  static ImageIcon opinionIcon() {
    return _getImageIcon(
        'assets/images/collab_opinion.png', 38.0, ColorsRes.primaryColor);
  }



  static Icon getBubbleImage(
      IconData icon, {
        double height = ICON_HEIGHT,
        double width = ICON_WIDTH,
      }) {
    return _getBubbleIcon(
      icon,
      height: height,
      width: width,
      color: ColorsRes.darkColor,
    );
  }

  static Icon _getBubbleIcon(
      IconData icon, {
        required double height,
        required double width,
        required Color color,
      }) {
    return Icon(
      icon,
      size: 35.0,
    );
  }

  static Widget bottomNavIcon(
      bool active,
      IconData icon, [
        double scaleFactor = 1,
      ]) {
    return SizedBox.square(
      dimension: active ? 32 : 30,
      child: buildIcon(
        active,
        scaleFactor,
        icon,
      ),
    );
  }

  static Icon buildIcon(bool active, double scaleFactor, IconData icon) {
    if (active) {
      return Icon(
        icon,
        size: 32.0 * scaleFactor,
        color: ColorsRes.primaryColor,
      );
    }
    return Icon(
      icon,
      size: 30.0 * scaleFactor,
      color: ColorsRes.iconDisabledColor,
    );
  }

  static Widget shopNavIcon(
      bool active,
      String icon, [
        double scaleFactor = 1,
      ]) {
    return SizedBox.square(
      dimension: active ? 32 : 30,
      child: buildShopIcon(
        active,
        scaleFactor,
        icon,
      ),
    );
  }

  static Image buildShopIcon(bool active, double scaleFactor, String icon) {
    if (active) {
      return Image.asset(
        icon,
        color: ColorsRes.primaryColor,
        width: 32.0 * scaleFactor,
        height: 32.0 * scaleFactor,
      );
    }
    return Image.asset(
      icon,
      width: 32.0 * scaleFactor,
      height: 32.0 * scaleFactor,
      color: ColorsRes.iconDisabledColor,
    );
  }

//////////////////////////////////////////////////////////////
///</Icon>
//////////////////////////////////////////////////////////////
}
