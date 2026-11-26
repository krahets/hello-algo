---
comments: true
---

# 4.3 &nbsp; Список

<u>Список (list)</u> — абстрактная структура данных, представляющая упорядоченную совокупность элементов. Список позволяет читать, изменять, добавлять, удалять и перебирать элементы, не требуя от пользователя следить за ёмкостью. Реализовать его можно на основе связного списка или массива.

- Связный список сам по себе уже реализует список: поддерживает добавление, удаление, поиск и изменение элементов и может динамически расти по мере необходимости.
- Массив тоже поддерживает добавление, удаление, поиск и изменение элементов, но его длина фиксирована, поэтому он представляет собой список с ограничением на длину.

При реализации списка на основе массива **фиксированная длина делает список менее удобным**. Обычно мы не знаем заранее, сколько данных понадобится хранить, и подобрать длину трудно. Слишком маленького массива может не хватить, а слишком большой будет напрасно занимать память.

Решение — реализовать список на основе <u>динамического массива (dynamic array)</u>. Он сохраняет преимущества массива и может наращивать ёмкость во время работы программы.

**Во многих языках списки из стандартной библиотеки реализованы на основе динамических массивов**. Примеры — `list` в Python, `ArrayList` в Java, `vector` в C++ и `List` в C#. В дальнейшем изложении под списком мы будем понимать динамический массив.

## 4.3.1 &nbsp; Основные операции со списком

### 1. &nbsp; Инициализация списка

Обычно список инициализируют одним из двух способов: без начальных значений или с заданными начальными значениями.

=== "Python"

    ```python title="list.py"
    # Инициализация списка
    # Без начальных значений
    empty_nums: list[int] = []
    # С начальными значениями
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Инициализация списка */
    // Без начальных значений
    vector<int> emptyNums;
    // С начальными значениями
    vector<int> nums = {1, 3, 2, 5, 4};
    ```

=== "Java"

    ```java title="list.java"
    /* Инициализация списка */
    // Без начальных значений
    List<Integer> emptyNums = new ArrayList<>();
    // С начальными значениями (тип массива должен быть Integer[], а не int[]: для элементов списка нужен Integer — класс-обёртка для int)
    Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
    List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Инициализация списка */
    // Без начальных значений
    List<int> emptyNums = [];
    // С начальными значениями
    int[] numbers = [1, 3, 2, 5, 4];
    List<int> nums = [.. numbers];
    ```

=== "Go"

    ```go title="list_test.go"
    /* Инициализация списка */
    // Без начальных значений
    emptyNums := []int{}
    // С начальными значениями
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Инициализация списка */
    // Без начальных значений
    let emptyNums: [Int] = []
    // С начальными значениями
    var nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="list.js"
    /* Инициализация списка */
    // Без начальных значений
    const emptyNums = [];
    // С начальными значениями
    const nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Инициализация списка */
    // Без начальных значений
    const emptyNums: number[] = [];
    // С начальными значениями
    const nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Инициализация списка */
    // Без начальных значений
    List<int> emptyNums = [];
    // С начальными значениями
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="list.rs"
    // Инициализация списка
    // Без начальных значений
    let empty_nums: Vec<i32> = Vec::new();
    // С начальными значениями
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Инициализация списка */
    // Без начальных значений
    val emptyNums = mutableListOf<Int>()
    // С начальными значениями
    val nums = mutableListOf(1, 3, 2, 5, 4)
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Инициализация списка
    # Без начальных значений
    empty_nums = []
    # С начальными значениями
    nums = [1, 3, 2, 5, 4]
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20%23%20%D0%91%D0%B5%D0%B7%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D1%85%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B9%0A%20%20%20%20empty_nums%20%3D%20%5B%5D%0A%20%20%20%20%23%20%D0%A1%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20%23%20%D0%91%D0%B5%D0%B7%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D1%85%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B9%0A%20%20%20%20empty_nums%20%3D%20%5B%5D%0A%20%20%20%20%23%20%D0%A1%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 2. &nbsp; Доступ к элементу

В основе такого списка лежит массив, поэтому чтение и изменение элемента по индексу занимают всего $O(1)$ времени.

=== "Python"

    ```python title="list.py"
    # Доступ к элементу
    x: int = nums[1]  # Прочитать элемент по индексу 1

    # Изменение элемента
    nums[1] = 0  # Записать 0 по индексу 1
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Доступ к элементу */
    int num = nums[1]; // Прочитать элемент по индексу 1

    /* Изменение элемента */
    nums[1] = 0; // Записать 0 по индексу 1
    ```

=== "Java"

    ```java title="list.java"
    /* Доступ к элементу */
    int num = nums.get(1); // Прочитать элемент по индексу 1

    /* Изменение элемента */
    nums.set(1, 0); // Записать 0 по индексу 1
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Доступ к элементу */
    int num = nums[1]; // Прочитать элемент по индексу 1

    /* Изменение элемента */
    nums[1] = 0; // Записать 0 по индексу 1
    ```

=== "Go"

    ```go title="list_test.go"
    /* Доступ к элементу */
    num := nums[1] // Прочитать элемент по индексу 1

    /* Изменение элемента */
    nums[1] = 0 // Записать 0 по индексу 1
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Доступ к элементу */
    let num = nums[1] // Прочитать элемент по индексу 1

    /* Изменение элемента */
    nums[1] = 0 // Записать 0 по индексу 1
    ```

=== "JS"

    ```javascript title="list.js"
    /* Доступ к элементу */
    const num = nums[1]; // Прочитать элемент по индексу 1

    /* Изменение элемента */
    nums[1] = 0; // Записать 0 по индексу 1
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Доступ к элементу */
    const num: number = nums[1]; // Прочитать элемент по индексу 1

    /* Изменение элемента */
    nums[1] = 0; // Записать 0 по индексу 1
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Доступ к элементу */
    int _num = nums[1]; // Прочитать элемент по индексу 1

    /* Изменение элемента */
    nums[1] = 0; // Записать 0 по индексу 1
    ```

=== "Rust"

    ```rust title="list.rs"
    // Доступ к элементу
    let num = nums[1]; // Прочитать элемент по индексу 1

    // Изменение элемента
    nums[1] = 0; // Записать 0 по индексу 1
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Доступ к элементу */
    val num = nums[1] // Прочитать элемент по индексу 1

    /* Изменение элемента */
    nums[1] = 0 // Записать 0 по индексу 1
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Доступ к элементу
    num = nums[1] # Прочитать элемент по индексу 1

    # Изменение элемента
    nums[1] = 0 # Записать 0 по индексу 1
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 369px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20x%20%3D%20nums%5B1%5D%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%201%0A%0A%20%20%20%20%23%20%D0%9C%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D1%8B%D0%B2%D0%B0%D0%B5%D0%BC%200%20%D0%B2%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%201&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20x%20%3D%20nums%5B1%5D%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%201%0A%0A%20%20%20%20%23%20%D0%9C%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D1%8B%D0%B2%D0%B0%D0%B5%D0%BC%200%20%D0%B2%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%201&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 3. &nbsp; Вставка и удаление элементов

В списке, в отличие от массива фиксированной длины, можно свободно добавлять и удалять элементы. Добавление в конец занимает амортизированное время $O(1)$. Вставка и удаление, как и в массиве, имеют временную сложность $O(n)$.

