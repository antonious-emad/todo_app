import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
class TextStyles{
  static TextTheme lightTextTheme=TextTheme(
    bodySmall: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w700,color:MainColors.blacked),
    bodyMedium:GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400,color:MainColors.secondryLightColor),
    bodyLarge:GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w700,color:MainColors.whited),
    displaySmall: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w700,color:MainColors.secondryLightColor),
    displayMedium: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w700,color:MainColors.secondryLightColor),
    displayLarge: GoogleFonts.roboto(fontSize: 22,fontWeight: FontWeight.w700,color:MainColors.secondryLightColor),
    headlineSmall: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w400,color:MainColors.shamed),
    headlineMedium: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w400,color:MainColors.shamed),
    headlineLarge: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w400,color:MainColors.specialblack),
     labelLarge:GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w700,color:MainColors.secondryLightColor),
    labelSmall:GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w700,color:MainColors.specialblack),
  );
  static TextTheme darkTextTheme= TextTheme(
    bodySmall: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700,color:MainColors.secondryLightColor),
    bodyMedium:GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w700,color:MainColors.secondryLightColor),
    bodyLarge:GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w700,color:MainColors.primarydarkColor),
    displaySmall: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w400,color:MainColors.whited),
    displayMedium: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w700,color:MainColors.secondryLightColor),
    displayLarge: GoogleFonts.inter(fontSize: 22,fontWeight: FontWeight.w700,color:MainColors.secondryLightColor),
    headlineSmall: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w400,color:MainColors.whited),
    headlineMedium: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w400,color:MainColors.specialWhite),
    headlineLarge: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w400,color:MainColors.whited),
    labelLarge:GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w700,color:MainColors.secondryLightColor),
    labelMedium:  GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w400,color:MainColors.darkshamed),
    labelSmall:GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w700,color:MainColors.whited),

  );
}