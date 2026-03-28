---
comments: true
---

# 11.5 &nbsp; Быстрая сортировка

<u>Быстрая сортировка (quick sort)</u> - это алгоритм сортировки, основанный на стратегии "разделяй и властвуй"; он работает эффективно и применяется очень широко.

Ключевая операция быстрой сортировки - это "разделение с опорным элементом". Ее цель такова: выбрать некоторый элемент массива в качестве "опорного" и переместить все элементы меньше опорного влево от него, а все элементы больше опорного - вправо. Конкретный процесс показан на рисунке 11-8.

1. Выбрать самый левый элемент массива как опорный и инициализировать два указателя `i` и `j` , направленные на левую и правую границы массива.
2. Запустить цикл, в котором `i` и `j` ищут соответственно первый элемент, больший опорного, и первый элемент, меньший опорного, после чего эти два элемента меняются местами.
3. Повторять шаг `2.` , пока указатели `i` и `j` не встретятся, а затем обменять опорный элемент с элементом на границе двух подмассивов.

=== "<1>"
    ![Шаги разделения с опорным элементом](quick_sort.assets/pivot_division_step1.png){ class="animation-figure" }

=== "<2>"
    ![pivot_division_step2](quick_sort.assets/pivot_division_step2.png){ class="animation-figure" }

=== "<3>"
    ![pivot_division_step3](quick_sort.assets/pivot_division_step3.png){ class="animation-figure" }

=== "<4>"
    ![pivot_division_step4](quick_sort.assets/pivot_division_step4.png){ class="animation-figure" }

=== "<5>"
    ![pivot_division_step5](quick_sort.assets/pivot_division_step5.png){ class="animation-figure" }

=== "<6>"
    ![pivot_division_step6](quick_sort.assets/pivot_division_step6.png){ class="animation-figure" }

=== "<7>"
    ![pivot_division_step7](quick_sort.assets/pivot_division_step7.png){ class="animation-figure" }

=== "<8>"
    ![pivot_division_step8](quick_sort.assets/pivot_division_step8.png){ class="animation-figure" }

=== "<9>"
    ![pivot_division_step9](quick_sort.assets/pivot_division_step9.png){ class="animation-figure" }

<p align="center"> Рисунок 11-8 &nbsp; Шаги разделения с опорным элементом </p>

После завершения разделения исходный массив разбивается на три части: левый подмассив, опорный элемент и правый подмассив; при этом выполняется условие "любой элемент левого подмассива $\leq$ опорный элемент $\leq$ любой элемент правого подмассива". Следовательно, далее нам нужно лишь отсортировать эти два подмассива.

!!! note "Стратегия divide and conquer в быстрой сортировке"

    По сути, разделение с опорным элементом сводит задачу сортировки длинного массива к двум задачам сортировки более коротких массивов.

