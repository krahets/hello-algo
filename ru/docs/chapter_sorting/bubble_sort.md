---
comments: true
---

# 11.3 &nbsp; Сортировка пузырьком

<u>Сортировка пузырьком (bubble sort)</u> реализует сортировку путем последовательного сравнения и обмена соседних элементов. Этот процесс напоминает всплытие пузырьков снизу вверх, откуда и произошло название алгоритма.

Как показано на рисунке 11-4, процесс "всплытия" можно смоделировать через операцию обмена элементов: начиная от левого края массива и двигаясь вправо, мы последовательно сравниваем соседние элементы и, если "левый элемент > правый элемент", меняем их местами. После завершения прохода максимальный элемент будет перемещен в самый правый конец массива.

=== "<1>"
    ![Моделирование пузырька через обмен элементов](bubble_sort.assets/bubble_operation_step1.png){ class="animation-figure" }

=== "<2>"
    ![bubble_operation_step2](bubble_sort.assets/bubble_operation_step2.png){ class="animation-figure" }

=== "<3>"
    ![bubble_operation_step3](bubble_sort.assets/bubble_operation_step3.png){ class="animation-figure" }

=== "<4>"
    ![bubble_operation_step4](bubble_sort.assets/bubble_operation_step4.png){ class="animation-figure" }

=== "<5>"
    ![bubble_operation_step5](bubble_sort.assets/bubble_operation_step5.png){ class="animation-figure" }

=== "<6>"
    ![bubble_operation_step6](bubble_sort.assets/bubble_operation_step6.png){ class="animation-figure" }

=== "<7>"
    ![bubble_operation_step7](bubble_sort.assets/bubble_operation_step7.png){ class="animation-figure" }

<p align="center"> Рисунок 11-4 &nbsp; Моделирование пузырька через обмен элементов </p>

## 11.3.1 &nbsp; Алгоритм

Пусть длина массива равна $n$ ; тогда шаги сортировки пузырьком показаны на рисунке 11-5.

1. Сначала выполнить один проход "всплытия" по $n$ элементам, **переместив максимальный элемент массива на правильную позицию**.
2. Затем выполнить "всплытие" по оставшимся $n - 1$ элементам, **переместив второй по величине элемент на правильную позицию**.
3. Продолжать по аналогии; после $n - 1$ раундов "всплытия" **первые $n - 1$ по величине элементы окажутся на правильных позициях**.
4. Оставшийся единственный элемент обязательно является минимальным, сортировать его уже не нужно, поэтому сортировка завершена.

![Процесс сортировки пузырьком](bubble_sort.assets/bubble_sort_overview.png){ class="animation-figure" }

<p align="center"> Рисунок 11-5 &nbsp; Процесс сортировки пузырьком </p>

Пример кода:

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort(nums: list[int]):
        """Пузырьковая сортировка"""
        n = len(nums)
        # Внешний цикл: неотсортированный диапазон [0, i]
        for i in range(n - 1, 0, -1):
            # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Поменять местами nums[j] и nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* Пузырьковая сортировка */
    void bubbleSort(vector<int> &nums) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    // Здесь используется функция std::swap()
                    swap(nums[j], nums[j + 1]);
                }
            }
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* Пузырьковая сортировка */
    void bubbleSort(int[] nums) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    /* Пузырьковая сортировка */
    void BubbleSort(int[] nums) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* Пузырьковая сортировка */
    func bubbleSort(nums []int) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // Поменять местами nums[j] и nums[j + 1]
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                }
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* Пузырьковая сортировка */
    func bubbleSort(nums: inout [Int]) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // Поменять местами nums[j] и nums[j + 1]
                    nums.swapAt(j, j + 1)
                }
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* Пузырьковая сортировка */
    function bubbleSort(nums) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    /* Пузырьковая сортировка */
    function bubbleSort(nums: number[]): void {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    /* Пузырьковая сортировка */
    void bubbleSort(List<int> nums) {
      // Внешний цикл: неотсортированный диапазон [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // Поменять местами nums[j] и nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
          }
        }
      }
    }
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    /* Пузырьковая сортировка */
    fn bubble_sort(nums: &mut [i32]) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for i in (1..nums.len()).rev() {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // Поменять местами nums[j] и nums[j + 1]
                    nums.swap(j, j + 1);
                }
            }
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* Пузырьковая сортировка */
    void bubbleSort(int nums[], int size) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = size - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    int temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                }
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bubble_sort.kt"
    /* Пузырьковая сортировка */
    fun bubbleSort(nums: IntArray) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (i in nums.size - 1 downTo 1) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                }
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    ### Пузырьковая сортировка ###
    def bubble_sort(nums)
      n = nums.length
      # Внешний цикл: неотсортированный диапазон [0, i]
      for i in (n - 1).downto(1)
        # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Поменять местами nums[j] и nums[j + 1]
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
          end
        end
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%D0%92%D0%BD%D0%B5%D1%88%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%92%D0%BD%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%D0%B0%20%5B0%2C%20i%5D%20%D0%B2%20%D0%B5%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D0%BD%D1%8F%D1%82%D1%8C%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%D0%BC%D0%B8%20nums%5Bj%5D%20%D0%B8%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BF%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%D0%92%D0%BD%D0%B5%D1%88%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%92%D0%BD%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%D0%B0%20%5B0%2C%20i%5D%20%D0%B2%20%D0%B5%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D0%BD%D1%8F%D1%82%D1%8C%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%D0%BC%D0%B8%20nums%5Bj%5D%20%D0%B8%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BF%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 11.3.2 &nbsp; Оптимизация эффективности

