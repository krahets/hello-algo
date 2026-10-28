---
comments: true
---

# 4.1 &nbsp; Массив

<u>Массив (array)</u> представляет собой линейную структуру данных, в которой элементы одного типа хранятся в непрерывной области памяти. Положение элемента в массиве называется его <u>индексом (index)</u>. На рисунке 4-1 изображены основные понятия и способ хранения массивов.

![Определение и способ хранения массива](array.assets/array_definition.png){ class="animation-figure" }

<p align="center"> Рисунок 4-1 &nbsp; Определение и способ хранения массива </p>

## 4.1.1 &nbsp; Основные операции с массивом

### 1. &nbsp; Инициализация массива

Существует два способа инициализации массива: без начальных значений и с заданными начальными значениями. Если начальные значения не указаны, большинство языков программирования инициализируют элементы массива нулями:

=== "Python"

    ```python title="array.py"
    # Инициализация массива
    arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Инициализация массива */
    // Хранится в стеке
    int arr[5] = {};
    int nums[5] = { 1, 3, 2, 5, 4 };
    // Хранится в куче (требуется ручное освобождение памяти)
    int* arr1 = new int[5] {};
    int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="array.java"
    /* Инициализация массива */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Инициализация массива */
    int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
    int[] nums = [1, 3, 2, 5, 4];
    ```

=== "Go"

    ```go title="array.go"
    /* Инициализация массива */
    var arr [5]int
    // В Go указание длины ([5]int) создает массив, а отсутствие длины ([]int) - срез
    // Поскольку длина массива в Go определяется на этапе компиляции, для задания длины можно использовать только константы
    // Чтобы упростить реализацию метода extend(), ниже будем рассматривать срезы (Slice) как массивы (Array)
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Инициализация массива */
    let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
    let nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="array.js"
    /* Инициализация массива */
    var arr = new Array(5).fill(0);
    var nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Инициализация массива */
    let arr: number[] = new Array(5).fill(0);
    let nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Инициализация массива */
    List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Инициализация массива */
    let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
    let slice: &[i32] = &[0; 5];
    // В Rust указание длины ([i32; 5]) создает массив, а отсутствие длины (&[i32]) - срез
    // Поскольку длина массива в Rust определяется на этапе компиляции, для задания длины можно использовать только константы
    // Vector в Rust обычно используется как динамический массив
    // Чтобы упростить реализацию метода extend(), ниже будем рассматривать vector как массив (array)
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="array.c"
    /* Инициализация массива */
    int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
    int nums[5] = { 1, 3, 2, 5, 4 };
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Инициализация массива */
    var arr = IntArray(5) // { 0, 0, 0, 0, 0 }
    var nums = intArrayOf(1, 3, 2, 5, 4)
    ```

