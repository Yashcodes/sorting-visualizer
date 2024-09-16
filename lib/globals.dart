import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Globals {
  static bool _isDialogOpen = false;

  static Future<void> showInstructions() async {
    _isDialogOpen = true;

    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      contentPadding: EdgeInsets.zero,
      content: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.blue, size: 18),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: Text("Use 'Start' button to sort array")),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.blue, size: 18),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Text(
                        "Use 'Reset' button to make random unsorted array")),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.blue,
                  size: 18,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Text(
                        "Use 'Slider' to change the speed of sorting the array")),
              ],
            ),
          ],
        ),
      ),
    )).whenComplete(() {
      _isDialogOpen = true;
    });

    await Future.delayed(const Duration(seconds: 5));

    if (!_isDialogOpen) {
      Get.back();
    }
  }
}
