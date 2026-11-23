<!-- [snippet]{init_list} -->
```python title="list.py"
# リストを初期化する
# 初期値なし
empty_nums: list[int] = []
# 初期値あり
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="list.cpp"
/* リストを初期化する */
// 初期値なし
vector<int> emptyNums;
// 初期値あり
vector<int> nums = {1, 3, 2, 5, 4};
```

```java title="list.java"
/* リストを初期化する */
// 初期値なし
List<Integer> emptyNums = new ArrayList<>();
// 初期値あり（リストの要素には int のラッパークラス Integer しか使えないため、配列の型は int[] ではなく Integer[] にする必要があることに注意）
Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
```

```csharp title="list.cs"
/* リストを初期化する */
// 初期値なし
List<int> emptyNums = [];
// 初期値あり
int[] numbers = [1, 3, 2, 5, 4];
List<int> nums = [.. numbers];
```

```go title="list_test.go"
/* リストを初期化する */
// 初期値なし
emptyNums := []int{}
// 初期値あり
nums := []int{1, 3, 2, 5, 4}
```

```swift title="list.swift"
/* リストを初期化する */
// 初期値なし
let emptyNums: [Int] = []
// 初期値あり
var nums = [1, 3, 2, 5, 4]
```

```javascript title="list.js"
/* リストを初期化する */
// 初期値なし
const emptyNums = [];
// 初期値あり
const nums = [1, 3, 2, 5, 4];
```

```typescript title="list.ts"
/* リストを初期化する */
// 初期値なし
const emptyNums: number[] = [];
// 初期値あり
const nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="list.dart"
/* リストを初期化する */
// 初期値なし
List<int> emptyNums = [];
// 初期値あり
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="list.rs"
// リストを初期化する
// 初期値なし
let empty_nums: Vec<i32> = Vec::new();
// 初期値あり
let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* リストを初期化する */
// 初期値なし
val emptyNums = mutableListOf<Int>()
// 初期値あり
val nums = mutableListOf(1, 3, 2, 5, 4)
```

```ruby title="list.rb"
# リストを初期化する
# 初期値なし
empty_nums = []
# 初期値あり
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%AA%E3%81%97%0A%20%20%20%20empty_nums%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{access_element} -->
```python title="list.py"
# 要素にアクセスする
x: int = nums[1]  # インデックス 1 の要素にアクセスする

# 要素を更新する
nums[1] = 0  # インデックス 1 の要素を 0 に更新する
```

```cpp title="list.cpp"
/* 要素にアクセスする */
int num = nums[1]; // インデックス 1 の要素にアクセスする

/* 要素を更新する */
nums[1] = 0; // インデックス 1 の要素を 0 に更新する
```

```java title="list.java"
/* 要素にアクセスする */
int num = nums.get(1); // インデックス 1 の要素にアクセスする

/* 要素を更新する */
nums.set(1, 0); // インデックス 1 の要素を 0 に更新する
```

```csharp title="list.cs"
/* 要素にアクセスする */
int num = nums[1]; // インデックス 1 の要素にアクセスする

/* 要素を更新する */
nums[1] = 0; // インデックス 1 の要素を 0 に更新する
```

```go title="list_test.go"
/* 要素にアクセスする */
num := nums[1] // インデックス 1 の要素にアクセスする

/* 要素を更新する */
nums[1] = 0 // インデックス 1 の要素を 0 に更新する
```

```swift title="list.swift"
/* 要素にアクセスする */
let num = nums[1] // インデックス 1 の要素にアクセスする

/* 要素を更新する */
nums[1] = 0 // インデックス 1 の要素を 0 に更新する
```

```javascript title="list.js"
/* 要素にアクセスする */
const num = nums[1]; // インデックス 1 の要素にアクセスする

/* 要素を更新する */
nums[1] = 0; // インデックス 1 の要素を 0 に更新する
```

```typescript title="list.ts"
/* 要素にアクセスする */
const num: number = nums[1]; // インデックス 1 の要素にアクセスする

/* 要素を更新する */
nums[1] = 0; // インデックス 1 の要素を 0 に更新する
```

```dart title="list.dart"
/* 要素にアクセスする */
int _num = nums[1]; // インデックス 1 の要素にアクセスする

/* 要素を更新する */
nums[1] = 0; // インデックス 1 の要素を 0 に更新する
```

```rust title="list.rs"
// 要素にアクセスする
let num = nums[1]; // インデックス 1 の要素にアクセスする

