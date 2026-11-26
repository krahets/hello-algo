<!-- [snippet]{init_list} -->
```python title="list.py"
# 初始化列表
# 無初始值
empty_nums: list[int] = []
# 有初始值
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="list.cpp"
/* 初始化列表 */
// 無初始值
vector<int> emptyNums;
// 有初始值
vector<int> nums = {1, 3, 2, 5, 4};
```

```java title="list.java"
/* 初始化列表 */
// 無初始值
List<Integer> emptyNums = new ArrayList<>();
// 有初始值（注意，陣列型別應為 Integer[] 而非 int[]，因為列表中的 int 元素必須使用其包裝類別 Integer）
Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
```

```csharp title="list.cs"
/* 初始化列表 */
// 無初始值
List<int> emptyNums = [];
// 有初始值
int[] numbers = [1, 3, 2, 5, 4];
List<int> nums = [.. numbers];
```

```go title="list_test.go"
/* 初始化列表 */
// 無初始值
emptyNums := []int{}
// 有初始值
nums := []int{1, 3, 2, 5, 4}
```

```swift title="list.swift"
/* 初始化列表 */
// 無初始值
let emptyNums: [Int] = []
// 有初始值
var nums = [1, 3, 2, 5, 4]
```

```javascript title="list.js"
/* 初始化列表 */
// 無初始值
const emptyNums = [];
// 有初始值
const nums = [1, 3, 2, 5, 4];
```

```typescript title="list.ts"
/* 初始化列表 */
// 無初始值
const emptyNums: number[] = [];
// 有初始值
const nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="list.dart"
/* 初始化列表 */
// 無初始值
List<int> emptyNums = [];
// 有初始值
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="list.rs"
// 初始化列表
// 無初始值
let empty_nums: Vec<i32> = Vec::new();
// 有初始值
let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="list.c"
// C 未提供內建的動態陣列
```

```kotlin title="list.kt"
/* 初始化列表 */
// 無初始值
val emptyNums = mutableListOf<Int>()
// 有初始值
val nums = mutableListOf(1, 3, 2, 5, 4)
```

```ruby title="list.rb"
# 初始化列表
# 無初始值
empty_nums = []
# 有初始值
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20%23%20%E7%84%A1%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20empty_nums%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{access_element} -->
```python title="list.py"
# 存取元素
x: int = nums[1]  # 存取索引 1 處的元素

# 更新元素
nums[1] = 0  # 將索引 1 處的元素更新為 0
```

```cpp title="list.cpp"
/* 存取元素 */
int num = nums[1]; // 存取索引 1 處的元素

/* 更新元素 */
nums[1] = 0; // 將索引 1 處的元素更新為 0
```

```java title="list.java"
/* 存取元素 */
int num = nums.get(1); // 存取索引 1 處的元素

/* 更新元素 */
nums.set(1, 0); // 將索引 1 處的元素更新為 0
```

```csharp title="list.cs"
/* 存取元素 */
int num = nums[1]; // 存取索引 1 處的元素

/* 更新元素 */
nums[1] = 0; // 將索引 1 處的元素更新為 0
```

```go title="list_test.go"
/* 存取元素 */
num := nums[1] // 存取索引 1 處的元素

/* 更新元素 */
nums[1] = 0 // 將索引 1 處的元素更新為 0
```

```swift title="list.swift"
/* 存取元素 */
let num = nums[1] // 存取索引 1 處的元素

/* 更新元素 */
nums[1] = 0 // 將索引 1 處的元素更新為 0
```

```javascript title="list.js"
/* 存取元素 */
const num = nums[1]; // 存取索引 1 處的元素

/* 更新元素 */
nums[1] = 0; // 將索引 1 處的元素更新為 0
```

```typescript title="list.ts"
/* 存取元素 */
const num: number = nums[1]; // 存取索引 1 處的元素

/* 更新元素 */
nums[1] = 0; // 將索引 1 處的元素更新為 0
```

```dart title="list.dart"
/* 存取元素 */
int _num = nums[1]; // 存取索引 1 處的元素

/* 更新元素 */
nums[1] = 0; // 將索引 1 處的元素更新為 0
```

```rust title="list.rs"
// 存取元素
let num = nums[1]; // 存取索引 1 處的元素

// 更新元素
nums[1] = 0; // 將索引 1 處的元素更新為 0
```

```c title="list.c"
// C 未提供內建的動態陣列
```

```kotlin title="list.kt"
/* 存取元素 */
val num = nums[1] // 存取索引 1 處的元素