=== "Python"

    ```python title="quick_sort.py"
    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Разбиение с опорными указателями"""
        # Взять nums[left] в качестве опорного элемента
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Идти справа налево в поисках первого элемента меньше опорного
            while i < j and nums[i] <= nums[left]:
                i += 1  # Идти слева направо в поисках первого элемента больше опорного
            # Обмен элементов
            nums[i], nums[j] = nums[j], nums[i]
        # Переместить опорный элемент на границу двух подмассивов
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Вернуть индекс опорного элемента
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Разбиение с опорными указателями */
    int partition(vector<int> &nums, int left, int right) {
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;                // Идти слева направо в поисках первого элемента больше опорного
            swap(nums[i], nums[j]); // Поменять эти два элемента местами
        }
        swap(nums[i], nums[left]);  // Переместить опорный элемент на границу двух подмассивов
        return i;                   // Вернуть индекс опорного элемента
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Обмен элементов */
    void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Разбиение с опорными указателями */
    int partition(int[] nums, int left, int right) {
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Идти слева направо в поисках первого элемента больше опорного
            swap(nums, i, j); // Поменять эти два элемента местами
        }
        swap(nums, i, left);  // Переместить опорный элемент на границу двух подмассивов
        return i;             // Вернуть индекс опорного элемента
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* Обмен элементов */
    void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Разбиение с опорными указателями */
    int Partition(int[] nums, int left, int right) {
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Идти слева направо в поисках первого элемента больше опорного
            Swap(nums, i, j); // Поменять эти два элемента местами
        }
        Swap(nums, i, left);  // Переместить опорный элемент на границу двух подмассивов
        return i;             // Вернуть индекс опорного элемента
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Разбиение с опорными указателями */
    func (q *quickSort) partition(nums []int, left, right int) int {
        // Взять nums[left] в качестве опорного элемента
        i, j := left, right
        for i < j {
            for i < j && nums[j] >= nums[left] {
                j-- // Идти справа налево в поисках первого элемента меньше опорного
            }
            for i < j && nums[i] <= nums[left] {
                i++ // Идти слева направо в поисках первого элемента больше опорного
            }
            // Обмен элементов
            nums[i], nums[j] = nums[j], nums[i]
        }
        // Переместить опорный элемент на границу двух подмассивов
        nums[i], nums[left] = nums[left], nums[i]
        return i // Вернуть индекс опорного элемента
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* Разбиение с опорными указателями */
    func partition(nums: inout [Int], left: Int, right: Int) -> Int {
        // Взять nums[left] в качестве опорного элемента
        var i = left
        var j = right
        while i < j {
            while i < j, nums[j] >= nums[left] {
                j -= 1 // Идти справа налево в поисках первого элемента меньше опорного
            }
            while i < j, nums[i] <= nums[left] {
                i += 1 // Идти слева направо в поисках первого элемента больше опорного
            }
            nums.swapAt(i, j) // Поменять эти два элемента местами
        }
        nums.swapAt(i, left) // Переместить опорный элемент на границу двух подмассивов
        return i // Вернуть индекс опорного элемента
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Обмен элементов */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Разбиение с опорными указателями */
    partition(nums, left, right) {
        // Взять nums[left] в качестве опорного элемента
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // Идти слева направо в поисках первого элемента больше опорного
            }
            // Обмен элементов
            this.swap(nums, i, j); // Поменять эти два элемента местами
        }
        this.swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
        return i; // Вернуть индекс опорного элемента
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Обмен элементов */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Разбиение с опорными указателями */
    partition(nums: number[], left: number, right: number): number {
        // Взять nums[left] в качестве опорного элемента
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // Идти слева направо в поисках первого элемента больше опорного
            }
            // Обмен элементов
            this.swap(nums, i, j); // Поменять эти два элемента местами
        }
        this.swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
        return i; // Вернуть индекс опорного элемента
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Обмен элементов */
    void _swap(List<int> nums, int i, int j) {
      int tmp = nums[i];
      nums[i] = nums[j];
      nums[j] = tmp;
    }

    /* Разбиение с опорными указателями */
    int _partition(List<int> nums, int left, int right) {
      // Взять nums[left] в качестве опорного элемента
      int i = left, j = right;
      while (i < j) {
        while (i < j && nums[j] >= nums[left]) j--; // Идти справа налево в поисках первого элемента меньше опорного
        while (i < j && nums[i] <= nums[left]) i++; // Идти слева направо в поисках первого элемента больше опорного
        _swap(nums, i, j); // Поменять эти два элемента местами
      }
      _swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
      return i; // Вернуть индекс опорного элемента
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Разбиение с опорными указателями */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Взять nums[left] в качестве опорного элемента
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Идти слева направо в поисках первого элемента больше опорного
            }
            nums.swap(i, j); // Поменять эти два элемента местами
        }
        nums.swap(i, left); // Переместить опорный элемент на границу двух подмассивов
        i // Вернуть индекс опорного элемента
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Обмен элементов */
    void swap(int nums[], int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Разбиение с опорными указателями */
    int partition(int nums[], int left, int right) {
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // Идти справа налево в поисках первого элемента меньше опорного
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // Идти слева направо в поисках первого элемента больше опорного
            }
            // Поменять эти два элемента местами
            swap(nums, i, j);
        }
        // Переместить опорный элемент на границу двух подмассивов
        swap(nums, i, left);
        // Вернуть индекс опорного элемента
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Обмен элементов */
    fun swap(nums: IntArray, i: Int, j: Int) {
        val temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }

    /* Разбиение с опорными указателями */
    fun partition(nums: IntArray, left: Int, right: Int): Int {
        // Взять nums[left] в качестве опорного элемента
        var i = left
        var j = right
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--           // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++           // Идти слева направо в поисках первого элемента больше опорного
            swap(nums, i, j)  // Поменять эти два элемента местами
        }
        swap(nums, i, left)   // Переместить опорный элемент на границу двух подмассивов
        return i              // Вернуть индекс опорного элемента
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Класс быстрой сортировки ###
class QuickSort
  class << self
    # ## Разбиение с опорными указателями ###
    def partition(nums, left, right)
      # Взять nums[left] в качестве опорного элемента
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Идти справа налево в поисках первого элемента меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Идти слева направо в поисках первого элемента больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%B1%D0%B8%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%D0%B8%20%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D1%8F%D0%BC%D0%B8%22%22%22%0A%20%20%20%20%23%20%D0%92%D0%B7%D1%8F%D1%82%D1%8C%20nums%5Bleft%5D%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20i%2C%20j%20%3D%20left%2C%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BF%D1%80%D0%B0%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BB%D0%B5%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BB%D0%B5%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D0%B1%D0%BC%D0%B5%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%2C%20nums%5Bj%5D%20%3D%20nums%5Bj%5D%2C%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%83%20%D0%B4%D0%B2%D1%83%D1%85%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%BE%D0%B2%0A%20%20%20%20nums%5Bi%5D%2C%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D%2C%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%204%2C%201%2C%200%2C%203%2C%205%5D%0A%20%20%20%20partition%28nums%2C%200%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%BC%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%B1%D0%B8%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%D0%B8%20%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D1%8F%D0%BC%D0%B8%22%22%22%0A%20%20%20%20%23%20%D0%92%D0%B7%D1%8F%D1%82%D1%8C%20nums%5Bleft%5D%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20i%2C%20j%20%3D%20left%2C%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BF%D1%80%D0%B0%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BB%D0%B5%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BB%D0%B5%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D0%B1%D0%BC%D0%B5%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%2C%20nums%5Bj%5D%20%3D%20nums%5Bj%5D%2C%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%83%20%D0%B4%D0%B2%D1%83%D1%85%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%BE%D0%B2%0A%20%20%20%20nums%5Bi%5D%2C%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D%2C%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%204%2C%201%2C%200%2C%203%2C%205%5D%0A%20%20%20%20partition%28nums%2C%200%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%BC%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 11.5.1 &nbsp; Алгоритм

Общий процесс быстрой сортировки показан на рисунке 11-9.

1. Сначала выполнить "разделение с опорным элементом" для исходного массива и получить неотсортированные левый и правый подмассивы.
2. Затем рекурсивно выполнить "разделение с опорным элементом" для левого и правого подмассивов.
3. Продолжать рекурсию до тех пор, пока длина подмассива не станет равной 1; после этого сортировка всего массива будет завершена.

![Процесс быстрой сортировки](quick_sort.assets/quick_sort_overview.png){ class="animation-figure" }

<p align="center"> Рисунок 11-9 &nbsp; Процесс быстрой сортировки </p>

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """Быстрая сортировка"""
        # Завершить рекурсию, когда длина подмассива равна 1
        if left >= right:
            return
        # Разбиение с опорными указателями
        pivot = self.partition(nums, left, right)
        # Рекурсивно обработать левый и правый подмассивы
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Быстрая сортировка */
    void quickSort(vector<int> &nums, int left, int right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right)
            return;
        // Разбиение с опорными указателями
        int pivot = partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Быстрая сортировка */
    void quickSort(int[] nums, int left, int right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right)
            return;
        // Разбиение с опорными указателями
        int pivot = partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* Быстрая сортировка */
    void QuickSort(int[] nums, int left, int right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right)
            return;
        // Разбиение с опорными указателями
        int pivot = Partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Быстрая сортировка */
    func (q *quickSort) quickSort(nums []int, left, right int) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if left >= right {
            return
        }
        // Разбиение с опорными указателями
        pivot := q.partition(nums, left, right)
        // Рекурсивно обработать левый и правый подмассивы
        q.quickSort(nums, left, pivot-1)
        q.quickSort(nums, pivot+1, right)
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* Быстрая сортировка */
    func quickSort(nums: inout [Int], left: Int, right: Int) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if left >= right {
            return
        }
        // Разбиение с опорными указателями
        let pivot = partition(nums: &nums, left: left, right: right)
        // Рекурсивно обработать левый и правый подмассивы
        quickSort(nums: &nums, left: left, right: pivot - 1)
        quickSort(nums: &nums, left: pivot + 1, right: right)
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Быстрая сортировка */
    quickSort(nums, left, right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right) return;
        // Разбиение с опорными указателями
        const pivot = this.partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Быстрая сортировка */
    quickSort(nums: number[], left: number, right: number): void {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right) {
            return;
        }
        // Разбиение с опорными указателями
        const pivot = this.partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Быстрая сортировка */
    void quickSort(List<int> nums, int left, int right) {
      // Завершить рекурсию, когда длина подмассива равна 1
      if (left >= right) return;
      // Разбиение с опорными указателями
      int pivot = _partition(nums, left, right);
      // Рекурсивно обработать левый и правый подмассивы
      quickSort(nums, left, pivot - 1);
      quickSort(nums, pivot + 1, right);
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Быстрая сортировка */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if left >= right {
            return;
        }
        // Разбиение с опорными указателями
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Рекурсивно обработать левый и правый подмассивы
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Быстрая сортировка */
    void quickSort(int nums[], int left, int right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right) {
            return;
        }
        // Разбиение с опорными указателями
        int pivot = partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Быстрая сортировка */
    fun quickSort(nums: IntArray, left: Int, right: Int) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right) return
        // Разбиение с опорными указателями
        val pivot = partition(nums, left, right)
        // Рекурсивно обработать левый и правый подмассивы
        quickSort(nums, left, pivot - 1)
        quickSort(nums, pivot + 1, right)
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Класс быстрой сортировки ###
class QuickSort
  class << self
    # ## Разбиение с опорными указателями ###
    def partition(nums, left, right)
      # Взять nums[left] в качестве опорного элемента
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Идти справа налево в поисках первого элемента меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Идти слева направо в поисках первого элемента больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    # ## Класс быстрой сортировки ###
    def quick_sort(nums, left, right)
      # Рекурсивно обрабатывать, пока длина подмассива не станет равной 1
      if left < right
        # Разбиение с опорными указателями
        pivot = partition(nums, left, right)
        # Рекурсивно обработать левый и правый подмассивы
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%B1%D0%B8%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%D0%B8%20%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D1%8F%D0%BC%D0%B8%22%22%22%0A%20%20%20%20%23%20%D0%92%D0%B7%D1%8F%D1%82%D1%8C%20nums%5Bleft%5D%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20i%2C%20j%20%3D%20left%2C%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BF%D1%80%D0%B0%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BB%D0%B5%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BB%D0%B5%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D0%B1%D0%BC%D0%B5%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%2C%20nums%5Bj%5D%20%3D%20nums%5Bj%5D%2C%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%83%20%D0%B4%D0%B2%D1%83%D1%85%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%BE%D0%B2%0A%20%20%20%20nums%5Bi%5D%2C%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D%2C%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%91%D1%8B%D1%81%D1%82%D1%80%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%22%22%22%0A%20%20%20%20%23%20%D0%97%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8E%2C%20%D0%BA%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%201%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%A0%D0%B0%D0%B7%D0%B1%D0%B8%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%D0%B8%20%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D1%8F%D0%BC%D0%B8%0A%20%20%20%20pivot%20%3D%20partition%28nums%2C%20left%2C%20right%29%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D1%8B%0A%20%20%20%20quick_sort%28nums%2C%20left%2C%20pivot%20-%201%29%0A%20%20%20%20quick_sort%28nums%2C%20pivot%20%2B%201%2C%20right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%91%D1%8B%D1%81%D1%82%D1%80%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%0A%20%20%20%20nums%20%3D%20%5B2%2C%204%2C%201%2C%200%2C%203%2C%205%5D%0A%20%20%20%20quick_sort%28nums%2C%200%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B1%D1%8B%D1%81%D1%82%D1%80%D0%BE%D0%B9%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%B1%D0%B8%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%D0%B8%20%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D1%8F%D0%BC%D0%B8%22%22%22%0A%20%20%20%20%23%20%D0%92%D0%B7%D1%8F%D1%82%D1%8C%20nums%5Bleft%5D%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20i%2C%20j%20%3D%20left%2C%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BF%D1%80%D0%B0%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BB%D0%B5%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BB%D0%B5%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D0%B1%D0%BC%D0%B5%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%2C%20nums%5Bj%5D%20%3D%20nums%5Bj%5D%2C%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%83%20%D0%B4%D0%B2%D1%83%D1%85%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%BE%D0%B2%0A%20%20%20%20nums%5Bi%5D%2C%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D%2C%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%91%D1%8B%D1%81%D1%82%D1%80%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%22%22%22%0A%20%20%20%20%23%20%D0%97%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D1%82%D1%8C%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D1%8E%2C%20%D0%BA%D0%BE%D0%B3%D0%B4%D0%B0%20%D0%B4%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%201%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%D0%A0%D0%B0%D0%B7%D0%B1%D0%B8%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%D0%B8%20%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D1%8F%D0%BC%D0%B8%0A%20%20%20%20pivot%20%3D%20partition%28nums%2C%20left%2C%20right%29%0A%20%20%20%20%23%20%D0%A0%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B2%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D1%8B%0A%20%20%20%20quick_sort%28nums%2C%20left%2C%20pivot%20-%201%29%0A%20%20%20%20quick_sort%28nums%2C%20pivot%20%2B%201%2C%20right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%91%D1%8B%D1%81%D1%82%D1%80%D0%B0%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%0A%20%20%20%20nums%20%3D%20%5B2%2C%204%2C%201%2C%200%2C%203%2C%205%5D%0A%20%20%20%20quick_sort%28nums%2C%200%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B1%D1%8B%D1%81%D1%82%D1%80%D0%BE%D0%B9%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 11.5.2 &nbsp; Характеристики алгоритма

- **Временная сложность равна $O(n \log n)$, алгоритм не является адаптивным**: в среднем глубина рекурсии при разделении равна $\log n$ , а суммарное число циклов на каждом уровне равно $n$ , поэтому общая сложность составляет $O(n \log n)$ . В худшем случае каждое разделение делит массив длины $n$ на подмассивы длины $0$ и $n - 1$ ; тогда глубина рекурсии достигает $n$ , на каждом уровне выполняется $n$ операций, и общая временная сложность вырождается в $O(n^2)$ .
- **Пространственная сложность равна $O(n)$, сортировка выполняется на месте**: если входной массив полностью отсортирован в обратном порядке, глубина рекурсии достигает худшего случая $n$ , что требует $O(n)$ памяти под стек вызовов. При этом сама сортировка выполняется в исходном массиве без дополнительного массива.
- **Нестабильная сортировка**: на последнем шаге разделения опорный элемент может быть обменян вправо от равного ему элемента.

## 11.5.3 &nbsp; Почему быстрая сортировка быстрая

Уже по названию понятно, что быстрая сортировка должна иметь преимущества по эффективности. Хотя ее средняя временная сложность совпадает со сложностью "сортировки слиянием" и "пирамидальной сортировки", на практике быстрая сортировка обычно работает быстрее. Основные причины таковы.

- **Вероятность худшего случая очень мала**: хотя худшая временная сложность быстрой сортировки равна $O(n^2)$ и она не так стабильна, как сортировка слиянием, в подавляющем большинстве случаев она работает за $O(n \log n)$ .
- **Высокая эффективность использования кэша**: при выполнении разделения система может загрузить весь подмассив в кэш, поэтому доступ к элементам оказывается быстрым. Алгоритмы вроде "пирамидальной сортировки" требуют скачкообразного доступа к элементам и таким свойством не обладают.
- **Небольшой константный множитель в сложности**: среди трех перечисленных алгоритмов у быстрой сортировки обычно меньше всего сравнений, присваиваний и обменов. Это похоже на причину, по которой "сортировка вставками" часто быстрее "сортировки пузырьком".

## 11.5.4 &nbsp; Оптимизация выбора опорного элемента

**На некоторых входных данных временная эффективность быстрой сортировки может ухудшаться**. Рассмотрим крайний случай: входной массив полностью отсортирован в обратном порядке. Поскольку в качестве опорного мы выбираем самый левый элемент, после разделения он будет обменян в самый правый конец массива, из-за чего длина левого подмассива станет $n - 1$ , а длина правого - $0$ . Если рекурсия будет продолжаться таким образом, то после каждого разделения один из подмассивов будет иметь длину $0$ , стратегия divide and conquer потеряет смысл, а быстрая сортировка выродится в нечто близкое к "сортировке пузырьком".

Чтобы по возможности избежать такого сценария, **мы можем улучшить стратегию выбора опорного элемента в процедуре разделения**. Например, можно выбирать случайный элемент массива как опорный. Однако если не повезет и каждый раз будет выбираться неудачный опорный элемент, производительность все равно останется неудовлетворительной.

Нужно учитывать, что языки программирования обычно генерируют "псевдослучайные числа". Если специально построить тестовый пример под такую последовательность, эффективность быстрой сортировки все равно может деградировать.

Чтобы улучшить ситуацию, можно взять три кандидата (обычно первый, последний и средний элементы массива) и **использовать медиану этих трех значений как опорный элемент**. Благодаря этому вероятность того, что опорный элемент окажется "не слишком маленьким и не слишком большим", заметно возрастает. Конечно, можно брать и большее число кандидатов, чтобы еще сильнее повысить устойчивость алгоритма. После этого вероятность деградации временной сложности до $O(n^2)$ существенно уменьшается.

Пример кода:

=== "Python"

    ```python title="quick_sort.py"
    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """Выбрать медиану из трех кандидатов"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m находится между l и r
        if (m <= l <= r) or (r <= l <= m):
            return left  # l находится между m и r
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Разбиение с опорными указателями (медиана трех)"""
        # Взять nums[left] в качестве опорного элемента
        med = self.median_three(nums, left, (left + right) // 2, right)
        # Переместить медиану в крайний левый элемент массива
        nums[left], nums[med] = nums[med], nums[left]
        # Взять nums[left] в качестве опорного элемента
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Идти справа налево в поисках первого элемента меньше опорного
            while i < j and nums[i] <= nums[left]:
                i += 1  # Идти слева направо в поисках первого элемента больше опорного
            # Обмен элементов
            nums[i], nums[j] = nums[j], nums[i]
        # Переместить опорный элемент на границу двух подмассивов
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Вернуть индекс опорного элемента
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Выбрать медиану из трех кандидатов */
    int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m находится между l и r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l находится между m и r
        return right;
    }

    /* Разбиение с опорными указателями (медиана трех) */
    int partition(vector<int> &nums, int left, int right) {
        // Выбрать медиану из трех кандидатов
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Переместить медиану в крайний левый элемент массива
        swap(nums[left], nums[med]);
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;                // Идти слева направо в поисках первого элемента больше опорного
            swap(nums[i], nums[j]); // Поменять эти два элемента местами
        }
        swap(nums[i], nums[left]);  // Переместить опорный элемент на границу двух подмассивов
        return i;                   // Вернуть индекс опорного элемента
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Выбрать медиану из трех кандидатов */
    int medianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m находится между l и r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l находится между m и r
        return right;
    }

    /* Разбиение с опорными указателями (медиана трех) */
    int partition(int[] nums, int left, int right) {
        // Выбрать медиану из трех кандидатов
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Переместить медиану в крайний левый элемент массива
        swap(nums, left, med);
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Идти слева направо в поисках первого элемента больше опорного
            swap(nums, i, j); // Поменять эти два элемента местами
        }
        swap(nums, i, left);  // Переместить опорный элемент на границу двух подмассивов
        return i;             // Вернуть индекс опорного элемента
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* Выбрать медиану из трех кандидатов */
    int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m находится между l и r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l находится между m и r
        return right;
    }

    /* Разбиение с опорными указателями (медиана трех) */
    int Partition(int[] nums, int left, int right) {
        // Выбрать медиану из трех кандидатов
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // Переместить медиану в крайний левый элемент массива
        Swap(nums, left, med);
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Идти слева направо в поисках первого элемента больше опорного
            Swap(nums, i, j); // Поменять эти два элемента местами
        }
        Swap(nums, i, left);  // Переместить опорный элемент на границу двух подмассивов
        return i;             // Вернуть индекс опорного элемента
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Выбрать медиану из трех кандидатов */
    func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
        l, m, r := nums[left], nums[mid], nums[right]
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid // m находится между l и r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left // l находится между m и r
        }
        return right
    }

    /* Разбиение с опорными указателями (медиана трех) */
    func (q *quickSortMedian) partition(nums []int, left, right int) int {
        // Взять nums[left] в качестве опорного элемента
        med := q.medianThree(nums, left, (left+right)/2, right)
        // Переместить медиану в крайний левый элемент массива
        nums[left], nums[med] = nums[med], nums[left]
        // Взять nums[left] в качестве опорного элемента
        i, j := left, right
        for i < j {
            for i < j && nums[j] >= nums[left] {
                j-- // Идти справа налево в поисках первого элемента меньше опорного
            }
            for i < j && nums[i] <= nums[left] {
                i++ // Идти слева направо в поисках первого элемента больше опорного
            }
            // Обмен элементов
            nums[i], nums[j] = nums[j], nums[i]
        }
        // Переместить опорный элемент на границу двух подмассивов
        nums[i], nums[left] = nums[left], nums[i]
        return i // Вернуть индекс опорного элемента
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* Выбрать медиану из трех кандидатов */
    func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
        let l = nums[left]
        let m = nums[mid]
        let r = nums[right]
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid // m находится между l и r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left // l находится между m и r
        }
        return right
    }

    /* Разбиение с опорными указателями (медиана трех) */
    func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
        // Выбрать медиану из трех кандидатов
        let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
        // Переместить медиану в крайний левый элемент массива
        nums.swapAt(left, med)
        return partition(nums: &nums, left: left, right: right)
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Выбрать медиану из трех кандидатов */
    medianThree(nums, left, mid, right) {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m находится между l и r
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l находится между m и r
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* Разбиение с опорными указателями (медиана трех) */
    partition(nums, left, right) {
        // Выбрать медиану из трех кандидатов
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // Переместить медиану в крайний левый элемент массива
        this.swap(nums, left, med);
        // Взять nums[left] в качестве опорного элемента
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left]) i++; // Идти слева направо в поисках первого элемента больше опорного
            this.swap(nums, i, j); // Поменять эти два элемента местами
        }
        this.swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
        return i; // Вернуть индекс опорного элемента
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Выбрать медиану из трех кандидатов */
    medianThree(
        nums: number[],
        left: number,
        mid: number,
        right: number
    ): number {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m находится между l и r
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l находится между m и r
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* Разбиение с опорными указателями (медиана трех) */
    partition(nums: number[], left: number, right: number): number {
        // Выбрать медиану из трех кандидатов
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // Переместить медиану в крайний левый элемент массива
        this.swap(nums, left, med);
        // Взять nums[left] в качестве опорного элемента
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // Идти справа налево в поисках первого элемента меньше опорного
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // Идти слева направо в поисках первого элемента больше опорного
            }
            this.swap(nums, i, j); // Поменять эти два элемента местами
        }
        this.swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
        return i; // Вернуть индекс опорного элемента
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Выбрать медиану из трех кандидатов */
    int _medianThree(List<int> nums, int left, int mid, int right) {
      int l = nums[left], m = nums[mid], r = nums[right];
      if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m находится между l и r
      if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l находится между m и r
      return right;
    }

    /* Разбиение с опорными указателями (медиана трех) */
    int _partition(List<int> nums, int left, int right) {
      // Выбрать медиану из трех кандидатов
      int med = _medianThree(nums, left, (left + right) ~/ 2, right);
      // Переместить медиану в крайний левый элемент массива
      _swap(nums, left, med);
      // Взять nums[left] в качестве опорного элемента
      int i = left, j = right;
      while (i < j) {
        while (i < j && nums[j] >= nums[left]) j--; // Идти справа налево в поисках первого элемента меньше опорного
        while (i < j && nums[i] <= nums[left]) i++; // Идти слева направо в поисках первого элемента больше опорного
        _swap(nums, i, j); // Поменять эти два элемента местами
      }
      _swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
      return i; // Вернуть индекс опорного элемента
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Выбрать медиану из трех кандидатов */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m находится между l и r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l находится между m и r
        }
        right
    }

    /* Разбиение с опорными указателями (медиана трех) */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Выбрать медиану из трех кандидатов
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // Переместить медиану в крайний левый элемент массива
        nums.swap(left, med);
        // Взять nums[left] в качестве опорного элемента
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Идти слева направо в поисках первого элемента больше опорного
            }
            nums.swap(i, j); // Поменять эти два элемента местами
        }
        nums.swap(i, left); // Переместить опорный элемент на границу двух подмассивов
        i // Вернуть индекс опорного элемента
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Выбрать медиану из трех кандидатов */
    int medianThree(int nums[], int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m находится между l и r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l находится между m и r
        return right;
    }

    /* Разбиение с опорными указателями (медиана трех) */
    int partitionMedian(int nums[], int left, int right) {
        // Выбрать медиану из трех кандидатов
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Переместить медиану в крайний левый элемент массива
        swap(nums, left, med);
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--; // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Идти слева направо в поисках первого элемента больше опорного
            swap(nums, i, j); // Поменять эти два элемента местами
        }
        swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
        return i;            // Вернуть индекс опорного элемента
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Выбрать медиану из трех кандидатов */
    fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
        val l = nums[left]
        val m = nums[mid]
        val r = nums[right]
        if ((m in l..r) || (m in r..l))
            return mid  // m находится между l и r
        if ((l in m..r) || (l in r..m))
            return left // l находится между m и r
        return right
    }

    /* Разбиение с опорными указателями (медиана трех) */
    fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
        // Выбрать медиану из трех кандидатов
        val med = medianThree(nums, left, (left + right) / 2, right)
        // Переместить медиану в крайний левый элемент массива
        swap(nums, left, med)
        // Взять nums[left] в качестве опорного элемента
        var i = left
        var j = right
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--                      // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++                      // Идти слева направо в поисках первого элемента больше опорного
            swap(nums, i, j)             // Поменять эти два элемента местами
        }
        swap(nums, i, left)              // Переместить опорный элемент на границу двух подмассивов
        return i                         // Вернуть индекс опорного элемента
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Класс быстрой сортировки ###
class QuickSort
  class << self
    # ## Разбиение с опорными указателями ###
    def partition(nums, left, right)
      # Взять nums[left] в качестве опорного элемента
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Идти справа налево в поисках первого элемента меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Идти слева направо в поисках первого элемента больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    # ## Класс быстрой сортировки ###
    def quick_sort(nums, left, right)
      # Рекурсивно обрабатывать, пока длина подмассива не станет равной 1
      if left < right
        # Разбиение с опорными указателями
        pivot = partition(nums, left, right)
        # Рекурсивно обработать левый и правый подмассивы
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

