---
comments: true
---

# 10.2 &nbsp; Двоичный поиск точки вставки

Двоичный поиск можно использовать не только для поиска целевого элемента, но и для решения многих вариаций задачи, например для поиска позиции вставки целевого элемента.

## 10.2.1 &nbsp; Случай без повторяющихся элементов

!!! question

    Дан упорядоченный массив `nums` длины $n$ и элемент `target` , причем в массиве нет повторяющихся элементов. Нужно вставить `target` в массив `nums` , сохранив порядок. Если элемент `target` уже присутствует в массиве, вставьте его слева от него. Верните индекс, который будет иметь `target` после вставки. Пример показан на рисунке 10-4.

![Пример данных для точки вставки](binary_search_insertion.assets/binary_search_insertion_example.png){ class="animation-figure" }

<p align="center"> Рисунок 10-4 &nbsp; Пример данных для точки вставки </p>

Если мы хотим переиспользовать код двоичного поиска из предыдущего раздела, нужно ответить на два вопроса.

**Вопрос 1**: если массив содержит `target` , будет ли индекс вставки совпадать с индексом этого элемента?

По условию `target` нужно вставить слева от равного элемента, а это означает, что новый `target` занимает место старого `target` . Иначе говоря, **если массив содержит `target` , то индекс вставки совпадает с индексом этого `target`**.

**Вопрос 2**: если массив не содержит `target` , индекс какого элемента будет точкой вставки?

Рассмотрим процесс двоичного поиска подробнее: когда `nums[m] < target` , указатель $i$ сдвигается вправо и тем самым приближается к элементу, который больше либо равен `target` . Аналогично указатель $j$ постепенно приближается к элементу, который меньше либо равен `target` .