// 要素を更新する
nums[1] = 0; // インデックス 1 の要素を 0 に更新する
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* 要素にアクセスする */
val num = nums[1] // インデックス 1 の要素にアクセスする

/* 要素を更新する */
nums[1] = 0 // インデックス 1 の要素を 0 に更新する
```

```ruby title="list.rb"
# 要素にアクセスする
num = nums[1] # インデックス 1 の要素にアクセスする

# 要素を更新する
nums[1] = 0 # インデックス 1 の要素を 0 に更新する
```

<!-- [tutor]{access_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20x%20%3D%20nums%5B1%5D%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E6%9B%B4%E6%96%B0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%200%20%E3%81%AB%E6%9B%B4%E6%96%B0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_element} -->
```python title="list.py"
# リストを空にする
nums.clear()

# 末尾に要素を追加する
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

# 途中に要素を挿入する
nums.insert(3, 6)  # インデックス 3 に数値 6 を挿入する

# 要素を削除する
nums.pop(3)  # インデックス 3 の要素を削除する
```

```cpp title="list.cpp"
/* リストを空にする */
nums.clear();

/* 末尾に要素を追加する */
nums.push_back(1);
nums.push_back(3);
nums.push_back(2);
nums.push_back(5);
nums.push_back(4);

/* 途中に要素を挿入する */
nums.insert(nums.begin() + 3, 6); // インデックス 3 に数値 6 を挿入する

/* 要素を削除する */
nums.erase(nums.begin() + 3); // インデックス 3 の要素を削除する
```

```java title="list.java"
/* リストを空にする */
nums.clear();

/* 末尾に要素を追加する */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* 途中に要素を挿入する */
nums.add(3, 6); // インデックス 3 に数値 6 を挿入する

/* 要素を削除する */
nums.remove(3); // インデックス 3 の要素を削除する
```

```csharp title="list.cs"
/* リストを空にする */
nums.Clear();

/* 末尾に要素を追加する */
nums.Add(1);
nums.Add(3);
nums.Add(2);
nums.Add(5);
nums.Add(4);

/* 途中に要素を挿入する */
nums.Insert(3, 6); // インデックス 3 に数値 6 を挿入する

/* 要素を削除する */
nums.RemoveAt(3); // インデックス 3 の要素を削除する
```

```go title="list_test.go"
/* リストを空にする */
nums = nil

/* 末尾に要素を追加する */
nums = append(nums, 1)
nums = append(nums, 3)
nums = append(nums, 2)
nums = append(nums, 5)
nums = append(nums, 4)

/* 途中に要素を挿入する */
nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // インデックス 3 に数値 6 を挿入する

/* 要素を削除する */
nums = append(nums[:3], nums[4:]...) // インデックス 3 の要素を削除する
```

```swift title="list.swift"
/* リストを空にする */
nums.removeAll()

/* 末尾に要素を追加する */
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

/* 途中に要素を挿入する */
nums.insert(6, at: 3) // インデックス 3 に数値 6 を挿入する

/* 要素を削除する */
nums.remove(at: 3) // インデックス 3 の要素を削除する
```

```javascript title="list.js"
/* リストを空にする */
nums.length = 0;

/* 末尾に要素を追加する */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* 途中に要素を挿入する */
nums.splice(3, 0, 6); // インデックス 3 に数値 6 を挿入する

/* 要素を削除する */
nums.splice(3, 1); // インデックス 3 の要素を削除する
```

```typescript title="list.ts"
/* リストを空にする */
nums.length = 0;

/* 末尾に要素を追加する */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* 途中に要素を挿入する */
nums.splice(3, 0, 6); // インデックス 3 に数値 6 を挿入する

/* 要素を削除する */
nums.splice(3, 1); // インデックス 3 の要素を削除する
```

```dart title="list.dart"
/* リストを空にする */
nums.clear();

/* 末尾に要素を追加する */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* 途中に要素を挿入する */
nums.insert(3, 6); // インデックス 3 に数値 6 を挿入する

/* 要素を削除する */
nums.removeAt(3); // インデックス 3 の要素を削除する
```

```rust title="list.rs"
// リストを空にする
nums.clear();

// 末尾に要素を追加する
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