# ## Класс быстрой сортировки (оптимизация медианой) ###
class QuickSortMedian
  class << self
    # ## Выбрать медиану из трех кандидатов ###
    def median_three(nums, left, mid, right)
      # Выбрать медиану из трех кандидатов
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m находится между l и r
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l находится между m и r
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Класс быстрой сортировки ###
class QuickSort
  class << self
    # ## Разбиение с опорными указателями ###
    def partition(nums, left, right)
      # Взять nums[left] в качестве опорного элемента
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Идти справа налево в поисках первого элемента меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Идти слева направо в поисках первого элемента больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    # ## Класс быстрой сортировки ###
    def quick_sort(nums, left, right)
      # Рекурсивно обрабатывать, пока длина подмассива не станет равной 1
      if left < right
        # Разбиение с опорными указателями
        pivot = partition(nums, left, right)
        # Рекурсивно обработать левый и правый подмассивы
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

# ## Класс быстрой сортировки (оптимизация медианой) ###
class QuickSortMedian
  class << self
    # ## Выбрать медиану из трех кандидатов ###
    def median_three(nums, left, mid, right)
      # Выбрать медиану из трех кандидатов
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m находится между l и r
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l находится между m и r
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    # ## Разбиение с опорными указателями (медиана трех) ###
    def partition(nums, left, right)
      # ## Использовать nums[left] как опорный элемент
      med = median_three(nums, left, (left + right) / 2, right)
      # Переместить медиану в крайний левый элемент массива
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Идти справа налево в поисках первого элемента меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Идти слева направо в поисках первого элемента больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20median_three%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20mid%3A%20int%2C%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%92%D1%8B%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0%D0%BD%D1%83%20%D0%B8%D0%B7%20%D1%82%D1%80%D0%B5%D1%85%20%D0%BA%D0%B0%D0%BD%D0%B4%D0%B8%D0%B4%D0%B0%D1%82%D0%BE%D0%B2%22%22%22%0A%20%20%20%20l%2C%20m%2C%20r%20%3D%20nums%5Bleft%5D%2C%20nums%5Bmid%5D%2C%20nums%5Bright%5D%0A%20%20%20%20if%20%28l%20%3C%3D%20m%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20m%20%3C%3D%20l%29%3A%0A%20%20%20%20%20%20%20%20return%20mid%20%20%23%20m%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20l%20%D0%B8%20r%0A%20%20%20%20if%20%28m%20%3C%3D%20l%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20l%20%3C%3D%20m%29%3A%0A%20%20%20%20%20%20%20%20return%20left%20%20%23%20l%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20m%20%D0%B8%20r%0A%20%20%20%20return%20right%0A%0Adef%20partition%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%B1%D0%B8%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%D0%B8%20%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D1%8F%D0%BC%D0%B8%20%28%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0%D0%BD%D0%B0%20%D1%82%D1%80%D0%B5%D1%85%29%22%22%22%0A%20%20%20%20%23%20%D0%92%D0%B7%D1%8F%D1%82%D1%8C%20nums%5Bleft%5D%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20med%20%3D%20median_three%28nums%2C%20left%2C%20%28left%20%2B%20right%29%20%2F%2F%202%2C%20right%29%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0%D0%BD%D1%83%20%D0%B2%20%D0%BA%D1%80%D0%B0%D0%B9%D0%BD%D0%B8%D0%B9%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%5Bleft%5D%2C%20nums%5Bmed%5D%20%3D%20nums%5Bmed%5D%2C%20nums%5Bleft%5D%0A%20%20%20%20%23%20%D0%92%D0%B7%D1%8F%D1%82%D1%8C%20nums%5Bleft%5D%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20i%2C%20j%20%3D%20left%2C%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BF%D1%80%D0%B0%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BB%D0%B5%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BB%D0%B5%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D0%B1%D0%BC%D0%B5%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%2C%20nums%5Bj%5D%20%3D%20nums%5Bj%5D%2C%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%83%20%D0%B4%D0%B2%D1%83%D1%85%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%BE%D0%B2%0A%20%20%20%20nums%5Bi%5D%2C%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D%2C%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%9E%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0%D0%BD%D0%BD%D1%8B%D0%BC%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%BC%0A%20%20%20%20nums%20%3D%20%5B2%2C%204%2C%201%2C%200%2C%203%2C%205%5D%0A%20%20%20%20partition%28nums%2C%200%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%BC%20%28%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20median_three%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20mid%3A%20int%2C%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%92%D1%8B%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0%D0%BD%D1%83%20%D0%B8%D0%B7%20%D1%82%D1%80%D0%B5%D1%85%20%D0%BA%D0%B0%D0%BD%D0%B4%D0%B8%D0%B4%D0%B0%D1%82%D0%BE%D0%B2%22%22%22%0A%20%20%20%20l%2C%20m%2C%20r%20%3D%20nums%5Bleft%5D%2C%20nums%5Bmid%5D%2C%20nums%5Bright%5D%0A%20%20%20%20if%20%28l%20%3C%3D%20m%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20m%20%3C%3D%20l%29%3A%0A%20%20%20%20%20%20%20%20return%20mid%20%20%23%20m%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20l%20%D0%B8%20r%0A%20%20%20%20if%20%28m%20%3C%3D%20l%20%3C%3D%20r%29%20or%20%28r%20%3C%3D%20l%20%3C%3D%20m%29%3A%0A%20%20%20%20%20%20%20%20return%20left%20%20%23%20l%20%D0%BD%D0%B0%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%81%D1%8F%20%D0%BC%D0%B5%D0%B6%D0%B4%D1%83%20m%20%D0%B8%20r%0A%20%20%20%20return%20right%0A%0Adef%20partition%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A0%D0%B0%D0%B7%D0%B1%D0%B8%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%D0%B8%20%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D1%8F%D0%BC%D0%B8%20%28%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0%D0%BD%D0%B0%20%D1%82%D1%80%D0%B5%D1%85%29%22%22%22%0A%20%20%20%20%23%20%D0%92%D0%B7%D1%8F%D1%82%D1%8C%20nums%5Bleft%5D%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20med%20%3D%20median_three%28nums%2C%20left%2C%20%28left%20%2B%20right%29%20%2F%2F%202%2C%20right%29%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0%D0%BD%D1%83%20%D0%B2%20%D0%BA%D1%80%D0%B0%D0%B9%D0%BD%D0%B8%D0%B9%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%5Bleft%5D%2C%20nums%5Bmed%5D%20%3D%20nums%5Bmed%5D%2C%20nums%5Bleft%5D%0A%20%20%20%20%23%20%D0%92%D0%B7%D1%8F%D1%82%D1%8C%20nums%5Bleft%5D%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20i%2C%20j%20%3D%20left%2C%20right%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BF%D1%80%D0%B0%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BB%D0%B5%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%D0%98%D0%B4%D1%82%D0%B8%20%D1%81%D0%BB%D0%B5%D0%B2%D0%B0%20%D0%BD%D0%B0%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%20%D0%B2%20%D0%BF%D0%BE%D0%B8%D1%81%D0%BA%D0%B0%D1%85%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%0A%20%20%20%20%20%20%20%20%23%20%D0%9E%D0%B1%D0%BC%D0%B5%D0%BD%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%2C%20nums%5Bj%5D%20%3D%20nums%5Bj%5D%2C%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%83%20%D0%B4%D0%B2%D1%83%D1%85%20%D0%BF%D0%BE%D0%B4%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%BE%D0%B2%0A%20%20%20%20nums%5Bi%5D%2C%20nums%5Bleft%5D%20%3D%20nums%5Bleft%5D%2C%20nums%5Bi%5D%0A%20%20%20%20return%20i%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%9E%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0%D0%BD%D0%BD%D1%8B%D0%BC%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%BC%0A%20%20%20%20nums%20%3D%20%5B2%2C%204%2C%201%2C%200%2C%203%2C%205%5D%0A%20%20%20%20partition%28nums%2C%200%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BE%D0%BF%D0%BE%D1%80%D0%BD%D1%8B%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%BC%20%28%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F%20%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%29%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 11.5.5 &nbsp; Оптимизация глубины рекурсии

