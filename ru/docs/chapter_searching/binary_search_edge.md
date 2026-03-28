---
comments: true
---

# 10.3 &nbsp; Двоичный поиск границ

## 10.3.1 &nbsp; Поиск левой границы

!!! question

    Дан упорядоченный массив `nums` длины $n$, который может содержать повторяющиеся элементы. Верните индекс самого левого элемента `target` в массиве. Если массив не содержит этот элемент, верните $-1$ .

Вспомним метод поиска точки вставки при двоичном поиске: после завершения поиска указатель $i$ указывает на самый левый `target` , **поэтому поиск точки вставки по сути и есть поиск индекса самого левого `target`**.

Рассмотрим реализацию поиска левой границы через функцию поиска точки вставки. Обратите внимание: массив может не содержать `target` , и тогда возможны две ситуации.

- Индекс точки вставки $i$ выходит за границы массива.
- Элемент `nums[i]` не равен `target` .

Если возникает любая из этих ситуаций, достаточно сразу вернуть $-1$ . Код приведен ниже:

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """Бинарный поиск самого левого target"""
        # Эквивалентно поиску точки вставки target
        i = binary_search_insertion(nums, target)
        # target не найден, вернуть -1
        if i == len(nums) or nums[i] != target:
            return -1
        # Найти target и вернуть индекс i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* Бинарный поиск самого левого target */
    int binarySearchLeftEdge(vector<int> &nums, int target) {
        // Эквивалентно поиску точки вставки target
        int i = binarySearchInsertion(nums, target);
        // target не найден, вернуть -1
        if (i == nums.size() || nums[i] != target) {
            return -1;
        }
        // Найти target и вернуть индекс i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* Бинарный поиск самого левого target */
    int binarySearchLeftEdge(int[] nums, int target) {
        // Эквивалентно поиску точки вставки target
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // target не найден, вернуть -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // Найти target и вернуть индекс i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* Бинарный поиск самого левого target */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // Эквивалентно поиску точки вставки target
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // target не найден, вернуть -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // Найти target и вернуть индекс i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* Бинарный поиск самого левого target */
    func binarySearchLeftEdge(nums []int, target int) int {
        // Эквивалентно поиску точки вставки target
        i := binarySearchInsertion(nums, target)
        // target не найден, вернуть -1
        if i == len(nums) || nums[i] != target {
            return -1
        }
        // Найти target и вернуть индекс i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* Бинарный поиск самого левого target */
    func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
        // Эквивалентно поиску точки вставки target
        let i = binarySearchInsertion(nums: nums, target: target)
        // target не найден, вернуть -1
        if i == nums.endIndex || nums[i] != target {
            return -1
        }
        // Найти target и вернуть индекс i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* Бинарный поиск самого левого target */
    function binarySearchLeftEdge(nums, target) {
        // Эквивалентно поиску точки вставки target
        const i = binarySearchInsertion(nums, target);
        // target не найден, вернуть -1
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // Найти target и вернуть индекс i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* Бинарный поиск самого левого target */
    function binarySearchLeftEdge(nums: Array<number>, target: number): number {
        // Эквивалентно поиску точки вставки target
        const i = binarySearchInsertion(nums, target);
        // target не найден, вернуть -1
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // Найти target и вернуть индекс i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* Бинарный поиск самого левого target */
    int binarySearchLeftEdge(List<int> nums, int target) {
      // Эквивалентно поиску точки вставки target
      int i = binarySearchInsertion(nums, target);
      // target не найден, вернуть -1
      if (i == nums.length || nums[i] != target) {
        return -1;
      }
      // Найти target и вернуть индекс i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* Бинарный поиск самого левого target */
    fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
        // Эквивалентно поиску точки вставки target
        let i = binary_search_insertion(nums, target);
        // target не найден, вернуть -1
        if i == nums.len() as i32 || nums[i as usize] != target {
            return -1;
        }
        // Найти target и вернуть индекс i
        i
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* Бинарный поиск самого левого target */
    int binarySearchLeftEdge(int *nums, int numSize, int target) {
        // Эквивалентно поиску точки вставки target
        int i = binarySearchInsertion(nums, numSize, target);
        // target не найден, вернуть -1
        if (i == numSize || nums[i] != target) {
            return -1;
        }
        // Найти target и вернуть индекс i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* Бинарный поиск самого левого target */
    fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
        // Эквивалентно поиску точки вставки target
        val i = binarySearchInsertion(nums, target)
        // target не найден, вернуть -1
        if (i == nums.size || nums[i] != target) {
            return -1
        }
        // Найти target и вернуть индекс i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### Бинарный поиск самого левого target ###
    def binary_search_left_edge(nums, target)
      # Эквивалентно поиску точки вставки target
      i = binary_search_insertion(nums, target)

      # target не найден, вернуть -1
      return -1 if i == nums.length || nums[i] != target

      i # Найти target и вернуть индекс i
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%28%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%29%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%20%D0%B7%D0%B0%D0%BC%D0%BA%D0%BD%D1%83%D1%82%D1%8B%D0%B9%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bm%2B1%2C%20j%5D%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%82%D0%BE%D1%87%D0%BA%D1%83%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%D0%B0%D0%BC%D0%BE%D0%B3%D0%BE%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20target%22%22%22%0A%20%20%20%20%23%20%D0%AD%D0%BA%D0%B2%D0%B8%D0%B2%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%BD%D0%BE%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D1%83%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20target%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums%2C%20target%29%0A%20%20%20%20%23%20target%20%D0%BD%D0%B5%20%D0%BD%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20-1%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20target%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20i%0A%20%20%20%20return%20i%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B9%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B0%D0%BC%D0%BE%D0%B3%D0%BE%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%7Btarget%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%28%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%29%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%20%D0%B7%D0%B0%D0%BC%D0%BA%D0%BD%D1%83%D1%82%D1%8B%D0%B9%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bm%2B1%2C%20j%5D%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%82%D0%BE%D1%87%D0%BA%D1%83%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%D0%B0%D0%BC%D0%BE%D0%B3%D0%BE%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20target%22%22%22%0A%20%20%20%20%23%20%D0%AD%D0%BA%D0%B2%D0%B8%D0%B2%D0%B0%D0%BB%D0%B5%D0%BD%D1%82%D0%BD%D0%BE%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D1%83%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20target%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums%2C%20target%29%0A%20%20%20%20%23%20target%20%D0%BD%D0%B5%20%D0%BD%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20-1%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20target%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20i%0A%20%20%20%20return%20i%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B9%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B0%D0%BC%D0%BE%D0%B3%D0%BE%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%7Btarget%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 10.3.2 &nbsp; Поиск правой границы

Как тогда найти самый правый `target` ? Самый прямой способ - изменить код, заменив операцию сужения указателя в случае `nums[m] == target` . Мы не будем приводить этот код, заинтересованные читатели могут реализовать его самостоятельно.

Ниже представлены два более изящных способа.

### 1. &nbsp; Повторное использование поиска левой границы

На самом деле функцию поиска самого левого элемента можно использовать и для поиска самого правого элемента. Конкретная идея такова: **преобразовать поиск самого правого `target` в поиск самого левого `target + 1`**.

Как показано на рисунке 10-7, после завершения поиска указатель $i$ указывает на самый левый `target + 1` (если он существует), а указатель $j$ указывает на самый правый `target` , **поэтому достаточно вернуть $j$**.

![Преобразование поиска правой границы в поиск левой](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> Рисунок 10-7 &nbsp; Преобразование поиска правой границы в поиск левой </p>

Обратите внимание: функция возвращает точку вставки $i$ , поэтому из нее нужно вычесть $1$ , чтобы получить $j$ :

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """Бинарный поиск самого правого target"""
        # Преобразовать задачу в поиск самого левого target + 1
        i = binary_search_insertion(nums, target + 1)
        # j указывает на самый правый target, а i — на первый элемент больше target
        j = i - 1
        # target не найден, вернуть -1
        if j == -1 or nums[j] != target:
            return -1
        # Найти target и вернуть индекс j
        return j
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* Бинарный поиск самого правого target */
    int binarySearchRightEdge(vector<int> &nums, int target) {
        // Преобразовать задачу в поиск самого левого target + 1
        int i = binarySearchInsertion(nums, target + 1);
        // j указывает на самый правый target, а i — на первый элемент больше target
        int j = i - 1;
        // target не найден, вернуть -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Найти target и вернуть индекс j
        return j;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* Бинарный поиск самого правого target */
    int binarySearchRightEdge(int[] nums, int target) {
        // Преобразовать задачу в поиск самого левого target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j указывает на самый правый target, а i — на первый элемент больше target
        int j = i - 1;
        // target не найден, вернуть -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Найти target и вернуть индекс j
        return j;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* Бинарный поиск самого правого target */
    int BinarySearchRightEdge(int[] nums, int target) {
        // Преобразовать задачу в поиск самого левого target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j указывает на самый правый target, а i — на первый элемент больше target
        int j = i - 1;
        // target не найден, вернуть -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Найти target и вернуть индекс j
        return j;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* Бинарный поиск самого правого target */
    func binarySearchRightEdge(nums []int, target int) int {
        // Преобразовать задачу в поиск самого левого target + 1
        i := binarySearchInsertion(nums, target+1)
        // j указывает на самый правый target, а i — на первый элемент больше target
        j := i - 1
        // target не найден, вернуть -1
        if j == -1 || nums[j] != target {
            return -1
        }
        // Найти target и вернуть индекс j
        return j
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* Бинарный поиск самого правого target */
    func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
        // Преобразовать задачу в поиск самого левого target + 1
        let i = binarySearchInsertion(nums: nums, target: target + 1)
        // j указывает на самый правый target, а i — на первый элемент больше target
        let j = i - 1
        // target не найден, вернуть -1
        if j == -1 || nums[j] != target {
            return -1
        }
        // Найти target и вернуть индекс j
        return j
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* Бинарный поиск самого правого target */
    function binarySearchRightEdge(nums, target) {
        // Преобразовать задачу в поиск самого левого target + 1
        const i = binarySearchInsertion(nums, target + 1);
        // j указывает на самый правый target, а i — на первый элемент больше target
        const j = i - 1;
        // target не найден, вернуть -1
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // Найти target и вернуть индекс j
        return j;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* Бинарный поиск самого правого target */
    function binarySearchRightEdge(nums: Array<number>, target: number): number {
        // Преобразовать задачу в поиск самого левого target + 1
        const i = binarySearchInsertion(nums, target + 1);
        // j указывает на самый правый target, а i — на первый элемент больше target
        const j = i - 1;
        // target не найден, вернуть -1
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // Найти target и вернуть индекс j
        return j;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* Бинарный поиск самого правого target */
    int binarySearchRightEdge(List<int> nums, int target) {
      // Преобразовать задачу в поиск самого левого target + 1
      int i = binarySearchInsertion(nums, target + 1);
      // j указывает на самый правый target, а i — на первый элемент больше target
      int j = i - 1;
      // target не найден, вернуть -1
      if (j == -1 || nums[j] != target) {
        return -1;
      }
      // Найти target и вернуть индекс j
      return j;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* Бинарный поиск самого правого target */
    fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
        // Преобразовать задачу в поиск самого левого target + 1
        let i = binary_search_insertion(nums, target + 1);
        // j указывает на самый правый target, а i — на первый элемент больше target
        let j = i - 1;
        // target не найден, вернуть -1
        if j == -1 || nums[j as usize] != target {
            return -1;
        }
        // Найти target и вернуть индекс j
        j
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* Бинарный поиск самого правого target */
    int binarySearchRightEdge(int *nums, int numSize, int target) {
        // Преобразовать задачу в поиск самого левого target + 1
        int i = binarySearchInsertion(nums, numSize, target + 1);
        // j указывает на самый правый target, а i — на первый элемент больше target
        int j = i - 1;
        // target не найден, вернуть -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Найти target и вернуть индекс j
        return j;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* Бинарный поиск самого правого target */
    fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
        // Преобразовать задачу в поиск самого левого target + 1
        val i = binarySearchInsertion(nums, target + 1)
        // j указывает на самый правый target, а i — на первый элемент больше target
        val j = i - 1
        // target не найден, вернуть -1
        if (j == -1 || nums[j] != target) {
            return -1
        }
        // Найти target и вернуть индекс j
        return j
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### Бинарный поиск самого правого target ###
    def binary_search_right_edge(nums, target)
      # Преобразовать задачу в поиск самого левого target + 1
      i = binary_search_insertion(nums, target + 1)

      # j указывает на самый правый target, а i — на первый элемент больше target
      j = i - 1

      # target не найден, вернуть -1
      return -1 if j == -1 || nums[j] != target

      j # Найти target и вернуть индекс j
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%28%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%29%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%20%D0%B7%D0%B0%D0%BC%D0%BA%D0%BD%D1%83%D1%82%D1%8B%D0%B9%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bm%2B1%2C%20j%5D%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%82%D0%BE%D1%87%D0%BA%D1%83%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%D0%B0%D0%BC%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B3%D0%BE%20target%22%22%22%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B5%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%D0%B0%D0%BC%D0%BE%D0%B3%D0%BE%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20target%20%2B%201%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums%2C%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20%D1%83%D0%BA%D0%B0%D0%B7%D1%8B%D0%B2%D0%B0%D0%B5%D1%82%20%D0%BD%D0%B0%20%D1%81%D0%B0%D0%BC%D1%8B%D0%B9%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20target%2C%20%D0%B0%20i%20%E2%80%94%20%D0%BD%D0%B0%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20target%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20target%20%D0%BD%D0%B5%20%D0%BD%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20-1%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20target%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20j%0A%20%20%20%20return%20j%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B9%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B0%D0%BC%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%7Btarget%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%82%D0%BE%D1%87%D0%BA%D0%B8%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%28%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%29%22%22%22%0A%20%20%20%20i%2C%20j%20%3D%200%2C%20len%28nums%29%20-%201%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%20%D0%B7%D0%B0%D0%BC%D0%BA%D0%BD%D1%83%D1%82%D1%8B%D0%B9%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%20%5B0%2C%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20%2F%2F%202%20%20%23%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%8B%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bm%2B1%2C%20j%5D%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20target%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B5%20%5Bi%2C%20m-1%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%82%D0%BE%D1%87%D0%BA%D1%83%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%D0%B0%D0%BC%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B3%D0%BE%20target%22%22%22%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B5%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D1%83%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D1%81%D0%B0%D0%BC%D0%BE%D0%B3%D0%BE%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20target%20%2B%201%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums%2C%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20%D1%83%D0%BA%D0%B0%D0%B7%D1%8B%D0%B2%D0%B0%D0%B5%D1%82%20%D0%BD%D0%B0%20%D1%81%D0%B0%D0%BC%D1%8B%D0%B9%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20target%2C%20%D0%B0%20i%20%E2%80%94%20%D0%BD%D0%B0%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20target%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20target%20%D0%BD%D0%B5%20%D0%BD%D0%B0%D0%B9%D0%B4%D0%B5%D0%BD%2C%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20-1%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20target%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20j%0A%20%20%20%20return%20j%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%81%20%D0%BF%D0%BE%D0%B2%D1%82%D0%BE%D1%80%D1%8F%D1%8E%D1%89%D0%B8%D0%BC%D0%B8%D1%81%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%206%2C%206%2C%206%2C%206%2C%206%2C%2010%2C%2012%2C%2015%5D%0A%20%20%20%20%23%20%D0%91%D0%B8%D0%BD%D0%B0%D1%80%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B9%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B9%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums%2C%20target%29%0A%20%20%20%20print%28f%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%B0%D0%BC%D0%BE%D0%B3%D0%BE%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%7Btarget%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 2. &nbsp; Преобразование в поиск элемента

Мы знаем, что если массив не содержит `target` , то в конце поиска указатели $i$ и $j$ будут указывать соответственно на первый элемент, больший `target` , и на первый элемент, меньший `target` .

Следовательно, как показано на рисунке 10-8, для поиска левой и правой границы можно сконструировать элемент, которого нет в массиве.

- Поиск самого левого `target` : можно преобразовать в поиск `target - 0.5` и вернуть указатель $i$ .
- Поиск самого правого `target` : можно преобразовать в поиск `target + 0.5` и вернуть указатель $j$ .

![Преобразование поиска границ в поиск элемента](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> Рисунок 10-8 &nbsp; Преобразование поиска границ в поиск элемента </p>

Код здесь опущен, но стоит обратить внимание на два момента.

- По условию массив не содержит дробных чисел, поэтому нам не нужно беспокоиться о том, как обрабатывать случай равенства другим элементам массива.
- Поскольку этот метод вводит дробные числа, переменную `target` в функции нужно изменить на тип с плавающей запятой (в Python менять ничего не требуется).