// 途中に要素を挿入する
nums.insert(3, 6); // インデックス 3 に数値 6 を挿入する

// 要素を削除する
nums.remove(3); // インデックス 3 の要素を削除する
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* リストを空にする */
nums.clear()

/* 末尾に要素を追加する */
nums.add(1)
nums.add(3)
nums.add(2)
nums.add(5)
nums.add(4)

/* 途中に要素を挿入する */
nums.add(3, 6) // インデックス 3 に数値 6 を挿入する

/* 要素を削除する */
nums.removeAt(3) // インデックス 3 の要素を削除する
```

```ruby title="list.rb"
# リストを空にする
nums.clear

# 末尾に要素を追加する
nums << 1
nums << 3
nums << 2
nums << 5
nums << 4

# 途中に要素を挿入する
nums.insert(3, 6) # インデックス 3 に数値 6 を挿入する

# 要素を削除する
nums.delete_at(3) # インデックス 3 の要素を削除する
```

<!-- [tutor]{insert_remove_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E7%A9%BA%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20nums.clear()%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20nums.append(1)%0A%20%20%20%20nums.append(3)%0A%20%20%20%20nums.append(2)%0A%20%20%20%20nums.append(5)%0A%20%20%20%20nums.append(4)%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%94%E4%B8%AD%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20nums.insert(3%2C%206)%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AB%E6%95%B0%E5%80%A4%206%20%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20nums.pop(3)%20%20%20%20%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{iterate_list} -->
```python title="list.py"
# インデックスを使ってリストを走査する
count = 0
for i in range(len(nums)):
    count += nums[i]

# リストの要素を直接走査する
for num in nums:
    count += num
```

```cpp title="list.cpp"
/* インデックスを使ってリストを走査する */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums[i];
}

/* リストの要素を直接走査する */
count = 0;
for (int x : nums) {
    count += x;
}
```

```java title="list.java"
/* インデックスを使ってリストを走査する */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums.get(i);
}

/* リストの要素を直接走査する */
for (int x : nums) {
    count += x;
}
```

```csharp title="list.cs"
/* インデックスを使ってリストを走査する */
int count = 0;
for (int i = 0; i < nums.Count; i++) {
    count += nums[i];
}

/* リストの要素を直接走査する */
count = 0;
foreach (int x in nums) {
    count += x;
}
```

```go title="list_test.go"
/* インデックスを使ってリストを走査する */
count := 0
for i := 0; i < len(nums); i++ {
    count += nums[i]
}

/* リストの要素を直接走査する */
count = 0
for _, x := range nums {
    count += x
}
```

```swift title="list.swift"
/* インデックスを使ってリストを走査する */
var count = 0
for i in nums.indices {
    count += nums[i]
}

/* リストの要素を直接走査する */
count = 0
for x in nums {
    count += x
}
```

```javascript title="list.js"
/* インデックスを使ってリストを走査する */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* リストの要素を直接走査する */
count = 0;
for (const x of nums) {
    count += x;
}
```

```typescript title="list.ts"
/* インデックスを使ってリストを走査する */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* リストの要素を直接走査する */
count = 0;
for (const x of nums) {
    count += x;
}
```

```dart title="list.dart"
/* インデックスを使ってリストを走査する */
int count = 0;
for (var i = 0; i < nums.length; i++) {
  count += nums[i];
}

/* リストの要素を直接走査する */
count = 0;
for (var x in nums) {
  count += x;
}
```

```rust title="list.rs"
// インデックスを使ってリストを走査する
let mut _count = 0;
for i in 0..nums.len() {
    _count += nums[i];
}

// リストの要素を直接走査する
_count = 0;
for x in &nums {
    _count += x;
}
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* インデックスを使ってリストを走査する */
var count = 0
for (i in nums.indices) {
    count += nums[i]
}

/* リストの要素を直接走査する */
for (j in nums) {
    count += j
}
```

```ruby title="list.rb"
# インデックスを使ってリストを走査する
count = 0
for i in 0...nums.length
  count += nums[i]
end

# リストの要素を直接走査する
count = 0
nums.each do |x|
  count += x
