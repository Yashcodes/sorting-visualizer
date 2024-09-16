import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'bubble_sort_controller.dart';

class BubbleSortScreen extends StatelessWidget {
  BubbleSortScreen({super.key});

  final BubbleSortController bubbleSortController =
  Get.put(BubbleSortController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bubble Sort Visualizer"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.5,
                child: Obx(
                      () => BarChart(
                    swapAnimationCurve: Curves.decelerate,
                    swapAnimationDuration: const Duration(milliseconds: 800),
                    BarChartData(
                      barGroups: bubbleSortController.arr
                          .asMap()
                          .map((index, value) => MapEntry(
                        index,
                        BarChartGroupData(
                          x: bubbleSortController.arr[index],
                          barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: value.toDouble(),
                              color: Colors.blue,
                              width: 20,
                            )
                          ],
                          // showingTooltipIndicators: [0],
                        ),
                      ))
                          .values
                          .toList(),
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            // Format tooltip as an integer
                            return BarTooltipItem(
                              '${rod.toY.toInt()}',
                              // Convert double to int here
                              const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            );
                          },
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "${value.toInt()}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                              interval: 1),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "${value.toInt()}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                              interval: 10),
                        ),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Adjust Sorting Speed", style: TextStyle(fontSize: 18),),
                  Obx(() {
                    return Slider(
                      value: bubbleSortController.sortSpeed.value,
                      label: bubbleSortController.sortSpeed.toInt().toString(),
                      activeColor: Colors.blue,
                      max: 2000,
                      divisions: 20,
                      onChanged: (value) {
                        bubbleSortController.sortSpeed.value = value;
                      },
                    );
                  }),
                ],
              ),
              Obx(
                () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green),
                          onPressed: () async {
                            await bubbleSortController.startSorting();
                          },
                          child: const Text("Start")),
                      bubbleSortController.isSorting.value == true ? Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: const Text("Sorting array.......", style: TextStyle(color: Colors.white),)) : const SizedBox.shrink(),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red),
                          onPressed: () {
                            bubbleSortController.resetSorting();
                          },
                          child: const Text("Reset")),
                    ],
                  );
                }
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Obx(
                          () {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Array Before Sorting:", style: TextStyle(fontSize: 16),),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(child: Text(bubbleSortController.unsortedArray.toString()))
                          ],
                        );
                      }
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                          () {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Array After Sorting:", style: TextStyle(fontSize: 16),),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(child: Text(bubbleSortController.arr.toString()))
                          ],
                        );
                      }
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
