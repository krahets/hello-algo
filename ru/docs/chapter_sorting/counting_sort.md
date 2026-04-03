---
comments: true
---

# 11.9 &nbsp; Сортировка подсчетом

<u>Сортировка подсчетом (counting sort)</u> реализует сортировку за счет подсчета количества вхождений элементов и обычно используется для массивов целых чисел.

## 11.9.1 &nbsp; Простая реализация

Сначала рассмотрим простой пример. Дан массив `nums` длины $n$ , элементы которого являются "неотрицательными целыми числами". Общий процесс сортировки подсчетом показан на рисунке 11-16.

1. Пройти по массиву, найти в нем максимальное число, обозначить его как $m$ , а затем создать вспомогательный массив `counter` длины $m + 1$ .
2. **С помощью `counter` подсчитать, сколько раз каждое число встречается в `nums`**; при этом `counter[num]` хранит число вхождений значения `num` . Делается это просто: достаточно пройти по `nums` (пусть текущее число равно `num` ) и на каждом шаге увеличить `counter[num]` на $1$ .
3. **Поскольку индексы массива `counter` изначально упорядочены, можно считать, что все числа уже отсортированы**. Далее остается пройти по `counter` и в соответствии с числом вхождений записать значения обратно в `nums` в порядке возрастания.

![Процесс сортировки подсчетом](counting_sort.assets/counting_sort_overview.png){ class="animation-figure" }

<p align="center"> Рисунок 11-16 &nbsp; Процесс сортировки подсчетом </p>

Код приведен ниже:

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort_naive(nums: list[int]):
        """Сортировка подсчетом"""
        # Простая реализация, не подходит для сортировки объектов
        # 1. Найти максимальный элемент массива m
        m = max(nums)
        # 2. Подсчитать число появлений каждой цифры
        # counter[num] обозначает число появлений num
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. Обойти counter и заполнить исходный массив nums элементами
        i = 0
        for num in range(m + 1):
            for _ in range(counter[num]):
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    void countingSortNaive(vector<int> &nums) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    void countingSortNaive(int[] nums) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    void CountingSortNaive(int[] nums) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Go"

    ```go title="counting_sort.go"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    func countingSortNaive(nums []int) {
        // 1. Найти максимальный элемент массива m
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        for i, num := 0, 0; num < m+1; num++ {
            for j := 0; j < counter[num]; j++ {
                nums[i] = num
                i++
            }
        }
    }
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    func countingSortNaive(nums: inout [Int]) {
        // 1. Найти максимальный элемент массива m
        let m = nums.max()!
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        var i = 0
        for num in 0 ..< m + 1 {
            for _ in 0 ..< counter[num] {
                nums[i] = num
                i += 1
            }
        }
    }
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    function countingSortNaive(nums) {
        // 1. Найти максимальный элемент массива m
        let m = Math.max(...nums);
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        let i = 0;
        for (let num = 0; num < m + 1; num++) {
            for (let j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    function countingSortNaive(nums: number[]): void {
        // 1. Найти максимальный элемент массива m
        let m: number = Math.max(...nums);
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        let i = 0;
        for (let num = 0; num < m + 1; num++) {
            for (let j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    void countingSortNaive(List<int> nums) {
      // 1. Найти максимальный элемент массива m
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. Подсчитать число появлений каждой цифры
      // counter[_num] обозначает число появлений _num
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. Обойти counter и заполнить исходный массив nums элементами
      int i = 0;
      for (int _num = 0; _num < m + 1; _num++) {
        for (int j = 0; j < counter[_num]; j++, i++) {
          nums[i] = _num;
        }
      }
    }
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    fn counting_sort_naive(nums: &mut [i32]) {
        // 1. Найти максимальный элемент массива m
        let m = *nums.iter().max().unwrap();
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        let mut counter = vec![0; m as usize + 1];
        for &num in nums.iter() {
            counter[num as usize] += 1;
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        let mut i = 0;
        for num in 0..m + 1 {
            for _ in 0..counter[num as usize] {
                nums[i] = num;
                i += 1;
            }
        }
    }
    ```

