---
comments: true
---

# 12.2 &nbsp; Поисковая стратегия divide and conquer

Мы уже знаем, что алгоритмы поиска делятся на две большие категории.

- **Полный перебор**: реализуется через обход структуры данных, временная сложность равна $O(n)$ .
- **Адаптивный поиск**: использует особую организацию данных или априорную информацию, временная сложность может достигать $O(\log n)$ и даже $O(1)$ .

На практике **алгоритмы поиска с временной сложностью $O(\log n)$ обычно реализуются на основе стратегии divide and conquer**, например двоичный поиск и деревья.

- На каждом шаге двоичный поиск раскладывает задачу (поиск целевого элемента в массиве) на более мелкую задачу (поиск целевого элемента в одной половине массива), и этот процесс продолжается, пока массив не станет пустым или пока не будет найден целевой элемент.
- Деревья являются типичными представителями идей divide and conquer; в таких структурах данных, как двоичное дерево поиска, AVL-дерево и куча, временная сложность различных операций равна $O(\log n)$ .

Стратегия divide and conquer для двоичного поиска выглядит следующим образом.

- **Задача раскладывается на части**: двоичный поиск рекурсивно разбивает исходную задачу (поиск в массиве) на подзадачу (поиск в одной половине массива), и это достигается сравнением среднего элемента с целевым значением.
- **Подзадачи независимы**: в двоичном поиске на каждом шаге обрабатывается только одна подзадача, и она не зависит от других подзадач.
- **Решения подзадач не нужно объединять**: двоичный поиск нацелен на поиск конкретного элемента, поэтому объединять решения подзадач не требуется. Как только подзадача решена, одновременно считается решенной и исходная задача.

По сути divide and conquer повышает эффективность поиска потому, что при полном переборе за один шаг удается исключить только один вариант, **тогда как при поиске на основе divide and conquer за один шаг можно исключить половину вариантов**.

### 1. &nbsp; Реализация двоичного поиска на основе divide and conquer

В предыдущих главах двоичный поиск реализовывался через итерацию. Теперь реализуем его с помощью divide and conquer, то есть через рекурсию.

!!! question

    Дан отсортированный массив `nums` длины $n$ , в котором все элементы уникальны. Найдите элемент `target` .

С точки зрения divide and conquer обозначим подзадачу, соответствующую интервалу поиска $[i, j]$ , через $f(i, j)$ .

Начиная с исходной задачи $f(0, n-1)$ , выполняем двоичный поиск по следующим шагам.

1. Вычислить середину $m$ интервала поиска $[i, j]$ и с ее помощью исключить половину интервала.
2. Рекурсивно решить подзадачу вдвое меньшего размера; это может быть либо $f(i, m-1)$ , либо $f(m+1, j)$ .
3. Повторять шаг `1.` и шаг `2.` , пока не будет найден `target` или пока интервал не станет пустым.

На рисунке 12-4 показан процесс применения divide and conquer для поиска элемента $6$ в массиве.

![Процесс двоичного поиска в стиле divide and conquer](binary_search_recur.assets/binary_search_recur.png){ class="animation-figure" }

<p align="center"> Рисунок 12-4 &nbsp; Процесс двоичного поиска в стиле divide and conquer </p>

В реализации кода мы объявляем рекурсивную функцию `dfs()` для решения задачи $f(i, j)$ :

=== "Python"

    ```python title="binary_search_recur.py"
    def dfs(nums: list[int], target: int, i: int, j: int) -> int:
        """Бинарный поиск: задача f(i, j)"""
        # Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if i > j:
            return -1
        # Вычислить индекс середины m
        m = (i + j) // 2
        if nums[m] < target:
            # Рекурсивная подзадача f(m+1, j)
            return dfs(nums, target, m + 1, j)
        elif nums[m] > target:
            # Рекурсивная подзадача f(i, m-1)
            return dfs(nums, target, i, m - 1)
        else:
            # Целевой элемент найден, вернуть его индекс
            return m

    def binary_search(nums: list[int], target: int) -> int:
        """Бинарный поиск"""
        n = len(nums)
        # Решить задачу f(0, n-1)
        return dfs(nums, target, 0, n - 1)
    ```