end
```

<!-- [tutor]{iterate_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range(len(nums))%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E7%9B%B4%E6%8E%A5%E8%B5%B0%E6%9F%BB%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{concat_list} -->
```python title="list.py"
# 2 つのリストを連結する
nums1 = [6, 8, 7, 10, 9]
nums += nums1  # リスト nums の後ろに nums1 を連結する
```

```cpp title="list.cpp"
/* 2 つのリストを連結する */
vector<int> nums1 = {6, 8, 7, 10, 9};
// リスト nums の後ろに nums1 を連結する
nums.insert(nums.end(), nums1.begin(), nums1.end());
```

```java title="list.java"
/* 2 つのリストを連結する */
List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
nums.addAll(nums1); // リスト nums の後ろに nums1 を連結する
```

```csharp title="list.cs"
/* 2 つのリストを連結する */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.AddRange(nums1); // リスト nums の後ろに nums1 を連結する
```

```go title="list_test.go"
/* 2 つのリストを連結する */
nums1 := []int{6, 8, 7, 10, 9}
nums = append(nums, nums1...) // リスト nums の後ろに nums1 を連結する
```

```swift title="list.swift"
/* 2 つのリストを連結する */
let nums1 = [6, 8, 7, 10, 9]
nums.append(contentsOf: nums1) // リスト nums の後ろに nums1 を連結する
```

```javascript title="list.js"
/* 2 つのリストを連結する */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1); // リスト nums の後ろに nums1 を連結する
```

```typescript title="list.ts"
/* 2 つのリストを連結する */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1); // リスト nums の後ろに nums1 を連結する
```

```dart title="list.dart"
/* 2 つのリストを連結する */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.addAll(nums1); // リスト nums の後ろに nums1 を連結する
```

```rust title="list.rs"
// 2 つのリストを連結する
let mut nums1 = vec![6, 8, 7, 10, 9];
nums.append(&mut nums1); // append は nums1 の要素をムーブするため、その後 nums1 は空になる
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* 2 つのリストを連結する */
val nums1 = mutableListOf(6, 8, 7, 10, 9)
nums.addAll(nums1) // リスト nums の後ろに nums1 を連結する
```

```ruby title="list.rb"
# 2 つのリストを連結する
nums1 = [6, 8, 7, 10, 9]
nums += nums1
```

<!-- [tutor]{concat_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%BA%8C%E3%81%A4%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E9%80%A3%E7%B5%90%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%20nums1%20%E3%82%92%20nums%20%E3%81%AE%E5%BE%8C%E3%82%8D%E3%81%AB%E9%80%A3%E7%B5%90&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{sort_list} -->
```python title="list.py"
# リストをソートする
nums.sort()  # ソート後、リストの要素は昇順に並ぶ
```

```cpp title="list.cpp"
/* リストをソートする */
sort(nums.begin(), nums.end()); // ソート後、リストの要素は昇順に並ぶ
```

```java title="list.java"
/* リストをソートする */
Collections.sort(nums); // ソート後、リストの要素は昇順に並ぶ
```

```csharp title="list.cs"
/* リストをソートする */
nums.Sort(); // ソート後、リストの要素は昇順に並ぶ
```

```go title="list_test.go"
/* リストをソートする */
sort.Ints(nums) // ソート後、リストの要素は昇順に並ぶ
```

```swift title="list.swift"
/* リストをソートする */
nums.sort() // ソート後、リストの要素は昇順に並ぶ
```

```javascript title="list.js"
/* リストをソートする */
nums.sort((a, b) => a - b); // ソート後、リストの要素は昇順に並ぶ
```

```typescript title="list.ts"
/* リストをソートする */
nums.sort((a, b) => a - b); // ソート後、リストの要素は昇順に並ぶ
```

```dart title="list.dart"
/* リストをソートする */
nums.sort(); // ソート後、リストの要素は昇順に並ぶ
```

```rust title="list.rs"
// リストをソートする
nums.sort(); // ソート後、リストの要素は昇順に並ぶ
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* リストをソートする */
nums.sort() // ソート後、リストの要素は昇順に並ぶ
```

```ruby title="list.rb"
# リストをソートする
nums = nums.sort { |a, b| a <=> b } # ソート後、リストの要素は昇順に並ぶ
```

<!-- [tutor]{sort_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E3%82%BD%E3%83%BC%E3%83%88%0A%20%20%20%20nums.sort()%20%20%23%20%E3%82%BD%E3%83%BC%E3%83%88%E5%BE%8C%E3%81%AF%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E6%98%87%E9%A0%86%E3%81%AB%E4%B8%A6%E3%81%B6&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
