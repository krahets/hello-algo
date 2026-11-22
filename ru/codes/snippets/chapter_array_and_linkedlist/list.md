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
// С начальными значениями (обратите внимание: массив должен иметь тип Integer[], а не int[], поскольку элементами списка могут быть только объекты класса-обертки Integer)
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
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20%23%20%D0%91%D0%B5%D0%B7%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D1%85%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B9%0A%20%20%20%20empty_nums%20%3D%20%5B%5D%0A%20%20%20%20%23%20%D0%A1%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{access_element} -->
```python title="list.py"
# Доступ к элементу
x: int = nums[1]  # Доступ к элементу по индексу 1

# Изменение элемента
nums[1] = 0  # Изменить значение элемента с индексом 1 на 0
```

```cpp title="list.cpp"
/* Доступ к элементу */
int num = nums[1]; // Доступ к элементу по индексу 1

/* Изменение элемента */
nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
```

```java title="list.java"
/* Доступ к элементу */
int num = nums.get(1); // Доступ к элементу по индексу 1

/* Изменение элемента */
nums.set(1, 0); // Изменить значение элемента с индексом 1 на 0
```

```csharp title="list.cs"
/* Доступ к элементу */
int num = nums[1]; // Доступ к элементу по индексу 1

/* Изменение элемента */
nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
```

```go title="list_test.go"
/* Доступ к элементу */
num := nums[1] // Обратиться к элементу по индексу 1

/* Изменение элемента */
nums[1] = 0 // Изменить значение элемента с индексом 1 на 0
```

```swift title="list.swift"
/* Доступ к элементу */
let num = nums[1] // Доступ к элементу по индексу 1

/* Изменение элемента */
nums[1] = 0 // Изменить значение элемента с индексом 1 на 0
```

```javascript title="list.js"
/* Доступ к элементу */
const num = nums[1]; // Доступ к элементу по индексу 1

/* Изменение элемента */
nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
```

```typescript title="list.ts"
/* Доступ к элементу */
const num: number = nums[1]; // Доступ к элементу по индексу 1

/* Изменение элемента */
nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
```

```dart title="list.dart"
/* Доступ к элементу */
int _num = nums[1]; // Доступ к элементу по индексу 1

/* Изменение элемента */
nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
```

```rust title="list.rs"
// Доступ к элементу
let num = nums[1]; // Доступ к элементу по индексу 1

// Изменение элемента
nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
```

```c title="list.c"
// В C нет встроенного динамического массива
```

```kotlin title="list.kt"
/* Доступ к элементу */
val num = nums[1] // Доступ к элементу по индексу 1

/* Изменение элемента */
nums[1] = 0 // Изменить значение элемента с индексом 1 на 0
```

```ruby title="list.rb"
# Доступ к элементу
num = nums[1] # Доступ к элементу по индексу 1

# Изменение элемента
nums[1] = 0 # Изменить значение элемента с индексом 1 на 0
```

<!-- [tutor]{access_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%0A%20%20%20%20x%20%3D%20nums%5B1%5D%20%20%23%20%D0%94%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%201%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%BC%D0%B5%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%D0%98%D0%B7%D0%BC%D0%B5%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%201%20%D0%BD%D0%B0%200&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_element} -->
```python title="list.py"
# Очистить список
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
/* Очистить список */
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
/* Очистить список */
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
/* Очистить список */
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
/* Очистить список */
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
/* Очистить список */
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
/* Очистить список */
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
/* Очистить список */
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
/* Очистить список */
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
// Очистить список
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
/* Очистить список */
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
# Очистить список
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
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%D0%BC%D0%B8%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D1%87%D0%B8%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%81%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%BD%D1%83%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%87%D0%B8%D1%81%D0%BB%D0%BE%206%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%203%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D1%83%203&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{iterate_list} -->
```python title="list.py"
# Обходить список по индексам
count = 0
for i in range(len(nums)):
    count += nums[i]

# Непосредственно обходить элементы списка
for num in nums:
    count += num
```

```cpp title="list.cpp"
/* Обходить список по индексам */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums[i];
}

/* Непосредственно обходить элементы списка */
count = 0;
for (int x : nums) {
    count += x;
}
```

```java title="list.java"
/* Обходить список по индексам */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums.get(i);
}

/* Непосредственно обходить элементы списка */
for (int x : nums) {
    count += x;
}
```

```csharp title="list.cs"
/* Обходить список по индексам */
int count = 0;
for (int i = 0; i < nums.Count; i++) {
    count += nums[i];
}

/* Непосредственно обходить элементы списка */
count = 0;
foreach (int x in nums) {
    count += x;
}
```

```go title="list_test.go"
/* Обходить список по индексам */
count := 0
for i := 0; i < len(nums); i++ {
    count += nums[i]
}

/* Непосредственно обходить элементы списка */
count = 0
for _, x := range nums {
    count += x
}
```

```swift title="list.swift"
/* Обходить список по индексам */
var count = 0
for i in nums.indices {
    count += nums[i]
}

/* Непосредственно обходить элементы списка */
count = 0
for x in nums {
    count += x
}
```

```javascript title="list.js"
/* Обходить список по индексам */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* Непосредственно обходить элементы списка */
count = 0;
for (const x of nums) {
    count += x;
}
```

```typescript title="list.ts"
/* Обходить список по индексам */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* Непосредственно обходить элементы списка */
count = 0;
for (const x of nums) {
    count += x;
}
```

```dart title="list.dart"
/* Обходить список по индексам */
int count = 0;
for (var i = 0; i < nums.length; i++) {
  count += nums[i];
}

