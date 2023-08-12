import 'package:flutter/material.dart';

TextStyle get smallThin =>
    const TextStyle(fontWeight: FontWeight.w300, fontSize: 14);
TextStyle get mediumThin =>
    const TextStyle(fontWeight: FontWeight.w300, fontSize: 16);
TextStyle get largeThin =>
    const TextStyle(fontWeight: FontWeight.w300, fontSize: 18);
TextStyle get xlargeThin =>
    const TextStyle(fontWeight: FontWeight.w300, fontSize: 24);

TextStyle get smallSemiBold =>
    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14);
TextStyle get mediumSemiBold =>
    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16);
TextStyle get largeSemiBold =>
    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18);
TextStyle get xlargeSemiBold =>
    const TextStyle(fontWeight: FontWeight.w500, fontSize: 24);

TextStyle get smallBold =>
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 14);
TextStyle get mediumBold =>
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16);
TextStyle get largeBold =>
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18);
TextStyle get xlargeBold =>
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 24);

BoxDecoration get cardStyle => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 2),
              blurStyle: BlurStyle.normal,
              blurRadius: 9,
              color: const Color.fromARGB(13, 0, 0, 0))
        ]);