/* 更新元素 */
nums[1] = 0 // 將索引 1 處的元素更新為 0
```

```ruby title="list.rb"
# 存取元素
num = nums[1] # 存取索引 1 處的元素

# 更新元素
nums[1] = 0 # 將索引 1 處的元素更新為 0
```

<!-- [tutor]{access_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%0A%20%20%20%20%23%20%E8%AE%80%E5%8F%96%E5%85%83%E7%B4%A0%0A%20%20%20%20x%20%3D%20nums%5B1%5D%20%20%23%20%E8%AE%80%E5%8F%96%E7%B4%A2%E5%BC%95%201%20%E7%9A%84%E5%85%83%E7%B4%A0%0A%0A%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E5%B0%87%E7%B4%A2%E5%BC%95%201%20%E7%9A%84%E5%85%83%E7%B4%A0%E6%9B%B4%E6%96%B0%E7%82%BA%200&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_element} -->
```python title="list.py"
# 清空列表
nums.clear()

# 在尾端加入元素
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

# 在中間插入元素
nums.insert(3, 6)  # 在索引 3 處插入數字 6

# 刪除元素
nums.pop(3)  # 刪除索引 3 處的元素
```

```cpp title="list.cpp"
/* 清空列表 */
nums.clear();

/* 在尾端加入元素 */
nums.push_back(1);
nums.push_back(3);
nums.push_back(2);
nums.push_back(5);
nums.push_back(4);

/* 在中間插入元素 */
nums.insert(nums.begin() + 3, 6); // 在索引 3 處插入數字 6

/* 刪除元素 */
nums.erase(nums.begin() + 3); // 刪除索引 3 處的元素
```

```java title="list.java"
/* 清空列表 */
nums.clear();

/* 在尾端加入元素 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* 在中間插入元素 */
nums.add(3, 6); // 在索引 3 處插入數字 6

/* 刪除元素 */
nums.remove(3); // 刪除索引 3 處的元素
```

```csharp title="list.cs"
/* 清空列表 */
nums.Clear();

/* 在尾端加入元素 */
nums.Add(1);
nums.Add(3);
nums.Add(2);
nums.Add(5);
nums.Add(4);

/* 在中間插入元素 */
nums.Insert(3, 6); // 在索引 3 處插入數字 6

/* 刪除元素 */
nums.RemoveAt(3); // 刪除索引 3 處的元素
```

```go title="list_test.go"
/* 清空列表 */
nums = nil

/* 在尾端加入元素 */
nums = append(nums, 1)
nums = append(nums, 3)
nums = append(nums, 2)
nums = append(nums, 5)
nums = append(nums, 4)

/* 在中間插入元素 */
nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 在索引 3 處插入數字 6

/* 刪除元素 */
nums = append(nums[:3], nums[4:]...) // 刪除索引 3 處的元素
```

```swift title="list.swift"
/* 清空列表 */
nums.removeAll()

/* 在尾端加入元素 */
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

/* 在中間插入元素 */
nums.insert(6, at: 3) // 在索引 3 處插入數字 6

/* 刪除元素 */
nums.remove(at: 3) // 刪除索引 3 處的元素
```

```javascript title="list.js"
/* 清空列表 */
nums.length = 0;

/* 在尾端加入元素 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* 在中間插入元素 */
nums.splice(3, 0, 6); // 在索引 3 處插入數字 6

/* 刪除元素 */
nums.splice(3, 1); // 刪除索引 3 處的元素
```

```typescript title="list.ts"
/* 清空列表 */
nums.length = 0;

/* 在尾端加入元素 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* 在中間插入元素 */
nums.splice(3, 0, 6); // 在索引 3 處插入數字 6

/* 刪除元素 */
nums.splice(3, 1); // 刪除索引 3 處的元素
```

```dart title="list.dart"
/* 清空列表 */
nums.clear();

/* 在尾端加入元素 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* 在中間插入元素 */
nums.insert(3, 6); // 在索引 3 處插入數字 6

/* 刪除元素 */
nums.removeAt(3); // 刪除索引 3 處的元素
```

```rust title="list.rs"
// 清空列表
nums.clear();

// 在尾端加入元素
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

// 在中間插入元素
nums.insert(3, 6); // 在索引 3 處插入數字 6

// 刪除元素
nums.remove(3); // 刪除索引 3 處的元素
```

```c title="list.c"
// C 未提供內建的動態陣列
```

```kotlin title="list.kt"
/* 清空列表 */
nums.clear()