=== "Python"

    ```python title="list.py"
    # Очистка списка
    nums.clear()

    # Добавление элемента в конец
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # Вставка элемента в середину
    nums.insert(3, 6)  # Вставить число 6 по индексу 3

    # Удаление элемента
    nums.pop(3)  # Удалить элемент по индексу 3
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Очистка списка */
    nums.clear();

    /* Добавление элемента в конец */
    nums.push_back(1);
    nums.push_back(3);
    nums.push_back(2);
    nums.push_back(5);
    nums.push_back(4);

    /* Вставка элемента в середину */
    nums.insert(nums.begin() + 3, 6); // Вставить число 6 по индексу 3

    /* Удаление элемента */
    nums.erase(nums.begin() + 3); // Удалить элемент по индексу 3
    ```

=== "Java"

    ```java title="list.java"
    /* Очистка списка */
    nums.clear();

    /* Добавление элемента в конец */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Вставка элемента в середину */
    nums.add(3, 6); // Вставить число 6 по индексу 3

    /* Удаление элемента */
    nums.remove(3); // Удалить элемент по индексу 3
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Очистка списка */
    nums.Clear();

    /* Добавление элемента в конец */
    nums.Add(1);
    nums.Add(3);
    nums.Add(2);
    nums.Add(5);
    nums.Add(4);

    /* Вставка элемента в середину */
    nums.Insert(3, 6); // Вставить число 6 по индексу 3

    /* Удаление элемента */
    nums.RemoveAt(3); // Удалить элемент по индексу 3
    ```

=== "Go"

    ```go title="list_test.go"
    /* Очистка списка */
    nums = nil

    /* Добавление элемента в конец */
    nums = append(nums, 1)
    nums = append(nums, 3)
    nums = append(nums, 2)
    nums = append(nums, 5)
    nums = append(nums, 4)

    /* Вставка элемента в середину */
    nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Вставить число 6 по индексу 3

    /* Удаление элемента */
    nums = append(nums[:3], nums[4:]...) // Удалить элемент по индексу 3
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Очистка списка */
    nums.removeAll()

    /* Добавление элемента в конец */
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    /* Вставка элемента в середину */
    nums.insert(6, at: 3) // Вставить число 6 по индексу 3

    /* Удаление элемента */
    nums.remove(at: 3) // Удалить элемент по индексу 3
    ```

=== "JS"

    ```javascript title="list.js"
    /* Очистка списка */
    nums.length = 0;

    /* Добавление элемента в конец */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Вставка элемента в середину */
    nums.splice(3, 0, 6); // Вставить число 6 по индексу 3

    /* Удаление элемента */
    nums.splice(3, 1); // Удалить элемент по индексу 3
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Очистка списка */
    nums.length = 0;

    /* Добавление элемента в конец */
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    /* Вставка элемента в середину */
    nums.splice(3, 0, 6); // Вставить число 6 по индексу 3

    /* Удаление элемента */
    nums.splice(3, 1); // Удалить элемент по индексу 3
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Очистка списка */
    nums.clear();

    /* Добавление элемента в конец */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);

    /* Вставка элемента в середину */
    nums.insert(3, 6); // Вставить число 6 по индексу 3

    /* Удаление элемента */
    nums.removeAt(3); // Удалить элемент по индексу 3
    ```

=== "Rust"

    ```rust title="list.rs"
    // Очистка списка
    nums.clear();

    // Добавление элемента в конец
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);

    // Вставка элемента в середину
    nums.insert(3, 6); // Вставить число 6 по индексу 3

    // Удаление элемента
    nums.remove(3); // Удалить элемент по индексу 3
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Очистка списка */
    nums.clear()

    /* Добавление элемента в конец */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)

    /* Вставка элемента в середину */
    nums.add(3, 6) // Вставить число 6 по индексу 3

    /* Удаление элемента */
    nums.removeAt(3) // Удалить элемент по индексу 3
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Очистка списка
    nums.clear

    # Добавление элемента в конец
    nums << 1
    nums << 3
    nums << 2
    nums << 5
    nums << 4

    # Вставка элемента в середину
    nums.insert(3, 6) # Вставить число 6 по индексу 3

    # Удаление элемента
    nums.delete_at(3) # Удалить элемент по индексу 3
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D1%87%D0%B8%D1%89%D0%B0%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%83%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%206%20%D0%BD%D0%B0%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%203%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%203&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D1%87%D0%B8%D1%89%D0%B0%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%83%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%206%20%D0%BD%D0%B0%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%203%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%203&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 4. &nbsp; Обход списка

Как и массив, список можно обходить по индексам или непосредственно перебирать его элементы.

=== "Python"

    ```python title="list.py"
    # Обойти список по индексам
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # Перебрать элементы списка напрямую
    for num in nums:
        count += num
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Обойти список по индексам */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums[i];
    }

    /* Перебрать элементы списка напрямую */
    count = 0;
    for (int x : nums) {
        count += x;
    }
    ```

=== "Java"

    ```java title="list.java"
    /* Обойти список по индексам */
    int count = 0;
    for (int i = 0; i < nums.size(); i++) {
        count += nums.get(i);
    }

    /* Перебрать элементы списка напрямую */
    for (int x : nums) {
        count += x;
    }
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Обойти список по индексам */
    int count = 0;
    for (int i = 0; i < nums.Count; i++) {
        count += nums[i];
    }

    /* Перебрать элементы списка напрямую */
    count = 0;
    foreach (int x in nums) {
        count += x;
    }
    ```

=== "Go"

    ```go title="list_test.go"
    /* Обойти список по индексам */
    count := 0
    for i := 0; i < len(nums); i++ {
        count += nums[i]
    }

    /* Перебрать элементы списка напрямую */
    count = 0
    for _, x := range nums {
        count += x
    }
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Обойти список по индексам */
    var count = 0
    for i in nums.indices {
        count += nums[i]
    }

    /* Перебрать элементы списка напрямую */
    count = 0
    for x in nums {
        count += x
    }
    ```

=== "JS"

    ```javascript title="list.js"
    /* Обойти список по индексам */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Перебрать элементы списка напрямую */
    count = 0;
    for (const x of nums) {
        count += x;
    }
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Обойти список по индексам */
    let count = 0;
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }

    /* Перебрать элементы списка напрямую */
    count = 0;
    for (const x of nums) {
        count += x;
    }
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Обойти список по индексам */
    int count = 0;
    for (var i = 0; i < nums.length; i++) {
      count += nums[i];
    }

    /* Перебрать элементы списка напрямую */
    count = 0;
    for (var x in nums) {
      count += x;
    }
    ```

=== "Rust"

    ```rust title="list.rs"
    // Обойти список по индексам
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }

    // Перебрать элементы списка напрямую
    _count = 0;
    for x in &nums {
        _count += x;
    }
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Обойти список по индексам */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Перебрать элементы списка напрямую */
    for (j in nums) {
        count += j
    }
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Обойти список по индексам
    count = 0
    for i in 0...nums.length
      count += nums[i]
    end

    # Перебрать элементы списка напрямую
    count = 0
    nums.each do |x|
      count += x
    end
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%B8%D1%80%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%B8%D1%80%D0%B0%D0%B5%D0%BC%20%D1%81%D0%B0%D0%BC%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%B8%D1%80%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%B8%D1%80%D0%B0%D0%B5%D0%BC%20%D1%81%D0%B0%D0%BC%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 5. &nbsp; Объединение списков

Пусть дан ещё один список `nums1`. Его можно присоединить к концу исходного списка.

=== "Python"

    ```python title="list.py"
    # Объединение двух списков
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1  # Добавить список nums1 в конец nums
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Объединение двух списков */
    vector<int> nums1 = {6, 8, 7, 10, 9};
    // Добавить список nums1 в конец nums
    nums.insert(nums.end(), nums1.begin(), nums1.end());
    ```

