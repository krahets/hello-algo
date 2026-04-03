---
comments: true
---

# 4.3 &nbsp; Список

<u>Список (list)</u> - это абстрактное понятие структуры данных, обозначающее упорядоченную коллекцию элементов, которая поддерживает доступ к элементам, их изменение, добавление, удаление и обход, не требуя от пользователя учитывать ограничения по емкости. Список может быть реализован как на основе связного списка, так и на основе массива.

- Связный список естественным образом можно рассматривать как список: он поддерживает операции добавления, удаления, поиска и изменения элементов и может гибко расширяться динамически.
- Массив тоже поддерживает операции добавления, удаления, поиска и изменения элементов, но из-за неизменяемости длины его можно считать лишь списком с ограниченной длиной.

Когда список реализуется с помощью массива, **неизменяемость длины снижает его практическую полезность**. Причина в том, что мы обычно не можем заранее точно знать, сколько данных нужно хранить, а значит, трудно выбрать подходящую длину списка. Если длина слишком мала, она может не покрыть реальные потребности; если слишком велика, будет зря расходоваться память.

Чтобы решить эту проблему, можно использовать <u>динамический массив (dynamic array)</u> для реализации списка. Он сохраняет все преимущества массива и при этом может динамически расширяться во время выполнения программы.

На практике **списки из стандартных библиотек многих языков программирования реализованы именно на основе динамических массивов**, например `list` в Python, `ArrayList` в Java, `vector` в C++ и `List` в C#. В дальнейшем обсуждении мы будем считать понятия "список" и "динамический массив" эквивалентными.

## 4.3.1 &nbsp; Основные операции со списком

### 1. &nbsp; Инициализация списка

Обычно используются два способа инициализации: без начальных значений и с начальными значениями:

=== "Python"

    ```python title="list.py"
    # Инициализация списка
    # Без начальных значений
    nums1: list[int] = []
    # С начальными значениями
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Инициализация списка */
    // Обрати внимание: в C++ vector соответствует описываемому здесь nums
    // Без начальных значений
    vector<int> nums1;
    // С начальными значениями
    vector<int> nums = { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="list.java"
    /* Инициализация списка */
    // Без начальных значений
    List<Integer> nums1 = new ArrayList<>();
    // С начальными значениями (обрати внимание: элементы массива должны использовать обертку Integer[] вместо int[])
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Инициализация списка */
    // Без начальных значений
    List<int> nums1 = [];
    // С начальными значениями
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* Инициализация списка */
    // Без начальных значений
    nums1 := []int{}
    // С начальными значениями
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Инициализация списка */
    // Без начальных значений
    let nums1: [Int] = []
    // С начальными значениями
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* Инициализация списка */
    // Без начальных значений
    const nums1 = [];
    // С начальными значениями
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Инициализация списка */
    // Без начальных значений
    const nums1: number[] = [];
    // С начальными значениями
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Инициализация списка */
    // Без начальных значений
    List<int> nums1 = [];
    // С начальными значениями
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Инициализация списка */
    // Без начальных значений
    let nums1: Vec<i32> = Vec::new();
    // С начальными значениями
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Инициализация списка */
    // Без начальных значений
    var nums1 = listOf<Int>()
    // С начальными значениями
    var numbers = arrayOf(1, 3, 2, 5, 4)
    var nums = numbers.toMutableList()
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Инициализация списка
    # Без начальных значений
    nums1 = []
    # С начальными значениями
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20%23%20%D0%91%D0%B5%D0%B7%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D1%85%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B9%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%D0%A1%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 2. &nbsp; Доступ к элементам

Поскольку в этом разделе список рассматривается как структура на основе динамического массива, доступ к элементам и их обновление можно выполнять за $O(1)$ времени, что очень эффективно.

=== "Python"

    ```python title="list.py"
    # Доступ к элементу
    num: int = nums[1]  # Доступ к элементу по индексу 1

    # Обновление элемента
    nums[1] = 0    # Обновить элемент по индексу 1 значением 0
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Доступ к элементу */
    int num = nums[1];  // Доступ к элементу по индексу 1

    /* Обновление элемента */
    nums[1] = 0;  // Обновить элемент по индексу 1 значением 0
    ```

=== "Java"

    ```java title="list.java"
    /* Доступ к элементу */
    int num = nums.get(1);  // Доступ к элементу по индексу 1

    /* Обновление элемента */
    nums.set(1, 0);  // Обновить элемент по индексу 1 значением 0
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Доступ к элементу */
    int num = nums[1];  // Доступ к элементу по индексу 1

    /* Обновление элемента */
    nums[1] = 0;  // Обновить элемент по индексу 1 значением 0
    ```

=== "Go"

    ```go title="list_test.go"
    /* Доступ к элементу */
    num := nums[1]  // Доступ к элементу по индексу 1

    /* Обновление элемента */
    nums[1] = 0     // Обновить элемент по индексу 1 значением 0
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Доступ к элементу */
    let num = nums[1] // Доступ к элементу по индексу 1

    /* Обновление элемента */
    nums[1] = 0 // Обновить элемент по индексу 1 значением 0
    ```

=== "JS"

    ```javascript title="list.js"
    /* Доступ к элементу */
    const num = nums[1];  // Доступ к элементу по индексу 1

    /* Обновление элемента */
    nums[1] = 0;  // Обновить элемент по индексу 1 значением 0
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Доступ к элементу */
    const num: number = nums[1];  // Доступ к элементу по индексу 1

    /* Обновление элемента */
    nums[1] = 0;  // Обновить элемент по индексу 1 значением 0
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Доступ к элементу */
    int num = nums[1];  // Доступ к элементу по индексу 1

    /* Обновление элемента */
    nums[1] = 0;  // Обновить элемент по индексу 1 значением 0
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Доступ к элементу */
    let num: i32 = nums[1];  // Доступ к элементу по индексу 1
    /* Обновление элемента */
    nums[1] = 0;             // Обновить элемент по индексу 1 значением 0
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Доступ к элементу */
    val num = nums[1]       // Доступ к элементу по индексу 1
    /* Обновление элемента */
    nums[1] = 0             // Обновить элемент по индексу 1 значением 0
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Доступ к элементу
    num = nums[1] # Доступ к элементу по индексу 1
    # Обновление элемента
    nums[1] = 0 # Обновить элемент по индексу 1 значением 0
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D0%B8%D1%82%D1%8C%D1%81%D1%8F%20%D0%BA%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%201%20%D0%BF%D0%BE%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%0A%20%20%20%20%23%20%D0%9E%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%D0%9E%D0%B1%D0%BD%D0%BE%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%201%20%D0%B4%D0%BE%200&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 3. &nbsp; Вставка и удаление элементов

