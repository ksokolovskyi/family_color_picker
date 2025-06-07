import 'dart:ui';

enum FamilyColor {
  redPink,
  pink,
  purple,
  darkPurple,
  bluePurple,
  darkBlue,
  seaBlue,
  blue,
  emerald,
  grassGreen,
  green,
  lime,
  offYellow,
  orange,
  burntOrange,
  red,
  yellowBrown,
  copper,
  navy,
  black;

  Color get color {
    switch (this) {
      case FamilyColor.redPink:
        return const Color.from(
          red: 0.9333333333,
          green: 0.2705882353,
          blue: 0.3843137255,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.pink:
        return const Color.from(
          red: 0.9254901961,
          green: 0.2823529412,
          blue: 0.6,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.purple:
        return const Color.from(
          red: 0.8509803922,
          green: 0.2745098039,
          blue: 0.937254902,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.darkPurple:
        return const Color.from(
          red: 0.5843137255,
          green: 0.3254901961,
          blue: 0.9764705882,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.bluePurple:
        return const Color.from(
          red: 0.337254902,
          green: 0.2784313725,
          blue: 0.9411764706,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.darkBlue:
        return const Color.from(
          red: 0.0235294118,
          green: 0.5019607843,
          blue: 0.9803921569,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.seaBlue:
        return const Color.from(
          red: 0.3019607843,
          green: 0.6862745098,
          blue: 1,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.blue:
        return const Color.from(
          red: 0.0549019608,
          green: 0.6470588235,
          blue: 0.9137254902,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.emerald:
        return const Color.from(
          red: 0.0784313725,
          green: 0.7333333333,
          blue: 0.7803921569,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.grassGreen:
        return const Color.from(
          red: 0.062745098,
          green: 0.7254901961,
          blue: 0.5058823529,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.green:
        return const Color.from(
          red: 0.2039215686,
          green: 0.7803921569,
          blue: 0.3490196078,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.lime:
        return const Color.from(
          red: 0.5176470588,
          green: 0.8,
          blue: 0.0862745098,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.offYellow:
        return const Color.from(
          red: 0.9176470588,
          green: 0.7019607843,
          blue: 0.031372549,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.orange:
        return const Color.from(
          red: 0.9607843137,
          green: 0.6196078431,
          blue: 0.0431372549,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.burntOrange:
        return const Color.from(
          red: 0.9764705882,
          green: 0.4509803922,
          blue: 0.0862745098,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.red:
        return const Color.from(
          red: 0.937254902,
          green: 0.2666666667,
          blue: 0.2666666667,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.yellowBrown:
        return const Color.from(
          red: 0.8039215686,
          green: 0.7019607843,
          blue: 0.368627451,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.copper:
        return const Color.from(
          red: 0.768627451,
          green: 0.5490196078,
          blue: 0.3294117647,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.navy:
        return const Color.from(
          red: 0.0078431373,
          green: 0.2,
          blue: 0.3921568627,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
      case FamilyColor.black:
        return const Color.from(
          red: 0.1019607843,
          green: 0.1019607843,
          blue: 0.1019607843,
          alpha: 1,
          colorSpace: ColorSpace.displayP3,
        );
    }
  }

  String get name => switch (this) {
    FamilyColor.redPink => 'Red Pink',
    FamilyColor.pink => 'Pink',
    FamilyColor.purple => 'Purple',
    FamilyColor.darkPurple => 'Dark Purple',
    FamilyColor.bluePurple => 'Blue Purple',
    FamilyColor.darkBlue => 'Dark Blue',
    FamilyColor.seaBlue => 'Sea Blue',
    FamilyColor.blue => 'Blue',
    FamilyColor.emerald => 'Emerald',
    FamilyColor.grassGreen => 'Grass Green',
    FamilyColor.green => 'Green',
    FamilyColor.lime => 'Lime',
    FamilyColor.offYellow => 'Off Yellow',
    FamilyColor.orange => 'Orange',
    FamilyColor.burntOrange => 'Burnt Orange',
    FamilyColor.red => 'Red',
    FamilyColor.yellowBrown => 'Yellow Brown',
    FamilyColor.copper => 'Copper',
    FamilyColor.navy => 'Navy',
    FamilyColor.black => 'Black',
  };
}
