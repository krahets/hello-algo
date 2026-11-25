<!-- [snippet]{init_list} -->
```python title="list.py"
# Инициализация списка
# Без начальных значений
empty_nums: list[int] = []
# С начальными значениями
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="list.cpp"
/* Инициализация списка */
// Без начальных значений
vector<int> emptyNums;
// С начальными значениями
vector<int> nums = {1, 3, 2, 5, 4};
```

```java title="list.java"
/* Инициализация списка */
// Без начальных значений
List<Integer> emptyNums = new ArrayList<>();
// С начальными значениями (тип массива должен быть Integer[], а не int[]: для элементов списка нужен Integer — класс-обёртка для int)
Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
```

```csharp title="list.cs"
/* Инициализация списка */
// Без начальных значений
List<int> emptyNums = [];
// С начальными значениями
int[] numbers = [1, 3, 2, 5, 4];
List<int> nums = [.. numbers];
```

```go title="list_test.go"
/* Инициализация списка */
// Без начальных значений
emptyNums := []int{}
// С начальными значениями
nums := []int{1, 3, 2, 5, 4}
```

```swift title="list.swift"
/* Инициализация списка */
// Без начальных значений
let emptyNums: [Int] = []
// С начальными значениями
var nums = [1, 3, 2, 5, 4]
```

```javascript title="list.js"
/* Инициализация списка */
// Без начальных значений
const emptyNums = [];
// С начальными значениями
const nums = [1, 3, 2, 5, 4];
```

```typescript title="list.ts"
/* Инициализация списка */
// Без начальных значений
const emptyNums: number[] = [];
// С начальными значениями
const nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="list.dart"
/* Инициализация списка */
// Без начальных значений
List<int> emptyNums = [];
// С начальными значениями
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="list.rs"
// Инициализация списка
// Без начальных значений
let empty_nums: Vec<i32> = Vec::new();
// С начальными значениями
let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="list.c"
// В C нет встроенного динамического массива
```

```kotlin title="list.kt"
/* Инициализация списка */
// Без начальных значений
val emptyNums = mutableListOf<Int>()
// С начальными значениями
val nums = mutableListOf(1, 3, 2, 5, 4)
```

```ruby title="list.rb"
# Инициализация списка
# Без начальных значений
empty_nums = []
# С начальными значениями
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20%23%20%D0%91%D0%B5%D0%B7%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D1%85%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B9%0A%20%20%20%20empty_nums%20%3D%20%5B%5D%0A%20%20%20%20%23%20%D0%A1%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{access_element} -->
```python title="list.py"
# Доступ к элементу
x: int = nums[1]  # Прочитать элемент по индексу 1

# Изменение элемента
nums[1] = 0  # Записать 0 по индексу 1
```

```cpp title="list.cpp"
/* Доступ к элементу */
int num = nums[1]; // Прочитать элемент по индексу 1

/* Изменение элемента */
nums[1] = 0; // Записать 0 по индексу 1
```

```java title="list.java"
/* Доступ к элементу */
int num = nums.get(1); // Прочитать элемент по индексу 1

/* Изменение элемента */
nums.set(1, 0); // Записать 0 по индексу 1
```

```csharp title="list.cs"
/* Доступ к элементу */
int num = nums[1]; // Прочитать элемент по индексу 1

/* Изменение элемента */
nums[1] = 0; // Записать 0 по индексу 1
```

```go title="list_test.go"
/* Доступ к элементу */
num := nums[1] // Прочитать элемент по индексу 1

/* Изменение элемента */
nums[1] = 0 // Записать 0 по индексу 1
```

```swift title="list.swift"
/* Доступ к элементу */
let num = nums[1] // Прочитать элемент по индексу 1

/* Изменение элемента */
nums[1] = 0 // Записать 0 по индексу 1
```

```javascript title="list.js"
/* Доступ к элементу */
const num = nums[1]; // Прочитать элемент по индексу 1

/* Изменение элемента */
nums[1] = 0; // Записать 0 по индексу 1
```

```typescript title="list.ts"
/* Доступ к элементу */
const num: number = nums[1]; // Прочитать элемент по индексу 1

/* Изменение элемента */
nums[1] = 0; // Записать 0 по индексу 1
```

```dart title="list.dart"
/* Доступ к элементу */
int _num = nums[1]; // Прочитать элемент по индексу 1

/* Изменение элемента */
nums[1] = 0; // Записать 0 по индексу 1
```

```rust title="list.rs"
// Доступ к элементу
let num = nums[1]; // Прочитать элемент по индексу 1

// Изменение элемента
nums[1] = 0; // Записать 0 по индексу 1
```

```c title="list.c"
// В C нет встроенного динамического массива
```

```kotlin title="list.kt"
/* Доступ к элементу */
val num = nums[1] // Прочитать элемент по индексу 1

/* Изменение элемента */
nums[1] = 0 // Записать 0 по индексу 1
```

```ruby title="list.rb"
# Доступ к элементу
num = nums[1] # Прочитать элемент по индексу 1