/* Непосредственно обходить элементы списка */
count = 0;
for (var x in nums) {
  count += x;
}
```

```rust title="list.rs"
// Обходить список по индексам
let mut _count = 0;
for i in 0..nums.len() {
    _count += nums[i];
}

// Непосредственно обходить элементы списка
_count = 0;
for x in &nums {
    _count += x;
}
```

```c title="list.c"
// В C нет встроенного динамического массива
```

```kotlin title="list.kt"
/* Обходить список по индексам */
var count = 0
for (i in nums.indices) {
    count += nums[i]
}

/* Непосредственно обходить элементы списка */
for (j in nums) {
    count += j
}
```

```ruby title="list.rb"
# Обходить список по индексам
count = 0
for i in 0...nums.length
  count += nums[i]
end

# Непосредственно обходить элементы списка
count = 0
nums.each do |x|
  count += x
end
```

<!-- [tutor]{iterate_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%BF%D0%BE%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%D0%9D%D0%B5%D0%BF%D0%BE%D1%81%D1%80%D0%B5%D0%B4%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{concat_list} -->
```python title="list.py"
# Объединить два списка
nums1 = [6, 8, 7, 10, 9]
nums += nums1  # Присоединить список nums1 к концу nums
```

```cpp title="list.cpp"
/* Объединить два списка */
vector<int> nums1 = {6, 8, 7, 10, 9};
// Присоединить список nums1 к концу nums
nums.insert(nums.end(), nums1.begin(), nums1.end());
```

```java title="list.java"
/* Объединить два списка */
List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
nums.addAll(nums1); // Присоединить список nums1 к концу nums
```

```csharp title="list.cs"
/* Объединить два списка */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.AddRange(nums1); // Присоединить список nums1 к концу nums
```

```go title="list_test.go"
/* Объединить два списка */
nums1 := []int{6, 8, 7, 10, 9}
nums = append(nums, nums1...) // Присоединить список nums1 после nums
```

```swift title="list.swift"
/* Объединить два списка */
let nums1 = [6, 8, 7, 10, 9]
nums.append(contentsOf: nums1) // Присоединить список nums1 к концу nums
```

```javascript title="list.js"
/* Объединить два списка */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1); // Присоединить список nums1 к концу nums
```

```typescript title="list.ts"
/* Объединить два списка */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1); // Присоединить список nums1 к концу nums
```

```dart title="list.dart"
/* Объединить два списка */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.addAll(nums1); // Присоединить список nums1 к концу nums
```

```rust title="list.rs"
// Объединить два списка
let mut nums1 = vec![6, 8, 7, 10, 9];
nums.append(&mut nums1); // append перемещает элементы nums1, после чего nums1 становится пустым
```

```c title="list.c"
// В C нет встроенного динамического массива
```

```kotlin title="list.kt"
/* Объединить два списка */
val nums1 = mutableListOf(6, 8, 7, 10, 9)
nums.addAll(nums1) // Присоединить список nums1 к концу nums
```

```ruby title="list.rb"
# Объединить два списка
nums1 = [6, 8, 7, 10, 9]
nums += nums1
```

<!-- [tutor]{concat_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D0%B1%D1%8A%D0%B5%D0%B4%D0%B8%D0%BD%D0%B8%D1%82%D1%8C%20%D0%B4%D0%B2%D0%B0%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%D0%9F%D1%80%D0%B8%D1%81%D0%BE%D0%B5%D0%B4%D0%B8%D0%BD%D0%B8%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20nums1%20%D0%BA%20nums&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{sort_list} -->
```python title="list.py"
# Отсортировать список
nums.sort()  # После сортировки элементы списка идут по возрастанию
```

```cpp title="list.cpp"
/* Отсортировать список */
sort(nums.begin(), nums.end()); // После сортировки элементы списка идут по возрастанию
```

```java title="list.java"
/* Отсортировать список */
Collections.sort(nums); // После сортировки элементы списка идут по возрастанию
```

```csharp title="list.cs"
/* Отсортировать список */
nums.Sort(); // После сортировки элементы списка располагаются по возрастанию
```

```go title="list_test.go"
/* Отсортировать список */
sort.Ints(nums) // После сортировки элементы списка располагаются по возрастанию
```

```swift title="list.swift"
/* Отсортировать список */
nums.sort() // После сортировки элементы списка идут по возрастанию
```

```javascript title="list.js"
/* Отсортировать список */
nums.sort((a, b) => a - b); // После сортировки элементы списка идут по возрастанию
```

```typescript title="list.ts"
/* Отсортировать список */
nums.sort((a, b) => a - b); // После сортировки элементы списка идут по возрастанию
```

```dart title="list.dart"
/* Отсортировать список */
nums.sort(); // После сортировки элементы списка идут по возрастанию
```

```rust title="list.rs"
// Отсортировать список
nums.sort(); // После сортировки элементы списка идут по возрастанию
```

```c title="list.c"
// В C нет встроенного динамического массива
```

```kotlin title="list.kt"
/* Отсортировать список */
nums.sort() // После сортировки элементы списка идут по возрастанию
```

```ruby title="list.rb"
# Отсортировать список
nums = nums.sort { |a, b| a <=> b } # После сортировки элементы списка идут по возрастанию
```

<!-- [tutor]{sort_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9E%D1%82%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%0A%20%20%20%20nums.sort%28%29%20%20%23%20%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%20%D1%80%D0%B0%D1%81%D0%BF%D0%BE%D0%BB%D0%B0%D0%B3%D0%B0%D1%8E%D1%82%D1%81%D1%8F%20%D0%BF%D0%BE%20%D0%B2%D0%BE%D0%B7%D1%80%D0%B0%D1%81%D1%82%D0%B0%D0%BD%D0%B8%D1%8E&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