В отличие от массива список позволяет свободно добавлять и удалять элементы. Добавление элемента в конец списка имеет временную сложность $O(1)$ , но операции вставки и удаления по-прежнему имеют ту же эффективность, что и у массива, то есть $O(n)$ .

=== "Python"

    ```python title="list.py"
    # Очистить список
    nums.clear()

    # Добавить элементы в конец
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # Вставить элемент в середину
    nums.insert(3, 6)  # Вставить число 6 по индексу 3

    # Удалить элемент
    nums.pop(3)        # Удалить элемент по индексу 3
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Очистить список */
    nums.clear();

    /* Добавить элементы в конец */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* Вставить элемент в середину */
    nums.insert(nums.begin() + 3, 6);  // Вставить число 6 по индексу 3

    /* Удалить элемент */
    nums.erase(nums.begin() + 3);      // Удалить элемент по индексу 3
    ```

=== "Java"

    ```java title="list.java"
    /* Очистить список */
    nums.clear();

    /* Добавить элементы в конец */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Вставить элемент в середину */
    nums.add(3, 6);  // Вставить число 6 по индексу 3

    /* Удалить элемент */
    nums.remove(3);  // Удалить элемент по индексу 3
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Очистить список */
    nums.Clear();

    /* Добавить элементы в конец */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* Вставить элемент в середину */
    nums.Insert(3, 6);  // Вставить число 6 по индексу 3

    /* Удалить элемент */
    nums.RemoveAt(3);  // Удалить элемент по индексу 3
    ```

=== "Go"

    ```go title="list_test.go"
    /* Очистить список */
    nums = nil

    /* Добавить элементы в конец */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* Вставить элемент в середину */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Вставить число 6 по индексу 3

    /* Удалить элемент */
    nums = append(nums[:3], nums[4:]...) // Удалить элемент по индексу 3
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Очистить список */
    nums.removeAll()

    /* Добавить элементы в конец */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* Вставить элемент в середину */
    nums.insert(6, at: 3) // Вставить число 6 по индексу 3

    /* Удалить элемент */
    nums.remove(at: 3) // Удалить элемент по индексу 3
    ```