/* 在尾端加入元素 */
nums.add(1)
nums.add(3)
nums.add(2)
nums.add(5)
nums.add(4)

/* 在中間插入元素 */
nums.add(3, 6) // 在索引 3 處插入數字 6

/* 刪除元素 */
nums.removeAt(3) // 刪除索引 3 處的元素
```

```ruby title="list.rb"
# 清空列表
nums.clear

# 在尾端加入元素
nums << 1
nums << 3
nums << 2
nums << 5
nums << 4

# 在中間插入元素
nums.insert(3, 6) # 在索引 3 處插入數字 6

# 刪除元素
nums.delete_at(3) # 刪除索引 3 處的元素
```

<!-- [tutor]{insert_remove_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%89%E5%88%9D%E5%A7%8B%E5%80%BC%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B8%85%E7%A9%BA%E4%B8%B2%E5%88%97%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E5%B0%BE%E7%AB%AF%E5%8A%A0%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%9C%A8%E4%B8%AD%E9%96%93%E6%8F%92%E5%85%A5%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.insert%283,%206%29%20%20%23%20%E5%9C%A8%E7%B4%A2%E5%BC%95%203%20%E6%8F%92%E5%85%A5%E6%95%B8%E5%AD%97%206%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E5%85%83%E7%B4%A0%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%B4%A2%E5%BC%95%203%20%E7%9A%84%E5%85%83%E7%B4%A0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{iterate_list} -->
```python title="list.py"
# 依索引走訪列表
count = 0
for i in range(len(nums)):
    count += nums[i]

# 直接走訪列表中的元素
for num in nums:
    count += num
```

```cpp title="list.cpp"
/* 依索引走訪列表 */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums[i];
}

/* 直接走訪列表中的元素 */
count = 0;
for (int x : nums) {
    count += x;
}
```

```java title="list.java"
/* 依索引走訪列表 */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums.get(i);
}

/* 直接走訪列表中的元素 */
for (int x : nums) {
    count += x;
}
```

```csharp title="list.cs"
/* 依索引走訪列表 */
int count = 0;
for (int i = 0; i < nums.Count; i++) {
    count += nums[i];
}

/* 直接走訪列表中的元素 */
count = 0;
foreach (int x in nums) {
    count += x;
}
```

```go title="list_test.go"
/* 依索引走訪列表 */
count := 0
for i := 0; i < len(nums); i++ {
    count += nums[i]
}

/* 直接走訪列表中的元素 */
count = 0
for _, x := range nums {
    count += x
}
```

```swift title="list.swift"
/* 依索引走訪列表 */
var count = 0
for i in nums.indices {
    count += nums[i]
}

/* 直接走訪列表中的元素 */
count = 0
for x in nums {
    count += x
}
```

```javascript title="list.js"
/* 依索引走訪列表 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* 直接走訪列表中的元素 */
count = 0;
for (const x of nums) {
    count += x;
}
```

```typescript title="list.ts"
/* 依索引走訪列表 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* 直接走訪列表中的元素 */
count = 0;
for (const x of nums) {
    count += x;
}
```

```dart title="list.dart"
/* 依索引走訪列表 */
int count = 0;
for (var i = 0; i < nums.length; i++) {
  count += nums[i];
}

/* 直接走訪列表中的元素 */
count = 0;
for (var x in nums) {
  count += x;
}
```

```rust title="list.rs"
// 依索引走訪列表
let mut _count = 0;
for i in 0..nums.len() {
    _count += nums[i];
}

// 直接走訪列表中的元素
_count = 0;
for x in &nums {
    _count += x;
}
```

```c title="list.c"
// C 未提供內建的動態陣列
```

```kotlin title="list.kt"
/* 依索引走訪列表 */
var count = 0
for (i in nums.indices) {
    count += nums[i]
}

/* 直接走訪列表中的元素 */
for (j in nums) {
    count += j
}
```

```ruby title="list.rb"
# 依索引走訪列表
count = 0
for i in 0...nums.length
  count += nums[i]
end

# 直接走訪列表中的元素
count = 0
nums.each do |x|
  count += x