=== "C"

    ```c title="counting_sort.c"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    void countingSortNaive(int nums[], int size) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        int *counter = calloc(m + 1, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
        // 4. Освободить память
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    fun countingSortNaive(nums: IntArray) {
        // 1. Найти максимальный элемент массива m
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        var i = 0
        for (num in 0..<m + 1) {
            var j = 0
            while (j < counter[num]) {
                nums[i] = num
                j++
                i++
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    ### Сортировка подсчетом ###
    def counting_sort_naive(nums)
      # Простая реализация, не подходит для сортировки объектов
      # 1. Найти максимальный элемент массива m
      m = 0
      nums.each { |num| m = [m, num].max }
      # 2. Подсчитать число появлений каждой цифры
      # counter[num] обозначает число появлений num
      counter = Array.new(m + 1, 0)
      nums.each { |num| counter[num] += 1 }
      # 3. Обойти counter и заполнить исходный массив nums элементами
      i = 0
      for num in 0...(m + 1)
        (0...counter[num]).each do
          nums[i] = num
          i += 1
        end
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%A1%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%BF%D0%BE%D0%B4%D1%81%D1%87%D0%B5%D1%82%D0%BE%D0%BC%22%22%22%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D1%81%D1%82%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%2C%20%D0%BD%D0%B5%20%D0%BF%D0%BE%D0%B4%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B4%D0%BB%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%BE%D0%B2%0A%20%20%20%20%23%201.%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20m%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m%2C%20num%29%0A%20%20%20%20%23%202.%20%D0%9F%D0%BE%D0%B4%D1%81%D1%87%D0%B8%D1%82%D0%B0%D1%82%D1%8C%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%BA%D0%B0%D0%B6%D0%B4%D0%BE%D0%B9%20%D1%86%D0%B8%D1%84%D1%80%D1%8B%0A%20%20%20%20%23%20counter%5Bnum%5D%20%D0%BE%D0%B1%D0%BE%D0%B7%D0%BD%D0%B0%D1%87%D0%B0%D0%B5%D1%82%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%20num%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%20counter%20%D0%B8%20%D0%B7%D0%B0%D0%BF%D0%BE%D0%BB%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1%2C%200%2C%201%2C%202%2C%200%2C%204%2C%200%2C%202%2C%202%2C%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D0%BF%D0%BE%D0%B4%D1%81%D1%87%D0%B5%D1%82%D0%BE%D0%BC%20%28%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D1%8B%20%D0%BD%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B6%D0%B8%D0%B2%D0%B0%D1%8E%D1%82%D1%81%D1%8F%29%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%A1%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%BF%D0%BE%D0%B4%D1%81%D1%87%D0%B5%D1%82%D0%BE%D0%BC%22%22%22%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D1%81%D1%82%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%2C%20%D0%BD%D0%B5%20%D0%BF%D0%BE%D0%B4%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B4%D0%BB%D1%8F%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%BE%D0%B2%0A%20%20%20%20%23%201.%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20m%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m%2C%20num%29%0A%20%20%20%20%23%202.%20%D0%9F%D0%BE%D0%B4%D1%81%D1%87%D0%B8%D1%82%D0%B0%D1%82%D1%8C%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%BA%D0%B0%D0%B6%D0%B4%D0%BE%D0%B9%20%D1%86%D0%B8%D1%84%D1%80%D1%8B%0A%20%20%20%20%23%20counter%5Bnum%5D%20%D0%BE%D0%B1%D0%BE%D0%B7%D0%BD%D0%B0%D1%87%D0%B0%D0%B5%D1%82%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%20num%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%20counter%20%D0%B8%20%D0%B7%D0%B0%D0%BF%D0%BE%D0%BB%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1%2C%200%2C%201%2C%202%2C%200%2C%204%2C%200%2C%202%2C%202%2C%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D0%BF%D0%BE%D0%B4%D1%81%D1%87%D0%B5%D1%82%D0%BE%D0%BC%20%28%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D1%8B%20%D0%BD%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B6%D0%B8%D0%B2%D0%B0%D1%8E%D1%82%D1%81%D1%8F%29%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

!!! note "Связь между сортировкой подсчетом и блочной сортировкой"

    Если посмотреть на сортировку подсчетом с точки зрения блочной сортировки, то каждый индекс массива `counter` можно рассматривать как отдельный блок, а процесс подсчета - как распределение элементов по соответствующим блокам. Иными словами, сортировка подсчетом является частным случаем блочной сортировки для целочисленных данных.

## 11.9.2 &nbsp; Полная реализация

Внимательный читатель мог заметить, что **если входные данные представлены объектами, то описанный выше шаг `3.` перестает работать**. Например, если входными данными являются объекты товаров и мы хотим отсортировать их по цене (полю класса), то описанный алгоритм сможет выдать только отсортированный ряд цен, но не исходные объекты в нужном порядке.

Как же получить корректный порядок исходных данных? Сначала вычислим "префиксную сумму" массива `counter` . Как следует из названия, префиксная сумма в индексе `i` , обозначаемая как `prefix[i]` , равна сумме первых `i` элементов массива:

$$
\text{prefix}[i] = \sum_{j=0}^i \text{counter[j]}
$$

**Префиксная сумма имеет четкий смысл: `prefix[num] - 1` обозначает индекс последнего вхождения элемента `num` в результирующем массиве `res`**. Это очень важная информация, потому что она указывает, в какую позицию результирующего массива должен попасть каждый элемент. Далее мы проходим исходный массив `nums` в обратном порядке и на каждой итерации для очередного элемента `num` выполняем два действия.

1. Записать `num` в массив `res` по индексу `prefix[num] - 1` .
2. Уменьшить префиксную сумму `prefix[num]` на $1$ , чтобы получить индекс следующего размещения элемента `num` .

После завершения прохода массив `res` будет содержать отсортированный результат; остается только переписать `res` обратно в `nums` . Полный процесс сортировки подсчетом показан на рисунке 11-17.

=== "<1>"
    ![Шаги сортировки подсчетом](counting_sort.assets/counting_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![counting_sort_step2](counting_sort.assets/counting_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![counting_sort_step3](counting_sort.assets/counting_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![counting_sort_step4](counting_sort.assets/counting_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![counting_sort_step5](counting_sort.assets/counting_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![counting_sort_step6](counting_sort.assets/counting_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![counting_sort_step7](counting_sort.assets/counting_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![counting_sort_step8](counting_sort.assets/counting_sort_step8.png){ class="animation-figure" }

<p align="center"> Рисунок 11-17 &nbsp; Шаги сортировки подсчетом </p>

Код реализации сортировки подсчетом приведен ниже:

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort(nums: list[int]):
        """Сортировка подсчетом"""
        # Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
        # 1. Найти максимальный элемент массива m
        m = max(nums)
        # 2. Подсчитать число появлений каждой цифры
        # counter[num] обозначает число появлений num
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        # То есть counter[num]-1 — это индекс последнего появления num в res
        for i in range(m):
            counter[i + 1] += counter[i]
        # 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        # Инициализировать массив res для хранения результата
        n = len(nums)
        res = [0] * n
        for i in range(n - 1, -1, -1):
            num = nums[i]
            res[counter[num] - 1] = num  # Поместить num по соответствующему индексу
            counter[num] -= 1  # Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        # Перезаписать исходный массив nums массивом результата res
        for i in range(n):
            nums[i] = res[i]
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    void countingSort(vector<int> &nums) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        int n = nums.size();
        vector<int> res(n);
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
            counter[num]--;              // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        nums = res;
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    void countingSort(int[] nums) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
            counter[num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    void CountingSort(int[] nums) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
            counter[num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Go"

    ```go title="counting_sort.go"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    func countingSort(nums []int) {
        // 1. Найти максимальный элемент массива m
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for i := 0; i < m; i++ {
            counter[i+1] += counter[i]
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        n := len(nums)
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            num := nums[i]
            // Поместить num по соответствующему индексу
            res[counter[num]-1] = num
            // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
            counter[num]--
        }
        // Перезаписать исходный массив nums массивом результата res
        copy(nums, res)
    }
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    func countingSort(nums: inout [Int]) {
        // 1. Найти максимальный элемент массива m
        let m = nums.max()!
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for i in 0 ..< m {
            counter[i + 1] += counter[i]
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let num = nums[i]
            res[counter[num] - 1] = num // Поместить num по соответствующему индексу
            counter[num] -= 1 // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        for i in nums.indices {
            nums[i] = res[i]
        }
    }
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    function countingSort(nums) {
        // 1. Найти максимальный элемент массива m
        let m = Math.max(...nums);
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        const n = nums.length;
        const res = new Array(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
            counter[num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    function countingSort(nums: number[]): void {
        // 1. Найти максимальный элемент массива m
        let m: number = Math.max(...nums);
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        const n = nums.length;
        const res: number[] = new Array<number>(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
            counter[num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    void countingSort(List<int> nums) {
      // 1. Найти максимальный элемент массива m
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. Подсчитать число появлений каждой цифры
      // counter[_num] обозначает число появлений _num
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
      // То есть counter[_num]-1 — это индекс последнего появления _num в res
      for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
      }
      // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
      // Инициализировать массив res для хранения результата
      int n = nums.length;
      List<int> res = List.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int _num = nums[i];
        res[counter[_num] - 1] = _num; // Поместить _num по соответствующему индексу
        counter[_num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения _num
      }
      // Перезаписать исходный массив nums массивом результата res
      nums.setAll(0, res);
    }
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    fn counting_sort(nums: &mut [i32]) {
        // 1. Найти максимальный элемент массива m
        let m = *nums.iter().max().unwrap() as usize;
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        let mut counter = vec![0; m + 1];
        for &num in nums.iter() {
            counter[num as usize] += 1;
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for i in 0..m {
            counter[i + 1] += counter[i];
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        let n = nums.len();
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let num = nums[i];
            res[counter[num as usize] - 1] = num; // Поместить num по соответствующему индексу
            counter[num as usize] -= 1; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        nums.copy_from_slice(&res)
    }
    ```

=== "C"

    ```c title="counting_sort.c"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    void countingSort(int nums[], int size) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        int *counter = calloc(m, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        int *res = malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
            counter[num]--;              // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        memcpy(nums, res, size * sizeof(int));
        // 5. Освободить память
        free(res);
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    fun countingSort(nums: IntArray) {
        // 1. Найти максимальный элемент массива m
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for (i in 0..<m) {
            counter[i + 1] += counter[i]
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        val n = nums.size
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val num = nums[i]
            res[counter[num] - 1] = num // Поместить num по соответствующему индексу
            counter[num]-- // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        for (i in 0..<n) {
            nums[i] = res[i]
        }
    }
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    ### Сортировка подсчетом ###
    def counting_sort(nums)
      # Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
      # 1. Найти максимальный элемент массива m
      m = nums.max
      # 2. Подсчитать число появлений каждой цифры
      # counter[num] обозначает число появлений num
      counter = Array.new(m + 1, 0)
      nums.each { |num| counter[num] += 1 }
      # 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
      # То есть counter[num]-1 — это индекс последнего появления num в res
      (0...m).each { |i| counter[i + 1] += counter[i] }
      # 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
      # Инициализировать массив res для хранения результата
      n = nums.length
      res = Array.new(n, 0)
      (n - 1).downto(0).each do |i|
        num = nums[i]
        res[counter[num] - 1] = num # Поместить num по соответствующему индексу
        counter[num] -= 1 # Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
      end
      # Перезаписать исходный массив nums массивом результата res
      (0...n).each { |i| nums[i] = res[i] }
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%A1%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%BF%D0%BE%D0%B4%D1%81%D1%87%D0%B5%D1%82%D0%BE%D0%BC%22%22%22%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%2C%20%D0%BF%D0%BE%D0%B7%D0%B2%D0%BE%D0%BB%D1%8F%D0%B5%D1%82%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D1%8B%20%D0%B8%20%D1%8F%D0%B2%D0%BB%D1%8F%D0%B5%D1%82%D1%81%D1%8F%20%D1%81%D1%82%D0%B0%D0%B1%D0%B8%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%BE%D0%B9%0A%20%20%20%20%23%201.%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20m%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20%D0%9F%D0%BE%D0%B4%D1%81%D1%87%D0%B8%D1%82%D0%B0%D1%82%D1%8C%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%BA%D0%B0%D0%B6%D0%B4%D0%BE%D0%B9%20%D1%86%D0%B8%D1%84%D1%80%D1%8B%0A%20%20%20%20%23%20counter%5Bnum%5D%20%D0%BE%D0%B1%D0%BE%D0%B7%D0%BD%D0%B0%D1%87%D0%B0%D0%B5%D1%82%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%20num%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D1%84%D0%B8%D0%BA%D1%81%D0%BD%D1%8B%D0%B5%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20counter%20%D0%B8%20%D0%BF%D1%80%D0%B5%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%C2%AB%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%C2%BB%20%D0%B2%20%C2%AB%D0%BA%D0%BE%D0%BD%D0%B5%D1%87%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%C2%BB%0A%20%20%20%20%23%20%D0%A2%D0%BE%20%D0%B5%D1%81%D1%82%D1%8C%20counter%5Bnum%5D-1%20%E2%80%94%20%D1%8D%D1%82%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BD%D0%B5%D0%B3%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20num%20%D0%B2%20res%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%20nums%20%D0%B2%20%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D0%BE%D0%BC%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B5%20%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B8%D1%80%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20res%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20res%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D0%B0%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%20-1%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20num%20%D0%BF%D0%BE%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D1%8E%D1%89%D0%B5%D0%BC%D1%83%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20%D0%A3%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D1%84%D0%B8%D0%BA%D1%81%D0%BD%D1%83%D1%8E%20%D1%81%D1%83%D0%BC%D0%BC%D1%83%20%D0%BD%D0%B0%201%2C%20%D1%87%D1%82%D0%BE%D0%B1%D1%8B%20%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B5%D0%B3%D0%BE%20%D1%80%D0%B0%D0%B7%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D1%8F%20num%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%BE%D0%BC%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D0%B0%20res%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1%2C%200%2C%201%2C%202%2C%200%2C%204%2C%200%2C%202%2C%202%2C%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D0%BF%D0%BE%D0%B4%D1%81%D1%87%D0%B5%D1%82%D0%BE%D0%BC%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%A1%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%BF%D0%BE%D0%B4%D1%81%D1%87%D0%B5%D1%82%D0%BE%D0%BC%22%22%22%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%2C%20%D0%BF%D0%BE%D0%B7%D0%B2%D0%BE%D0%BB%D1%8F%D0%B5%D1%82%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D1%8B%20%D0%B8%20%D1%8F%D0%B2%D0%BB%D1%8F%D0%B5%D1%82%D1%81%D1%8F%20%D1%81%D1%82%D0%B0%D0%B1%D0%B8%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%BE%D0%B9%0A%20%20%20%20%23%201.%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20m%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20%D0%9F%D0%BE%D0%B4%D1%81%D1%87%D0%B8%D1%82%D0%B0%D1%82%D1%8C%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%20%D0%BA%D0%B0%D0%B6%D0%B4%D0%BE%D0%B9%20%D1%86%D0%B8%D1%84%D1%80%D1%8B%0A%20%20%20%20%23%20counter%5Bnum%5D%20%D0%BE%D0%B1%D0%BE%D0%B7%D0%BD%D0%B0%D1%87%D0%B0%D0%B5%D1%82%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%20num%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%D0%92%D1%8B%D1%87%D0%B8%D1%81%D0%BB%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D1%84%D0%B8%D0%BA%D1%81%D0%BD%D1%8B%D0%B5%20%D1%81%D1%83%D0%BC%D0%BC%D1%8B%20counter%20%D0%B8%20%D0%BF%D1%80%D0%B5%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%C2%AB%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B9%C2%BB%20%D0%B2%20%C2%AB%D0%BA%D0%BE%D0%BD%D0%B5%D1%87%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%C2%BB%0A%20%20%20%20%23%20%D0%A2%D0%BE%20%D0%B5%D1%81%D1%82%D1%8C%20counter%5Bnum%5D-1%20%E2%80%94%20%D1%8D%D1%82%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BD%D0%B5%D0%B3%D0%BE%20%D0%BF%D0%BE%D1%8F%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20num%20%D0%B2%20res%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20%D0%9E%D0%B1%D0%BE%D0%B9%D1%82%D0%B8%20nums%20%D0%B2%20%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D0%BE%D0%BC%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B5%20%D0%B8%20%D0%BF%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B8%D1%80%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20res%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20res%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D0%B0%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%2C%20-1%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20num%20%D0%BF%D0%BE%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D1%8E%D1%89%D0%B5%D0%BC%D1%83%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20%D0%A3%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B5%D1%84%D0%B8%D0%BA%D1%81%D0%BD%D1%83%D1%8E%20%D1%81%D1%83%D0%BC%D0%BC%D1%83%20%D0%BD%D0%B0%201%2C%20%D1%87%D1%82%D0%BE%D0%B1%D1%8B%20%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B5%D0%B3%D0%BE%20%D1%80%D0%B0%D0%B7%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D1%8F%20num%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D1%82%D1%8C%20%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%BE%D0%BC%20%D1%80%D0%B5%D0%B7%D1%83%D0%BB%D1%8C%D1%82%D0%B0%D1%82%D0%B0%20res%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1%2C%200%2C%201%2C%202%2C%200%2C%204%2C%200%2C%202%2C%202%2C%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D0%BF%D0%BE%D0%B4%D1%81%D1%87%D0%B5%D1%82%D0%BE%D0%BC%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 11.9.3 &nbsp; Характеристики алгоритма

- **Временная сложность равна $O(n + m)$, алгоритм не является адаптивным** : необходимо пройти по `nums` и по `counter` , а оба этих прохода занимают линейное время. Обычно выполняется $n \gg m$ , поэтому временная сложность стремится к $O(n)$ .
- **Пространственная сложность равна $O(n + m)$, сортировка не выполняется на месте**: используются массивы `res` и `counter` длины $n$ и $m$ соответственно.
- **Стабильная сортировка**: порядок заполнения `res` идет "справа налево", поэтому обратный проход по `nums` позволяет сохранить относительный порядок равных элементов и тем самым реализовать стабильную сортировку. Вообще говоря, прямой проход по `nums` тоже даст правильный результат сортировки, но он будет нестабильным.

## 11.9.4 &nbsp; Ограничения

На этом этапе сортировка подсчетом может показаться очень изящной: она позволяет эффективно сортировать данные, опираясь только на подсчет числа вхождений. Однако условия ее применения довольно строгие.

**Сортировка подсчетом применима только к неотрицательным целым числам**. Чтобы использовать ее для других типов данных, нужно убедиться, что эти данные можно преобразовать в неотрицательные целые числа и что при преобразовании относительный порядок элементов не изменится. Например, для массива целых чисел с отрицательными значениями можно сначала прибавить ко всем числам константу, превратив их в положительные, затем выполнить сортировку и после этого преобразовать значения обратно.

**Сортировка подсчетом подходит для случаев, когда объем данных велик, но диапазон значений невелик**. Например, в приведенном выше примере $m$ не должно быть слишком большим, иначе будет занято слишком много памяти. А когда $n \ll m$ , сортировка подсчетом использует $O(m)$ времени и может оказаться медленнее, чем алгоритмы сортировки с $O(n \log n)$ .
