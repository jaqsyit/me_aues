import 'package:flutter/material.dart';

class AppStyles {
  static const Color primaryColor = Color(0xFF046380);
  static const Color secondaryColor = Color.fromARGB(255, 61, 154, 182);

  static ButtonStyle activeButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    // fixedSize: MaterialStateProperty.all<Size>(
    //   const Size(20, 40),
    // ),
  );

  static ButtonStyle nonActiveButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    // fixedSize: MaterialStateProperty.all<Size>(
    //   const Size(20, 40),
    // ),
  );
}

class CustomTextStyles {
  static const TextStyle s10w600cb = TextStyle(
    color: Colors.black,
    fontSize: 10,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s14w400cb = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s16w400cb = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s16w400cbl = TextStyle(
    color: Colors.blue,
    fontSize: 16,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );
  
  static const TextStyle s16w400cr = TextStyle(
    color: Colors.red,
    fontSize: 16,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s16w600cb = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle s20w400cb = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s20w400cr = TextStyle(
    color: Colors.red,
    fontSize: 20,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s20w400cg = TextStyle(
    color: Colors.grey,
    fontSize: 20,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s20w400cbl = TextStyle(
    color: Colors.blue,
    fontSize: 20,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s20w400cgrn = TextStyle(
    color: Colors.green,
    fontSize: 20,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle s20w600cb = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w600,
  );
}