---
comments: true
---

# 4.1 &nbsp; Массив

<u>Массив (array)</u> - это линейная структура данных, которая хранит элементы одного типа в непрерывной области памяти. Положение элемента в массиве называется его <u>индексом (index)</u>. На рисунке 4-1 показаны основные понятия, связанные с массивом, и способ его хранения.

![Определение массива и способ хранения](array.assets/array_definition.png){ class="animation-figure" }

<p align="center"> Рисунок 4-1 &nbsp; Определение массива и способ хранения </p>

## 4.1.1 &nbsp; Основные операции с массивом

### 1. &nbsp; Инициализация массива

В зависимости от задачи мы можем выбрать один из двух способов инициализации массива: без начальных значений или с заданными начальными значениями. Если начальные значения не указаны, большинство языков программирования инициализируют элементы массива значением $0$ :

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
    int arr[5];
    int nums[5] = { 1, 3, 2, 5, 4 };
    // Хранится в куче (требуется ручное освобождение памяти)
    int* arr1 = new int[5];
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

    https://pythontutor.com/render.html#code=%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%0Aarr%20%3D%20%5B0%5D%20%2A%205%20%20%23%20%5B%200%2C%200%2C%200%2C%200%2C%200%20%5D%0Anums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 2. &nbsp; Доступ к элементам

Элементы массива хранятся в непрерывной области памяти, а это означает, что вычислить адрес любого элемента очень просто. Зная адрес массива в памяти (то есть адрес первого элемента) и индекс некоторого элемента, мы можем по формуле с рисунка ниже вычислить адрес этого элемента и напрямую обратиться к нему.

![Вычисление адреса элемента массива](array.assets/array_memory_location_calculation.png){ class="animation-figure" }

<p align="center"> Рисунок 4-2 &nbsp; Вычисление адреса элемента массива </p>

Если посмотреть на рисунок 4-2, можно заметить, что индекс первого элемента массива равен $0$ , и это кажется не слишком интуитивным, ведь естественнее было бы начинать счет с $1$ . Однако с точки зрения формулы адресации **индекс по сути является смещением относительно адреса памяти**. Смещение первого элемента равно $0$ , поэтому индекс $0$ вполне логичен.

Доступ к элементам массива очень эффективен: любой элемент массива можно получить за $O(1)$ времени.