=== "Java"

    ```java title="list.java"
    /* Объединение двух списков */
    List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
    nums.addAll(nums1); // Добавить список nums1 в конец nums
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Объединение двух списков */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.AddRange(nums1); // Добавить список nums1 в конец nums
    ```

=== "Go"

    ```go title="list_test.go"
    /* Объединение двух списков */
    nums1 := []int{6, 8, 7, 10, 9}
    nums = append(nums, nums1...) // Добавить список nums1 в конец nums
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Объединение двух списков */
    let nums1 = [6, 8, 7, 10, 9]
    nums.append(contentsOf: nums1) // Добавить список nums1 в конец nums
    ```

=== "JS"

    ```javascript title="list.js"
    /* Объединение двух списков */
    const nums1 = [6, 8, 7, 10, 9];
    nums.push(...nums1); // Добавить список nums1 в конец nums
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Объединение двух списков */
    const nums1: number[] = [6, 8, 7, 10, 9];
    nums.push(...nums1); // Добавить список nums1 в конец nums
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Объединение двух списков */
    List<int> nums1 = [6, 8, 7, 10, 9];
    nums.addAll(nums1); // Добавить список nums1 в конец nums
    ```

=== "Rust"

    ```rust title="list.rs"
    // Объединение двух списков
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append перемещает элементы из nums1, оставляя nums1 пустым
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Объединение двух списков */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1) // Добавить список nums1 в конец nums
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Объединение двух списков
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 333px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B5%D0%B4%D0%B8%D0%BD%D1%8F%D0%B5%D0%BC%20%D0%B4%D0%B2%D0%B0%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20nums1%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%20nums&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B5%D0%B4%D0%B8%D0%BD%D1%8F%D0%B5%D0%BC%20%D0%B4%D0%B2%D0%B0%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20nums1%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%20nums&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 6. &nbsp; Сортировка списка

После сортировки списка можно применять двоичный поиск и метод двух указателей. Эти алгоритмы часто встречаются в задачах на массивы.

=== "Python"

    ```python title="list.py"
    # Сортировка списка
    nums.sort()  # После сортировки элементы списка расположены по возрастанию
    ```

=== "C++"

    ```cpp title="list.cpp"
    /* Сортировка списка */
    sort(nums.begin(), nums.end()); // После сортировки элементы списка расположены по возрастанию
    ```

=== "Java"

    ```java title="list.java"
    /* Сортировка списка */
    Collections.sort(nums); // После сортировки элементы списка расположены по возрастанию
    ```

=== "C#"

    ```csharp title="list.cs"
    /* Сортировка списка */
    nums.Sort(); // После сортировки элементы списка расположены по возрастанию
    ```

=== "Go"

    ```go title="list_test.go"
    /* Сортировка списка */
    sort.Ints(nums) // После сортировки элементы списка расположены по возрастанию
    ```

=== "Swift"

    ```swift title="list.swift"
    /* Сортировка списка */
    nums.sort() // После сортировки элементы списка расположены по возрастанию
    ```

=== "JS"

    ```javascript title="list.js"
    /* Сортировка списка */
    nums.sort((a, b) => a - b); // После сортировки элементы списка расположены по возрастанию
    ```

=== "TS"

    ```typescript title="list.ts"
    /* Сортировка списка */
    nums.sort((a, b) => a - b); // После сортировки элементы списка расположены по возрастанию
    ```

=== "Dart"

    ```dart title="list.dart"
    /* Сортировка списка */
    nums.sort(); // После сортировки элементы списка расположены по возрастанию
    ```

=== "Rust"

    ```rust title="list.rs"
    // Сортировка списка
    nums.sort(); // После сортировки элементы списка расположены по возрастанию
    ```

=== "C"

    ```c title="list.c"
    // В C нет встроенного динамического массива
    ```

=== "Kotlin"

    ```kotlin title="list.kt"
    /* Сортировка списка */
    nums.sort() // После сортировки элементы списка расположены по возрастанию
    ```

=== "Ruby"

    ```ruby title="list.rb"
    # Сортировка списка
    nums = nums.sort { |a, b| a <=> b } # После сортировки элементы списка расположены по возрастанию
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 315px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A1%D0%BE%D1%80%D1%82%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums.sort%28%29%20%20%23%20%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%80%D0%B0%D1%81%D0%BF%D0%BE%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D1%8B%20%D0%BF%D0%BE%20%D0%B2%D0%BE%D0%B7%D1%80%D0%B0%D1%81%D1%82%D0%B0%D0%BD%D0%B8%D1%8E&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A1%D0%BE%D1%80%D1%82%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums.sort%28%29%20%20%23%20%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%80%D0%B0%D1%81%D0%BF%D0%BE%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D1%8B%20%D0%BF%D0%BE%20%D0%B2%D0%BE%D0%B7%D1%80%D0%B0%D1%81%D1%82%D0%B0%D0%BD%D0%B8%D1%8E&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 4.3.2 &nbsp; Реализация списка

Во многих языках, например Java, C++ и Python, есть готовые реализации списков. Они довольно сложны, а параметры, в частности начальная ёмкость и коэффициент её увеличения, тщательно подобраны. За подробностями можно обратиться к исходному коду.

Чтобы лучше понять устройство списка, реализуем его упрощённую версию. Особое внимание уделим трём решениям.

- **Начальная ёмкость**. Выберем подходящую ёмкость исходного массива. В нашем примере она равна 10.
- **Учёт числа элементов**. Заведём переменную `size` для текущего количества элементов и будем обновлять её при каждой вставке и удалении. По ней можно определить конец списка и понять, нужно ли увеличивать ёмкость.
- **Увеличение ёмкости**. Если к моменту вставки список заполнен, его нужно расширить. Сначала создаём массив большего размера с учётом коэффициента увеличения, затем по порядку переносим в него все элементы текущего массива. В нашем примере при каждом расширении ёмкость удваивается.

=== "Python"

    ```python title="my_list.py"
    class MyList:
        """Класс списка"""

        def __init__(self):
            """Конструктор"""
            self._capacity: int = 10  # Ёмкость списка
            self._arr: list[int] = [0] * self._capacity  # Массив для хранения элементов списка
            self._size: int = 0  # Длина списка (текущее количество элементов)
            self._extend_ratio: int = 2  # Коэффициент увеличения ёмкости списка

        def size(self) -> int:
            """Получить длину списка (текущее количество элементов)"""
            return self._size

        def capacity(self) -> int:
            """Получить ёмкость списка"""
            return self._capacity

        def get(self, index: int) -> int:
            """Доступ к элементу"""
            # При выходе индекса за границы выбросить исключение. То же правило действует ниже
            if index < 0 or index >= self._size:
                raise IndexError("Индекс за пределами списка")
            return self._arr[index]

        def set(self, num: int, index: int):
            """Изменение элемента"""
            if index < 0 or index >= self._size:
                raise IndexError("Индекс за пределами списка")
            self._arr[index] = num

        def add(self, num: int):
            """Добавление элемента в конец"""
            # Если для элементов не хватает места, увеличить ёмкость
            if self.size() == self.capacity():
                self.extend_capacity()
            self._arr[self._size] = num
            self._size += 1

        def insert(self, num: int, index: int):
            """Вставка элемента в середину"""
            if index < 0 or index >= self._size:
                raise IndexError("Индекс за пределами списка")
            # Если для элементов не хватает места, увеличить ёмкость
            if self._size == self.capacity():
                self.extend_capacity()
            # Сдвинуть все элементы начиная с index на одну позицию вправо
            for j in range(self._size - 1, index - 1, -1):
                self._arr[j + 1] = self._arr[j]
            self._arr[index] = num
            # Обновить количество элементов
            self._size += 1

        def remove(self, index: int) -> int:
            """Удаление элемента"""
            if index < 0 or index >= self._size:
                raise IndexError("Индекс за пределами списка")
            num = self._arr[index]
            # Сдвинуть все элементы после index на одну позицию влево
            for j in range(index, self._size - 1):
                self._arr[j] = self._arr[j + 1]
            # Обновить количество элементов
            self._size -= 1
            # Вернуть удалённый элемент
            return num

        def extend_capacity(self):
            """Увеличение ёмкости списка"""
            # Создать массив в _extend_ratio раз длиннее исходного и скопировать в него исходный массив
            self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
            # Обновить ёмкость списка
            self._capacity = len(self._arr)

        def to_array(self) -> list[int]:
            """Вернуть список в пределах фактической длины"""
            return self._arr[: self._size]
    ```

