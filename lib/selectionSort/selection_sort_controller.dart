import 'dart:math';
import 'package:get/get.dart';
import 'package:sorting_visualizer/globals.dart';

class SelectionSortController extends GetxController {
  RxList<int> arr = <int>[].obs;
  RxList unsorted_array = [].obs;

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

      unsorted_array.value = [];
      unsorted_array.value = arr.value;
    } else {
      for (int i = 0; i < 10; i++) {
        arr.add(random.nextInt(100));
      }

      unsorted_array.value = [];
      unsorted_array.value = arr.value;
    }
  }

  Future<void> startSorting() async {
    isSorting.value = true;

    for (int i = 0; i < arr.length - 1; i++) {
      int minIndex = i;

      for (int j = i + 1; j < arr.length; j++) {
        if (arr[minIndex] > arr[j]) {
          minIndex = j;
        }
      }

      if (minIndex != i) {
        int temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;

        arr.refresh();
        await Future.delayed(Duration(milliseconds: sortSpeed.value.toInt()));
      }
    }

    isSorting.value = false;
  }
}