=== "Ruby"

    ```ruby title="array.rb"
    # Инициализация массива
    arr = Array.new(5, 0)
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 243px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация кода" src="https://pythontutor.com/iframe-embed.html#code=%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200%2C%200%2C%200%2C%200%2C%200%20%5D%0Anums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200%2C%200%2C%200%2C%200%2C%200%20%5D%0Anums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 2. &nbsp; Доступ к элементам

Элементы массива хранятся в непрерывной области памяти, что упрощает вычисление их адресов. Зная адрес массива (адрес первого элемента) и индекс элемента, можно вычислить адрес этого элемента по формуле, показанной на рисунке 4-2, и получить к нему доступ.

![Вычисление адреса элемента массива](array.assets/array_memory_location_calculation.png){ class="animation-figure" }

<p align="center"> Рисунок 4-2 &nbsp; Вычисление адреса элемента массива </p>

Как видно из рисунка выше, индекс первого элемента массива равен $0$ , что может показаться неочевидным, так как отсчет с $1$ кажется более естественным. Однако с точки зрения формулы вычисления адреса **индекс является смещением адреса в памяти**. Смещение адреса первого элемента равно $0$ , поэтому и его индекс равен $0$.

Доступ к элементам массива осуществляется очень эффективно, так как позволяет за время $O(1)$ произвольно обращаться к любому элементу.

=== "Python"

    ```python title="array.py"
    def random_access(nums: list[int]) -> int:
        """Случайный доступ к элементу"""
        # Случайный выбор числа из диапазона [0, len(nums)-1]
        random_index = random.randint(0, len(nums) - 1)
        # Получить и вернуть случайный элемент
        random_num = nums[random_index]
        return random_num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Случайный доступ к элементу */
    int randomAccess(int *nums, int size) {
        // Случайный выбор числа из диапазона [0, size)
        int randomIndex = rand() % size;
        // Получить и вернуть случайный элемент
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Случайный доступ к элементу */
    int randomAccess(int[] nums) {
        // Случайный выбор числа из диапазона [0, nums.length)
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // Получить и вернуть случайный элемент
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Случайный доступ к элементу */
    int RandomAccess(int[] nums) {
        Random random = new();
        // Случайный выбор числа из диапазона [0, nums.Length)
        int randomIndex = random.Next(nums.Length);
        // Получить и вернуть случайный элемент
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Случайный доступ к элементу */
    func randomAccess(nums []int) (randomNum int) {
        // Случайный выбор числа из диапазона [0, nums.length)
        randomIndex := rand.Intn(len(nums))
        // Получить и вернуть случайный элемент
        randomNum = nums[randomIndex]
        return
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Случайный доступ к элементу */
    func randomAccess(nums: [Int]) -> Int {
        // Случайный выбор числа из диапазона [0, nums.count)
        let randomIndex = nums.indices.randomElement()!
        // Получить и вернуть случайный элемент
        let randomNum = nums[randomIndex]
        return randomNum
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Случайный доступ к элементу */
    function randomAccess(nums) {
        // Случайный выбор числа из диапазона [0, nums.length)
        const random_index = Math.floor(Math.random() * nums.length);
        // Получить и вернуть случайный элемент
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Случайный доступ к элементу */
    function randomAccess(nums: number[]): number {
        // Случайный выбор числа из диапазона [0, nums.length)
        const random_index = Math.floor(Math.random() * nums.length);
        // Получить и вернуть случайный элемент
        const random_num = nums[random_index];
        return random_num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Случайный доступ к элементу */
    int randomAccess(List<int> nums) {
      // Случайный выбор числа из диапазона [0, nums.length)
      int randomIndex = Random().nextInt(nums.length);
      // Получить и вернуть случайный элемент
      int randomNum = nums[randomIndex];
      return randomNum;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Случайный доступ к элементу */
    fn random_access(nums: &[i32]) -> i32 {
        // Случайный выбор числа из диапазона [0, nums.len())
        let random_index = rand::thread_rng().gen_range(0..nums.len());
        // Получить и вернуть случайный элемент
        let random_num = nums[random_index];
        random_num
    }
    ```

=== "C"

    ```c title="array.c"
    /* Случайный доступ к элементу */
    int randomAccess(int *nums, int size) {
        // Случайный выбор числа из диапазона [0, size)
        int randomIndex = rand() % size;
        // Получить и вернуть случайный элемент
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Случайный доступ к элементу */
    fun randomAccess(nums: IntArray): Int {
        // Случайный выбор числа из диапазона [0, nums.size)
        val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
        // Получить и вернуть случайный элемент
        val randomNum = nums[randomIndex]
        return randomNum
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Случайный доступ к элементу ###
    def random_access(nums)
      # Случайный выбор числа из диапазона [0, nums.length)
      random_index = Random.rand(0...nums.length)

      # Получить и вернуть случайный элемент
      nums[random_index]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация кода" src="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_access%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%D0%B8%D0%B7%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%D0%B0%20%5B0%2C%20len%28nums%29-1%5D%0A%20%20%20%20random_index%20%3D%20random.randint%280%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20random_num%20%3D%20nums%5Brandom_index%5D%0A%20%20%20%20return%20random_num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%0A%20%20%20%20random_num%3A%20int%20%3D%20random_access%28nums%29%0A%20%20%20%20print%28%22%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20nums%20%3D%22%2C%20random_num%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_access%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D0%B2%D1%8B%D0%B1%D0%BE%D1%80%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%D0%B8%D0%B7%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%D0%B0%20%5B0%2C%20len%28nums%29-1%5D%0A%20%20%20%20random_index%20%3D%20random.randint%280%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20random_num%20%3D%20nums%5Brandom_index%5D%0A%20%20%20%20return%20random_num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%0A%20%20%20%20random_num%3A%20int%20%3D%20random_access%28nums%29%0A%20%20%20%20print%28%22%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20nums%20%3D%22%2C%20random_num%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 3. &nbsp; Вставка элемента

Элементы массива в памяти расположены вплотную, между ними нет места для хранения других данных. Для вставки элемента в середину массива необходимо сдвинуть все последующие элементы на одну позицию вправо, а затем присвоить значение элементу по заданному индексу, как показано на рисунке 4-3.

![Пример вставки элемента в массив](array.assets/array_insert_element.png){ class="animation-figure" }

<p align="center"> Рисунок 4-3 &nbsp; Пример вставки элемента в массив </p>

Стоит отметить, что длина массива фиксирована, поэтому вставка элемента неизбежно приведет к потере элемента на конце массива. Решение этой проблемы будет рассмотрено в разделе «Список».

=== "Python"

    ```python title="array.py"
    def insert(nums: list[int], num: int, index: int):
        """Вставка элемента num в массив по индексу index"""
        # Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for i in range(len(nums) - 1, index, -1):
            nums[i] = nums[i - 1]
        # Присвоить num элементу по индексу index
        nums[index] = num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Вставка элемента num в массив по индексу index */
    void insert(int *nums, int size, int num, int index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Вставка элемента num в массив по индексу index */
    void insert(int[] nums, int num, int index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Вставка элемента num в массив по индексу index */
    void Insert(int[] nums, int num, int index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Вставка элемента num в массив по индексу index */
    func insert(nums []int, num int, index int) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for i := len(nums) - 1; i > index; i-- {
            nums[i] = nums[i-1]
        }
        // Присвоить num элементу по индексу index
        nums[index] = num
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Вставка элемента num в массив по индексу index */
    func insert(nums: inout [Int], num: Int, index: Int) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for i in stride(from: nums.count - 1, to: index, by: -1) {
            nums[i] = nums[i - 1]
        }
        // Присвоить num элементу по индексу index
        nums[index] = num
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Вставка элемента num в массив по индексу index */
    function insert(nums, num, index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Вставка элемента num в массив по индексу index */
    function insert(nums: number[], num: number, index: number): void {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Вставка элемента _num в массив по индексу index */
    void insert(List<int> nums, int _num, int index) {
      // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
      for (var i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
      }
      // Присвоить _num элементу по индексу index
      nums[index] = _num;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Вставка элемента num в массив по индексу index */
    fn insert(nums: &mut [i32], num: i32, index: usize) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for i in (index + 1..nums.len()).rev() {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "C"

    ```c title="array.c"
    /* Вставка элемента num в массив по индексу index */
    void insert(int *nums, int size, int num, int index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Вставка элемента num в массив по индексу index */
    fun insert(nums: IntArray, num: Int, index: Int) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
        for (i in nums.size - 1 downTo index + 1) {
            nums[i] = nums[i - 1]
        }
        // Присвоить num элементу по индексу index
        nums[index] = num
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Вставка элемента num в массив по индексу index ###
    def insert(nums, num, index)
      # Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
      for i in (nums.length - 1).downto(index + 1)
        nums[i] = nums[i - 1]
      end

      # Присвоить num элементу по индексу index
      nums[index] = num
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация кода" src="https://pythontutor.com/iframe-embed.html#code=def%20insert%28nums%3A%20list%5Bint%5D%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20num%20%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%20index%20%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BD%D0%B0%20%D0%BE%D0%B4%D0%BD%D1%83%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D0%B2%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%2C%20index%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20-%201%5D%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B8%D1%81%D0%B2%D0%BE%D0%B8%D1%82%D1%8C%20num%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%0A%20%20%20%20nums%5Bindex%5D%20%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20insert%28nums%2C%206%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%206%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%203%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20insert%28nums%3A%20list%5Bint%5D%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20num%20%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%20index%20%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BD%D0%B0%20%D0%BE%D0%B4%D0%BD%D1%83%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D0%B2%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%2C%20index%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20-%201%5D%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B8%D1%81%D0%B2%D0%BE%D0%B8%D1%82%D1%8C%20num%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%0A%20%20%20%20nums%5Bindex%5D%20%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20insert%28nums%2C%206%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%206%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%203%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 4. &nbsp; Удаление элемента

Аналогично для удаления элемента по индексу $i$ необходимо сдвинуть все элементы после индекса $i$ на одну позицию влево, как показано на рисунке 4-4.

![Пример удаления элемента из массива](array.assets/array_remove_element.png){ class="animation-figure" }

<p align="center"> Рисунок 4-4 &nbsp; Пример удаления элемента из массива </p>

Обратите внимание, что после удаления элемента последний элемент становится бессмысленным, поэтому его можно не изменять.

=== "Python"

    ```python title="array.py"
    def remove(nums: list[int], index: int):
        """Удаление элемента по индексу index"""
        # Сдвинуть все элементы после индекса index на одну позицию влево
        for i in range(index, len(nums) - 1):
            nums[i] = nums[i + 1]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Удаление элемента по индексу index */
    void remove(int *nums, int size, int index) {
        // Сдвинуть все элементы после индекса index на одну позицию влево
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Удаление элемента по индексу index */
    void remove(int[] nums, int index) {
        // Сдвинуть все элементы после индекса index на одну позицию влево
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Удаление элемента по индексу index */
    void Remove(int[] nums, int index) {
        // Сдвинуть все элементы после индекса index на одну позицию влево
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Удаление элемента по индексу index */
    func remove(nums []int, index int) {
        // Сдвинуть все элементы после индекса index на одну позицию влево
        for i := index; i < len(nums)-1; i++ {
            nums[i] = nums[i+1]
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Удаление элемента по индексу index */
    func remove(nums: inout [Int], index: Int) {
        // Сдвинуть все элементы после индекса index на одну позицию влево
        for i in nums.indices.dropFirst(index).dropLast() {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Удаление элемента по индексу index */
    function remove(nums, index) {
        // Сдвинуть все элементы после индекса index на одну позицию влево
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Удаление элемента по индексу index */
    function remove(nums: number[], index: number): void {
        // Сдвинуть все элементы после индекса index на одну позицию влево
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Удаление элемента по индексу index */
    void remove(List<int> nums, int index) {
      // Сдвинуть все элементы после индекса index на одну позицию влево
      for (var i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
      }
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Удаление элемента по индексу index */
    fn remove(nums: &mut [i32], index: usize) {
        // Сдвинуть все элементы после индекса index на одну позицию влево
        for i in index..nums.len() - 1 {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* Удаление элемента по индексу index */
    // Внимание: stdio.h уже использует ключевое слово remove
    void removeItem(int *nums, int size, int index) {
        // Сдвинуть все элементы после индекса index на одну позицию влево
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Удаление элемента по индексу index */
    fun remove(nums: IntArray, index: Int) {
        // Сдвинуть все элементы после индекса index на одну позицию влево
        for (i in index..<nums.size - 1) {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Удаление элемента по индексу index ###
    def remove(nums, index)
      # Сдвинуть все элементы после индекса index на одну позицию влево
      for i in index...(nums.length - 1)
        nums[i] = nums[i + 1]
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация кода" src="https://pythontutor.com/iframe-embed.html#code=def%20remove%28nums%3A%20list%5Bint%5D%2C%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8C%20%D0%B2%D1%81%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%20index%20%D0%BD%D0%B0%20%D0%BE%D0%B4%D0%BD%D1%83%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D0%B2%D0%BB%D0%B5%D0%B2%D0%BE%0A%20%20%20%20for%20i%20in%20range%28index%2C%20len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20%2B%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20remove%28nums%2C%202%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%202%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20remove%28nums%3A%20list%5Bint%5D%2C%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8C%20%D0%B2%D1%81%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%20index%20%D0%BD%D0%B0%20%D0%BE%D0%B4%D0%BD%D1%83%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D0%B2%D0%BB%D0%B5%D0%B2%D0%BE%0A%20%20%20%20for%20i%20in%20range%28index%2C%20len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20%2B%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20remove%28nums%2C%202%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%202%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

В целом операции вставки и удаления в массиве имеют следующие недостатки.

- **Высокая временная сложность**: средняя временная сложность операций вставки и удаления в массиве составляет $O(n)$ , где $n$ - длина массива.
- **Потеря элементов**: так как длина массива фиксирована, при вставке элемента элементы, выходящие за пределы длины массива, теряются.
- **Потери памяти**: можно заранее инициализировать более длинный массив и использовать только его переднюю часть. Тогда теряемые при вставке элементы на конце не будут нести смысла, но такой подход приводит к лишнему расходу памяти.

### 5. &nbsp; Обход массива

В большинстве языков программирования массив можно обходить как по индексам, так и непосредственно по элементам.

=== "Python"

    ```python title="array.py"
    def traverse(nums: list[int]):
        """Обход массива"""
        count = 0
        # Обход массива по индексам
        for i in range(len(nums)):
            count += nums[i]
        # Непосредственно обходить элементы массива
        for num in nums:
            count += num
        # Одновременно обходить индексы и элементы данных
        for i, num in enumerate(nums):
            count += nums[i]
            count += num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Обход массива */
    void traverse(int *nums, int size) {
        int count = 0;
        // Обход массива по индексам
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Обход массива */
    void traverse(int[] nums) {
        int count = 0;
        // Обход массива по индексам
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Непосредственно обходить элементы массива
        for (int num : nums) {
            count += num;
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Обход массива */
    void Traverse(int[] nums) {
        int count = 0;
        // Обход массива по индексам
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // Непосредственно обходить элементы массива
        foreach (int num in nums) {
            count += num;
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Обход массива */
    func traverse(nums []int) {
        count := 0
        // Обход массива по индексам
        for i := 0; i < len(nums); i++ {
            count += nums[i]
        }
        count = 0
        // Непосредственно обходить элементы массива
        for _, num := range nums {
            count += num
        }
        // Одновременно обходить индексы и элементы данных
        for i, num := range nums {
            count += nums[i]
            count += num
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Обход массива */
    func traverse(nums: [Int]) {
        var count = 0
        // Обход массива по индексам
        for i in nums.indices {
            count += nums[i]
        }
        // Непосредственно обходить элементы массива
        for num in nums {
            count += num
        }
        // Одновременно обходить индексы и элементы данных
        for (i, num) in nums.enumerated() {
            count += nums[i]
            count += num
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Обход массива */
    function traverse(nums) {
        let count = 0;
        // Обход массива по индексам
        for (let i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Непосредственно обходить элементы массива
        for (const num of nums) {
            count += num;
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Обход массива */
    function traverse(nums: number[]): void {
        let count = 0;
        // Обход массива по индексам
        for (let i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Непосредственно обходить элементы массива
        for (const num of nums) {
            count += num;
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Перебрать элементы массива */
    void traverse(List<int> nums) {
      int count = 0;
      // Обход массива по индексам
      for (var i = 0; i < nums.length; i++) {
        count += nums[i];
      }
      // Непосредственно обходить элементы массива
      for (int _num in nums) {
        count += _num;
      }
      // Перебрать массив методом forEach
      nums.forEach((_num) {
        count += _num;
      });
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Обход массива */
    fn traverse(nums: &[i32]) {
        let mut _count = 0;
        // Обход массива по индексам
        for i in 0..nums.len() {
            _count += nums[i];
        }
        // Непосредственно обходить элементы массива
        _count = 0;
        for &num in nums {
            _count += num;
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* Обход массива */
    void traverse(int *nums, int size) {
        int count = 0;
        // Обход массива по индексам
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Обход массива */
    fun traverse(nums: IntArray) {
        var count = 0
        // Обход массива по индексам
        for (i in nums.indices) {
            count += nums[i]
        }
        // Непосредственно обходить элементы массива
        for (j in nums) {
            count += j
        }
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Обход массива ###
    def traverse(nums)
      count = 0

      # Обход массива по индексам
      for i in 0...nums.length
        count += nums[i]
      end

      # Непосредственно обходить элементы массива
      for num in nums
        count += num
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация кода" src="https://pythontutor.com/iframe-embed.html#code=def%20traverse%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%9D%D0%B5%D0%BF%D0%BE%D1%81%D1%80%D0%B5%D0%B4%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%20%20%20%20%23%20%D0%9E%D0%B4%D0%BD%D0%BE%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%0A%20%20%20%20for%20i%2C%20num%20in%20enumerate%28nums%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20traverse%28nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20traverse%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%9D%D0%B5%D0%BF%D0%BE%D1%81%D1%80%D0%B5%D0%B4%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%20%20%20%20%23%20%D0%9E%D0%B4%D0%BD%D0%BE%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%0A%20%20%20%20for%20i%2C%20num%20in%20enumerate%28nums%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20traverse%28nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 6. &nbsp; Поиск элемента

Для поиска заданного элемента в массиве необходимо обойти массив и на каждой итерации проверить, совпадает ли значение элемента с искомым. Если совпадает, вернуть соответствующий индекс.

Поскольку массив является линейной структурой данных, этот процесс называется линейным поиском.

=== "Python"

    ```python title="array.py"
    def find(nums: list[int], target: int) -> int:
        """Поиск заданного элемента в массиве"""
        for i in range(len(nums)):
            if nums[i] == target:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Поиск заданного элемента в массиве */
    int find(int *nums, int size, int target) {
        for (int i = 0; i < size; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Поиск заданного элемента в массиве */
    int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Поиск заданного элемента в массиве */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Поиск заданного элемента в массиве */
    func find(nums []int, target int) (index int) {
        index = -1
        for i := 0; i < len(nums); i++ {
            if nums[i] == target {
                index = i
                break
            }
        }
        return
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Поиск заданного элемента в массиве */
    func find(nums: [Int], target: Int) -> Int {
        for i in nums.indices {
            if nums[i] == target {
                return i
            }
        }
        return -1
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Поиск заданного элемента в массиве */
    function find(nums, target) {
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] === target) return i;
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Поиск заданного элемента в массиве */
    function find(nums: number[], target: number): number {
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] === target) {
                return i;
            }
        }
        return -1;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Поиск заданного элемента в массиве */
    int find(List<int> nums, int target) {
      for (var i = 0; i < nums.length; i++) {
        if (nums[i] == target) return i;
      }
      return -1;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Поиск заданного элемента в массиве */
    fn find(nums: &[i32], target: i32) -> Option<usize> {
        for i in 0..nums.len() {
            if nums[i] == target {
                return Some(i);
            }
        }
        None
    }
    ```

=== "C"

    ```c title="array.c"
    /* Поиск заданного элемента в массиве */
    int find(int *nums, int size, int target) {
        for (int i = 0; i < size; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Поиск заданного элемента в массиве */
    fun find(nums: IntArray, target: Int): Int {
        for (i in nums.indices) {
            if (nums[i] == target)
                return i
        }
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Поиск заданного элемента в массиве ###
    def find(nums, target)
      for i in 0...nums.length
        return i if nums[i] == target
      end

      -1
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация кода" src="https://pythontutor.com/iframe-embed.html#code=def%20find%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B5%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20index%3A%20int%20%3D%20find%28nums%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%203%20%D0%B2%20nums%3A%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%3D%22%2C%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20find%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B5%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20index%3A%20int%20%3D%20find%28nums%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%203%20%D0%B2%20nums%3A%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%3D%22%2C%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 7. &nbsp; Расширение массива

В сложных системных средах нельзя гарантировать, что ячейки памяти, расположенные после массива, являются свободными. Это делает невозможным безопасное расширение его размера. Поэтому в большинстве языков программирования **длина массива фиксирована**.

Если необходимо увеличить массив, нужно создать новый, больший массив и последовательно скопировать в него элементы исходного массива. Эта операция имеет сложность $O(n)$ и при больших массивах занимает много времени. Пример кода представлен ниже.

=== "Python"

    ```python title="array.py"
    def extend(nums: list[int], enlarge: int) -> list[int]:
        """Увеличение длины массива"""
        # Инициализировать массив увеличенной длины
        res = [0] * (len(nums) + enlarge)
        # Скопировать все элементы исходного массива в новый массив
        for i in range(len(nums)):
            res[i] = nums[i]
        # Вернуть новый массив после расширения
        return res
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Увеличение длины массива */
    int *extend(int *nums, int size, int enlarge) {
        // Инициализировать массив увеличенной длины
        int *res = new int[size + enlarge];
        // Скопировать все элементы исходного массива в новый массив
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // Освободить память
        delete[] nums;
        // Вернуть новый массив после расширения
        return res;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Увеличение длины массива */
    int[] extend(int[] nums, int enlarge) {
        // Инициализировать массив увеличенной длины
        int[] res = new int[nums.length + enlarge];
        // Скопировать все элементы исходного массива в новый массив
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Вернуть новый массив после расширения
        return res;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Увеличение длины массива */
    int[] Extend(int[] nums, int enlarge) {
        // Инициализировать массив увеличенной длины
        int[] res = new int[nums.Length + enlarge];
        // Скопировать все элементы исходного массива в новый массив
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // Вернуть новый массив после расширения
        return res;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Увеличение длины массива */
    func extend(nums []int, enlarge int) []int {
        // Инициализировать массив увеличенной длины
        res := make([]int, len(nums)+enlarge)
        // Скопировать все элементы исходного массива в новый массив
        for i, num := range nums {
            res[i] = num
        }
        // Вернуть новый массив после расширения
        return res
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Увеличение длины массива */
    func extend(nums: [Int], enlarge: Int) -> [Int] {
        // Инициализировать массив увеличенной длины
        var res = Array(repeating: 0, count: nums.count + enlarge)
        // Скопировать все элементы исходного массива в новый массив
        for i in nums.indices {
            res[i] = nums[i]
        }
        // Вернуть новый массив после расширения
        return res
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Увеличение длины массива */
    // Обратите внимание: Array в JavaScript — это динамический массив, его можно расширять напрямую
    // Для удобства обучения в этой функции Array рассматривается как массив неизменяемой длины
    function extend(nums, enlarge) {
        // Инициализировать массив увеличенной длины
        const res = new Array(nums.length + enlarge).fill(0);
        // Скопировать все элементы исходного массива в новый массив
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Вернуть новый массив после расширения
        return res;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Увеличение длины массива */
    // Обратите внимание: Array в TypeScript — это динамический массив, его можно расширять напрямую
    // Для удобства обучения в этой функции Array рассматривается как массив неизменяемой длины
    function extend(nums: number[], enlarge: number): number[] {
        // Инициализировать массив увеличенной длины
        const res = new Array(nums.length + enlarge).fill(0);
        // Скопировать все элементы исходного массива в новый массив
        for (let i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Вернуть новый массив после расширения
        return res;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Увеличение длины массива */
    List<int> extend(List<int> nums, int enlarge) {
      // Инициализировать массив увеличенной длины
      List<int> res = List.filled(nums.length + enlarge, 0);
      // Скопировать все элементы исходного массива в новый массив
      for (var i = 0; i < nums.length; i++) {
        res[i] = nums[i];
      }
      // Вернуть новый массив после расширения
      return res;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Увеличение длины массива */
    fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
        // Инициализировать массив увеличенной длины
        let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
        // Скопировать все элементы исходного массива в новый
        res[0..nums.len()].copy_from_slice(nums);

        // Вернуть новый массив после расширения
        res
    }
    ```

=== "C"

    ```c title="array.c"
    /* Увеличение длины массива */
    int *extend(int *nums, int size, int enlarge) {
        // Инициализировать массив увеличенной длины
        int *res = (int *)malloc(sizeof(int) * (size + enlarge));
        // Скопировать все элементы исходного массива в новый массив
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // Инициализировать расширенное пространство
        for (int i = size; i < size + enlarge; i++) {
            res[i] = 0;
        }
        // Вернуть новый массив после расширения
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Увеличение длины массива */
    fun extend(nums: IntArray, enlarge: Int): IntArray {
        // Инициализировать массив увеличенной длины
        val res = IntArray(nums.size + enlarge)
        // Скопировать все элементы исходного массива в новый массив
        for (i in nums.indices) {
            res[i] = nums[i]
        }
        // Вернуть новый массив после расширения
        return res
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Увеличение длины массива ###
    # Обратите внимание: Array в Ruby является динамическим массивом и может расширяться напрямую
    # Для удобства обучения в этой функции Array рассматривается как массив неизменяемой длины
    def extend(nums, enlarge)
      # Инициализировать массив увеличенной длины
      res = Array.new(nums.length + enlarge, 0)

      # Скопировать все элементы исходного массива в новый массив
      for i in 0...nums.length
        res[i] = nums[i]
      end

      # Вернуть новый массив после расширения
      res
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация кода" src="https://pythontutor.com/iframe-embed.html#code=%23%20%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%B8%D1%82%D0%B5%20%D0%B2%D0%BD%D0%B8%D0%BC%D0%B0%D0%BD%D0%B8%D0%B5%3A%20list%20%D0%B2%20Python%20%E2%80%94%20%D1%8D%D1%82%D0%BE%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%2C%20%D0%B5%D0%B3%D0%BE%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D1%80%D0%B0%D1%81%D1%88%D0%B8%D1%80%D1%8F%D1%82%D1%8C%20%D0%BD%D0%B0%D0%BF%D1%80%D1%8F%D0%BC%D1%83%D1%8E%0A%23%20%D0%94%D0%BB%D1%8F%20%D1%83%D0%B4%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B0%20%D0%BE%D0%B1%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%8D%D1%82%D0%BE%D0%B9%20%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8%20list%20%D1%80%D0%B0%D1%81%D1%81%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D0%B2%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D0%BA%D0%B0%D0%BA%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%BD%D0%B5%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%D0%BE%D0%B9%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0Adef%20extend%28nums%3A%20list%5Bint%5D%2C%20enlarge%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%A3%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%83%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20%28len%28nums%29%20%2B%20enlarge%29%0A%20%20%20%20%23%20%D0%A1%D0%BA%D0%BE%D0%BF%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B2%D1%81%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B2%20%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D1%80%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A0%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0A%20%20%20%20nums%20%3D%20extend%28nums%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%83%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B4%D0%BE%208%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%23%20%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%B8%D1%82%D0%B5%20%D0%B2%D0%BD%D0%B8%D0%BC%D0%B0%D0%BD%D0%B8%D0%B5%3A%20list%20%D0%B2%20Python%20%E2%80%94%20%D1%8D%D1%82%D0%BE%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%2C%20%D0%B5%D0%B3%D0%BE%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D1%80%D0%B0%D1%81%D1%88%D0%B8%D1%80%D1%8F%D1%82%D1%8C%20%D0%BD%D0%B0%D0%BF%D1%80%D1%8F%D0%BC%D1%83%D1%8E%0A%23%20%D0%94%D0%BB%D1%8F%20%D1%83%D0%B4%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B0%20%D0%BE%D0%B1%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%8D%D1%82%D0%BE%D0%B9%20%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8%20list%20%D1%80%D0%B0%D1%81%D1%81%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D0%B2%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D0%BA%D0%B0%D0%BA%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%BD%D0%B5%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%D0%BE%D0%B9%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0Adef%20extend%28nums%3A%20list%5Bint%5D%2C%20enlarge%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%A3%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%83%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20%28len%28nums%29%20%2B%20enlarge%29%0A%20%20%20%20%23%20%D0%A1%D0%BA%D0%BE%D0%BF%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B2%D1%81%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B2%20%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D1%80%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A0%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0A%20%20%20%20nums%20%3D%20extend%28nums%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%83%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B4%D0%BE%208%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 4.1.2 &nbsp; Преимущества и ограничения массива

Массивы хранятся в непрерывном пространстве памяти, а их элементы имеют одинаковый тип. Этот подход содержит богатую априорную информацию, которую система может использовать для оптимизации эффективности операций с данной структурой данных.

- **Высокая эффективность использования пространства**: массивы выделяют непрерывные блоки памяти для данных без дополнительных структурных затрат.
- **Поддержка произвольного доступа**: массивы позволяют получить доступ к любому элементу за время $O(1)$.
- **Локальность кэша**: при обращении к элементу массива компьютер загружает не только сам элемент, но и соседние данные, что позволяет использовать кэш для ускорения последующих операций.

Непрерывное хранение в памяти – это палка о двух концах, имеющая следующие ограничения.

- **Низкая эффективность вставки и удаления**: при большом количестве элементов в массиве операции вставки и удаления требуют перемещения множества элементов.
- **Неизменная длина**: после инициализации длина массива фиксируется, а увеличение массива требует копирования всех данных в новый массив, что влечет за собой значительные затраты.
- **Потери памяти**: если размер выделенного массива превышает фактические потребности, избыточное пространство оказывается потраченным впустую.

## 4.1.3 &nbsp; Типичные применения массива

Массивы – это базовая и распространенная структура данных, часто используемая в различных алгоритмах и для реализации сложных структур данных.

- **Произвольный доступ**: если мы хотим случайным образом выбирать некоторые образцы, можно сохранить их в массиве и сгенерировать случайную последовательность индексов для выборки.
- **Сортировка и поиск**: массивы являются наиболее часто используемой структурой данных для алгоритмов сортировки и поиска. Быстрая сортировка, сортировка слиянием, двоичный поиск и другие алгоритмы в основном работают с массивами.
- **Таблица поиска**: когда необходимо быстро найти элемент или его соответствие, можно использовать массив в качестве таблицы поиска. Например, для реализации отображения символов в ASCII-коды можно использовать значение ASCII-кода символа в качестве индекса, а соответствующий элемент хранить в соответствующем месте массива.
- **Машинное обучение**: в нейронных сетях широко используются операции линейной алгебры между векторами, матрицами и тензорами, которые реализуются в виде массивов. Массивы являются наиболее часто используемой структурой данных в программировании нейронных сетей.
- **Реализация структур данных**: массивы могут использоваться для реализации стека, очереди, хеш-таблицы, кучи, графа и других структур данных. Например, представление графа в виде матрицы смежности фактически является двумерным массивом.
