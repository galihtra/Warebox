import 'package:flutter/material.dart';
import 'package:warebox/utils/color_resources.dart';

import 'dimensions.dart';

const titilliumRegular = TextStyle(
  fontFamily: 'PlusJakartaSans',
  fontSize: Dimensions.fontSizeSmall, // 12px
);
const titleRegular = TextStyle(
  fontFamily: 'PlusJakartaSans',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault, // 14px
);
const titleHeader = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.fontSizeLarge, // 16px
    color: ColorResources.grey);

const titleHeader2 = TextStyle(
  fontFamily: 'PlusJakartaSans',
  fontWeight: FontWeight.bold,
  fontSize: Dimensions.fontSizeLarge, // 16px
);

const titilliumSemiBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeSmall,
  fontWeight: FontWeight.w600,
);

const extraBold = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: Dimensions.fontSizeExtraLarge, // 30px
    letterSpacing: -1.2,
    fontWeight: FontWeight.w900,
    color: ColorResources.black);

const pjsSemiBold16 = TextStyle(
  fontFamily: 'Plus Jakarta Sans',
  fontSize: Dimensions.fontSizeLarge,
  fontWeight: FontWeight.w600,
  color: Color(0xFF3D4966),
);

const pjsExtraBold20 = TextStyle(
  fontFamily: 'Plus Jakarta Sans',
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.white,
);

const pjsMedium16 = TextStyle(
  fontFamily: 'Plus Jakarta Sans',
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

const pjsExtraBold16RedUnderlined = TextStyle(
  fontFamily: 'Plus Jakarta Sans',
  color: Color(0xFFFA4D5E),
  fontSize: 16,
  fontWeight: FontWeight.w800,
  decoration: TextDecoration.underline,
);
