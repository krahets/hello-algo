---
comments: true
---

# 11.6 &nbsp; Сортировка слиянием

<u>Сортировка слиянием (merge sort)</u> - это алгоритм сортировки на основе стратегии "разделяй и властвуй", который включает этапы "разделения" и "слияния", показанные на рисунке 11-10.

1. **Этап разделения**: массив рекурсивно разбивается от середины, и задача сортировки длинного массива превращается в задачи сортировки более коротких массивов.
2. **Этап слияния**: когда длина подмассива становится равной 1, разделение завершается и начинается слияние; левые и правые короткие упорядоченные массивы непрерывно объединяются в более длинный упорядоченный массив, пока процесс не завершится.

![Этапы разделения и слияния в сортировке слиянием](merge_sort.assets/merge_sort_overview.png){ class="animation-figure" }

<p align="center"> Рисунок 11-10 &nbsp; Этапы разделения и слияния в сортировке слиянием </p>

## 11.6.1 &nbsp; Алгоритм

Как показано на рисунке 11-11, на этапе "разделения" массив рекурсивно разбивается сверху вниз по середине на два подмассива.

1. Вычислить середину массива `mid` и рекурсивно разделить левый подмассив (интервал `[left, mid]` ) и правый подмассив (интервал `[mid + 1, right]` ).
2. Рекурсивно повторять шаг `1.` , пока длина подмассива не станет равной 1.

Этап "слияния" снизу вверх объединяет левый и правый подмассивы в один упорядоченный массив. Следует заметить, что начиная с подмассивов длины 1, каждый подмассив в фазе слияния уже является упорядоченным.