**На некоторых входных данных быстрая сортировка может занимать слишком много памяти**. Рассмотрим полностью отсортированный входной массив. Пусть длина текущего подмассива в рекурсии равна $m$ ; тогда после каждого разделения будут получаться левый подмассив длины $0$ и правый подмассив длины $m - 1$ . Это означает, что на каждом уровне размер задачи уменьшается совсем немного (лишь на один элемент), а высота дерева рекурсии достигает $n - 1$ , поэтому требуется $O(n)$ памяти под стек вызовов.

Чтобы избежать накопления стековых кадров, после каждого разделения можно сравнивать длины двух подмассивов и **рекурсивно обрабатывать только более короткий из них**. Поскольку длина короткого подмассива не превысит $n / 2$ , такой подход гарантирует, что глубина рекурсии не превысит $\log n$ , а худшая пространственная сложность будет оптимизирована до $O(\log n)$ . Код приведен ниже:

=== "Python"

    ```python title="quick_sort.py"
    def quick_sort(self, nums: list[int], left: int, right: int):
        """Быстрая сортировка (оптимизация глубины рекурсии)"""
        # Завершить, когда длина подмассива равна 1
        while left < right:
            # Операция разбиения с опорными указателями
            pivot = self.partition(nums, left, right)
            # Выполнить быструю сортировку для более короткого из двух подмассивов
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # Рекурсивно отсортировать левый подмассив
                left = pivot + 1  # Оставшийся неотсортированный диапазон: [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # Рекурсивно отсортировать правый подмассив
                right = pivot - 1  # Оставшийся неотсортированный диапазон: [left, pivot - 1]
    ```