end
```

<!-- [tutor]{iterate_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%BE%9D%E7%B4%A2%E5%BC%95%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E8%B5%B0%E8%A8%AA%E4%B8%B2%E5%88%97%E4%B8%AD%E7%9A%84%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{concat_list} -->
```python title="list.py"
# 串接兩個列表
nums1 = [6, 8, 7, 10, 9]
nums += nums1  # 將列表 nums1 接在 nums 之後
```

```cpp title="list.cpp"
/* 串接兩個列表 */
vector<int> nums1 = {6, 8, 7, 10, 9};
// 將列表 nums1 接在 nums 之後
nums.insert(nums.end(), nums1.begin(), nums1.end());
```

```java title="list.java"
/* 串接兩個列表 */
List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
nums.addAll(nums1); // 將列表 nums1 接在 nums 之後
```

```csharp title="list.cs"
/* 串接兩個列表 */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.AddRange(nums1); // 將列表 nums1 接在 nums 之後
```

```go title="list_test.go"
/* 串接兩個列表 */
nums1 := []int{6, 8, 7, 10, 9}
nums = append(nums, nums1...) // 將列表 nums1 接在 nums 之後
```

```swift title="list.swift"
/* 串接兩個列表 */
let nums1 = [6, 8, 7, 10, 9]
nums.append(contentsOf: nums1) // 將列表 nums1 接在 nums 之後
```

```javascript title="list.js"
/* 串接兩個列表 */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1); // 將列表 nums1 接在 nums 之後
```

```typescript title="list.ts"
/* 串接兩個列表 */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1); // 將列表 nums1 接在 nums 之後
```

```dart title="list.dart"
/* 串接兩個列表 */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.addAll(nums1); // 將列表 nums1 接在 nums 之後
```

```rust title="list.rs"
// 串接兩個列表
let mut nums1 = vec![6, 8, 7, 10, 9];
nums.append(&mut nums1); // append 會移走 nums1 的元素，之後 nums1 就空了
```

```c title="list.c"
// C 未提供內建的動態陣列
```

```kotlin title="list.kt"
/* 串接兩個列表 */
val nums1 = mutableListOf(6, 8, 7, 10, 9)
nums.addAll(nums1) // 將列表 nums1 接在 nums 之後
```

```ruby title="list.rb"
# 串接兩個列表
nums1 = [6, 8, 7, 10, 9]
nums += nums1
```

<!-- [tutor]{concat_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%B8%B2%E6%8E%A5%E5%85%A9%E5%80%8B%E4%B8%B2%E5%88%97%0A%20%20%20%20nums1%20%3D%20%5B6,%208,%207,%2010,%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%20nums1%20%E6%8E%A5%E5%88%B0%20nums%20%E7%9A%84%E5%B0%BE%E7%AB%AF&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{sort_list} -->
```python title="list.py"
# 排序列表
nums.sort()  # 排序後，列表元素由小到大排列
```

```cpp title="list.cpp"
/* 排序列表 */
sort(nums.begin(), nums.end()); // 排序後，列表元素由小到大排列
```

```java title="list.java"
/* 排序列表 */
Collections.sort(nums); // 排序後，列表元素由小到大排列
```

```csharp title="list.cs"
/* 排序列表 */
nums.Sort(); // 排序後，列表元素由小到大排列
```

```go title="list_test.go"
/* 排序列表 */
sort.Ints(nums) // 排序後，列表元素由小到大排列
```

```swift title="list.swift"
/* 排序列表 */
nums.sort() // 排序後，列表元素由小到大排列
```

```javascript title="list.js"
/* 排序列表 */
nums.sort((a, b) => a - b); // 排序後，列表元素由小到大排列
```

```typescript title="list.ts"
/* 排序列表 */
nums.sort((a, b) => a - b); // 排序後，列表元素由小到大排列
```

```dart title="list.dart"
/* 排序列表 */
nums.sort(); // 排序後，列表元素由小到大排列
```

```rust title="list.rs"
// 排序列表
nums.sort(); // 排序後，列表元素由小到大排列
```

```c title="list.c"
// C 未提供內建的動態陣列
```

```kotlin title="list.kt"
/* 排序列表 */
nums.sort() // 排序後，列表元素由小到大排列
```

```ruby title="list.rb"
# 排序列表
nums = nums.sort { |a, b| a <=> b } # 排序後，列表元素由小到大排列
```

<!-- [tutor]{sort_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%B2%E5%88%97%0A%20%20%20%20nums%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%B0%87%E4%B8%B2%E5%88%97%E6%8E%92%E5%BA%8F%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E6%8E%92%E5%BA%8F%E5%BE%8C%EF%BC%8C%E4%B8%B2%E5%88%97%E5%85%83%E7%B4%A0%E7%94%B1%E5%B0%8F%E5%88%B0%E5%A4%A7%E6%8E%92%E5%88%97&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