# Изменение элемента
nums[1] = 0 # Записать 0 по индексу 1
```

<!-- [tutor]{access_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20x%20%3D%20nums%5B1%5D%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%201%0A%0A%20%20%20%20%23%20%D0%9C%D0%B5%D0%BD%D1%8F%D0%B5%D0%BC%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%D0%97%D0%B0%D0%BF%D0%B8%D1%81%D1%8B%D0%B2%D0%B0%D0%B5%D0%BC%200%20%D0%B2%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%201&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_element} -->
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

```c title="list.c"
// В C нет встроенного динамического массива
```

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

<!-- [tutor]{insert_remove_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D1%87%D0%B8%D1%89%D0%B0%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%83%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%206%20%D0%BD%D0%B0%20%D0%BF%D0%BE%D0%B7%D0%B8%D1%86%D0%B8%D1%8E%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%203%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%203&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{iterate_list} -->
```python title="list.py"
# Обойти список по индексам
count = 0
for i in range(len(nums)):
    count += nums[i]

# Перебрать элементы списка напрямую
for num in nums:
    count += num
```

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

```c title="list.c"
// В C нет встроенного динамического массива
```

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

<!-- [tutor]{iterate_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%B8%D1%80%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%B8%D1%80%D0%B0%D0%B5%D0%BC%20%D1%81%D0%B0%D0%BC%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{concat_list} -->
```python title="list.py"
# Объединение двух списков
nums1 = [6, 8, 7, 10, 9]
nums += nums1  # Добавить список nums1 в конец nums
```

```cpp title="list.cpp"
/* Объединение двух списков */
vector<int> nums1 = {6, 8, 7, 10, 9};
// Добавить список nums1 в конец nums
nums.insert(nums.end(), nums1.begin(), nums1.end());
```

```java title="list.java"
/* Объединение двух списков */
List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
nums.addAll(nums1); // Добавить список nums1 в конец nums
```

```csharp title="list.cs"
/* Объединение двух списков */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.AddRange(nums1); // Добавить список nums1 в конец nums
```

```go title="list_test.go"
/* Объединение двух списков */
nums1 := []int{6, 8, 7, 10, 9}
nums = append(nums, nums1...) // Добавить список nums1 в конец nums
```

```swift title="list.swift"
/* Объединение двух списков */
let nums1 = [6, 8, 7, 10, 9]
nums.append(contentsOf: nums1) // Добавить список nums1 в конец nums
```

```javascript title="list.js"
/* Объединение двух списков */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1); // Добавить список nums1 в конец nums
```

```typescript title="list.ts"
/* Объединение двух списков */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1); // Добавить список nums1 в конец nums
```

```dart title="list.dart"
/* Объединение двух списков */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.addAll(nums1); // Добавить список nums1 в конец nums
```

```rust title="list.rs"
// Объединение двух списков
let mut nums1 = vec![6, 8, 7, 10, 9];
nums.append(&mut nums1); // append перемещает элементы из nums1, оставляя nums1 пустым
```

```c title="list.c"
// В C нет встроенного динамического массива
```

```kotlin title="list.kt"
/* Объединение двух списков */
val nums1 = mutableListOf(6, 8, 7, 10, 9)
nums.addAll(nums1) // Добавить список nums1 в конец nums
```

```ruby title="list.rb"
# Объединение двух списков
nums1 = [6, 8, 7, 10, 9]
nums += nums1
```

<!-- [tutor]{concat_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B5%D0%B4%D0%B8%D0%BD%D1%8F%D0%B5%D0%BC%20%D0%B4%D0%B2%D0%B0%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20nums1%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%20nums&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{sort_list} -->
```python title="list.py"
# Сортировка списка
nums.sort()  # После сортировки элементы списка расположены по возрастанию
```

```cpp title="list.cpp"
/* Сортировка списка */
sort(nums.begin(), nums.end()); // После сортировки элементы списка расположены по возрастанию
```

```java title="list.java"
/* Сортировка списка */
Collections.sort(nums); // После сортировки элементы списка расположены по возрастанию
```

```csharp title="list.cs"
/* Сортировка списка */
nums.Sort(); // После сортировки элементы списка расположены по возрастанию
```

```go title="list_test.go"
/* Сортировка списка */
sort.Ints(nums) // После сортировки элементы списка расположены по возрастанию
```

```swift title="list.swift"
/* Сортировка списка */
nums.sort() // После сортировки элементы списка расположены по возрастанию
```

```javascript title="list.js"
/* Сортировка списка */
nums.sort((a, b) => a - b); // После сортировки элементы списка расположены по возрастанию
```

```typescript title="list.ts"
/* Сортировка списка */
nums.sort((a, b) => a - b); // После сортировки элементы списка расположены по возрастанию
```

```dart title="list.dart"
/* Сортировка списка */
nums.sort(); // После сортировки элементы списка расположены по возрастанию
```

```rust title="list.rs"
// Сортировка списка
nums.sort(); // После сортировки элементы списка расположены по возрастанию
```

```c title="list.c"
// В C нет встроенного динамического массива
```

```kotlin title="list.kt"
/* Сортировка списка */
nums.sort() // После сортировки элементы списка расположены по возрастанию
```

```ruby title="list.rb"
# Сортировка списка
nums = nums.sort { |a, b| a <=> b } # После сортировки элементы списка расположены по возрастанию
```

<!-- [tutor]{sort_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A1%D0%BE%D1%80%D1%82%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums.sort%28%29%20%20%23%20%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%80%D0%B0%D1%81%D0%BF%D0%BE%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D1%8B%20%D0%BF%D0%BE%20%D0%B2%D0%BE%D0%B7%D1%80%D0%B0%D1%81%D1%82%D0%B0%D0%BD%D0%B8%D1%8E&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
