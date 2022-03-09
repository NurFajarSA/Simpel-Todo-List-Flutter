import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_todo_app/styles/color_style.dart';

FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

TextStyle heading1 = GoogleFonts.poppins(
  fontSize: 48,
  fontWeight: bold,
);

TextStyle heading2 = GoogleFonts.poppins(
  fontSize: 22,
  fontWeight: bold,
);

TextStyle heading3 = GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: bold,
  color: secondary1,
);

TextStyle subHeading = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: regular,
  color: secondary1,
);

TextStyle bodyDark = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: semiBold,
  color: secondary1,
);

TextStyle bodyLight = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: semiBold,
  color: primary2,
);

TextStyle text = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: regular,
);

TextStyle boldSmallText = GoogleFonts.poppins(
  fontSize: 12,
  fontWeight: semiBold,
);

TextStyle smallText = GoogleFonts.poppins(
  fontSize: 12,
  fontWeight: regular,
);