=== "<1>"
    ![Шаги сортировки слиянием](merge_sort.assets/merge_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![merge_sort_step2](merge_sort.assets/merge_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![merge_sort_step3](merge_sort.assets/merge_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![merge_sort_step4](merge_sort.assets/merge_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![merge_sort_step5](merge_sort.assets/merge_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![merge_sort_step6](merge_sort.assets/merge_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![merge_sort_step7](merge_sort.assets/merge_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![merge_sort_step8](merge_sort.assets/merge_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![merge_sort_step9](merge_sort.assets/merge_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![merge_sort_step10](merge_sort.assets/merge_sort_step10.png){ class="animation-figure" }

<p align="center"> Рисунок 11-11 &nbsp; Шаги сортировки слиянием </p>

Нетрудно заметить, что порядок рекурсии в сортировке слиянием совпадает с порядком рекурсии при постфиксном обходе бинарного дерева.

- **Постфиксный обход**: сначала рекурсивно обходится левое поддерево, затем правое поддерево, а в конце обрабатывается корневой узел.
- **Сортировка слиянием**: сначала рекурсивно обрабатывается левый подмассив, затем правый подмассив, а в конце выполняется слияние.

Реализация сортировки слиянием показана в коде ниже. Обратите внимание: в `nums` объединяемый интервал равен `[left, right]` , а соответствующий интервал в `tmp` равен `[0, right - left]` .

=== "Python"

    ```python title="merge_sort.py"
    def merge(nums: list[int], left: int, mid: int, right: int):
        """Объединить левый и правый подмассивы"""
        # Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        # Создать временный массив tmp для хранения результата слияния
        tmp = [0] * (right - left + 1)
        # Инициализировать начальные индексы левого и правого подмассивов
        i, j, k = left, mid + 1, 0
        # Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while i <= mid and j <= right:
            if nums[i] <= nums[j]:
                tmp[k] = nums[i]
                i += 1
            else:
                tmp[k] = nums[j]
                j += 1
            k += 1
        # Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while i <= mid:
            tmp[k] = nums[i]
            i += 1
            k += 1
        while j <= right:
            tmp[k] = nums[j]
            j += 1
            k += 1
        # Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for k in range(0, len(tmp)):
            nums[left + k] = tmp[k]

    def merge_sort(nums: list[int], left: int, right: int):
        """Сортировка слиянием"""
        # Условие завершения
        if left >= right:
            return  # Завершить рекурсию, когда длина подмассива равна 1
        # Этап разбиения
        mid = (left + right) // 2 # Вычислить середину
        merge_sort(nums, left, mid)  # Рекурсивно обработать левый подмассив
        merge_sort(nums, mid + 1, right)  # Рекурсивно обработать правый подмассив
        # Этап слияния
        merge(nums, left, mid, right)
    ```

=== "C++"

    ```cpp title="merge_sort.cpp"
    /* Объединить левый и правый подмассивы */
    void merge(vector<int> &nums, int left, int mid, int right) {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        vector<int> tmp(right - left + 1);
        // Инициализировать начальные индексы левого и правого подмассивов
        int i = left, j = mid + 1, k = 0;
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for (k = 0; k < tmp.size(); k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* Сортировка слиянием */
    void mergeSort(vector<int> &nums, int left, int right) {
        // Условие завершения
        if (left >= right)
            return; // Завершить рекурсию, когда длина подмассива равна 1
        // Этап разбиения
        int mid = left + (right - left) / 2;    // Вычислить середину
        mergeSort(nums, left, mid);      // Рекурсивно обработать левый подмассив
        mergeSort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив
        // Этап слияния
        merge(nums, left, mid, right);
    }
    ```

=== "Java"

    ```java title="merge_sort.java"
    /* Объединить левый и правый подмассивы */
    void merge(int[] nums, int left, int mid, int right) {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        int[] tmp = new int[right - left + 1];
        // Инициализировать начальные индексы левого и правого подмассивов
        int i = left, j = mid + 1, k = 0;
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* Сортировка слиянием */
    void mergeSort(int[] nums, int left, int right) {
        // Условие завершения
        if (left >= right)
            return; // Завершить рекурсию, когда длина подмассива равна 1
        // Этап разбиения
        int mid = left + (right - left) / 2; // Вычислить середину
        mergeSort(nums, left, mid); // Рекурсивно обработать левый подмассив
        mergeSort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив
        // Этап слияния
        merge(nums, left, mid, right);
    }
    ```

=== "C#"

    ```csharp title="merge_sort.cs"
    /* Объединить левый и правый подмассивы */
    void Merge(int[] nums, int left, int mid, int right) {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        int[] tmp = new int[right - left + 1];
        // Инициализировать начальные индексы левого и правого подмассивов
        int i = left, j = mid + 1, k = 0;
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* Сортировка слиянием */
    void MergeSort(int[] nums, int left, int right) {
        // Условие завершения
        if (left >= right) return;       // Завершить рекурсию, когда длина подмассива равна 1
        // Этап разбиения
        int mid = left + (right - left) / 2;    // Вычислить середину
        MergeSort(nums, left, mid);      // Рекурсивно обработать левый подмассив
        MergeSort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив
        // Этап слияния
        Merge(nums, left, mid, right);
    }
    ```

=== "Go"

    ```go title="merge_sort.go"
    /* Объединить левый и правый подмассивы */
    func merge(nums []int, left, mid, right int) {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        tmp := make([]int, right-left+1)
        // Инициализировать начальные индексы левого и правого подмассивов
        i, j, k := left, mid+1, 0
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        for i <= mid && j <= right {
            if nums[i] <= nums[j] {
                tmp[k] = nums[i]
                i++
            } else {
                tmp[k] = nums[j]
                j++
            }
            k++
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        for i <= mid {
            tmp[k] = nums[i]
            i++
            k++
        }
        for j <= right {
            tmp[k] = nums[j]
            j++
            k++
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for k := 0; k < len(tmp); k++ {
            nums[left+k] = tmp[k]
        }
    }

    /* Сортировка слиянием */
    func mergeSort(nums []int, left, right int) {
        // Условие завершения
        if left >= right {
            return
        }
        // Этап разбиения
        mid := left + (right - left) / 2
        mergeSort(nums, left, mid)
        mergeSort(nums, mid+1, right)
        // Этап слияния
        merge(nums, left, mid, right)
    }
    ```

=== "Swift"

    ```swift title="merge_sort.swift"
    /* Объединить левый и правый подмассивы */
    func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        var tmp = Array(repeating: 0, count: right - left + 1)
        // Инициализировать начальные индексы левого и правого подмассивов
        var i = left, j = mid + 1, k = 0
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while i <= mid, j <= right {
            if nums[i] <= nums[j] {
                tmp[k] = nums[i]
                i += 1
            } else {
                tmp[k] = nums[j]
                j += 1
            }
            k += 1
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while i <= mid {
            tmp[k] = nums[i]
            i += 1
            k += 1
        }
        while j <= right {
            tmp[k] = nums[j]
            j += 1
            k += 1
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for k in tmp.indices {
            nums[left + k] = tmp[k]
        }
    }

    /* Сортировка слиянием */
    func mergeSort(nums: inout [Int], left: Int, right: Int) {
        // Условие завершения
        if left >= right { // Завершить рекурсию, когда длина подмассива равна 1
            return
        }
        // Этап разбиения
        let mid = left + (right - left) / 2 // Вычислить середину
        mergeSort(nums: &nums, left: left, right: mid) // Рекурсивно обработать левый подмассив
        mergeSort(nums: &nums, left: mid + 1, right: right) // Рекурсивно обработать правый подмассив
        // Этап слияния
        merge(nums: &nums, left: left, mid: mid, right: right)
    }
    ```

=== "JS"

    ```javascript title="merge_sort.js"
    /* Объединить левый и правый подмассивы */
    function merge(nums, left, mid, right) {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        const tmp = new Array(right - left + 1);
        // Инициализировать начальные индексы левого и правого подмассивов
        let i = left,
            j = mid + 1,
            k = 0;
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* Сортировка слиянием */
    function mergeSort(nums, left, right) {
        // Условие завершения
        if (left >= right) return; // Завершить рекурсию, когда длина подмассива равна 1
        // Этап разбиения
        let mid = Math.floor(left + (right - left) / 2); // Вычислить середину
        mergeSort(nums, left, mid); // Рекурсивно обработать левый подмассив
        mergeSort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив
        // Этап слияния
        merge(nums, left, mid, right);
    }
    ```

=== "TS"

    ```typescript title="merge_sort.ts"
    /* Объединить левый и правый подмассивы */
    function merge(nums: number[], left: number, mid: number, right: number): void {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        const tmp = new Array(right - left + 1);
        // Инициализировать начальные индексы левого и правого подмассивов
        let i = left,
            j = mid + 1,
            k = 0;
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* Сортировка слиянием */
    function mergeSort(nums: number[], left: number, right: number): void {
        // Условие завершения
        if (left >= right) return; // Завершить рекурсию, когда длина подмассива равна 1
        // Этап разбиения
        let mid = Math.floor(left + (right - left) / 2); // Вычислить середину
        mergeSort(nums, left, mid); // Рекурсивно обработать левый подмассив
        mergeSort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив
        // Этап слияния
        merge(nums, left, mid, right);
    }
    ```

=== "Dart"

    ```dart title="merge_sort.dart"
    /* Объединить левый и правый подмассивы */
    void merge(List<int> nums, int left, int mid, int right) {
      // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
      // Создать временный массив tmp для хранения результата слияния
      List<int> tmp = List.filled(right - left + 1, 0);
      // Инициализировать начальные индексы левого и правого подмассивов
      int i = left, j = mid + 1, k = 0;
      // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
      while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
          tmp[k++] = nums[i++];
        else
          tmp[k++] = nums[j++];
      }
      // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
      while (i <= mid) {
        tmp[k++] = nums[i++];
      }
      while (j <= right) {
        tmp[k++] = nums[j++];
      }
      // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
      for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
      }
    }

    /* Сортировка слиянием */
    void mergeSort(List<int> nums, int left, int right) {
      // Условие завершения
      if (left >= right) return; // Завершить рекурсию, когда длина подмассива равна 1
      // Этап разбиения
      int mid = left + (right - left) ~/ 2; // Вычислить середину
      mergeSort(nums, left, mid); // Рекурсивно обработать левый подмассив
      mergeSort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив
      // Этап слияния
      merge(nums, left, mid, right);
    }
    ```

=== "Rust"

    ```rust title="merge_sort.rs"
    /* Объединить левый и правый подмассивы */
    fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        let tmp_size = right - left + 1;
        let mut tmp = vec![0; tmp_size];
        // Инициализировать начальные индексы левого и правого подмассивов
        let (mut i, mut j, mut k) = (left, mid + 1, 0);
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while i <= mid && j <= right {
            if nums[i] <= nums[j] {
                tmp[k] = nums[i];
                i += 1;
            } else {
                tmp[k] = nums[j];
                j += 1;
            }
            k += 1;
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while i <= mid {
            tmp[k] = nums[i];
            k += 1;
            i += 1;
        }
        while j <= right {
            tmp[k] = nums[j];
            k += 1;
            j += 1;
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for k in 0..tmp_size {
            nums[left + k] = tmp[k];
        }
    }

    /* Сортировка слиянием */
    fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
        // Условие завершения
        if left >= right {
            return; // Завершить рекурсию, когда длина подмассива равна 1
        }

        // Этап разбиения
        let mid = left + (right - left) / 2; // Вычислить середину
        merge_sort(nums, left, mid); // Рекурсивно обработать левый подмассив
        merge_sort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив

        // Этап слияния
        merge(nums, left, mid, right);
    }
    ```

=== "C"

    ```c title="merge_sort.c"
    /* Объединить левый и правый подмассивы */
    void merge(int *nums, int left, int mid, int right) {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        int tmpSize = right - left + 1;
        int *tmp = (int *)malloc(tmpSize * sizeof(int));
        // Инициализировать начальные индексы левого и правого подмассивов
        int i = left, j = mid + 1, k = 0;
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for (k = 0; k < tmpSize; ++k) {
            nums[left + k] = tmp[k];
        }
        // Освободить память
        free(tmp);
    }

    /* Сортировка слиянием */
    void mergeSort(int *nums, int left, int right) {
        // Условие завершения
        if (left >= right)
            return; // Завершить рекурсию, когда длина подмассива равна 1
        // Этап разбиения
        int mid = left + (right - left) / 2;    // Вычислить середину
        mergeSort(nums, left, mid);      // Рекурсивно обработать левый подмассив
        mergeSort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив
        // Этап слияния
        merge(nums, left, mid, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="merge_sort.kt"
    /* Объединить левый и правый подмассивы */
    fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        val tmp = IntArray(right - left + 1)
        // Инициализировать начальные индексы левого и правого подмассивов
        var i = left
        var j = mid + 1
        var k = 0
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++]
            else
                tmp[k++] = nums[j++]
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while (i <= mid) {
            tmp[k++] = nums[i++]
        }
        while (j <= right) {
            tmp[k++] = nums[j++]
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for (l in tmp.indices) {
            nums[left + l] = tmp[l]
        }
    }

    /* Сортировка слиянием */
    fun mergeSort(nums: IntArray, left: Int, right: Int) {
        // Условие завершения
        if (left >= right) return  // Завершить рекурсию, когда длина подмассива равна 1
        // Этап разбиения
        val mid = left + (right - left) / 2 // Вычислить середину
        mergeSort(nums, left, mid) // Рекурсивно обработать левый подмассив
        mergeSort(nums, mid + 1, right) // Рекурсивно обработать правый подмассив
        // Этап слияния
        merge(nums, left, mid, right)
    }
    ```

=== "Ruby"

    ```ruby title="merge_sort.rb"
    ### Слияние левого и правого подмассивов ###
    def merge(nums, left, mid, right)
      # Интервал левого подмассива: [left, mid], правого подмассива: [mid+1, right]
      # Создать временный массив tmp для хранения результата слияния
      tmp = Array.new(right - left + 1, 0)
      # Инициализировать начальные индексы левого и правого подмассивов
      i, j, k = left, mid + 1, 0
      # Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
      while i <= mid && j <= right
        if nums[i] <= nums[j]
          tmp[k] = nums[i]
          i += 1
        else
          tmp[k] = nums[j]
          j += 1
        end
        k += 1
      end
      # Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
      while i <= mid
        tmp[k] = nums[i]
        i += 1
        k += 1
      end
      while j <= right
        tmp[k] = nums[j]
        j += 1
        k += 1
      end
      # Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
      (0...tmp.length).each do |k|
        nums[left + k] = tmp[k]
      end
    end

    ### Сортировка слиянием ###
    def merge_sort(nums, left, right)
      # Условие завершения
      # Когда длина подмассива равна 1, рекурсия завершается
      return if left >= right
      # Этап разбиения
      mid = left + (right - left) / 2 # Вычислить середину
      merge_sort(nums, left, mid) # Рекурсивно обработать левый подмассив
      merge_sort(nums, mid + 1, right) # Рекурсивно обработать правый подмассив
      # Этап слияния
      merge(nums, left, mid, right)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20merge%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20mid%3A%20int%2C%20right%3A%20int%29%3A%0A%20%20%20%20tmp%20%3D%20%5B0%5D%20%2A%20%28right%20-%20left%20%2B%201%29%0A%20%20%20%20%28i%2C%20j%2C%20k%29%20%3D%20%28left%2C%20mid%20%2B%201%2C%200%29%0A%20%20%20%20while%20i%20%3C%3D%20mid%20and%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3C%3D%20nums%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20i%20%3C%3D%20mid%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20for%20k%20in%20range%280%2C%20len%28tmp%29%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bleft%20%2B%20k%5D%20%3D%20tmp%5Bk%5D%0A%0Adef%20merge_sort%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%3A%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20mid%20%3D%20%28left%20%2B%20right%29%20%2F%2F%202%0A%20%20%20%20merge_sort%28nums%2C%20left%2C%20mid%29%0A%20%20%20%20merge_sort%28nums%2C%20mid%20%2B%201%2C%20right%29%0A%20%20%20%20merge%28nums%2C%20left%2C%20mid%2C%20right%29%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20nums%20%3D%20%5B7%2C%203%2C%202%2C%206%2C%200%2C%201%2C%205%2C%204%5D%0A%20%20%20%20merge_sort%28nums%2C%200%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%27%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%81%D0%BB%D0%B8%D1%8F%D0%BD%D0%B8%D0%B5%D0%BC%20nums%20%3D%27%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20merge%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20mid%3A%20int%2C%20right%3A%20int%29%3A%0A%20%20%20%20tmp%20%3D%20%5B0%5D%20%2A%20%28right%20-%20left%20%2B%201%29%0A%20%20%20%20%28i%2C%20j%2C%20k%29%20%3D%20%28left%2C%20mid%20%2B%201%2C%200%29%0A%20%20%20%20while%20i%20%3C%3D%20mid%20and%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3C%3D%20nums%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20i%20%3C%3D%20mid%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20for%20k%20in%20range%280%2C%20len%28tmp%29%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bleft%20%2B%20k%5D%20%3D%20tmp%5Bk%5D%0A%0Adef%20merge_sort%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%3A%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20mid%20%3D%20%28left%20%2B%20right%29%20%2F%2F%202%0A%20%20%20%20merge_sort%28nums%2C%20left%2C%20mid%29%0A%20%20%20%20merge_sort%28nums%2C%20mid%20%2B%201%2C%20right%29%0A%20%20%20%20merge%28nums%2C%20left%2C%20mid%2C%20right%29%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20nums%20%3D%20%5B7%2C%203%2C%202%2C%206%2C%200%2C%201%2C%205%2C%204%5D%0A%20%20%20%20merge_sort%28nums%2C%200%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%27%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%81%D0%BB%D0%B8%D1%8F%D0%BD%D0%B8%D0%B5%D0%BC%20nums%20%3D%27%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 11.6.2 &nbsp; Характеристики алгоритма

- **Временная сложность равна $O(n \log n)$, алгоритм не является адаптивным**: этап разделения создает дерево рекурсии высоты $\log n$ , а суммарное число операций слияния на каждом уровне равно $n$ , поэтому общая временная сложность составляет $O(n \log n)$ .
- **Пространственная сложность равна $O(n)$, сортировка не выполняется на месте**: глубина рекурсии равна $\log n$ , из-за чего требуется $O(\log n)$ памяти под стек вызовов. Для этапа слияния нужен вспомогательный массив, поэтому дополнительно используется $O(n)$ памяти.
- **Стабильная сортировка**: в процессе слияния относительный порядок равных элементов не меняется.

## 11.6.3 &nbsp; Сортировка связного списка

Для связных списков сортировка слиянием имеет заметное преимущество перед другими алгоритмами сортировки: **пространственную сложность задачи сортировки списка можно оптимизировать до $O(1)$**.

- **Этап разделения**: работу по разбиению списка можно реализовать с помощью "итерации" вместо "рекурсии", тем самым устранив расход памяти на стек вызовов.
- **Этап слияния**: в связном списке добавление и удаление узлов требует только изменения ссылок (указателей), поэтому при слиянии двух коротких упорядоченных списков в один длинный упорядоченный список не нужно создавать дополнительный список.

Детали реализации достаточно сложны; заинтересованные читатели могут изучить соответствующие материалы самостоятельно.