=== "C++"

    ```cpp title="quick_sort.cpp"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    void quickSort(vector<int> &nums, int left, int right) {
        // Завершить, когда длина подмассива равна 1
        while (left < right) {
            // Операция разбиения с опорными указателями
            int pivot = partition(nums, left, right);
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1;                 // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1;                 // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
    ```

=== "Java"

    ```java title="quick_sort.java"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    void quickSort(int[] nums, int left, int right) {
        // Завершить, когда длина подмассива равна 1
        while (left < right) {
            // Операция разбиения с опорными указателями
            int pivot = partition(nums, left, right);
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1; // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
    ```

=== "C#"

    ```csharp title="quick_sort.cs"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    void QuickSort(int[] nums, int left, int right) {
        // Завершить, когда длина подмассива равна 1
        while (left < right) {
            // Операция разбиения с опорными указателями
            int pivot = Partition(nums, left, right);
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // Рекурсивно отсортировать левый подмассив
                left = pivot + 1;  // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
    ```

=== "Go"

    ```go title="quick_sort.go"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
        // Завершить, когда длина подмассива равна 1
        for left < right {
            // Операция разбиения с опорными указателями
            pivot := q.partition(nums, left, right)
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if pivot-left < right-pivot {
                q.quickSort(nums, left, pivot-1) // Рекурсивно отсортировать левый подмассив
                left = pivot + 1                 // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                q.quickSort(nums, pivot+1, right) // Рекурсивно отсортировать правый подмассив
                right = pivot - 1                 // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
    ```