=== "Python"

    ```python title="array.py"
    def random_access(nums: list[int]) -> int:
        """Случайный доступ к элементу"""
        # Случайным образом выбрать число из интервала [0, len(nums)-1]
        random_index = random.randint(0, len(nums) - 1)
        # Получить и вернуть случайный элемент
        random_num = nums[random_index]
        return random_num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Случайный доступ к элементу */
    int randomAccess(int *nums, int size) {
        // Случайным образом выбрать число из интервала [0, size)
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
        // Случайным образом выбрать число из интервала [0, nums.length)
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
        // Случайным образом выбрать число из интервала [0, nums.Length)
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
        // Случайным образом выбрать число из интервала [0, nums.length)
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
        // Случайным образом выбрать число из интервала [0, nums.count)
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
        // Случайным образом выбрать число из интервала [0, nums.length)
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
        // Случайным образом выбрать число из интервала [0, nums.length)
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
      // Случайным образом выбрать число из интервала [0, nums.length)
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
        // Случайным образом выбрать число из интервала [0, nums.len())
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
        // Случайным образом выбрать число из интервала [0, size)
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
        // Случайным образом выбрать число из интервала [0, nums.size)
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
      # Случайным образом выбрать число из интервала [0, nums.length)
      random_index = Random.rand(0...nums.length)

      # Получить и вернуть случайный элемент
      nums[random_index]
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 531px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_access%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%BC%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%BE%D0%BC%20%D0%B2%D1%8B%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B8%D0%B7%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B0%20%5B0%2C%20len%28nums%29-1%5D%0A%20%20%20%20random_index%20%3D%20random.randint%280%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20random_num%20%3D%20nums%5Brandom_index%5D%0A%20%20%20%20return%20random_num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%0A%20%20%20%20random_num%3A%20int%20%3D%20random_access%28nums%29%0A%20%20%20%20print%28%22%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20nums%20%3D%22%2C%20random_num%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20random%0A%0Adef%20random_access%28nums%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%BC%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D0%BE%D0%BC%20%D0%B2%D1%8B%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D0%B8%D0%B7%20%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%B2%D0%B0%D0%BB%D0%B0%20%5B0%2C%20len%28nums%29-1%5D%0A%20%20%20%20random_index%20%3D%20random.randint%280%2C%20len%28nums%29%20-%201%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B8%20%D0%B2%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20random_num%20%3D%20nums%5Brandom_index%5D%0A%20%20%20%20return%20random_num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%0A%20%20%20%20random_num%3A%20int%20%3D%20random_access%28nums%29%0A%20%20%20%20print%28%22%D0%A1%D0%BB%D1%83%D1%87%D0%B0%D0%B9%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20nums%20%3D%22%2C%20random_num%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 3. &nbsp; Вставка элемента

Элементы массива в памяти расположены "вплотную" друг к другу, и между ними нет места для размещения новых данных. Как показано на рисунке 4-3, если мы хотим вставить элемент в середину массива, то все элементы после этой позиции нужно сдвинуть на одну позицию вправо, а затем записать новое значение в освободившийся индекс.

![Пример вставки элемента в массив](array.assets/array_insert_element.png){ class="animation-figure" }

<p align="center"> Рисунок 4-3 &nbsp; Пример вставки элемента в массив </p>

Стоит отметить, что длина массива фиксирована, поэтому вставка нового элемента неизбежно приведет к "потере" элемента на конце массива. Решение этой проблемы мы оставим для обсуждения в разделе о "списках".

=== "Python"

    ```python title="array.py"
    def insert(nums: list[int], num: int, index: int):
        """Вставить элемент num по индексу index в массив"""
        # Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for i in range(len(nums) - 1, index, -1):
            nums[i] = nums[i - 1]
        # Присвоить num элементу по индексу index
        nums[index] = num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Вставить элемент num по индексу index в массив */
    void insert(int *nums, int size, int num, int index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Вставить элемент num по индексу index в массив */
    void insert(int[] nums, int num, int index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Вставить элемент num по индексу index в массив */
    void Insert(int[] nums, int num, int index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Вставить элемент num по индексу index в массив */
    func insert(nums []int, num int, index int) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for i := len(nums) - 1; i > index; i-- {
            nums[i] = nums[i-1]
        }
        // Присвоить num элементу по индексу index
        nums[index] = num
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Вставить элемент num по индексу index в массив */
    func insert(nums: inout [Int], num: Int, index: Int) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for i in nums.indices.dropFirst(index).reversed() {
            nums[i] = nums[i - 1]
        }
        // Присвоить num элементу по индексу index
        nums[index] = num
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Вставить элемент num по индексу index в массив */
    function insert(nums, num, index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Вставить элемент num по индексу index в массив */
    function insert(nums: number[], num: number, index: number): void {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for (let i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Вставить элемент _num по индексу index в массив */
    void insert(List<int> nums, int _num, int index) {
      // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
      for (var i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
      }
      // Присвоить _num элементу по индексу index
      nums[index] = _num;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Вставить элемент num по индексу index в массив */
    fn insert(nums: &mut [i32], num: i32, index: usize) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for i in (index + 1..nums.len()).rev() {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "C"

    ```c title="array.c"
    /* Вставить элемент num по индексу index в массив */
    void insert(int *nums, int size, int num, int index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Вставить элемент num по индексу index в массив */
    fun insert(nums: IntArray, num: Int, index: Int) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
        for (i in nums.size - 1 downTo index + 1) {
            nums[i] = nums[i - 1]
        }
        // Присвоить num элементу по индексу index
        nums[index] = num
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Вставка элемента num по индексу index в массив ###
    def insert(nums, num, index)
      # Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
      for i in (nums.length - 1).downto(index + 1)
        nums[i] = nums[i - 1]
      end

      # Присвоить num элементу по индексу index
      nums[index] = num
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20insert%28nums%3A%20list%5Bint%5D%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20num%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%20%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%20index%20%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BD%D0%B0%20%D0%BE%D0%B4%D0%BD%D1%83%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D0%BD%D0%B0%D0%B7%D0%B0%D0%B4%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%2C%20index%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20-%201%5D%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B8%D1%81%D0%B2%D0%BE%D0%B8%D1%82%D1%8C%20num%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%0A%20%20%20%20nums%5Bindex%5D%20%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20insert%28nums%2C%206%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%206%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%203%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20insert%28nums%3A%20list%5Bint%5D%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20num%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%20%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%20index%20%D0%B8%20%D0%B2%D1%81%D0%B5%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BD%D0%B0%20%D0%BE%D0%B4%D0%BD%D1%83%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D0%BD%D0%B0%D0%B7%D0%B0%D0%B4%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%20-%201%2C%20index%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20-%201%5D%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%B8%D1%81%D0%B2%D0%BE%D0%B8%D1%82%D1%8C%20num%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%0A%20%20%20%20nums%5Bindex%5D%20%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20insert%28nums%2C%206%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B8%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%206%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%203%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 4. &nbsp; Удаление элемента

Аналогично, как показано на рисунке 4-4, если нужно удалить элемент по индексу $i$ , то все элементы после индекса $i$ необходимо сдвинуть на одну позицию влево.

![Пример удаления элемента из массива](array.assets/array_remove_element.png){ class="animation-figure" }

<p align="center"> Рисунок 4-4 &nbsp; Пример удаления элемента из массива </p>

Обрати внимание: после удаления исходный последний элемент становится "бессмысленным", поэтому специально изменять его не требуется.

=== "Python"

    ```python title="array.py"
    def remove(nums: list[int], index: int):
        """Удалить элемент по индексу index"""
        # Сдвинуть все элементы после индекса index на одну позицию вперед
        for i in range(index, len(nums) - 1):
            nums[i] = nums[i + 1]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Удалить элемент по индексу index */
    void remove(int *nums, int size, int index) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* Удалить элемент по индексу index */
    void remove(int[] nums, int index) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    /* Удалить элемент по индексу index */
    void Remove(int[] nums, int index) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Go"

    ```go title="array.go"
    /* Удалить элемент по индексу index */
    func remove(nums []int, index int) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for i := index; i < len(nums)-1; i++ {
            nums[i] = nums[i+1]
        }
    }
    ```

=== "Swift"

    ```swift title="array.swift"
    /* Удалить элемент по индексу index */
    func remove(nums: inout [Int], index: Int) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for i in nums.indices.dropFirst(index).dropLast() {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "JS"

    ```javascript title="array.js"
    /* Удалить элемент по индексу index */
    function remove(nums, index) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Удалить элемент по индексу index */
    function remove(nums: number[], index: number): void {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (let i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Dart"

    ```dart title="array.dart"
    /* Удалить элемент по индексу index */
    void remove(List<int> nums, int index) {
      // Сдвинуть все элементы после индекса index на одну позицию вперед
      for (var i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
      }
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Удалить элемент по индексу index */
    fn remove(nums: &mut [i32], index: usize) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for i in index..nums.len() - 1 {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C"

    ```c title="array.c"
    /* Удалить элемент по индексу index */
    // Внимание: stdio.h уже использует ключевое слово remove
    void removeItem(int *nums, int size, int index) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    /* Удалить элемент по индексу index */
    fun remove(nums: IntArray, index: Int) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (i in index..<nums.size - 1) {
            nums[i] = nums[i + 1]
        }
    }
    ```

=== "Ruby"

    ```ruby title="array.rb"
    ### Удаление элемента по индексу index ###
    def remove(nums, index)
      # Сдвинуть все элементы после индекса index на одну позицию вперед
      for i in index...(nums.length - 1)
        nums[i] = nums[i + 1]
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20remove%28nums%3A%20list%5Bint%5D%2C%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8C%20%D0%B2%D1%81%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%20index%20%D0%BD%D0%B0%20%D0%BE%D0%B4%D0%BD%D1%83%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D0%B2%D0%BF%D0%B5%D1%80%D0%B5%D0%B4%0A%20%20%20%20for%20i%20in%20range%28index%2C%20len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20%2B%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20remove%28nums%2C%202%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%202%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20remove%28nums%3A%20list%5Bint%5D%2C%20index%3A%20int%29%3A%0A%20%20%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%20index%22%22%22%0A%20%20%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8C%20%D0%B2%D1%81%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%20index%20%D0%BD%D0%B0%20%D0%BE%D0%B4%D0%BD%D1%83%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D0%B2%D0%BF%D0%B5%D1%80%D0%B5%D0%B4%0A%20%20%20%20for%20i%20in%20range%28index%2C%20len%28nums%29%20-%201%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20nums%5Bi%20%2B%201%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20remove%28nums%2C%202%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%202%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

В целом операции вставки и удаления в массиве имеют следующие недостатки.

- **Высокая временная сложность**: средняя временная сложность и вставки, и удаления равна $O(n)$ , где $n$ - длина массива.
- **Потеря элементов**: поскольку длина массива неизменяема, после вставки элементы, выходящие за пределы длины массива, будут потеряны.
- **Потери памяти**: можно заранее инициализировать более длинный массив и использовать только его переднюю часть; тогда "теряемые" при вставке элементы на конце не будут нести смысла, но такой подход приводит к лишнему расходу памяти.

### 5. &nbsp; Обход массива

В большинстве языков программирования массив можно обходить как по индексу, так и напрямую перебирая каждый элемент:

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

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20traverse%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%9D%D0%B5%D0%BF%D0%BE%D1%81%D1%80%D0%B5%D0%B4%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%20%20%20%20%23%20%D0%9E%D0%B4%D0%BD%D0%BE%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%0A%20%20%20%20for%20i%2C%20num%20in%20enumerate%28nums%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20traverse%28nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20traverse%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%9D%D0%B5%D0%BF%D0%BE%D1%81%D1%80%D0%B5%D0%B4%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%20%20%20%20%23%20%D0%9E%D0%B4%D0%BD%D0%BE%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%8B%20%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85%0A%20%20%20%20for%20i%2C%20num%20in%20enumerate%28nums%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20traverse%28nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 6. &nbsp; Поиск элемента

Чтобы найти заданный элемент в массиве, нужно пройти по массиву и на каждой итерации проверять, совпадает ли значение; если совпадает, вернуть соответствующий индекс.

Поскольку массив - это линейная структура данных, такая операция поиска называется "линейным поиском".

=== "Python"

    ```python title="array.py"
    def find(nums: list[int], target: int) -> int:
        """Найти заданный элемент в массиве"""
        for i in range(len(nums)):
            if nums[i] == target:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* Найти заданный элемент в массиве */
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
    /* Найти заданный элемент в массиве */
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
    /* Найти заданный элемент в массиве */
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
    /* Найти заданный элемент в массиве */
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
    /* Найти заданный элемент в массиве */
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
    /* Найти заданный элемент в массиве */
    function find(nums, target) {
        for (let i = 0; i < nums.length; i++) {
            if (nums[i] === target) return i;
        }
        return -1;
    }
    ```

=== "TS"

    ```typescript title="array.ts"
    /* Найти заданный элемент в массиве */
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
    /* Найти заданный элемент в массиве */
    int find(List<int> nums, int target) {
      for (var i = 0; i < nums.length; i++) {
        if (nums[i] == target) return i;
      }
      return -1;
    }
    ```

=== "Rust"

    ```rust title="array.rs"
    /* Найти заданный элемент в массиве */
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
    /* Найти заданный элемент в массиве */
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
    /* Найти заданный элемент в массиве */
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

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20find%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B5%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20index%3A%20int%20%3D%20find%28nums%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%203%20%D0%B2%20nums%3A%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%3D%22%2C%20index%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20find%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20%D0%B7%D0%B0%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B5%22%22%22%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20return%20-1%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20index%3A%20int%20%3D%20find%28nums%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D0%B8%D1%81%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%203%20%D0%B2%20nums%3A%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%3D%22%2C%20index%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 7. &nbsp; Расширение массива

В сложной системной среде программа не может гарантировать, что память сразу после массива доступна, поэтому безопасно расширить емкость массива невозможно. Поэтому в большинстве языков программирования **длина массива неизменяема**.

Если мы хотим расширить массив, нужно заново создать больший массив и затем по одному скопировать в него элементы исходного массива. Это операция с временной сложностью $O(n)$ , и при больших массивах она очень затратна. Соответствующий код показан ниже:

=== "Python"

    ```python title="array.py"
    def extend(nums: list[int], enlarge: int) -> list[int]:
        """Увеличить длину массива"""
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
    /* Увеличить длину массива */
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
    /* Увеличить длину массива */
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
    /* Увеличить длину массива */
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
    /* Увеличить длину массива */
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
    /* Увеличить длину массива */
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
    /* Увеличить длину массива */
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
    /* Увеличить длину массива */
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
    /* Увеличить длину массива */
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
    /* Увеличить длину массива */
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
    /* Увеличить длину массива */
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
    /* Увеличить длину массива */
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
    ### Увеличить длину массива ###
    # Обратите внимание: Array в Ruby является динамическим массивом и может быть расширен напрямую
    # Для удобства обучения эта функция рассматривает Array как массив неизменяемой длины
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

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=%23%20%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%B8%D1%82%D0%B5%20%D0%B2%D0%BD%D0%B8%D0%BC%D0%B0%D0%BD%D0%B8%D0%B5%3A%20list%20%D0%B2%20Python%20%E2%80%94%20%D1%8D%D1%82%D0%BE%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%2C%20%D0%B5%D0%B3%D0%BE%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D1%80%D0%B0%D1%81%D1%88%D0%B8%D1%80%D1%8F%D1%82%D1%8C%20%D0%BD%D0%B0%D0%BF%D1%80%D1%8F%D0%BC%D1%83%D1%8E%0A%23%20%D0%94%D0%BB%D1%8F%20%D1%83%D0%B4%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B0%20%D0%BE%D0%B1%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%8D%D1%82%D0%BE%D0%B9%20%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8%20list%20%D1%80%D0%B0%D1%81%D1%81%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D0%B2%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D0%BA%D0%B0%D0%BA%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%BD%D0%B5%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%D0%BE%D0%B9%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0Adef%20extend%28nums%3A%20list%5Bint%5D%2C%20enlarge%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%A3%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%83%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20%28len%28nums%29%20%2B%20enlarge%29%0A%20%20%20%20%23%20%D0%A1%D0%BA%D0%BE%D0%BF%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B2%D1%81%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B2%20%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D1%80%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A0%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0A%20%20%20%20nums%20%3D%20extend%28nums%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%83%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B4%D0%BE%208%20nums%20%3D%22%2C%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%23%20%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%B8%D1%82%D0%B5%20%D0%B2%D0%BD%D0%B8%D0%BC%D0%B0%D0%BD%D0%B8%D0%B5%3A%20list%20%D0%B2%20Python%20%E2%80%94%20%D1%8D%D1%82%D0%BE%20%D0%B4%D0%B8%D0%BD%D0%B0%D0%BC%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%2C%20%D0%B5%D0%B3%D0%BE%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D1%80%D0%B0%D1%81%D1%88%D0%B8%D1%80%D1%8F%D1%82%D1%8C%20%D0%BD%D0%B0%D0%BF%D1%80%D1%8F%D0%BC%D1%83%D1%8E%0A%23%20%D0%94%D0%BB%D1%8F%20%D1%83%D0%B4%D0%BE%D0%B1%D1%81%D1%82%D0%B2%D0%B0%20%D0%BE%D0%B1%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%20%D1%8D%D1%82%D0%BE%D0%B9%20%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%B8%20list%20%D1%80%D0%B0%D1%81%D1%81%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D0%B2%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D0%BA%D0%B0%D0%BA%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%BD%D0%B5%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%D0%BE%D0%B9%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0Adef%20extend%28nums%3A%20list%5Bint%5D%2C%20enlarge%3A%20int%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%D0%A3%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%83%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20%28len%28nums%29%20%2B%20enlarge%29%0A%20%20%20%20%23%20%D0%A1%D0%BA%D0%BE%D0%BF%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B2%D1%81%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B8%D1%81%D1%85%D0%BE%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B2%20%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D1%80%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B5%D0%BD%D0%B8%D1%8F%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20print%28%22%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20nums%20%3D%22%2C%20nums%29%0A%0A%20%20%20%20%23%20%D0%A0%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%0A%20%20%20%20nums%20%3D%20extend%28nums%2C%203%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%83%D0%B2%D0%B5%D0%BB%D0%B8%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%B4%D0%BE%208%20nums%20%3D%22%2C%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 4.1.2 &nbsp; Преимущества и ограничения массива

Массив хранится в непрерывной области памяти, и все его элементы имеют один и тот же тип. Такой подход содержит много априорной информации, которую система может использовать для оптимизации эффективности операций со структурой данных.

- **Высокая пространственная эффективность**: массив выделяет для данных непрерывный блок памяти без дополнительного структурного накладного расхода.
- **Поддержка произвольного доступа**: массив позволяет обращаться к любому элементу за $O(1)$ времени.
- **Локальность кэша**: при обращении к элементу массива компьютер загружает не только сам элемент, но и соседние данные, что позволяет использовать кэш для ускорения последующих операций.

Хранение в непрерывной области памяти - палка о двух концах, и у него есть следующие ограничения.

- **Низкая эффективность вставки и удаления**: когда элементов в массиве много, вставка и удаление требуют сдвига большого количества элементов.
- **Неизменяемая длина**: после инициализации длина массива фиксирована; расширение массива требует копирования всех данных в новый массив, что стоит дорого.
- **Потери памяти**: если выделенный массив больше, чем реально необходимо, лишнее пространство пропадает впустую.

## 4.1.3 &nbsp; Типичные применения массива

Массив - это базовая и очень распространенная структура данных. Он часто используется как в различных алгоритмах, так и при реализации более сложных структур данных.

- **Произвольный доступ**: если мы хотим случайным образом выбирать некоторые образцы, можно сохранить их в массиве и сгенерировать случайную последовательность индексов для выборки.
- **Сортировка и поиск**: массив - самая распространенная структура данных для алгоритмов сортировки и поиска. Быстрая сортировка, сортировка слиянием, бинарный поиск и многие другие алгоритмы в основном работают именно с массивами.
- **Таблица поиска**: когда нужно быстро находить элемент или его соответствие, массив можно использовать как lookup table. Например, если мы хотим реализовать отображение символов в коды ASCII, можно использовать значение ASCII как индекс, а соответствующий элемент хранить по этой позиции массива.
- **Машинное обучение**: в нейронных сетях широко используются операции линейной алгебры над векторами, матрицами и тензорами, и все эти данные строятся в форме массивов. Массив - самая часто используемая структура данных в программировании нейросетей.
- **Реализация структур данных**: массивы можно использовать для реализации стеков, очередей, хеш-таблиц, куч, графов и других структур данных. Например, матрица смежности графа по сути является двумерным массивом.
