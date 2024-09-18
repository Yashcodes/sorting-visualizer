# Sorting Visualizer

A real-time sorting visualizer built with `Flutter`, utilizing the `flChart` package for rendering interactive bar charts and `GetX` for efficient state management. This project visualizes four popular sorting algorithms, allowing users to observe the sorting process dynamically.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Sorting Algorithms](#sorting-algorithms)
  - [Selection Sort](#selection-sort)
  - [Bubble Sort](#bubble-sort)
  - [Insertion Sort](#insertion-sort)
  - [Merge Sort](#merge-sort)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Features

- Visualizes sorting algorithms in real-time using bar charts.
- Supports four sorting algorithms:
  - Selection Sort
  - Bubble Sort
  - Insertion Sort
  - Merge Sort
- Interactive user interface built with Flutter.

## Installation

To set up the Sorting Visualizer on your local machine, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Yashcodes/sorting-visualizer.git
   ```

2. **Navigate to the project directory:**
    ```bash
    cd sorting-visualizer
    ```

3. **Install the dependencies:**
    ```bash
    flutter pub get
    ```

4. **Run the application:**
    ```bash
    flutter run
    ```

## Usage

After running the application, you'll see an interface where you can:

- Select the sorting algorithm you wish to visualize.

- Create an unsorted array by clicking on the reset button. When you navigate to the sorting screen, the unsorted will automatically be created.

- Start the sorting process by clicking on the start button, a sorting indication will be visible there while the array is being sorted and you watch the sorting visualization in real-time.

## Sorting Algorithms

### Selection Sort

**Description**: Selection Sort divides the array into a sorted and an unsorted region. It repeatedly selects the smallest element from the unsorted region and moves it to the sorted region.

**Video**: 

[Selection Sort: Watch or download demo video](/videos/selection-sort.mp4)

**Image**: 

![Selection Sort](/images/bubble-sort.jpg)

---

### Bubble Sort

**Description**: Bubble Sort repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. The process continues until no swaps are needed.

**Video**: 

[Bubble Sort: Watch or download demo video](/videos/bubble-sort.mp4)

**Image**: 

![Bubble Sort](/images/bubble-sort.jpg)

---

### Insertion Sort

**Description**: Insertion Sort builds the sorted array one item at a time by comparing each new element to the already sorted elements and inserting it in the correct position.

**Video**: 

[Insertion Sort: Watch or download demo video](/videos/insertion-sort.mp4)

**Image**: 

![Insertion Sort](/images/insertion-sort.jpg)

---

### Merge Sort

**Description**: Merge Sort is a divide-and-conquer algorithm that divides the array into halves, sorts them, and merges the sorted halves back together.

**Video**: 

[Merge Sort: Watch or download demo video](/videos/merge-sort.mp4)

**Image**: 

![Merge Sort](/images/merge-sort.jpg)

## Contributing

Contributions are welcome! If you have suggestions for improvements or features, feel free to fork the repository and submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [Flutter](https://flutter.dev) - A UI toolkit for building natively compiled applications.
- [flChart](https://pub.dev/packages/fl_chart) - A powerful chart library for Flutter.
- [GetX](https://pub.dev/packages/get) - A lightweight solution for state management.
