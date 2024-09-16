import 'dart:math';
import 'package:get/get.dart';
import 'package:sorting_visualizer/globals.dart';

class MergeSortController extends GetxController {
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

  Future<void> mergeSort(RxList<int> v, int s, int e) async {
    if(s >= e) return;

    int mid = s + (e - s) ~/ 2;

    await mergeSort(v, s, mid);
    await mergeSort(v, mid + 1, e);

    List<int> arr = List<int>.filled(e - s + 1, 0);

    int i = s, j = mid + 1, k = 0;

    while(i <= mid && j <= e) {
      if(v[i] < v[j]) {
        arr[k++] = v[i++];
      } else {
        arr[k++] = v[j++];
      }

      v.refresh();
      await Future.delayed(Duration(milliseconds: sortSpeed.value.toInt()));

    }

    while(i <= mid) {
      arr[k++] = v[i++];

      v.refresh();
      await Future.delayed(Duration(milliseconds: sortSpeed.value.toInt()));
    }

    while(j <= e) {
      arr[k++] = v[j++];

      v.refresh();
      await Future.delayed(Duration(milliseconds: sortSpeed.value.toInt()));
    }

    int p = 0;

    for(int i = s; i <= e; i++) {
      v[i] = arr[p++];

      v.refresh();
      await Future.delayed(Duration(milliseconds: sortSpeed.value.toInt()));
    }
  }

  Future<void> startSorting() async {
    isSorting.value = true;

    await mergeSort(arr, 0, arr.length - 1);

    isSorting.value = false;
  }
}