Следовательно, после завершения двоичного поиска обязательно выполняется следующее: указатель $i$ указывает на первый элемент, больший `target` , а указатель $j$ указывает на первый элемент, меньший `target` . **Нетрудно сделать вывод, что если массив не содержит `target` , то индекс вставки равен $i$** . Код приведен ниже:

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion_simple(nums: list[int], target: int) -> int:
        """Бинарный поиск точки вставки (без повторяющихся элементов)"""
        i, j = 0, len(nums) - 1  # Инициализировать двусторонне замкнутый интервал [0, n-1]
        while i <= j:
            m = (i + j) // 2  # Вычислить индекс середины m
            if nums[m] < target:
                i = m + 1  # target находится в интервале [m+1, j]
            elif nums[m] > target:
                j = m - 1  # target находится в интервале [i, m-1]
            else:
                return m  # Найти target и вернуть точку вставки m
        # target не найден, вернуть точку вставки i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    int binarySearchInsertionSimple(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                return m; // Найти target и вернуть точку вставки m
            }
        }
        // target не найден, вернуть точку вставки i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                return m; // Найти target и вернуть точку вставки m
            }
        }
        // target не найден, вернуть точку вставки i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                return m; // Найти target и вернуть точку вставки m
            }
        }
        // target не найден, вернуть точку вставки i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    func binarySearchInsertionSimple(nums []int, target int) int {
        // Инициализировать двусторонне замкнутый интервал [0, n-1]
        i, j := 0, len(nums)-1
        for i <= j {
            // Вычислить индекс середины m
            m := i + (j-i)/2
            if nums[m] < target {
                // target находится в интервале [m+1, j]
                i = m + 1
            } else if nums[m] > target {
                // target находится в интервале [i, m-1]
                j = m - 1
            } else {
                // Найти target и вернуть точку вставки m
                return m
            }
        }
        // target не найден, вернуть точку вставки i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
        // Инициализировать двусторонне замкнутый интервал [0, n-1]
        var i = nums.startIndex
        var j = nums.endIndex - 1
        while i <= j {
            let m = i + (j - i) / 2 // Вычислить индекс середины m
            if nums[m] < target {
                i = m + 1 // target находится в интервале [m+1, j]
            } else if nums[m] > target {
                j = m - 1 // target находится в интервале [i, m-1]
            } else {
                return m // Найти target и вернуть точку вставки m
            }
        }
        // target не найден, вернуть точку вставки i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    function binarySearchInsertionSimple(nums, target) {
        let i = 0,
            j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // Вычислить индекс середины m, используя Math.floor() для округления вниз
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                return m; // Найти target и вернуть точку вставки m
            }
        }
        // target не найден, вернуть точку вставки i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    function binarySearchInsertionSimple(
        nums: Array<number>,
        target: number
    ): number {
        let i = 0,
            j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // Вычислить индекс середины m, используя Math.floor() для округления вниз
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                return m; // Найти target и вернуть точку вставки m
            }
        }
        // target не найден, вернуть точку вставки i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    int binarySearchInsertionSimple(List<int> nums, int target) {
      int i = 0, j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // Вычислить индекс середины m
        if (nums[m] < target) {
          i = m + 1; // target находится в интервале [m+1, j]
        } else if (nums[m] > target) {
          j = m - 1; // target находится в интервале [i, m-1]
        } else {
          return m; // Найти target и вернуть точку вставки m
        }
      }
      // target не найден, вернуть точку вставки i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
        let (mut i, mut j) = (0, nums.len() as i32 - 1); // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while i <= j {
            let m = i + (j - i) / 2; // Вычислить индекс середины m
            if nums[m as usize] < target {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if nums[m as usize] > target {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                return m;
            }
        }
        // target не найден, вернуть точку вставки i
        i
    }
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    int binarySearchInsertionSimple(int *nums, int numSize, int target) {
        int i = 0, j = numSize - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                return m; // Найти target и вернуть точку вставки m
            }
        }
        // target не найден, вернуть точку вставки i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
        var i = 0
        var j = nums.size - 1 // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            val m = i + (j - i) / 2 // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1 // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1 // target находится в интервале [i, m-1]
            } else {
                return m // Найти target и вернуть точку вставки m
            }
        }
        // target не найден, вернуть точку вставки i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    ### Бинарный поиск точки вставки (без повторяющихся элементов) ###
    def binary_search_insertion_simple(nums, target)
      # Инициализировать двусторонне замкнутый интервал [0, n-1]
      i, j = 0, nums.length - 1

      while i <= j
        # Вычислить индекс середины m
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # target находится в интервале [m+1, j]
        elsif nums[m] > target
          j = m - 1 # target находится в интервале [i, m-1]
        else
          return m  # Найти target и вернуть точку вставки m
        end
      end

      i # target не найден, вернуть точку вставки i
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion_simple%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%28%D0%B1%D0%B5%D0%B7%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D1%85%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%29%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%20%D0%B7%D0%B0%D0%BC%D0%BA%D0%BD%D1%83%D1%82%D1%8B%D0%B9%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bm%2B1%2C%20j%5D%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20target%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%82%D0%BE%D1%87%D0%BA%D1%83%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20m%0A%20%20%20%20%23%20target%20%D0%BD%D0%B5%20%D0%BD%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%82%D0%BE%D1%87%D0%BA%D1%83%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D1%85%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%208%2C%2012%2C%2015%2C%2023%2C%2026%2C%2031%2C%2035%5D%0A%20%20%20%20%23%20%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion_simple%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%7Btarget%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion_simple%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%28%D0%B1%D0%B5%D0%B7%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D1%85%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%29%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%20%D0%B7%D0%B0%D0%BC%D0%BA%D0%BD%D1%83%D1%82%D1%8B%D0%B9%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bm%2B1%2C%20j%5D%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20m%20%20%23%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20target%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%82%D0%BE%D1%87%D0%BA%D1%83%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20m%0A%20%20%20%20%23%20target%20%D0%BD%D0%B5%20%D0%BD%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%82%D0%BE%D1%87%D0%BA%D1%83%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%B1%D0%B5%D0%B7%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D1%85%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%208%2C%2012%2C%2015%2C%2023%2C%2026%2C%2031%2C%2035%5D%0A%20%20%20%20%23%20%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion_simple%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%7Btarget%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 10.2.2 &nbsp; Случай с повторяющимися элементами

!!! question

    В предыдущей задаче теперь допускается, что массив может содержать повторяющиеся элементы, а все остальные условия остаются без изменений.

Если в массиве есть несколько элементов `target` , то обычный двоичный поиск сможет вернуть индекс только одного из них, **но не позволит определить, сколько элементов `target` находится слева и справа от него**.

По условию целевой элемент нужно вставить в самую левую позицию, **поэтому нам нужно найти индекс самого левого `target` в массиве**. На первом этапе можно рассмотреть решение, показанное на рисунке 10-5.