=== "Swift"

    ```swift title="quick_sort.swift"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
        var left = left
        var right = right
        // Завершить, когда длина подмассива равна 1
        while left < right {
            // Операция разбиения с опорными указателями
            let pivot = partition(nums: &nums, left: left, right: right)
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left) < (right - pivot) {
                quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // Рекурсивно отсортировать левый подмассив
                left = pivot + 1 // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // Рекурсивно отсортировать правый подмассив
                right = pivot - 1 // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
    ```

=== "JS"

    ```javascript title="quick_sort.js"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    quickSort(nums, left, right) {
        // Завершить, когда длина подмассива равна 1
        while (left < right) {
            // Операция разбиения с опорными указателями
            let pivot = this.partition(nums, left, right);
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1; // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
    ```

=== "TS"

    ```typescript title="quick_sort.ts"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    quickSort(nums: number[], left: number, right: number): void {
        // Завершить, когда длина подмассива равна 1
        while (left < right) {
            // Операция разбиения с опорными указателями
            let pivot = this.partition(nums, left, right);
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1; // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
    ```

=== "Dart"

    ```dart title="quick_sort.dart"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    void quickSort(List<int> nums, int left, int right) {
      // Завершить, когда длина подмассива равна 1
      while (left < right) {
        // Операция разбиения с опорными указателями
        int pivot = _partition(nums, left, right);
        // Выполнить быструю сортировку для более короткого из двух подмассивов
        if (pivot - left < right - pivot) {
          quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
          left = pivot + 1; // Оставшийся неотсортированный диапазон: [pivot + 1, right]
        } else {
          quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
          right = pivot - 1; // Оставшийся неотсортированный диапазон: [left, pivot - 1]
        }
      }
    }
    ```