=== "JS"

    ```javascript title="list.js"
    /* Очистить список */
    nums.length = 0;

    /* Добавить элементы в конец */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Вставить элемент в середину */
    nums.splice(3, 0, 6); // Вставить число 6 по индексу 3

    /* Удалить элемент */
    nums.splice(3, 1);  // Удалить элемент по индексу 3
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Очистить список */
    nums.length = 0;

    /* Добавить элементы в конец */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Вставить элемент в середину */
    nums.splice(3, 0, 6); // Вставить число 6 по индексу 3

    /* Удалить элемент */
    nums.splice(3, 1);  // Удалить элемент по индексу 3
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Очистить список */
    nums.clear();

    /* Добавить элементы в конец */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Вставить элемент в середину */
    nums.insert(3, 6); // Вставить число 6 по индексу 3

    /* Удалить элемент */
    nums.removeAt(3); // Удалить элемент по индексу 3
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Очистить список */
    nums.clear();

    /* Добавить элементы в конец */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Вставить элемент в середину */
    nums.insert(3, 6);  // Вставить число 6 по индексу 3

    /* Удалить элемент */
    nums.remove(3);    // Удалить элемент по индексу 3
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Очистить список */
    nums.clear();

    /* Добавить элементы в конец */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Вставить элемент в середину */
    nums.add(3, 6);  // Вставить число 6 по индексу 3

    /* Удалить элемент */
    nums.remove(3);  // Удалить элемент по индексу 3
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Очистить список
    nums.clear

    # Добавить элементы в конец
    nums << 1
    nums << 3
    nums << 2
    nums << 5
    nums << 4

    # Вставить элемент в середину
    nums.insert(3, 6) # Вставить число 6 по индексу 3

    # Удалить элемент
    nums.delete_at(3) # Удалить элемент по индексу 3
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D1%87%D0%B8%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%83%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%206%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%203%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%203&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 4. &nbsp; Обход списка

Как и массив, список можно обходить как по индексам, так и напрямую по элементам.

=== "Python"

    ```python title="list.py"
    # Обход списка по индексам
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # Прямой обход элементов списка
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Обход списка по индексам */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* Прямой обход элементов списка */
    count = 0;
    for (int num : nums) {
        count += num;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* Обход списка по индексам */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* Прямой обход элементов списка */
    for (int num : nums) {
        count += num;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Обход списка по индексам */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* Прямой обход элементов списка */
    count = 0;
    foreach (int num in nums) {
        count += num;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* Обход списка по индексам */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* Прямой обход элементов списка */
    count = 0
    for _, num := range nums {
        count += num
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Обход списка по индексам */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* Прямой обход элементов списка */
    count = 0
    for num in nums {
        count += num
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* Обход списка по индексам */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Прямой обход элементов списка */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Обход списка по индексам */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Прямой обход элементов списка */
    count = 0;
    for (const num of nums) {
        count += num;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Обход списка по индексам */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Прямой обход элементов списка */
    count = 0;
    for (var num in nums) {
        count += num;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // Обход списка по индексам
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // Прямой обход элементов списка
    _count = 0;
    for num in &nums {
        _count += num;
    }
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Обход списка по индексам */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Прямой обход элементов списка */
    for (num in nums) {
        count += num
    }
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Обход списка по индексам
    count = 0
    for i in 0...nums.length
        count += nums[i]
    end

    # Прямой обход элементов списка
    count = 0
    for num in nums
        count += num
    end
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%D0%9D%D0%B5%D0%BF%D0%BE%D1%81%D1%80%D0%B5%D0%B4%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 5. &nbsp; Конкатенация списков

Создав новый список `nums1` , мы можем присоединить его к хвосту исходного списка.

=== "Python"

    ```python title="list.py"
    # Конкатенация двух списков
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # Присоединить список nums1 к концу nums
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Конкатенация двух списков */
    vector<int> nums1 = { 6, 8, 7, 10, 9 };
    // Присоединить список nums1 к концу nums
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* Конкатенация двух списков */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1);  // Присоединить список nums1 к концу nums
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Конкатенация двух списков */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1);  // Присоединить список nums1 к концу nums
    ```

=== "Go"

    ```go title="list_test.go"
    /* Конкатенация двух списков */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...)  // Присоединить список nums1 к концу nums
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Конкатенация двух списков */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // Присоединить список nums1 к концу nums
    ```

=== "JS"

    ```javascript title="list.js"
    /* Конкатенация двух списков */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // Присоединить список nums1 к концу nums
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Конкатенация двух списков */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1);  // Присоединить список nums1 к концу nums
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Конкатенация двух списков */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1);  // Присоединить список nums1 к концу nums
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Конкатенация двух списков */
    let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
    nums.extend(nums1);
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Конкатенация двух списков */
    val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
    nums.addAll(nums1)  // Присоединить список nums1 к концу nums
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Конкатенация двух списков
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%8A%D0%B5%D0%B4%D0%B8%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B4%D0%B2%D0%B0%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%D0%9F%D1%80%D0%B8%D1%81%D0%BE%D0%B5%D0%B4%D0%B8%D0%BD%D0%B8%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20nums1%20%D0%BA%20nums&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### 6. &nbsp; Сортировка списка

После сортировки списка мы сможем применять алгоритмы "двоичный поиск" и "два указателя", которые очень часто встречаются в задачах по массивам.

=== "Python"

    ```python title="list.py"
    # Отсортировать список
    nums.sort()  # После сортировки элементы списка идут по возрастанию
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Отсортировать список */
    sort(nums.begin(), nums.end());  // После сортировки элементы списка идут по возрастанию
    ```

=== "Java"

    ```java title="list.java"
    /* Отсортировать список */
    Collections.sort(nums);  // После сортировки элементы списка идут по возрастанию
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Отсортировать список */
    nums.Sort(); // После сортировки элементы списка идут по возрастанию
    ```

=== "Go"

    ```go title="list_test.go"
    /* Отсортировать список */
    sort.Ints(nums)  // После сортировки элементы списка идут по возрастанию
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Отсортировать список */
    nums.sort() // После сортировки элементы списка идут по возрастанию
    ```

=== "JS"

    ```javascript title="list.js"
    /* Отсортировать список */
    nums.sort((a, b) => a - b);  // После сортировки элементы списка идут по возрастанию
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Отсортировать список */
    nums.sort((a, b) => a - b);  // После сортировки элементы списка идут по возрастанию
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Отсортировать список */
    nums.sort(); // После сортировки элементы списка идут по возрастанию
    ```

=== "Rust"

    ```rust title="list.rs"
    /* Отсортировать список */
    nums.sort(); // После сортировки элементы списка идут по возрастанию
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Отсортировать список */
    nums.sort() // После сортировки элементы списка идут по возрастанию
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Отсортировать список
    nums = nums.sort { |a, b| a <=> b } # После сортировки элементы списка идут по возрастанию
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums.sort%28%29%20%20%23%20%D0%A1%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%2C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%80%D0%B0%D1%81%D0%BF%D0%BE%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D1%8B%20%D0%BF%D0%BE%20%D0%B2%D0%BE%D0%B7%D1%80%D0%B0%D1%81%D1%82%D0%B0%D0%BD%D0%B8%D1%8E&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 4.3.2 &nbsp; Реализация списка

Во многих языках программирования списки встроены в стандартную библиотеку, например в Java, C++, Python и других языках. Их реализация довольно сложна, а настройки параметров тщательно продуманы: начальная емкость, коэффициент расширения и так далее. Если это интересно, стоит заглянуть в исходный код.

Чтобы лучше понять принцип работы списка, попробуем реализовать его упрощенную версию, в которой есть три ключевых аспекта проектирования.

- **Начальная емкость**: выбрать разумную начальную емкость внутреннего массива. В этом примере мы берем 10.
- **Учет количества элементов**: объявить переменную `size` , которая будет хранить текущее число элементов в списке и обновляться в реальном времени при вставке и удалении элементов. С помощью этой переменной можно определять конец списка и понимать, требуется ли расширение.
- **Механизм расширения**: если при вставке элементов емкость списка исчерпана, нужно выполнить расширение. Для этого сначала создается больший массив с учетом коэффициента расширения, а затем все элементы текущего массива по порядку переносятся в новый. В этом примере мы считаем, что каждый раз массив расширяется в 2 раза.

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """Класс списка"""

        def __init__(self):
            """Конструктор"""
            self._capacity: int = 10  # Вместимость списка
            self._arr: list[int] = [0] * self._capacity  # Массив (для хранения элементов списка)
            self._size: int = 0  # Длина списка (текущее число элементов)
            self._extend_ratio: int = 2  # Коэффициент увеличения списка при каждом расширении

        def size(self) -> int:
            """Получить длину списка (текущее число элементов)"""
            return self._size

        def capacity(self) -> int:
            """Получить вместимость списка"""
            return self._capacity

        def get(self, index: int) -> int:
            """Доступ к элементу"""
            # Если индекс выходит за границы, выбрасывается исключение; далее аналогично
            if index < 0 or index >= self._size:
                raise IndexError("индекс выходит за границы")
            return self._arr[index]

        def set(self, num: int, index: int):
            """Обновление элемента"""
            if index < 0 or index >= self._size:
                raise IndexError("индекс выходит за границы")
            self._arr[index] = num

        def add(self, num: int):
            """Добавление элемента в конец"""
            # При превышении вместимости по числу элементов запускается расширение
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """Вставка элемента в середину"""
            if index < 0 or index >= self._size:
                raise IndexError("индекс выходит за границы")
            # При превышении вместимости по числу элементов запускается расширение
            if self._size == self.capacity():
                self.extend_capacity()
            # Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # Обновить число элементов
            self._size += 1

        def remove(self, index: int) -> int:
            """Удаление элемента"""
            if index < 0 or index >= self._size:
                raise IndexError("индекс выходит за границы")
            num = self._arr[index]
            # Сдвинуть все элементы после индекса index на одну позицию вперед
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # Обновить число элементов
            self._size -= 1
            # Вернуть удаленный элемент
            return num

        def extend_capacity(self):
            """Расширение списка"""
            # Создать новый массив длиной в _extend_ratio раз больше исходного массива и скопировать в него исходный массив
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # Обновить вместимость списка
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """Вернуть список фактической длины"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* Класс списка */
    class MyList {
      private:
        int *arr;             // Массив (для хранения элементов списка)
        int arrCapacity = 10; // Вместимость списка
        int arrSize = 0;      // Длина списка (текущее число элементов)
        int extendRatio = 2;   // Коэффициент увеличения списка при каждом расширении

      public:
        /* Конструктор */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* Метод-деструктор */
        ~MyList() {
            delete[] arr;
        }

        /* Получить длину списка (текущее число элементов) */
        int size() {
            return arrSize;
        }

        /* Получить вместимость списка */
        int capacity() {
            return arrCapacity;
        }

        /* Доступ к элементу */
        int get(int index) {
            // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
            if (index < 0 || index >= size())
                throw out_of_range("индекс выходит за границы");
            return arr[index];
        }

        /* Обновление элемента */
        void set(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("индекс выходит за границы");
            arr[index] = num;
        }

        /* Добавление элемента в конец */
        void add(int num) {
            // При превышении вместимости по числу элементов запускается расширение
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // Обновить число элементов
            arrSize++;
        }

        /* Вставка элемента в середину */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("индекс выходит за границы");
            // При превышении вместимости по числу элементов запускается расширение
            if (size() == capacity())
                extendCapacity();
            // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
            for (int j = size() - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // Обновить число элементов
            arrSize++;
        }

        /* Удаление элемента */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("индекс выходит за границы");
            int num = arr[index];
            // Сдвинуть все элементы после индекса index на одну позицию вперед
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // Обновить число элементов
            arrSize--;
            // Вернуть удаленный элемент
            return num;
        }

        /* Расширение списка */
        void extendCapacity() {
            // Создать новый массив длиной в extendRatio раз больше исходного массива
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // Скопировать все элементы исходного массива в новый массив
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // Освободить память
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* Преобразовать список в Vector для вывода */
        vector<int> toVector() {
            // Преобразовывать только элементы списка в пределах фактической длины
            vector<int> vec(size());
            for (int i = 0; i < size(); i++) {
                vec[i] = arr[i];
            }
            return vec;
        }
    };
    ```

=== "Java"

    ```java title="my_list.java"
    /* Класс списка */
    class MyList {
        private int[] arr; // Массив (для хранения элементов списка)
        private int capacity = 10; // Вместимость списка
        private int size = 0; // Длина списка (текущее число элементов)
        private int extendRatio = 2; // Коэффициент увеличения списка при каждом расширении

        /* Конструктор */
        public MyList() {
            arr = new int[capacity];
        }

        /* Получить длину списка (текущее число элементов) */
        public int size() {
            return size;
        }

        /* Получить вместимость списка */
        public int capacity() {
            return capacity;
        }

        /* Доступ к элементу */
        public int get(int index) {
            // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("индекс выходит за границы");
            return arr[index];
        }

        /* Обновление элемента */
        public void set(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("индекс выходит за границы");
            arr[index] = num;
        }

        /* Добавление элемента в конец */
        public void add(int num) {
            // При превышении вместимости по числу элементов запускается расширение
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // Обновить число элементов
            size++;
        }

        /* Вставка элемента в середину */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("индекс выходит за границы");
            // При превышении вместимости по числу элементов запускается расширение
            if (size == capacity())
                extendCapacity();
            // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
            for (int j = size - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // Обновить число элементов
            size++;
        }

        /* Удаление элемента */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("индекс выходит за границы");
            int num = arr[index];
            // Сдвинуть все элементы после индекса index на одну позицию вперед
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // Обновить число элементов
            size--;
            // Вернуть удаленный элемент
            return num;
        }

        /* Расширение списка */
        public void extendCapacity() {
            // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // Обновить вместимость списка
            capacity = arr.length;
        }

        /* Преобразовать список в массив */
        public int[] toArray() {
            int size = size();
            // Преобразовывать только элементы списка в пределах фактической длины
            int[] arr = new int[size];
            for (int i = 0; i < size; i++) {
                arr[i] = get(i);
            }
            return arr;
        }
    }
    ```

=== "C#"

    ```csharp title="my_list.cs"
    /* Класс списка */
    class MyList {
        private int[] arr;           // Массив (для хранения элементов списка)
        private int arrCapacity = 10;    // Вместимость списка
        private int arrSize = 0;         // Длина списка (текущее число элементов)
        private readonly int extendRatio = 2;  // Коэффициент увеличения списка при каждом расширении

        /* Конструктор */
        public MyList() {
            arr = new int[arrCapacity];
        }

        /* Получить длину списка (текущее число элементов) */
        public int Size() {
            return arrSize;
        }

        /* Получить вместимость списка */
        public int Capacity() {
            return arrCapacity;
        }

        /* Доступ к элементу */
        public int Get(int index) {
            // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("индекс выходит за границы");
            return arr[index];
        }

        /* Обновление элемента */
        public void Set(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("индекс выходит за границы");
            arr[index] = num;
        }

        /* Добавление элемента в конец */
        public void Add(int num) {
            // При превышении вместимости по числу элементов запускается расширение
            if (arrSize == arrCapacity)
                ExtendCapacity();
            arr[arrSize] = num;
            // Обновить число элементов
            arrSize++;
        }

        /* Вставка элемента в середину */
        public void Insert(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("индекс выходит за границы");
            // При превышении вместимости по числу элементов запускается расширение
            if (arrSize == arrCapacity)
                ExtendCapacity();
            // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
            for (int j = arrSize - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // Обновить число элементов
            arrSize++;
        }

        /* Удаление элемента */
        public int Remove(int index) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("индекс выходит за границы");
            int num = arr[index];
            // Сдвинуть все элементы после индекса index на одну позицию вперед
            for (int j = index; j < arrSize - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // Обновить число элементов
            arrSize--;
            // Вернуть удаленный элемент
            return num;
        }

        /* Расширение списка */
        public void ExtendCapacity() {
            // Создать новый массив длиной arrCapacity * extendRatio и скопировать в него исходный массив
            Array.Resize(ref arr, arrCapacity * extendRatio);
            // Обновить вместимость списка
            arrCapacity = arr.Length;
        }

        /* Преобразовать список в массив */
        public int[] ToArray() {
            // Преобразовывать только элементы списка в пределах фактической длины
            int[] arr = new int[arrSize];
            for (int i = 0; i < arrSize; i++) {
                arr[i] = Get(i);
            }
            return arr;
        }
    }
    ```

=== "Go"

    ```go title="my_list.go"
    /* Класс списка */
    type myList struct {
        arrCapacity int
        arr         []int
        arrSize     int
        extendRatio int
    }

    /* Конструктор */
    func newMyList() *myList {
        return &myList{
            arrCapacity: 10,              // Вместимость списка
            arr:         make([]int, 10), // Массив (для хранения элементов списка)
            arrSize:     0,               // Длина списка (текущее число элементов)
            extendRatio: 2,               // Коэффициент увеличения списка при каждом расширении
        }
    }

    /* Получить длину списка (текущее число элементов) */
    func (l *myList) size() int {
        return l.arrSize
    }

    /* Получить вместимость списка */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* Доступ к элементу */
    func (l *myList) get(index int) int {
        // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if index < 0 || index >= l.arrSize {
            panic("индекс выходит за границы")
        }
        return l.arr[index]
    }

    /* Обновление элемента */
    func (l *myList) set(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("индекс выходит за границы")
        }
        l.arr[index] = num
    }

    /* Добавление элемента в конец */
    func (l *myList) add(num int) {
        // При превышении вместимости по числу элементов запускается расширение
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        l.arr[l.arrSize] = num
        // Обновить число элементов
        l.arrSize++
    }

    /* Вставка элемента в середину */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("индекс выходит за границы")
        }
        // При превышении вместимости по числу элементов запускается расширение
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for j := l.arrSize - 1; j >= index; j-- {
            l.arr[j+1] = l.arr[j]
        }
        l.arr[index] = num
        // Обновить число элементов
        l.arrSize++
    }

    /* Удаление элемента */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.arrSize {
            panic("индекс выходит за границы")
        }
        num := l.arr[index]
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // Обновить число элементов
        l.arrSize--
        // Вернуть удаленный элемент
        return num
    }

    /* Расширение списка */
    func (l *myList) extendCapacity() {
        // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // Обновить вместимость списка
        l.arrCapacity = len(l.arr)
    }

    /* Вернуть список фактической длины */
    func (l *myList) toArray() []int {
        // Преобразовывать только элементы списка в пределах фактической длины
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* Класс списка */
    class MyList {
        private var arr: [Int] // Массив (для хранения элементов списка)
        private var _capacity: Int // Вместимость списка
        private var _size: Int // Длина списка (текущее число элементов)
        private let extendRatio: Int // Коэффициент увеличения списка при каждом расширении

        /* Конструктор */
        init() {
            _capacity = 10
            _size = 0
            extendRatio = 2
            arr = Array(repeating: 0, count: _capacity)
        }

        /* Получить длину списка (текущее число элементов) */
        func size() -> Int {
            _size
        }

        /* Получить вместимость списка */
        func capacity() -> Int {
            _capacity
        }

        /* Доступ к элементу */
        func get(index: Int) -> Int {
            // Если индекс выходит за границы, выбросить ошибку; далее аналогично
            if index < 0 || index >= size() {
                fatalError("индекс выходит за границы")
            }
            return arr[index]
        }

        /* Обновление элемента */
        func set(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("индекс выходит за границы")
            }
            arr[index] = num
        }

        /* Добавление элемента в конец */
        func add(num: Int) {
            // При превышении вместимости по числу элементов запускается расширение
            if size() == capacity() {
                extendCapacity()
            }
            arr[size()] = num
            // Обновить число элементов
            _size += 1
        }

        /* Вставка элемента в середину */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("индекс выходит за границы")
            }
            // При превышении вместимости по числу элементов запускается расширение
            if size() == capacity() {
                extendCapacity()
            }
            // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
            for j in (index ..< size()).reversed() {
                arr[j + 1] = arr[j]
            }
            arr[index] = num
            // Обновить число элементов
            _size += 1
        }

        /* Удаление элемента */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= size() {
                fatalError("индекс выходит за границы")
            }
            let num = arr[index]
            // Сдвинуть все элементы после индекса index на одну позицию вперед
            for j in index ..< (size() - 1) {
                arr[j] = arr[j + 1]
            }
            // Обновить число элементов
            _size -= 1
            // Вернуть удаленный элемент
            return num
        }

        /* Расширение списка */
        func extendCapacity() {
            // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
            arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
            // Обновить вместимость списка
            _capacity = arr.count
        }

        /* Преобразовать список в массив */
        func toArray() -> [Int] {
            Array(arr.prefix(size()))
        }
    }
    ```

=== "JS"

    ```javascript title="my_list.js"
    /* Класс списка */
    class MyList {
        #arr = new Array(); // Массив (для хранения элементов списка)
        #capacity = 10; // Вместимость списка
        #size = 0; // Длина списка (текущее число элементов)
        #extendRatio = 2; // Коэффициент увеличения списка при каждом расширении

        /* Конструктор */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* Получить длину списка (текущее число элементов) */
        size() {
            return this.#size;
        }

        /* Получить вместимость списка */
        capacity() {
            return this.#capacity;
        }

        /* Доступ к элементу */
        get(index) {
            // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
            if (index < 0 || index >= this.#size) throw new Error('индекс выходит за границы');
            return this.#arr[index];
        }

        /* Обновление элемента */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('индекс выходит за границы');
            this.#arr[index] = num;
        }

        /* Добавление элемента в конец */
        add(num) {
            // Если длина равна вместимости, требуется расширение
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // Добавить новый элемент в конец списка
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* Вставка элемента в середину */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('индекс выходит за границы');
            // При превышении вместимости по числу элементов запускается расширение
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // Обновить число элементов
            this.#arr[index] = num;
            this.#size++;
        }

        /* Удаление элемента */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('индекс выходит за границы');
            let num = this.#arr[index];
            // Сдвинуть все элементы после индекса index на одну позицию вперед
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // Обновить число элементов
            this.#size--;
            // Вернуть удаленный элемент
            return num;
        }

        /* Расширение списка */
        extendCapacity() {
            // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // Обновить вместимость списка
            this.#capacity = this.#arr.length;
        }

        /* Преобразовать список в массив */
        toArray() {
            let size = this.size();
            // Преобразовывать только элементы списка в пределах фактической длины
            const arr = new Array(size);
            for (let i = 0; i < size; i++) {
                arr[i] = this.get(i);
            }
            return arr;
        }
    }
    ```

=== "TS"

    ```typescript title="my_list.ts"
    /* Класс списка */
    class MyList {
        private arr: Array<number>; // Массив (для хранения элементов списка)
        private _capacity: number = 10; // Вместимость списка
        private _size: number = 0; // Длина списка (текущее число элементов)
        private extendRatio: number = 2; // Коэффициент увеличения списка при каждом расширении

        /* Конструктор */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* Получить длину списка (текущее число элементов) */
        public size(): number {
            return this._size;
        }

        /* Получить вместимость списка */
        public capacity(): number {
            return this._capacity;
        }

        /* Доступ к элементу */
        public get(index: number): number {
            // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
            if (index < 0 || index >= this._size) throw new Error('индекс выходит за границы');
            return this.arr[index];
        }

        /* Обновление элемента */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('индекс выходит за границы');
            this.arr[index] = num;
        }

        /* Добавление элемента в конец */
        public add(num: number): void {
            // Если длина равна вместимости, требуется расширение
            if (this._size === this._capacity) this.extendCapacity();
            // Добавить новый элемент в конец списка
            this.arr[this._size] = num;
            this._size++;
        }

        /* Вставка элемента в середину */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('индекс выходит за границы');
            // При превышении вместимости по числу элементов запускается расширение
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // Обновить число элементов
            this.arr[index] = num;
            this._size++;
        }

        /* Удаление элемента */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('индекс выходит за границы');
            let num = this.arr[index];
            // Сдвинуть все элементы после индекса index на одну позицию вперед
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // Обновить число элементов
            this._size--;
            // Вернуть удаленный элемент
            return num;
        }

        /* Расширение списка */
        public extendCapacity(): void {
            // Создать новый массив длиной size и скопировать в него исходный массив
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // Обновить вместимость списка
            this._capacity = this.arr.length;
        }

        /* Преобразовать список в массив */
        public toArray(): number[] {
            let size = this.size();
            // Преобразовывать только элементы списка в пределах фактической длины
            const arr = new Array(size);
            for (let i = 0; i < size; i++) {
                arr[i] = this.get(i);
            }
            return arr;
        }
    }
    ```

=== "Dart"

    ```dart title="my_list.dart"
    /* Класс списка */
    class MyList {
      late List<int> _arr; // Массив (для хранения элементов списка)
      int _capacity = 10; // Вместимость списка
      int _size = 0; // Длина списка (текущее число элементов)
      int _extendRatio = 2; // Коэффициент увеличения списка при каждом расширении

      /* Конструктор */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* Получить длину списка (текущее число элементов) */
      int size() => _size;

      /* Получить вместимость списка */
      int capacity() => _capacity;

      /* Доступ к элементу */
      int get(int index) {
        if (index >= _size) throw RangeError('индекс выходит за границы');
        return _arr[index];
      }

      /* Обновление элемента */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('индекс выходит за границы');
        _arr[index] = _num;
      }

      /* Добавление элемента в конец */
      void add(int _num) {
        // При превышении вместимости по числу элементов запускается расширение
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // Обновить число элементов
        _size++;
      }

      /* Вставка элемента в середину */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('индекс выходит за границы');
        // При превышении вместимости по числу элементов запускается расширение
        if (_size == _capacity) extendCapacity();
        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // Обновить число элементов
        _size++;
      }

      /* Удаление элемента */
      int remove(int index) {
        if (index >= _size) throw RangeError('индекс выходит за границы');
        int _num = _arr[index];
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // Обновить число элементов
        _size--;
        // Вернуть удаленный элемент
        return _num;
      }

      /* Расширение списка */
      void extendCapacity() {
        // Создать новый массив длиной в _extendRatio раз больше исходного массива
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // Скопировать исходный массив в новый массив
        List.copyRange(_newNums, 0, _arr);
        // Обновить ссылку на _arr
        _arr = _newNums;
        // Обновить вместимость списка
        _capacity = _arr.length;
      }

      /* Преобразовать список в массив */
      List<int> toArray() {
        List<int> arr = [];
        for (var i = 0; i < _size; i++) {
          arr.add(get(i));
        }
        return arr;
      }
    }
    ```

=== "Rust"

    ```rust title="my_list.rs"
    /* Класс списка */
    #[allow(dead_code)]
    struct MyList {
        arr: Vec<i32>,       // Массив (для хранения элементов списка)
        capacity: usize,     // Вместимость списка
        size: usize,         // Длина списка (текущее число элементов)
        extend_ratio: usize, // Коэффициент увеличения списка при каждом расширении
    }

    #[allow(unused, unused_comparisons)]
    impl MyList {
        /* Конструктор */
        pub fn new(capacity: usize) -> Self {
            let mut vec = vec![0; capacity];
            Self {
                arr: vec,
                capacity,
                size: 0,
                extend_ratio: 2,
            }
        }

        /* Получить длину списка (текущее число элементов) */
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* Получить вместимость списка */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* Доступ к элементу */
        pub fn get(&self, index: usize) -> i32 {
            // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
            if index >= self.size {
                panic!("индекс выходит за границы")
            };
            return self.arr[index];
        }

        /* Обновление элемента */
        pub fn set(&mut self, index: usize, num: i32) {
            if index >= self.size {
                panic!("индекс выходит за границы")
            };
            self.arr[index] = num;
        }

        /* Добавление элемента в конец */
        pub fn add(&mut self, num: i32) {
            // При превышении вместимости по числу элементов запускается расширение
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.arr[self.size] = num;
            // Обновить число элементов
            self.size += 1;
        }

        /* Вставка элемента в середину */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index >= self.size() {
                panic!("индекс выходит за границы")
            };
            // При превышении вместимости по числу элементов запускается расширение
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
            for j in (index..self.size).rev() {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // Обновить число элементов
            self.size += 1;
        }

        /* Удаление элемента */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index >= self.size() {
                panic!("индекс выходит за границы")
            };
            let num = self.arr[index];
            // Сдвинуть все элементы после индекса index на одну позицию вперед
            for j in index..self.size - 1 {
                self.arr[j] = self.arr[j + 1];
            }
            // Обновить число элементов
            self.size -= 1;
            // Вернуть удаленный элемент
            return num;
        }

        /* Расширение списка */
        pub fn extend_capacity(&mut self) {
            // Создать новый массив длиной в extend_ratio раз больше исходного и скопировать в него исходный массив
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // Обновить вместимость списка
            self.capacity = new_capacity;
        }

        /* Преобразовать список в массив */
        pub fn to_array(&self) -> Vec<i32> {
            // Преобразовывать только элементы списка в пределах фактической длины
            let mut arr = Vec::new();
            for i in 0..self.size {
                arr.push(self.get(i));
            }
            arr
        }
    }
    ```

=== "C"

    ```c title="my_list.c"
    /* Класс списка */
    typedef struct {
        int *arr;        // Массив (для хранения элементов списка)
        int capacity;    // Вместимость списка
        int size;        // Размер списка
        int extendRatio; // Коэффициент расширения списка при каждом увеличении
    } MyList;

    /* Конструктор */
    MyList *newMyList() {
        MyList *nums = malloc(sizeof(MyList));
        nums->capacity = 10;
        nums->arr = malloc(sizeof(int) * nums->capacity);
        nums->size = 0;
        nums->extendRatio = 2;
        return nums;
    }

    /* Деструктор */
    void delMyList(MyList *nums) {
        free(nums->arr);
        free(nums);
    }

    /* Получить длину списка */
    int size(MyList *nums) {
        return nums->size;
    }

    /* Получить вместимость списка */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* Доступ к элементу */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* Обновление элемента */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* Добавление элемента в конец */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // Расширение емкости
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* Вставка элемента в середину */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // При превышении вместимости по числу элементов запускается расширение
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // Расширение емкости
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* Удаление элемента */
    // Внимание: stdio.h уже использует ключевое слово remove
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* Расширение списка */
    void extendCapacity(MyList *nums) {
        // Сначала выделить память
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // Скопировать старые данные в новые
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // Освободить старые данные
        free(temp);

        // Обновить новые данные
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* Преобразовать список в Array для вывода */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_list.kt"
    /* Класс списка */
    class MyList {
        private var arr: IntArray = intArrayOf() // Массив (для хранения элементов списка)
        private var capacity: Int = 10 // Вместимость списка
        private var size: Int = 0 // Длина списка (текущее число элементов)
        private var extendRatio: Int = 2 // Коэффициент увеличения списка при каждом расширении

        /* Конструктор */
        init {
            arr = IntArray(capacity)
        }

        /* Получить длину списка (текущее число элементов) */
        fun size(): Int {
            return size
        }

        /* Получить вместимость списка */
        fun capacity(): Int {
            return capacity
        }

        /* Доступ к элементу */
        fun get(index: Int): Int {
            // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("индекс выходит за границы")
            return arr[index]
        }

        /* Обновление элемента */
        fun set(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("индекс выходит за границы")
            arr[index] = num
        }

        /* Добавление элемента в конец */
        fun add(num: Int) {
            // При превышении вместимости по числу элементов запускается расширение
            if (size == capacity())
                extendCapacity()
            arr[size] = num
            // Обновить число элементов
            size++
        }

        /* Вставка элемента в середину */
        fun insert(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("индекс выходит за границы")
            // При превышении вместимости по числу элементов запускается расширение
            if (size == capacity())
                extendCapacity()
            // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
            for (j in size - 1 downTo index)
                arr[j + 1] = arr[j]
            arr[index] = num
            // Обновить число элементов
            size++
        }

        /* Удаление элемента */
        fun remove(index: Int): Int {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("индекс выходит за границы")
            val num = arr[index]
            // Сдвинуть все элементы после индекса index на одну позицию вперед
            for (j in index..<size - 1)
                arr[j] = arr[j + 1]
            // Обновить число элементов
            size--
            // Вернуть удаленный элемент
            return num
        }

        /* Расширение списка */
        fun extendCapacity() {
            // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
            arr = arr.copyOf(capacity() * extendRatio)
            // Обновить вместимость списка
            capacity = arr.size
        }

        /* Преобразовать список в массив */
        fun toArray(): IntArray {
            val size = size()
            // Преобразовывать только элементы списка в пределах фактической длины
            val arr = IntArray(size)
            for (i in 0..<size) {
                arr[i] = get(i)
            }
            return arr
        }
    }
    ```

=== "Ruby"

    ```ruby title="my_list.rb"
    ### Класс списка ###
    class MyList
      attr_reader :size       # Получить длину списка (текущее число элементов)
      attr_reader :capacity   # Получить вместимость списка

      ### Конструктор ###
      def initialize
        @capacity = 10
        @size = 0
        @extend_ratio = 2
        @arr = Array.new(capacity)
      end

      ### Доступ к элементу ###
      def get(index)
        # Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        raise IndexError, "индекс выходит за границы" if index < 0 || index >= size
        @arr[index]
      end

      ### Доступ к элементу ###
      def set(index, num)
        raise IndexError, "индекс выходит за границы" if index < 0 || index >= size
        @arr[index] = num
      end

      ### Добавление элемента в конец ###
      def add(num)
        # При превышении вместимости по числу элементов запускается расширение
        extend_capacity if size == capacity
        @arr[size] = num

        # Обновить число элементов
        @size += 1
      end

      ### Вставка элемента в середину ###
      def insert(index, num)
        raise IndexError, "индекс выходит за границы" if index < 0 || index >= size

        # При превышении вместимости по числу элементов запускается расширение
        extend_capacity if size == capacity

        # Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for j in (size - 1).downto(index)
          @arr[j + 1] = @arr[j]
        end
        @arr[index] = num

        # Обновить число элементов
        @size += 1
      end

      ### Удаление элемента ###
      def remove(index)
        raise IndexError, "индекс выходит за границы" if index < 0 || index >= size
        num = @arr[index]

        # Сдвинуть все элементы после индекса index на одну позицию вперед
        for j in index...size
          @arr[j] = @arr[j + 1]
        end

        # Обновить число элементов
        @size -= 1

        # Вернуть удаленный элемент
        num
      end

      ### Расширение списка ###
      def extend_capacity
        # Создать новый массив длиной в extend_ratio раз больше исходного и скопировать в него исходный массив
        arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
        # Обновить вместимость списка
        @capacity = arr.length
      end

      ### Преобразование списка в массив ###
      def to_array
        sz = size
        # Преобразовывать только элементы списка в пределах фактической длины
        arr = Array.new(sz)
        for i in 0...sz
          arr[i] = get(i)
        end
        arr
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%27%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%27%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%27%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201%2C%20index%20-%201%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%27%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index%2C%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%20%20%20%20nums.insert%286%2C%20index%3D3%29%0A%20%20%20%20nums.remove%283%29%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%20%20%20%20nums.set%280%2C%201%29%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20%20%20%20%20%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._capacity%0A%0A%20%20%20%20def%20get%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%27%29%0A%20%20%20%20%20%20%20%20return%20self._arr%5Bindex%5D%0A%0A%20%20%20%20def%20set%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%27%29%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20%20%20%20def%20add%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%2C%20index%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%27%29%0A%20%20%20%20%20%20%20%20%20%20%20%20self.extend_capacity%28%29%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28self._size%20-%201%2C%20index%20-%201%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20%20%20%20%20%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20remove%28self%2C%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D1%8B%D1%85%D0%BE%D0%B4%D0%B8%D1%82%20%D0%B7%D0%B0%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%D1%8B%27%29%0A%20%20%20%20%20%20%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28index%2C%20self._size%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20extend_capacity%28self%29%3A%0A%20%20%20%20%20%20%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20%20%20%20%20%20%20self._capacity%20%3D%20len%28self._arr%29%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20nums%20%3D%20MyList%28%29%0A%20%20%20%20nums.add%281%29%0A%20%20%20%20nums.add%283%29%0A%20%20%20%20nums.add%282%29%0A%20%20%20%20nums.add%285%29%0A%20%20%20%20nums.add%284%29%0A%20%20%20%20nums.insert%286%2C%20index%3D3%29%0A%20%20%20%20nums.remove%283%29%0A%20%20%20%20num%20%3D%20nums.get%281%29%0A%20%20%20%20nums.set%280%2C%201%29%0A%20%20%20%20for%20i%20in%20range%2810%29%3A%0A%20%20%20%20%20%20%20%20nums.add%28i%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>
