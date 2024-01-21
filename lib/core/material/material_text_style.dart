import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialTextStyle {
  TextStyle normalTextStyle = GoogleFonts.archivo(
    color: BionicColors.white,
    fontWeight: FontWeight.w400,
    wordSpacing: 1.5,
    letterSpacing: 1,
    fontSize: 14,
  );
  TextStyle smallTextStyle = GoogleFonts.archivo(
    color: BionicColors.grey,
    fontWeight: FontWeight.w400,
    wordSpacing: 1.5,
    letterSpacing: 1,
    fontSize: 9,
  );
  TextStyle normalTextStyleGrey = GoogleFonts.archivo(
    color: BionicColors.grey,
    fontWeight: FontWeight.w400,
    wordSpacing: 1.5,
    letterSpacing: 1,
    fontSize: 14,
  );
  TextStyle normalTextStyleCPrimary = GoogleFonts.archivo(
    color: BionicColors.primaryColor,
    fontWeight: FontWeight.w400,
    wordSpacing: 1.5,
    letterSpacing: 1,
    fontSize: 14,
  );
  TextStyle mediumTextStyleCPrimary = GoogleFonts.archivo(
    color: BionicColors.primaryColor,
    fontWeight: FontWeight.w400,
    wordSpacing: 1.5,
    letterSpacing: 1,
    fontSize: 18,
  );

  TextStyle normalTextStyleW500 = GoogleFonts.archivo(
    color: BionicColors.white,
    fontWeight: FontWeight.w500,
    wordSpacing: 1.5,
    letterSpacing: 0.5,
    fontSize: 15,
  );

  TextStyle largeTextStyle = GoogleFonts.archivo(
    color: BionicColors.white,
    fontWeight: FontWeight.w400,
    wordSpacing: 1,
    letterSpacing: 1,
    fontSize: 20,
  );
}

MaterialTextStyle materialTextStyle = MaterialTextStyle();
