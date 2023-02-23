import 'package:flutter/material.dart';

class LoadingDialogWidget {
  static showLoading(BuildContext context, {String? message}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              height: 64.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blueAccent),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      message ?? "Loading. . .",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}