=== "C++"

    ```cpp title="my_list.cpp"
    /* Класс списка */
    class MyList {
      private:
        int *arr;             // Массив для хранения элементов списка
        int arrCapacity = 10; // Ёмкость списка
        int arrSize = 0;      // Длина списка (текущее количество элементов)
        int extendRatio = 2;   // Коэффициент увеличения ёмкости списка

      public:
        /* Конструктор */
        MyList() {
            arr = new int[arrCapacity];
        }

        /* Деструктор */
        ~MyList() {
            delete[] arr;
        }

        /* Получить длину списка (текущее количество элементов)*/
        int size() {
            return arrSize;
        }

        /* Получить ёмкость списка */
        int capacity() {
            return arrCapacity;
        }

        /* Доступ к элементу */
        int get(int index) {
            // При выходе индекса за границы выбросить исключение. То же правило действует ниже
            if (index < 0 || index >= size())
                throw out_of_range("Индекс за пределами списка");
            return arr[index];
        }

        /* Изменение элемента */
        void set(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("Индекс за пределами списка");
            arr[index] = num;
        }

        /* Добавление элемента в конец */
        void add(int num) {
            // Если для элементов не хватает места, увеличить ёмкость
            if (size() == capacity())
                extendCapacity();
            arr[size()] = num;
            // Обновить количество элементов
            arrSize++;
        }

        /* Вставка элемента в середину */
        void insert(int index, int num) {
            if (index < 0 || index >= size())
                throw out_of_range("Индекс за пределами списка");
            // Если для элементов не хватает места, увеличить ёмкость
            if (size() == capacity())
                extendCapacity();
            // Сдвинуть все элементы начиная с index на одну позицию вправо
            for (int j = size() - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // Обновить количество элементов
            arrSize++;
        }

        /* Удаление элемента */
        int remove(int index) {
            if (index < 0 || index >= size())
                throw out_of_range("Индекс за пределами списка");
            int num = arr[index];
            // Сдвинуть все элементы после index на одну позицию влево
            for (int j = index; j < size() - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // Обновить количество элементов
            arrSize--;
            // Вернуть удалённый элемент
            return num;
        }

        /* Увеличение ёмкости списка */
        void extendCapacity() {
            // Создать массив, длина которого в extendRatio раз больше длины исходного
            int newCapacity = capacity() * extendRatio;
            int *tmp = arr;
            arr = new int[newCapacity];
            // Скопировать все элементы исходного массива в новый
            for (int i = 0; i < size(); i++) {
                arr[i] = tmp[i];
            }
            // Освободить память
            delete[] tmp;
            arrCapacity = newCapacity;
        }

        /* Преобразовать список в вектор для вывода */
        vector<int> toVector() {
            // Преобразовать только используемую часть списка
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
        private int[] arr; // Массив для хранения элементов списка
        private int capacity = 10; // Ёмкость списка
        private int size = 0; // Длина списка (текущее количество элементов)
        private int extendRatio = 2; // Коэффициент увеличения ёмкости списка

        /* Конструктор */
        public MyList() {
            arr = new int[capacity];
        }

        /* Получить длину списка (текущее количество элементов) */
        public int size() {
            return size;
        }

        /* Получить ёмкость списка */
        public int capacity() {
            return capacity;
        }

        /* Доступ к элементу */
        public int get(int index) {
            // При выходе индекса за границы выбросить исключение. То же правило действует ниже
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Индекс за пределами списка");
            return arr[index];
        }

        /* Изменение элемента */
        public void set(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Индекс за пределами списка");
            arr[index] = num;
        }

        /* Добавление элемента в конец */
        public void add(int num) {
            // Если для элементов не хватает места, увеличить ёмкость
            if (size == capacity())
                extendCapacity();
            arr[size] = num;
            // Обновить количество элементов
            size++;
        }

        /* Вставка элемента в середину */
        public void insert(int index, int num) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Индекс за пределами списка");
            // Если для элементов не хватает места, увеличить ёмкость
            if (size == capacity())
                extendCapacity();
            // Сдвинуть все элементы начиная с index на одну позицию вправо
            for (int j = size - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // Обновить количество элементов
            size++;
        }

        /* Удаление элемента */
        public int remove(int index) {
            if (index < 0 || index >= size)
                throw new IndexOutOfBoundsException("Индекс за пределами списка");
            int num = arr[index];
            // Сдвинуть все элементы после index на одну позицию влево
            for (int j = index; j < size - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // Обновить количество элементов
            size--;
            // Вернуть удалённый элемент
            return num;
        }

        /* Увеличение ёмкости списка */
        public void extendCapacity() {
            // Создать массив в extendRatio раз длиннее исходного и скопировать в него исходный массив
            arr = Arrays.copyOf(arr, capacity() * extendRatio);
            // Обновить ёмкость списка
            capacity = arr.length;
        }

        /* Преобразовать список в массив */
        public int[] toArray() {
            int size = size();
            // Преобразовать только используемую часть списка
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
        private int[] arr;           // Массив для хранения элементов списка
        private int arrCapacity = 10;    // Ёмкость списка
        private int arrSize = 0;         // Длина списка (текущее количество элементов)
        private readonly int extendRatio = 2;  // Коэффициент увеличения ёмкости списка

        /* Конструктор */
        public MyList() {
            arr = new int[arrCapacity];
        }

        /* Получить длину списка (текущее количество элементов)*/
        public int Size() {
            return arrSize;
        }

        /* Получить ёмкость списка */
        public int Capacity() {
            return arrCapacity;
        }

        /* Доступ к элементу */
        public int Get(int index) {
            // При выходе индекса за границы выбросить исключение. То же правило действует ниже
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("Индекс за пределами списка");
            return arr[index];
        }

        /* Изменение элемента */
        public void Set(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("Индекс за пределами списка");
            arr[index] = num;
        }

        /* Добавление элемента в конец */
        public void Add(int num) {
            // Если для элементов не хватает места, увеличить ёмкость
            if (arrSize == arrCapacity)
                ExtendCapacity();
            arr[arrSize] = num;
            // Обновить количество элементов
            arrSize++;
        }

        /* Вставка элемента в середину */
        public void Insert(int index, int num) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("Индекс за пределами списка");
            // Если для элементов не хватает места, увеличить ёмкость
            if (arrSize == arrCapacity)
                ExtendCapacity();
            // Сдвинуть все элементы начиная с index на одну позицию вправо
            for (int j = arrSize - 1; j >= index; j--) {
                arr[j + 1] = arr[j];
            }
            arr[index] = num;
            // Обновить количество элементов
            arrSize++;
        }

        /* Удаление элемента */
        public int Remove(int index) {
            if (index < 0 || index >= arrSize)
                throw new IndexOutOfRangeException("Индекс за пределами списка");
            int num = arr[index];
            // Сдвинуть все элементы после index на одну позицию влево
            for (int j = index; j < arrSize - 1; j++) {
                arr[j] = arr[j + 1];
            }
            // Обновить количество элементов
            arrSize--;
            // Вернуть удалённый элемент
            return num;
        }

        /* Увеличение ёмкости списка */
        public void ExtendCapacity() {
            // Создать массив длины arrCapacity * extendRatio и скопировать в него исходный массив
            Array.Resize(ref arr, arrCapacity * extendRatio);
            // Обновить ёмкость списка
            arrCapacity = arr.Length;
        }

        /* Преобразовать список в массив */
        public int[] ToArray() {
            // Преобразовать только используемую часть списка
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
            arrCapacity: 10,              // Ёмкость списка
            arr:         make([]int, 10), // Массив для хранения элементов списка
            arrSize:     0,               // Длина списка (текущее количество элементов)
            extendRatio: 2,               // Коэффициент увеличения ёмкости списка
        }
    }

    /* Получить длину списка (текущее количество элементов) */
    func (l *myList) size() int {
        return l.arrSize
    }

    /*  Получить ёмкость списка */
    func (l *myList) capacity() int {
        return l.arrCapacity
    }

    /* Доступ к элементу */
    func (l *myList) get(index int) int {
        // При выходе индекса за границы выбросить исключение. То же правило действует ниже
        if index < 0 || index >= l.arrSize {
            panic("Индекс за пределами списка")
        }
        return l.arr[index]
    }

    /* Изменение элемента */
    func (l *myList) set(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("Индекс за пределами списка")
        }
        l.arr[index] = num
    }

    /* Добавление элемента в конец */
    func (l *myList) add(num int) {
        // Если для элементов не хватает места, увеличить ёмкость
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        l.arr[l.arrSize] = num
        // Обновить количество элементов
        l.arrSize++
    }

    /* Вставка элемента в середину */
    func (l *myList) insert(num, index int) {
        if index < 0 || index >= l.arrSize {
            panic("Индекс за пределами списка")
        }
        // Если для элементов не хватает места, увеличить ёмкость
        if l.arrSize == l.arrCapacity {
            l.extendCapacity()
        }
        // Сдвинуть все элементы начиная с index на одну позицию вправо
        for j := l.arrSize - 1; j >= index; j-- {
            l.arr[j+1] = l.arr[j]
        }
        l.arr[index] = num
        // Обновить количество элементов
        l.arrSize++
    }

    /* Удаление элемента */
    func (l *myList) remove(index int) int {
        if index < 0 || index >= l.arrSize {
            panic("Индекс за пределами списка")
        }
        num := l.arr[index]
        // Сдвинуть все элементы после index на одну позицию влево
        for j := index; j < l.arrSize-1; j++ {
            l.arr[j] = l.arr[j+1]
        }
        // Обновить количество элементов
        l.arrSize--
        // Вернуть удалённый элемент
        return num
    }

    /* Увеличение ёмкости списка */
    func (l *myList) extendCapacity() {
        // Создать массив в extendRatio раз длиннее исходного и скопировать в него исходный массив
        l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
        // Обновить ёмкость списка
        l.arrCapacity = len(l.arr)
    }

    /* Вернуть список в пределах фактической длины */
    func (l *myList) toArray() []int {
        // Преобразовать только используемую часть списка
        return l.arr[:l.arrSize]
    }
    ```

