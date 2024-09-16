import 'dart:math';
import 'package:get/get.dart';
import 'package:sorting_visualizer/globals.dart';

class InsertionSortController extends GetxController {
  RxList<int> arr = <int>[].obs;
  RxList unsortedArray = [].obs;

  RxBool isSorting = false.obs;

  var sortSpeed = 500.0.obs;
  final random = Random();

  @override
  void onInit() {
    Future.delayed(Duration.zero, () => Globals.showInstructions());
    resetSorting();
    super.onInit();
  }

  void resetSorting() {
    if (arr.isNotEmpty) {
      arr.value = [];

      for (int i = 0; i < 10; i++) {
        arr.add(random.nextInt(100));
      }

      arr.shuffle();

      unsortedArray.value = [];
      unsortedArray.value = arr.value;
    } else {
      for (int i = 0; i < 10; i++) {
        arr.add(random.nextInt(100));
      }

      unsortedArray.value = [];
      unsortedArray.value = arr.value;
    }
  }

  Future<void> startSorting() async {
    isSorting.value = true;

    for (int i = 1; i < arr.length; i++) {
      int j = i - 1;
      int key = arr[i];

      while(j > -1 && arr[j] > key) {
        arr[j + 1] = arr[j];
        j--;

        arr.refresh();
        await Future.delayed(Duration(milliseconds: sortSpeed.value.toInt()));
      }

      arr[j + 1] = key;
    }

    isSorting.value = false;
  }
}