Если в каком-либо раунде "всплытия" не произошло ни одного обмена, значит, массив уже отсортирован и можно сразу вернуть результат. Поэтому можно добавить флаг `flag` для отслеживания этой ситуации и немедленного выхода.

После такой оптимизации худшая и средняя временные сложности сортировки пузырьком по-прежнему равны $O(n^2)$ ; однако если входной массив уже полностью упорядочен, достигается лучшая временная сложность $O(n)$ .

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort_with_flag(nums: list[int]):
        """Пузырьковая сортировка (оптимизация флагом)"""
        n = len(nums)
        # Внешний цикл: неотсортированный диапазон [0, i]
        for i in range(n - 1, 0, -1):
            flag = False  # Инициализировать флаг
            # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Поменять местами nums[j] и nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
                    flag = True  # Записать обмен элементов
            if not flag:
                break  # На этой итерации «всплытия» не было ни одного обмена, сразу выйти
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* Пузырьковая сортировка (оптимизация флагом) */
    void bubbleSortWithFlag(vector<int> &nums) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            bool flag = false; // Инициализировать флаг
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    // Здесь используется функция std::swap()
                    swap(nums[j], nums[j + 1]);
                    flag = true; // Записать обмен элементов
                }
            }
            if (!flag)
                break; // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* Пузырьковая сортировка (оптимизация флагом) */
    void bubbleSortWithFlag(int[] nums) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // Инициализировать флаг
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Записать обмен элементов
                }
            }
            if (!flag)
                break; // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    /* Пузырьковая сортировка (оптимизация флагом) */
    void BubbleSortWithFlag(int[] nums) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // Инициализировать флаг
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // Записать обмен элементов
                }
            }
            if (!flag) break;     // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* Пузырьковая сортировка (оптимизация флагом) */
    func bubbleSortWithFlag(nums []int) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            flag := false // Инициализировать флаг
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // Поменять местами nums[j] и nums[j + 1]
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                    flag = true // Записать обмен элементов
                }
            }
            if flag == false { // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
                break
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* Пузырьковая сортировка (оптимизация флагом) */
    func bubbleSortWithFlag(nums: inout [Int]) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for i in nums.indices.dropFirst().reversed() {
            var flag = false // Инициализировать флаг
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // Поменять местами nums[j] и nums[j + 1]
                    nums.swapAt(j, j + 1)
                    flag = true // Записать обмен элементов
                }
            }
            if !flag { // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
                break
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* Пузырьковая сортировка (оптимизация флагом) */
    function bubbleSortWithFlag(nums) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // Инициализировать флаг
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Записать обмен элементов
                }
            }
            if (!flag) break; // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
        }
    }
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    /* Пузырьковая сортировка (оптимизация флагом) */
    function bubbleSortWithFlag(nums: number[]): void {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // Инициализировать флаг
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Записать обмен элементов
                }
            }
            if (!flag) break; // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
        }
    }
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    /* Пузырьковая сортировка (оптимизация флагом) */
    void bubbleSortWithFlag(List<int> nums) {
      // Внешний цикл: неотсортированный диапазон [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        bool flag = false; // Инициализировать флаг
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // Поменять местами nums[j] и nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            flag = true; // Записать обмен элементов
          }
        }
        if (!flag) break; // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
      }
    }
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    /* Пузырьковая сортировка (оптимизация флагом) */
    fn bubble_sort_with_flag(nums: &mut [i32]) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for i in (1..nums.len()).rev() {
            let mut flag = false; // Инициализировать флаг
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // Поменять местами nums[j] и nums[j + 1]
                    nums.swap(j, j + 1);
                    flag = true; // Записать обмен элементов
                }
            }
            if !flag {
                break; // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
            };
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* Пузырьковая сортировка (оптимизация флагом) */
    void bubbleSortWithFlag(int nums[], int size) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = size - 1; i > 0; i--) {
            bool flag = false;
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    int temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                    flag = true;
                }
            }
            if (!flag)
                break;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bubble_sort.kt"
    /* Пузырьковая сортировка (оптимизация флагом) */
    fun bubbleSortWithFlag(nums: IntArray) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (i in nums.size - 1 downTo 1) {
            var flag = false // Инициализировать флаг
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    flag = true // Записать обмен элементов
                }
            }
            if (!flag) break // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
        }
    }
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    ### Пузырьковая сортировка ###
    def bubble_sort(nums)
      n = nums.length
      # Внешний цикл: неотсортированный диапазон [0, i]
      for i in (n - 1).downto(1)
        # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Поменять местами nums[j] и nums[j + 1]
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
          end
        end
      end
    end

    # ## Пузырьковая сортировка (оптимизация флагом) ###
    def bubble_sort_with_flag(nums)
      n = nums.length
      # Внешний цикл: неотсортированный диапазон [0, i]
      for i in (n - 1).downto(1)
        flag = false # Инициализировать флаг

        # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Поменять местами nums[j] и nums[j + 1]
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
            flag = true # Записать обмен элементов
          end
        end

        break unless flag # На этой итерации «всплытия» не было ни одного обмена, сразу выйти
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%20%28%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%84%D0%BB%D0%B0%D0%B3%D0%BE%D0%BC%29%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%D0%92%D0%BD%D0%B5%D1%88%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%84%D0%BB%D0%B0%D0%B3%0A%20%20%20%20%20%20%20%20%23%20%D0%92%D0%BD%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%D0%B0%20%5B0%2C%20i%5D%20%D0%B2%20%D0%B5%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D0%BD%D1%8F%D1%82%D1%8C%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%D0%BC%D0%B8%20nums%5Bj%5D%20%D0%B8%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B1%D0%BC%D0%B5%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20%D0%9D%D0%B0%20%D1%8D%D1%82%D0%BE%D0%B9%20%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%20%C2%AB%D0%B2%D1%81%D0%BF%D0%BB%D1%8B%D1%82%D0%B8%D1%8F%C2%BB%20%D0%BD%D0%B5%20%D0%B1%D1%8B%D0%BB%D0%BE%20%D0%BD%D0%B8%20%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BE%D0%B1%D0%BC%D0%B5%D0%BD%D0%B0%2C%20%D1%81%D1%80%D0%B0%D0%B7%D1%83%20%D0%B2%D1%8B%D0%B9%D1%82%D0%B8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BF%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%9F%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%20%28%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%84%D0%BB%D0%B0%D0%B3%D0%BE%D0%BC%29%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%D0%92%D0%BD%D0%B5%D1%88%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%20%5B0%2C%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%84%D0%BB%D0%B0%D0%B3%0A%20%20%20%20%20%20%20%20%23%20%D0%92%D0%BD%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B8%D0%B9%20%D1%86%D0%B8%D0%BA%D0%BB%3A%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B5%D0%BE%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%D0%B0%20%5B0%2C%20i%5D%20%D0%B2%20%D0%B5%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D0%BD%D1%8F%D1%82%D1%8C%20%D0%BC%D0%B5%D1%81%D1%82%D0%B0%D0%BC%D0%B8%20nums%5Bj%5D%20%D0%B8%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D%2C%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D%2C%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B1%D0%BC%D0%B5%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20%D0%9D%D0%B0%20%D1%8D%D1%82%D0%BE%D0%B9%20%D0%B8%D1%82%D0%B5%D1%80%D0%B0%D1%86%D0%B8%D0%B8%20%C2%AB%D0%B2%D1%81%D0%BF%D0%BB%D1%8B%D1%82%D0%B8%D1%8F%C2%BB%20%D0%BD%D0%B5%20%D0%B1%D1%8B%D0%BB%D0%BE%20%D0%BD%D0%B8%20%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BE%D0%B1%D0%BC%D0%B5%D0%BD%D0%B0%2C%20%D1%81%D1%80%D0%B0%D0%B7%D1%83%20%D0%B2%D1%8B%D0%B9%D1%82%D0%B8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%201%2C%203%2C%201%2C%205%2C%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BF%D1%83%D0%B7%D1%8B%D1%80%D1%8C%D0%BA%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 11.3.3 &nbsp; Характеристики алгоритма

- **Временная сложность равна $O(n^2)$, алгоритм адаптивен**: длины диапазонов, проходящих "всплытие" в разных раундах, последовательно равны $n - 1$, $n - 2$, $\dots$, $2$, $1$ , а их сумма равна $(n - 1) n / 2$ . После добавления оптимизации с `flag` лучшая временная сложность может достигать $O(n)$ .
- **Пространственная сложность равна $O(1)$, сортировка выполняется на месте**: указатели $i$ и $j$ используют константный объем дополнительной памяти.
- **Стабильная сортировка**: поскольку при "всплытии" равные элементы не обмениваются местами.