=== "Swift"

    ```swift title="my_list.swift"
    /* Класс списка */
    class MyList {
        private var arr: [Int] // Массив для хранения элементов списка
        private var _capacity: Int // Ёмкость списка
        private var _size: Int // Длина списка (текущее количество элементов)
        private let extendRatio: Int // Коэффициент увеличения ёмкости списка

        /* Конструктор */
        init() {
            _capacity = 10
            _size = 0
            extendRatio = 2
            arr = Array(repeating: 0, count: _capacity)
        }

        /* Получить длину списка (текущее количество элементов)*/
        func size() -> Int {
            _size
        }

        /* Получить ёмкость списка */
        func capacity() -> Int {
            _capacity
        }

        /* Доступ к элементу */
        func get(index: Int) -> Int {
            // При выходе индекса за границы сообщить об ошибке. То же правило действует ниже
            if index < 0 || index >= size() {
                fatalError("Индекс за пределами списка")
            }
            return arr[index]
        }

        /* Изменение элемента */
        func set(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("Индекс за пределами списка")
            }
            arr[index] = num
        }

        /* Добавление элемента в конец */
        func add(num: Int) {
            // Если для элементов не хватает места, увеличить ёмкость
            if size() == capacity() {
                extendCapacity()
            }
            arr[size()] = num
            // Обновить количество элементов
            _size += 1
        }

        /* Вставка элемента в середину */
        func insert(index: Int, num: Int) {
            if index < 0 || index >= size() {
                fatalError("Индекс за пределами списка")
            }
            // Если для элементов не хватает места, увеличить ёмкость
            if size() == capacity() {
                extendCapacity()
            }
            // Сдвинуть все элементы начиная с index на одну позицию вправо
            for j in (index ..< size()).reversed() {
                arr[j + 1] = arr[j]
            }
            arr[index] = num
            // Обновить количество элементов
            _size += 1
        }

        /* Удаление элемента */
        @discardableResult
        func remove(index: Int) -> Int {
            if index < 0 || index >= size() {
                fatalError("Индекс за пределами списка")
            }
            let num = arr[index]
            // Сдвинуть все элементы после index на одну позицию влево
            for j in index ..< (size() - 1) {
                arr[j] = arr[j + 1]
            }
            // Обновить количество элементов
            _size -= 1
            // Вернуть удалённый элемент
            return num
        }

        /* Увеличение ёмкости списка */
        func extendCapacity() {
            // Создать массив в extendRatio раз длиннее исходного и скопировать в него исходный массив
            arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
            // Обновить ёмкость списка
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
        #arr = new Array(); // Массив для хранения элементов списка
        #capacity = 10; // Ёмкость списка
        #size = 0; // Длина списка (текущее количество элементов)
        #extendRatio = 2; // Коэффициент увеличения ёмкости списка

        /* Конструктор */
        constructor() {
            this.#arr = new Array(this.#capacity);
        }

        /* Получить длину списка (текущее количество элементов)*/
        size() {
            return this.#size;
        }

        /* Получить ёмкость списка */
        capacity() {
            return this.#capacity;
        }

        /* Доступ к элементу */
        get(index) {
            // При выходе индекса за границы выбросить исключение. То же правило действует ниже
            if (index < 0 || index >= this.#size) throw new Error('Индекс за пределами списка');
            return this.#arr[index];
        }

        /* Изменение элемента */
        set(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('Индекс за пределами списка');
            this.#arr[index] = num;
        }

        /* Добавление элемента в конец */
        add(num) {
            // Если длина равна ёмкости, увеличить ёмкость
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // Добавить новый элемент в конец списка
            this.#arr[this.#size] = num;
            this.#size++;
        }

        /* Вставка элемента в середину */
        insert(index, num) {
            if (index < 0 || index >= this.#size) throw new Error('Индекс за пределами списка');
            // Если для элементов не хватает места, увеличить ёмкость
            if (this.#size === this.#capacity) {
                this.extendCapacity();
            }
            // Сдвинуть все элементы начиная с index на одну позицию вправо
            for (let j = this.#size - 1; j >= index; j--) {
                this.#arr[j + 1] = this.#arr[j];
            }
            // Обновить количество элементов
            this.#arr[index] = num;
            this.#size++;
        }

        /* Удаление элемента */
        remove(index) {
            if (index < 0 || index >= this.#size) throw new Error('Индекс за пределами списка');
            let num = this.#arr[index];
            // Сдвинуть все элементы после index на одну позицию влево
            for (let j = index; j < this.#size - 1; j++) {
                this.#arr[j] = this.#arr[j + 1];
            }
            // Обновить количество элементов
            this.#size--;
            // Вернуть удалённый элемент
            return num;
        }

        /* Увеличение ёмкости списка */
        extendCapacity() {
            // Создать массив в extendRatio раз длиннее исходного и скопировать в него исходный массив
            this.#arr = this.#arr.concat(
                new Array(this.capacity() * (this.#extendRatio - 1))
            );
            // Обновить ёмкость списка
            this.#capacity = this.#arr.length;
        }

        /* Преобразовать список в массив */
        toArray() {
            let size = this.size();
            // Преобразовать только используемую часть списка
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
        private arr: Array<number>; // Массив для хранения элементов списка
        private _capacity: number = 10; // Ёмкость списка
        private _size: number = 0; // Длина списка (текущее количество элементов)
        private extendRatio: number = 2; // Коэффициент увеличения ёмкости списка

        /* Конструктор */
        constructor() {
            this.arr = new Array(this._capacity);
        }

        /* Получить длину списка (текущее количество элементов)*/
        public size(): number {
            return this._size;
        }

        /* Получить ёмкость списка */
        public capacity(): number {
            return this._capacity;
        }

        /* Доступ к элементу */
        public get(index: number): number {
            // При выходе индекса за границы выбросить исключение. То же правило действует ниже
            if (index < 0 || index >= this._size) throw new Error('Индекс за пределами списка');
            return this.arr[index];
        }

        /* Изменение элемента */
        public set(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('Индекс за пределами списка');
            this.arr[index] = num;
        }

        /* Добавление элемента в конец */
        public add(num: number): void {
            // Если длина равна ёмкости, увеличить ёмкость
            if (this._size === this._capacity) this.extendCapacity();
            // Добавить новый элемент в конец списка
            this.arr[this._size] = num;
            this._size++;
        }

        /* Вставка элемента в середину */
        public insert(index: number, num: number): void {
            if (index < 0 || index >= this._size) throw new Error('Индекс за пределами списка');
            // Если для элементов не хватает места, увеличить ёмкость
            if (this._size === this._capacity) {
                this.extendCapacity();
            }
            // Сдвинуть все элементы начиная с index на одну позицию вправо
            for (let j = this._size - 1; j >= index; j--) {
                this.arr[j + 1] = this.arr[j];
            }
            // Обновить количество элементов
            this.arr[index] = num;
            this._size++;
        }

        /* Удаление элемента */
        public remove(index: number): number {
            if (index < 0 || index >= this._size) throw new Error('Индекс за пределами списка');
            let num = this.arr[index];
            // Сдвинуть все элементы после index на одну позицию влево
            for (let j = index; j < this._size - 1; j++) {
                this.arr[j] = this.arr[j + 1];
            }
            // Обновить количество элементов
            this._size--;
            // Вернуть удалённый элемент
            return num;
        }

        /* Увеличение ёмкости списка */
        public extendCapacity(): void {
            // Создать массив длины size и скопировать в него исходный массив
            this.arr = this.arr.concat(
                new Array(this.capacity() * (this.extendRatio - 1))
            );
            // Обновить ёмкость списка
            this._capacity = this.arr.length;
        }

        /* Преобразовать список в массив */
        public toArray(): number[] {
            let size = this.size();
            // Преобразовать только используемую часть списка
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
      late List<int> _arr; // Массив для хранения элементов списка
      int _capacity = 10; // Ёмкость списка
      int _size = 0; // Длина списка (текущее количество элементов)
      int _extendRatio = 2; // Коэффициент увеличения ёмкости списка

      /* Конструктор */
      MyList() {
        _arr = List.filled(_capacity, 0);
      }

      /* Получить длину списка (текущее количество элементов)*/
      int size() => _size;

      /* Получить ёмкость списка */
      int capacity() => _capacity;

      /* Доступ к элементу */
      int get(int index) {
        if (index >= _size) throw RangeError('Индекс за пределами списка');
        return _arr[index];
      }

      /* Изменение элемента */
      void set(int index, int _num) {
        if (index >= _size) throw RangeError('Индекс за пределами списка');
        _arr[index] = _num;
      }

      /* Добавление элемента в конец */
      void add(int _num) {
        // Если для элементов не хватает места, увеличить ёмкость
        if (_size == _capacity) extendCapacity();
        _arr[_size] = _num;
        // Обновить количество элементов
        _size++;
      }

      /* Вставка элемента в середину */
      void insert(int index, int _num) {
        if (index >= _size) throw RangeError('Индекс за пределами списка');
        // Если для элементов не хватает места, увеличить ёмкость
        if (_size == _capacity) extendCapacity();
        // Сдвинуть все элементы начиная с index на одну позицию вправо
        for (var j = _size - 1; j >= index; j--) {
          _arr[j + 1] = _arr[j];
        }
        _arr[index] = _num;
        // Обновить количество элементов
        _size++;
      }

      /* Удаление элемента */
      int remove(int index) {
        if (index >= _size) throw RangeError('Индекс за пределами списка');
        int _num = _arr[index];
        // Сдвинуть все элементы после index на одну позицию влево
        for (var j = index; j < _size - 1; j++) {
          _arr[j] = _arr[j + 1];
        }
        // Обновить количество элементов
        _size--;
        // Вернуть удалённый элемент
        return _num;
      }

      /* Увеличение ёмкости списка */
      void extendCapacity() {
        // Создать массив, длина которого в _extendRatio раз больше длины исходного
        final _newNums = List.filled(_capacity * _extendRatio, 0);
        // Скопировать исходный массив в новый
        List.copyRange(_newNums, 0, _arr);
        // Обновить ссылку _arr
        _arr = _newNums;
        // Обновить ёмкость списка
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
        arr: Vec<i32>,       // Массив для хранения элементов списка
        capacity: usize,     // Ёмкость списка
        size: usize,         // Длина списка (текущее количество элементов)
        extend_ratio: usize, // Коэффициент увеличения ёмкости списка
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

        /* Получить длину списка (текущее количество элементов)*/
        pub fn size(&self) -> usize {
            return self.size;
        }

        /* Получить ёмкость списка */
        pub fn capacity(&self) -> usize {
            return self.capacity;
        }

        /* Доступ к элементу */
        pub fn get(&self, index: usize) -> i32 {
            // При выходе индекса за границы выбросить исключение. То же правило действует ниже
            if index >= self.size {
                panic!("Индекс за пределами списка")
            };
            return self.arr[index];
        }

        /* Изменение элемента */
        pub fn set(&mut self, index: usize, num: i32) {
            if index >= self.size {
                panic!("Индекс за пределами списка")
            };
            self.arr[index] = num;
        }

        /* Добавление элемента в конец */
        pub fn add(&mut self, num: i32) {
            // Если для элементов не хватает места, увеличить ёмкость
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            self.arr[self.size] = num;
            // Обновить количество элементов
            self.size += 1;
        }

        /* Вставка элемента в середину */
        pub fn insert(&mut self, index: usize, num: i32) {
            if index >= self.size() {
                panic!("Индекс за пределами списка")
            };
            // Если для элементов не хватает места, увеличить ёмкость
            if self.size == self.capacity() {
                self.extend_capacity();
            }
            // Сдвинуть все элементы начиная с index на одну позицию вправо
            for j in (index..self.size).rev() {
                self.arr[j + 1] = self.arr[j];
            }
            self.arr[index] = num;
            // Обновить количество элементов
            self.size += 1;
        }

        /* Удаление элемента */
        pub fn remove(&mut self, index: usize) -> i32 {
            if index >= self.size() {
                panic!("Индекс за пределами списка")
            };
            let num = self.arr[index];
            // Сдвинуть все элементы после index на одну позицию влево
            for j in index..self.size - 1 {
                self.arr[j] = self.arr[j + 1];
            }
            // Обновить количество элементов
            self.size -= 1;
            // Вернуть удалённый элемент
            return num;
        }

        /* Увеличение ёмкости списка */
        pub fn extend_capacity(&mut self) {
            // Создать массив в extend_ratio раз длиннее исходного и скопировать в него исходный массив
            let new_capacity = self.capacity * self.extend_ratio;
            self.arr.resize(new_capacity, 0);
            // Обновить ёмкость списка
            self.capacity = new_capacity;
        }

        /* Преобразовать список в массив */
        pub fn to_array(&self) -> Vec<i32> {
            // Преобразовать только используемую часть списка
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
        int *arr;        // Массив для хранения элементов списка
        int capacity;    // Ёмкость списка
        int size;        // Размер списка
        int extendRatio; // Коэффициент увеличения ёмкости списка
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

    /* Получить ёмкость списка */
    int capacity(MyList *nums) {
        return nums->capacity;
    }

    /* Доступ к элементу */
    int get(MyList *nums, int index) {
        assert(index >= 0 && index < nums->size);
        return nums->arr[index];
    }

    /* Изменение элемента */
    void set(MyList *nums, int index, int num) {
        assert(index >= 0 && index < nums->size);
        nums->arr[index] = num;
    }

    /* Добавление элемента в конец */
    void add(MyList *nums, int num) {
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // Увеличение ёмкости
        }
        nums->arr[size(nums)] = num;
        nums->size++;
    }

    /* Вставка элемента в середину */
    void insert(MyList *nums, int index, int num) {
        assert(index >= 0 && index < size(nums));
        // Если для элементов не хватает места, увеличить ёмкость
        if (size(nums) == capacity(nums)) {
            extendCapacity(nums); // Увеличение ёмкости
        }
        for (int i = size(nums); i > index; --i) {
            nums->arr[i] = nums->arr[i - 1];
        }
        nums->arr[index] = num;
        nums->size++;
    }

    /* Удаление элемента */
    // Имя remove уже используется в stdio.h
    int removeItem(MyList *nums, int index) {
        assert(index >= 0 && index < size(nums));
        int num = nums->arr[index];
        for (int i = index; i < size(nums) - 1; i++) {
            nums->arr[i] = nums->arr[i + 1];
        }
        nums->size--;
        return num;
    }

    /* Увеличение ёмкости списка */
    void extendCapacity(MyList *nums) {
        // Сначала выделить память
        int newCapacity = capacity(nums) * nums->extendRatio;
        int *extend = (int *)malloc(sizeof(int) * newCapacity);
        int *temp = nums->arr;

        // Скопировать данные в новую область памяти
        for (int i = 0; i < size(nums); i++)
            extend[i] = nums->arr[i];

        // Освободить прежнюю область памяти
        free(temp);

        // Перейти к новым данным
        nums->arr = extend;
        nums->capacity = newCapacity;
    }

    /* Преобразовать список в массив для вывода */
    int *toArray(MyList *nums) {
        return nums->arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="my_list.kt"
    /* Класс списка */
    class MyList {
        private var arr: IntArray = intArrayOf() // Массив для хранения элементов списка
        private var capacity: Int = 10 // Ёмкость списка
        private var size: Int = 0 // Длина списка (текущее количество элементов)
        private var extendRatio: Int = 2 // Коэффициент увеличения ёмкости списка

        /* Конструктор */
        init {
            arr = IntArray(capacity)
        }

        /* Получить длину списка (текущее количество элементов) */
        fun size(): Int {
            return size
        }

        /* Получить ёмкость списка */
        fun capacity(): Int {
            return capacity
        }

        /* Доступ к элементу */
        fun get(index: Int): Int {
            // При выходе индекса за границы выбросить исключение. То же правило действует ниже
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Индекс за пределами списка")
            return arr[index]
        }

        /* Изменение элемента */
        fun set(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Индекс за пределами списка")
            arr[index] = num
        }

        /* Добавление элемента в конец */
        fun add(num: Int) {
            // Если для элементов не хватает места, увеличить ёмкость
            if (size == capacity())
                extendCapacity()
            arr[size] = num
            // Обновить количество элементов
            size++
        }

        /* Вставка элемента в середину */
        fun insert(index: Int, num: Int) {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Индекс за пределами списка")
            // Если для элементов не хватает места, увеличить ёмкость
            if (size == capacity())
                extendCapacity()
            // Сдвинуть все элементы начиная с index на одну позицию вправо
            for (j in size - 1 downTo index)
                arr[j + 1] = arr[j]
            arr[index] = num
            // Обновить количество элементов
            size++
        }

        /* Удаление элемента */
        fun remove(index: Int): Int {
            if (index < 0 || index >= size)
                throw IndexOutOfBoundsException("Индекс за пределами списка")
            val num = arr[index]
            // Сдвинуть все элементы после index на одну позицию влево
            for (j in index..<size - 1)
                arr[j] = arr[j + 1]
            // Обновить количество элементов
            size--
            // Вернуть удалённый элемент
            return num
        }

        /* Увеличение ёмкости списка */
        fun extendCapacity() {
            // Создать массив в extendRatio раз длиннее исходного и скопировать в него исходный массив
            arr = arr.copyOf(capacity() * extendRatio)
            // Обновить ёмкость списка
            capacity = arr.size
        }

        /* Преобразовать список в массив */
        fun toArray(): IntArray {
            val size = size()
            // Преобразовать только используемую часть списка
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
      attr_reader :size       # Получить длину списка (текущее количество элементов)
      attr_reader :capacity   # Получить ёмкость списка

      ### Конструктор ###
      def initialize
        @capacity = 10
        @size = 0
        @extend_ratio = 2
        @arr = Array.new(capacity)
      end

      ### Доступ к элементу ###
      def get(index)
        # При выходе индекса за границы выбросить исключение. То же правило действует ниже
        raise IndexError, "Индекс за пределами списка" if index < 0 || index >= size
        @arr[index]
      end

      ### Доступ к элементу ###
      def set(index, num)
        raise IndexError, "Индекс за пределами списка" if index < 0 || index >= size
        @arr[index] = num
      end

      ### Добавление элемента в конец ###
      def add(num)
        # Если для элементов не хватает места, увеличить ёмкость
        extend_capacity if size == capacity
        @arr[size] = num

        # Обновить количество элементов
        @size += 1
      end

      ### Вставка элемента в середину ###
      def insert(index, num)
        raise IndexError, "Индекс за пределами списка" if index < 0 || index >= size

        # Если для элементов не хватает места, увеличить ёмкость
        extend_capacity if size == capacity

        # Сдвинуть все элементы начиная с index на одну позицию вправо
        for j in (size - 1).downto(index)
          @arr[j + 1] = @arr[j]
        end
        @arr[index] = num

        # Обновить количество элементов
        @size += 1
      end

      ### Удаление элемента ###
      def remove(index)
        raise IndexError, "Индекс за пределами списка" if index < 0 || index >= size
        num = @arr[index]

        # Сдвинуть все элементы после index на одну позицию влево
        for j in index...size
          @arr[j] = @arr[j + 1]
        end

        # Обновить количество элементов
        @size -= 1

        # Вернуть удалённый элемент
        num
      end

      ### Увеличение ёмкости списка ###
      def extend_capacity
        # Создать массив в extend_ratio раз длиннее исходного и скопировать в него исходный массив
        arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
        # Обновить ёмкость списка
        @capacity = arr.length
      end

      ### Преобразовать список в массив ###
      def to_array
        sz = size
        # Преобразовать только используемую часть списка
        arr = Array.new(sz)
        for i in 0...sz
          arr[i] = get(i)
        end
        arr
      end
    end
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%0A%20def%20__init__%28self%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20self._size%3A%20int%20%3D%200%0A%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%28%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%29%22%22%22%0A%20%20return%20self._size%0A%0A%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%81%D0%BC%D0%BA%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20return%20self._capacity%0A%0A%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%A7%D1%82%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%22%29%0A%20%20return%20self._arr%5Bindex%5D%0A%0A%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%22%22%22%D0%97%D0%B0%D0%BC%D0%B5%D0%BD%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%22%29%0A%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%22%22%22%0A%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20self.extend_capacity%28%29%0A%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%22%22%22%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D0%B2%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%22%29%0A%20%20%20self.extend_capacity%28%29%0A%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%B3%20%D0%BE%D1%82%20index%20%D0%BD%D0%B0%20%D1%88%D0%B0%D0%B3%20%D0%B2%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%0A%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%22%29%0A%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%B3%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20i%20%D0%BD%D0%B0%20%D1%88%D0%B0%D0%B3%20%D0%B2%D0%BB%D0%B5%D0%B2%D0%BE%0A%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20self._size%20-%3D%201%0A%20%20return%20num%0A%0A%20def%20extend_capacity%28self%29%3A%0A%20%20%22%22%22%D0%A0%D0%BE%D1%81%D1%82%20%D1%91%D0%BC%D0%BA%D0%BE%D1%81%D1%82%D0%B8%22%22%22%0A%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20nums%20%3D%20MyList%28%29%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20nums.add%281%29%0A%20nums.add%283%29%0A%20nums.add%282%29%0A%20nums.add%285%29%0A%20nums.add%284%29%0A%0A%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D0%B2%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%83%0A%20nums.insert%286,%20index%3D3%29%0A%0A%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20nums.remove%283%29%0A%0A%20%23%20%D0%A7%D1%82%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20num%20%3D%20nums.get%281%29%0A%0A%20%23%20%D0%97%D0%B0%D0%BC%D0%B5%D0%BD%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20nums.set%280,%201%29%0A%0A%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D1%80%D0%BE%D1%81%D1%82%D0%B0%20%D1%91%D0%BC%D0%BA%D0%BE%D1%81%D1%82%D0%B8%0A%20for%20i%20in%20range%2810%29%3A%0A%20%20nums.add%28i%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20MyList%3A%0A%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%0A%20def%20__init__%28self%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self._capacity%3A%20int%20%3D%2010%0A%20%20self._arr%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20self._capacity%0A%20%20self._size%3A%20int%20%3D%200%0A%20%20self._extend_ratio%3A%20int%20%3D%202%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%28%D1%87%D0%B8%D1%81%D0%BB%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%29%22%22%22%0A%20%20return%20self._size%0A%0A%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%81%D0%BC%D0%BA%D0%BE%D1%81%D1%82%D1%8C%22%22%22%0A%20%20return%20self._capacity%0A%0A%20def%20get%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%A7%D1%82%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%22%29%0A%20%20return%20self._arr%5Bindex%5D%0A%0A%20def%20set%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%22%22%22%D0%97%D0%B0%D0%BC%D0%B5%D0%BD%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%22%29%0A%20%20self._arr%5Bindex%5D%20%3D%20num%0A%0A%20def%20add%28self,%20num%3A%20int%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%22%22%22%0A%20%20if%20self.size%28%29%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20self.extend_capacity%28%29%0A%20%20self._arr%5Bself._size%5D%20%3D%20num%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20insert%28self,%20num%3A%20int,%20index%3A%20int%29%3A%0A%20%20%22%22%22%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D0%B2%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%22%29%0A%20%20%20self.extend_capacity%28%29%0A%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%B3%20%D0%BE%D1%82%20index%20%D0%BD%D0%B0%20%D1%88%D0%B0%D0%B3%20%D0%B2%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%0A%20%20for%20j%20in%20range%28self._size%20-%201,%20index%20-%201,%20-1%29%3A%0A%20%20%20self._arr%5Bj%20%2B%201%5D%20%3D%20self._arr%5Bj%5D%0A%20%20self._arr%5Bindex%5D%20%3D%20num%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20remove%28self,%20index%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%22%22%22%0A%20%20if%20index%20%3C%200%20or%20index%20%3E%3D%20self._size%3A%0A%20%20%20raise%20IndexError%28%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%B2%D0%BD%D0%B5%20%D0%B3%D1%80%D0%B0%D0%BD%D0%B8%D1%86%22%29%0A%20%20num%20%3D%20self._arr%5Bindex%5D%0A%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%B3%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20i%20%D0%BD%D0%B0%20%D1%88%D0%B0%D0%B3%20%D0%B2%D0%BB%D0%B5%D0%B2%D0%BE%0A%20%20for%20j%20in%20range%28index,%20self._size%20-%201%29%3A%0A%20%20%20self._arr%5Bj%5D%20%3D%20self._arr%5Bj%20%2B%201%5D%0A%20%20self._size%20-%3D%201%0A%20%20return%20num%0A%0A%20def%20extend_capacity%28self%29%3A%0A%20%20%22%22%22%D0%A0%D0%BE%D1%81%D1%82%20%D1%91%D0%BC%D0%BA%D0%BE%D1%81%D1%82%D0%B8%22%22%22%0A%20%20self._arr%20%3D%20self._arr%20%2B%20%5B0%5D%20%2A%20self.capacity%28%29%20%2A%20%28self._extend_ratio%20-%201%29%0A%20%20self._capacity%20%3D%20len%28self._arr%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20nums%20%3D%20MyList%28%29%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20nums.add%281%29%0A%20nums.add%283%29%0A%20nums.add%282%29%0A%20nums.add%285%29%0A%20nums.add%284%29%0A%0A%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%B0%20%D0%B2%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%83%0A%20nums.insert%286,%20index%3D3%29%0A%0A%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20nums.remove%283%29%0A%0A%20%23%20%D0%A7%D1%82%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20num%20%3D%20nums.get%281%29%0A%0A%20%23%20%D0%97%D0%B0%D0%BC%D0%B5%D0%BD%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20nums.set%280,%201%29%0A%0A%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D1%80%D0%BE%D1%81%D1%82%D0%B0%20%D1%91%D0%BC%D0%BA%D0%BE%D1%81%D1%82%D0%B8%0A%20for%20i%20in%20range%2810%29%3A%0A%20%20nums.add%28i%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>