1. Выполнить двоичный поиск и получить индекс любого элемента `target` , обозначив его как $k$ .
2. Начиная с индекса $k$ , линейно двигаться влево и вернуть результат, когда будет найден самый левый `target` .

![Линейный поиск точки вставки среди повторяющихся элементов](binary_search_insertion.assets/binary_search_insertion_naive.png){ class="animation-figure" }

<p align="center"> Рисунок 10-5 &nbsp; Линейный поиск точки вставки среди повторяющихся элементов </p>

Этот метод применим на практике, однако в нем есть линейный поиск, поэтому его временная сложность равна $O(n)$ . Когда в массиве имеется много повторяющихся `target` , такой подход работает неэффективно.

Теперь рассмотрим расширение кода двоичного поиска. Как показано на рисунке 10-6, общий процесс остается прежним: на каждом шаге мы сначала вычисляем индекс середины $m$ , а затем сравниваем `target` и `nums[m]` , после чего возможны следующие случаи.

- Когда `nums[m] < target` или `nums[m] > target` , это означает, что `target` еще не найден, поэтому используется стандартная операция сужения интервала в двоичном поиске, **благодаря чему указатели $i$ и $j$ приближаются к `target`**.
- Когда `nums[m] == target` , это означает, что элементы меньше `target` находятся в интервале $[i, m - 1]$ , поэтому мы используем $j = m - 1$ для сужения интервала, **тем самым приближая указатель $j$ к элементам, меньшим `target`**.

После завершения цикла указатель $i$ будет указывать на самый левый `target` , а указатель $j$ - на первый элемент, меньший `target` , **поэтому индекс $i$ и является точкой вставки**.

=== "<1>"
    ![Шаги поиска точки вставки для повторяющихся элементов](binary_search_insertion.assets/binary_search_insertion_step1.png){ class="animation-figure" }

=== "<2>"
    ![binary_search_insertion_step2](binary_search_insertion.assets/binary_search_insertion_step2.png){ class="animation-figure" }

=== "<3>"
    ![binary_search_insertion_step3](binary_search_insertion.assets/binary_search_insertion_step3.png){ class="animation-figure" }

=== "<4>"
    ![binary_search_insertion_step4](binary_search_insertion.assets/binary_search_insertion_step4.png){ class="animation-figure" }

=== "<5>"
    ![binary_search_insertion_step5](binary_search_insertion.assets/binary_search_insertion_step5.png){ class="animation-figure" }

=== "<6>"
    ![binary_search_insertion_step6](binary_search_insertion.assets/binary_search_insertion_step6.png){ class="animation-figure" }

=== "<7>"
    ![binary_search_insertion_step7](binary_search_insertion.assets/binary_search_insertion_step7.png){ class="animation-figure" }

=== "<8>"
    ![binary_search_insertion_step8](binary_search_insertion.assets/binary_search_insertion_step8.png){ class="animation-figure" }

<p align="center"> Рисунок 10-6 &nbsp; Шаги поиска точки вставки для повторяющихся элементов </p>

Если посмотреть на следующий код, то видно, что действия в ветвях `nums[m] > target` и `nums[m] == target` совпадают, поэтому эти две ветви можно объединить.

Даже в этом случае можно оставить условия развернутыми, потому что так логика выглядит более ясной и код легче читать.