=== "C++"

    ```cpp title="binary_search_recur.cpp"
    /* Бинарный поиск: задача f(i, j) */
    int dfs(vector<int> &nums, int target, int i, int j) {
        // Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if (i > j) {
            return -1;
        }
        // Вычислить индекс середины m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Рекурсивная подзадача f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Рекурсивная подзадача f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }

    /* Бинарный поиск */
    int binarySearch(vector<int> &nums, int target) {
        int n = nums.size();
        // Решить задачу f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Java"

    ```java title="binary_search_recur.java"
    /* Бинарный поиск: задача f(i, j) */
    int dfs(int[] nums, int target, int i, int j) {
        // Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if (i > j) {
            return -1;
        }
        // Вычислить индекс середины m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Рекурсивная подзадача f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Рекурсивная подзадача f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }

    /* Бинарный поиск */
    int binarySearch(int[] nums, int target) {
        int n = nums.length;
        // Решить задачу f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "C#"

    ```csharp title="binary_search_recur.cs"
    /* Бинарный поиск: задача f(i, j) */
    int DFS(int[] nums, int target, int i, int j) {
        // Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if (i > j) {
            return -1;
        }
        // Вычислить индекс середины m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Рекурсивная подзадача f(m+1, j)
            return DFS(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Рекурсивная подзадача f(i, m-1)
            return DFS(nums, target, i, m - 1);
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }

    /* Бинарный поиск */
    int BinarySearch(int[] nums, int target) {
        int n = nums.Length;
        // Решить задачу f(0, n-1)
        return DFS(nums, target, 0, n - 1);
    }
    ```

=== "Go"

    ```go title="binary_search_recur.go"
    /* Бинарный поиск: задача f(i, j) */
    func dfs(nums []int, target, i, j int) int {
        // Если интервал пуст, это означает отсутствие целевого элемента, вернуть -1
        if i > j {
            return -1
        }
        // Вычислить средний индекс
        m := i + ((j - i) >> 1)
        // Сравнить середину и целевой элемент
        if nums[m] < target {
            // Если меньше, рекурсивно обрабатывать правую половину массива
            // Рекурсивная подзадача f(m+1, j)
            return dfs(nums, target, m+1, j)
        } else if nums[m] > target {
            // Если больше, рекурсивно обработать левую половину массива
            // Рекурсивная подзадача f(i, m-1)
            return dfs(nums, target, i, m-1)
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m
        }
    }

    /* Бинарный поиск */
    func binarySearch(nums []int, target int) int {
        n := len(nums)
        return dfs(nums, target, 0, n-1)
    }
    ```

=== "Swift"

    ```swift title="binary_search_recur.swift"
    /* Бинарный поиск: задача f(i, j) */
    func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
        // Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if i > j {
            return -1
        }
        // Вычислить индекс середины m
        let m = (i + j) / 2
        if nums[m] < target {
            // Рекурсивная подзадача f(m+1, j)
            return dfs(nums: nums, target: target, i: m + 1, j: j)
        } else if nums[m] > target {
            // Рекурсивная подзадача f(i, m-1)
            return dfs(nums: nums, target: target, i: i, j: m - 1)
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m
        }
    }

    /* Бинарный поиск */
    func binarySearch(nums: [Int], target: Int) -> Int {
        // Решить задачу f(0, n-1)
        dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
    }
    ```

=== "JS"

    ```javascript title="binary_search_recur.js"
    /* Бинарный поиск: задача f(i, j) */
    function dfs(nums, target, i, j) {
        // Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if (i > j) {
            return -1;
        }
        // Вычислить индекс середины m
        const m = i + ((j - i) >> 1);
        if (nums[m] < target) {
            // Рекурсивная подзадача f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Рекурсивная подзадача f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }

    /* Бинарный поиск */
    function binarySearch(nums, target) {
        const n = nums.length;
        // Решить задачу f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "TS"

    ```typescript title="binary_search_recur.ts"
    /* Бинарный поиск: задача f(i, j) */
    function dfs(nums: number[], target: number, i: number, j: number): number {
        // Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if (i > j) {
            return -1;
        }
        // Вычислить индекс середины m
        const m = i + ((j - i) >> 1);
        if (nums[m] < target) {
            // Рекурсивная подзадача f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Рекурсивная подзадача f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }

    /* Бинарный поиск */
    function binarySearch(nums: number[], target: number): number {
        const n = nums.length;
        // Решить задачу f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Dart"

    ```dart title="binary_search_recur.dart"
    /* Бинарный поиск: задача f(i, j) */
    int dfs(List<int> nums, int target, int i, int j) {
      // Если интервал пуст, целевой элемент отсутствует, вернуть -1
      if (i > j) {
        return -1;
      }
      // Вычислить индекс середины m
      int m = (i + j) ~/ 2;
      if (nums[m] < target) {
        // Рекурсивная подзадача f(m+1, j)
        return dfs(nums, target, m + 1, j);
      } else if (nums[m] > target) {
        // Рекурсивная подзадача f(i, m-1)
        return dfs(nums, target, i, m - 1);
      } else {
        // Целевой элемент найден, вернуть его индекс
        return m;
      }
    }

    /* Бинарный поиск */
    int binarySearch(List<int> nums, int target) {
      int n = nums.length;
      // Решить задачу f(0, n-1)
      return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Rust"

    ```rust title="binary_search_recur.rs"
    /* Бинарный поиск: задача f(i, j) */
    fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
        // Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if i > j {
            return -1;
        }
        let m: i32 = i + (j - i) / 2;
        if nums[m as usize] < target {
            // Рекурсивная подзадача f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if nums[m as usize] > target {
            // Рекурсивная подзадача f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }

    /* Бинарный поиск */
    fn binary_search(nums: &[i32], target: i32) -> i32 {
        let n = nums.len() as i32;
        // Решить задачу f(0, n-1)
        dfs(nums, target, 0, n - 1)
    }
    ```

=== "C"

    ```c title="binary_search_recur.c"
    /* Бинарный поиск: задача f(i, j) */
    int dfs(int nums[], int target, int i, int j) {
        // Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if (i > j) {
            return -1;
        }
        // Вычислить индекс середины m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Рекурсивная подзадача f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Рекурсивная подзадача f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }

    /* Бинарный поиск */
    int binarySearch(int nums[], int target, int numsSize) {
        int n = numsSize;
        // Решить задачу f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_recur.kt"
    /* Бинарный поиск: задача f(i, j) */
    fun dfs(
        nums: IntArray,
        target: Int,
        i: Int,
        j: Int
    ): Int {
        // Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if (i > j) {
            return -1
        }
        // Вычислить индекс середины m
        val m = (i + j) / 2
        return if (nums[m] < target) {
            // Рекурсивная подзадача f(m+1, j)
            dfs(nums, target, m + 1, j)
        } else if (nums[m] > target) {
            // Рекурсивная подзадача f(i, m-1)
            dfs(nums, target, i, m - 1)
        } else {
            // Целевой элемент найден, вернуть его индекс
            m
        }
    }

    /* Бинарный поиск */
    fun binarySearch(nums: IntArray, target: Int): Int {
        val n = nums.size
        // Решить задачу f(0, n-1)
        return dfs(nums, target, 0, n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_recur.rb"
    ### Бинарный поиск: задача f(i, j) ###
    def dfs(nums, target, i, j)
      # Если интервал пуст, целевой элемент отсутствует, вернуть -1
      return -1 if i > j
      
      # Вычислить индекс середины m
      m = (i + j) / 2

      if nums[m] < target
        # Рекурсивная подзадача f(m+1, j)
        return dfs(nums, target, m + 1, j)
      elsif nums[m] > target
        # Рекурсивная подзадача f(i, m-1)
        return dfs(nums, target, i, m - 1)
      else
        # Целевой элемент найден, вернуть его индекс
        return m
      end
    end

    ### Бинарный поиск ###
    def binary_search(nums, target)
      n = nums.length
      # Решить задачу f(0, n-1)
      dfs(nums, target, 0, n - 1)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%2C%20i%3A%20int%2C%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%3A%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%28i%2C%20j%29%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%20%D0%BF%D1%83%D1%81%D1%82%2C%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BE%D1%82%D1%81%D1%83%D1%82%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20-1%0A%20%20%20%20if%20i%20%3E%20j%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20m%0A%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%0A%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%28m%2B1%2C%20j%29%0A%20%20%20%20%20%20%20%20return%20dfs%28nums%2C%20target%2C%20m%20%2B%201%2C%20j%29%0A%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%28i%2C%20m-1%29%0A%20%20%20%20%20%20%20%20return%20dfs%28nums%2C%20target%2C%20i%2C%20m%20-%201%29%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%A6%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B5%D0%B3%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%0A%20%20%20%20%20%20%20%20return%20m%0A%0Adef%20binary_search%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%D0%A0%D0%B5%D1%88%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20f%280%2C%20n-1%29%0A%20%20%20%20return%20dfs%28nums%2C%20target%2C%200%2C%20n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%208%2C%2012%2C%2015%2C%2023%2C%2026%2C%2031%2C%2035%5D%0A%0A%20%20%20%20%23%20%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%28%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%20%D0%B7%D0%B0%D0%BC%D0%BA%D0%BD%D1%83%D1%82%D1%8B%D0%B9%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%29%0A%20%20%20%20index%20%3D%20binary_search%28nums%2C%20target%29%0A%20%20%20%20print%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%206%20%3D%20%22%2C%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%2C%20i%3A%20int%2C%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%3A%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%28i%2C%20j%29%22%22%22%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%20%D0%BF%D1%83%D1%81%D1%82%2C%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BE%D1%82%D1%81%D1%83%D1%82%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20-1%0A%20%20%20%20if%20i%20%3E%20j%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20m%0A%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%0A%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%28m%2B1%2C%20j%29%0A%20%20%20%20%20%20%20%20return%20dfs%28nums%2C%20target%2C%20m%20%2B%201%2C%20j%29%0A%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%B0%D1%8F%20%D0%BF%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%20f%28i%2C%20m-1%29%0A%20%20%20%20%20%20%20%20return%20dfs%28nums%2C%20target%2C%20i%2C%20m%20-%201%29%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%23%20%D0%A6%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B5%D0%B3%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%0A%20%20%20%20%20%20%20%20return%20m%0A%0Adef%20binary_search%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%D0%A0%D0%B5%D1%88%D0%B8%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20f%280%2C%20n-1%29%0A%20%20%20%20return%20dfs%28nums%2C%20target%2C%200%2C%20n%20-%201%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%208%2C%2012%2C%2015%2C%2023%2C%2026%2C%2031%2C%2035%5D%0A%0A%20%20%20%20%23%20%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%28%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%20%D0%B7%D0%B0%D0%BC%D0%BA%D0%BD%D1%83%D1%82%D1%8B%D0%B9%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%29%0A%20%20%20%20index%20%3D%20binary_search%28nums%2C%20target%29%0A%20%20%20%20print%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%86%D0%B5%D0%BB%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%206%20%3D%20%22%2C%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>
