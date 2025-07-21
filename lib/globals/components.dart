import 'package:flutter/material.dart';
import 'package:mymax/globals/styles.dart';

Widget load() {
  return Positioned.fill(
    child: Container(
      color: corPreto.withOpacity(0.3),
      child: Center(child: CircularProgressIndicator(color: corPadrao)),
    ),
  );
}

Widget botaoPadrao({required VoidCallback onTap, required String texto}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: corPadrao,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: corPadrao),
      ),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: corBranco,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