=== "Rust"

    ```rust title="quick_sort.rs"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // Завершить, когда длина подмассива равна 1
        while left < right {
            // Операция разбиения с опорными указателями
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1; // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
    ```

=== "C"

    ```c title="quick_sort.c"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    void quickSortTailCall(int nums[], int left, int right) {
        // Завершить, когда длина подмассива равна 1
        while (left < right) {
            // Операция разбиения с опорными указателями
            int pivot = partition(nums, left, right);
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left < right - pivot) {
                // Рекурсивно отсортировать левый подмассив
                quickSortTailCall(nums, left, pivot - 1);
                // Оставшийся неотсортированный диапазон: [pivot + 1, right]
                left = pivot + 1;
            } else {
                // Рекурсивно отсортировать правый подмассив
                quickSortTailCall(nums, pivot + 1, right);
                // Оставшийся неотсортированный диапазон: [left, pivot - 1]
                right = pivot - 1;
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="quick_sort.kt"
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
        // Завершить, когда длина подмассива равна 1
        var l = left
        var r = right
        while (l < r) {
            // Операция разбиения с опорными указателями
            val pivot = partition(nums, l, r)
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - l < r - pivot) {
                quickSort(nums, l, pivot - 1) // Рекурсивно отсортировать левый подмассив
                l = pivot + 1 // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, r) // Рекурсивно отсортировать правый подмассив
                r = pivot - 1 // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="quick_sort.rb"
=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Класс быстрой сортировки ###
class QuickSort
  class << self
    # ## Разбиение с опорными указателями ###
    def partition(nums, left, right)
      # Взять nums[left] в качестве опорного элемента
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Идти справа налево в поисках первого элемента меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Идти слева направо в поисках первого элемента больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    # ## Класс быстрой сортировки ###
    def quick_sort(nums, left, right)
      # Рекурсивно обрабатывать, пока длина подмассива не станет равной 1
      if left < right
        # Разбиение с опорными указателями
        pivot = partition(nums, left, right)
        # Рекурсивно обработать левый и правый подмассивы
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

# ## Класс быстрой сортировки (оптимизация медианой) ###
class QuickSortMedian
  class << self
    # ## Выбрать медиану из трех кандидатов ###
    def median_three(nums, left, mid, right)
      # Выбрать медиану из трех кандидатов
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m находится между l и r
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l находится между m и r
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    # ## Разбиение с опорными указателями (медиана трех) ###
    def partition(nums, left, right)
      # ## Использовать nums[left] как опорный элемент
      med = median_three(nums, left, (left + right) / 2, right)
      # Переместить медиану в крайний левый элемент массива
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Идти справа налево в поисках первого элемента меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Идти слева направо в поисках первого элемента больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    # ## Быстрая сортировка ###
    def quick_sort(nums, left, right)
      # Рекурсивно обрабатывать, пока длина подмассива не станет равной 1
      if left < right
        # Разбиение с опорными указателями
        pivot = partition(nums, left, right)
        # Рекурсивно обработать левый и правый подмассивы
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

# ## Класс быстрой сортировки (оптимизация глубины рекурсии) ###
class QuickSortTailCall
  class << self
    # ## Разбиение с опорными указателями ###
    def partition(nums, left, right)
      # Использовать nums[left] как опорный элемент
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Идти справа налево в поисках первого элемента меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Идти слева направо в поисках первого элемента больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    # ## Быстрая сортировка (оптимизация глубины рекурсии) ###
    def quick_sort(nums, left, right)
      # Рекурсивно обрабатывать, пока длина подмассива не станет равной 1
      while left < right
        # Разбиение с опорными указателями
        pivot = partition(nums, left, right)
        # Выполнить быструю сортировку для более короткого из двух подмассивов
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # Оставшийся неотсортированный диапазон: [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # Оставшийся неотсортированный диапазон: [left, pivot - 1]
        end
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%28i%2C%20j%29%20%3D%20%28left%2C%20right%29%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20%28nums%5Bi%5D%2C%20nums%5Bj%5D%29%20%3D%20%28nums%5Bj%5D%2C%20nums%5Bi%5D%29%0A%20%20%20%20%28nums%5Bi%5D%2C%20nums%5Bleft%5D%29%20%3D%20%28nums%5Bleft%5D%2C%20nums%5Bi%5D%29%0A%20%20%20%20return%20i%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%3A%0A%20%20%20%20while%20left%20%3C%20right%3A%0A%20%20%20%20%20%20%20%20pivot%20%3D%20partition%28nums%2C%20left%2C%20right%29%0A%20%20%20%20%20%20%20%20if%20pivot%20-%20left%20%3C%20right%20-%20pivot%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums%2C%20left%2C%20pivot%20-%201%29%0A%20%20%20%20%20%20%20%20%20%20%20%20left%20%3D%20pivot%20%2B%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums%2C%20pivot%20%2B%201%2C%20right%29%0A%20%20%20%20%20%20%20%20%20%20%20%20right%20%3D%20pivot%20-%201%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%204%2C%201%2C%200%2C%203%2C%205%5D%0A%20%20%20%20quick_sort%28nums%2C%200%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%27%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B1%D1%8B%D1%81%D1%82%D1%80%D0%BE%D0%B9%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%28%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B5%D0%B9%29%20nums%20%3D%27%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20partition%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%28i%2C%20j%29%20%3D%20%28left%2C%20right%29%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bj%5D%20%3E%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20%20%20%20%20while%20i%20%3C%20j%20and%20nums%5Bi%5D%20%3C%3D%20nums%5Bleft%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20%28nums%5Bi%5D%2C%20nums%5Bj%5D%29%20%3D%20%28nums%5Bj%5D%2C%20nums%5Bi%5D%29%0A%20%20%20%20%28nums%5Bi%5D%2C%20nums%5Bleft%5D%29%20%3D%20%28nums%5Bleft%5D%2C%20nums%5Bi%5D%29%0A%20%20%20%20return%20i%0A%0Adef%20quick_sort%28nums%3A%20list%5Bint%5D%2C%20left%3A%20int%2C%20right%3A%20int%29%3A%0A%20%20%20%20while%20left%20%3C%20right%3A%0A%20%20%20%20%20%20%20%20pivot%20%3D%20partition%28nums%2C%20left%2C%20right%29%0A%20%20%20%20%20%20%20%20if%20pivot%20-%20left%20%3C%20right%20-%20pivot%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums%2C%20left%2C%20pivot%20-%201%29%0A%20%20%20%20%20%20%20%20%20%20%20%20left%20%3D%20pivot%20%2B%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20quick_sort%28nums%2C%20pivot%20%2B%201%2C%20right%29%0A%20%20%20%20%20%20%20%20%20%20%20%20right%20%3D%20pivot%20-%201%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20nums%20%3D%20%5B2%2C%204%2C%201%2C%200%2C%203%2C%205%5D%0A%20%20%20%20quick_sort%28nums%2C%200%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%27%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B1%D1%8B%D1%81%D1%82%D1%80%D0%BE%D0%B9%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%28%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B9%20%D1%80%D0%B5%D0%BA%D1%83%D1%80%D1%81%D0%B8%D0%B5%D0%B9%29%20nums%20%3D%27%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>
