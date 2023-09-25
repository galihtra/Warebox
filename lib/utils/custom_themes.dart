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
  color: ColorResources.grey
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
  color: ColorResources.black
);