=== "Python"

    ```python title="binary_search_insertion.py"
    def binary_search_insertion(nums: list[int], target: int) -> int:
        """Бинарный поиск точки вставки (с повторяющимися элементами)"""
        i, j = 0, len(nums) - 1  # Инициализировать двусторонне замкнутый интервал [0, n-1]
        while i <= j:
            m = (i + j) // 2  # Вычислить индекс середины m
            if nums[m] < target:
                i = m + 1  # target находится в интервале [m+1, j]
            elif nums[m] > target:
                j = m - 1  # target находится в интервале [i, m-1]
            else:
                j = m - 1  # Первый элемент меньше target находится в интервале [i, m-1]
        # Вернуть точку вставки i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_insertion.cpp"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    int binarySearchInsertion(vector<int> &nums, int target) {
        int i = 0, j = nums.size() - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_insertion.java"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_insertion.cs"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_insertion.go"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    func binarySearchInsertion(nums []int, target int) int {
        // Инициализировать двусторонне замкнутый интервал [0, n-1]
        i, j := 0, len(nums)-1
        for i <= j {
            // Вычислить индекс середины m
            m := i + (j-i)/2
            if nums[m] < target {
                // target находится в интервале [m+1, j]
                i = m + 1
            } else if nums[m] > target {
                // target находится в интервале [i, m-1]
                j = m - 1
            } else {
                // Первый элемент меньше target находится в интервале [i, m-1]
                j = m - 1
            }
        }
        // Вернуть точку вставки i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_insertion.swift"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    func binarySearchInsertion(nums: [Int], target: Int) -> Int {
        // Инициализировать двусторонне замкнутый интервал [0, n-1]
        var i = nums.startIndex
        var j = nums.endIndex - 1
        while i <= j {
            let m = i + (j - i) / 2 // Вычислить индекс середины m
            if nums[m] < target {
                i = m + 1 // target находится в интервале [m+1, j]
            } else if nums[m] > target {
                j = m - 1 // target находится в интервале [i, m-1]
            } else {
                j = m - 1 // Первый элемент меньше target находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_insertion.js"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    function binarySearchInsertion(nums, target) {
        let i = 0,
            j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // Вычислить индекс середины m, используя Math.floor() для округления вниз
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_insertion.ts"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    function binarySearchInsertion(nums: Array<number>, target: number): number {
        let i = 0,
            j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            const m = Math.floor(i + (j - i) / 2); // Вычислить индекс середины m, используя Math.floor() для округления вниз
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_insertion.dart"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    int binarySearchInsertion(List<int> nums, int target) {
      int i = 0, j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // Вычислить индекс середины m
        if (nums[m] < target) {
          i = m + 1; // target находится в интервале [m+1, j]
        } else if (nums[m] > target) {
          j = m - 1; // target находится в интервале [i, m-1]
        } else {
          j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
        }
      }
      // Вернуть точку вставки i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_insertion.rs"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
        let (mut i, mut j) = (0, nums.len() as i32 - 1); // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while i <= j {
            let m = i + (j - i) / 2; // Вычислить индекс середины m
            if nums[m as usize] < target {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if nums[m as usize] > target {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        i
    }
    ```

=== "C"

    ```c title="binary_search_insertion.c"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    int binarySearchInsertion(int *nums, int numSize, int target) {
        int i = 0, j = numSize - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_insertion.kt"
    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    fun binarySearchInsertion(nums: IntArray, target: Int): Int {
        var i = 0
        var j = nums.size - 1 // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            val m = i + (j - i) / 2 // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1 // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1 // target находится в интервале [i, m-1]
            } else {
                j = m - 1 // Первый элемент меньше target находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_insertion.rb"
    ### Бинарный поиск точки вставки (с повторяющимися элементами) ###
    def binary_search_insertion(nums, target)
      # Инициализировать двусторонне замкнутый интервал [0, n-1]
      i, j = 0, nums.length - 1

      while i <= j
        # Вычислить индекс середины m
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # target находится в интервале [m+1, j]
        elsif nums[m] > target
          j = m - 1 # target находится в интервале [i, m-1]
        else
          j = m - 1 # Первый элемент меньше target находится в интервале [i, m-1]
        end
      end

      i # Вернуть точку вставки i
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%28%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%29%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%20%D0%B7%D0%B0%D0%BC%D0%BA%D0%BD%D1%83%D1%82%D1%8B%D0%B9%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bm%2B1%2C%20j%5D%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%82%D0%BE%D1%87%D0%BA%D1%83%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%7Btarget%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%28%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%29%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%20%D0%B7%D0%B0%D0%BC%D0%BA%D0%BD%D1%83%D1%82%D1%8B%D0%B9%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bm%2B1%2C%20j%5D%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%82%D0%BE%D1%87%D0%BA%D1%83%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20i%0A%20%20%20%20return%20i%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_insertion%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%7Btarget%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

!!! tip

    Код в этом разделе записан в стиле "двойного замкнутого интервала". При желании можно самостоятельно реализовать вариант "слева закрыт, справа открыт".

Если смотреть в целом, суть двоичного поиска сводится к тому, что для указателей $i$ и $j$ заранее задаются ориентиры поиска; целью может быть конкретный элемент, например `target` , а может быть и диапазон элементов, например все элементы, меньшие `target` .

В ходе непрерывного двоичного деления указатели $i$ и $j$ постепенно приближаются к заранее заданной цели. В конце они либо успешно находят ответ, либо останавливаются после выхода за границы.
