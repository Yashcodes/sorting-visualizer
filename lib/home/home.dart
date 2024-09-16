import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sorting_visualizer/bubbleSort/bubble_sort.dart';
import 'package:sorting_visualizer/mergeSort/merge_sort.dart';
import 'package:sorting_visualizer/selectionSort/selection_sort.dart';
import '../insertionSort/insertion_sort.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sorting Visualizer"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => SelectionSortScreen());
              },
              child: Container(
                height: Get.width * 0.4,
                width: Get.width * 0.4,
                child: Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Selection Sort"),
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: 'Time Complexity: ',
                                style: TextStyle(color: Colors.black)),
                            const TextSpan(
                                text: 'O(n',
                                style: TextStyle(color: Colors.black)),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -4),
                                child: const Text(
                                  '2',
                                  textScaleFactor: 0.7,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const TextSpan(
                                text: ' )',
                                style: TextStyle(color: Colors.black)),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => BubbleSortScreen());
              },
              child: Container(
                height: Get.width * 0.4,
                width: Get.width * 0.4,
                child: Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Bubble Sort"),
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: 'Time Complexity: ',
                                style: TextStyle(color: Colors.black)),
                            const TextSpan(
                                text: 'O(n',
                                style: TextStyle(color: Colors.black)),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -4),
                                child: const Text(
                                  '2',
                                  textScaleFactor: 0.7,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const TextSpan(
                                text: ' )',
                                style: TextStyle(color: Colors.black)),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => InsertionSortScreen());
              },
              child: Container(
                height: Get.width * 0.4,
                width: Get.width * 0.4,
                child: Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Insertion Sort"),
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: 'Time Complexity: ',
                                style: TextStyle(color: Colors.black)),
                            const TextSpan(
                                text: 'O(n',
                                style: TextStyle(color: Colors.black)),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -4),
                                child: const Text(
                                  '2',
                                  textScaleFactor: 0.7,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const TextSpan(
                                text: ' )',
                                style: TextStyle(color: Colors.black)),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => MergeSortScreen());
              },
              child: Container(
                height: Get.width * 0.4,
                width: Get.width * 0.4,
                child: const Card(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Merge Sort"),
                        Text("Time Complexity: O(n log n)")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
