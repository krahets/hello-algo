<!-- [snippet]{init_list} -->
```python title="list.py"
# リストを初期化
# 初期値なし
nums1: list[int] = []
# 初期値あり
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="list.cpp"
/* リストを初期化 */
// C++ の vector が、本節で扱う nums に相当することに注意
// 初期値なし
vector<int> nums1;
// 初期値あり
vector<int> nums = { 1, 3, 2, 5, 4 };
```

```java title="list.java"
/* リストを初期化 */
// 初期値なし
List<Integer> nums1 = new ArrayList<>();
// 初期値あり（配列には、int[] に対応するラッパー型の配列 Integer[] を使う必要がある）
Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
```

```csharp title="list.cs"
/* リストを初期化 */
// 初期値なし
List<int> nums1 = [];
// 初期値あり
int[] numbers = [1, 3, 2, 5, 4];
List<int> nums = [.. numbers];
```

```go title="list_test.go"
/* リストを初期化 */
// 初期値なし
nums1 := []int{}
// 初期値あり
nums := []int{1, 3, 2, 5, 4}
```

```swift title="list.swift"
/* リストを初期化 */
// 初期値なし
let nums1: [Int] = []
// 初期値あり
var nums = [1, 3, 2, 5, 4]
```

```javascript title="list.js"
/* リストを初期化 */
// 初期値なし
const nums1 = [];
// 初期値あり
const nums = [1, 3, 2, 5, 4];
```

```typescript title="list.ts"
/* リストを初期化 */
// 初期値なし
const nums1: number[] = [];
// 初期値あり
const nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="list.dart"
/* リストを初期化 */
// 初期値なし
List<int> nums1 = [];
// 初期値あり
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="list.rs"
/* リストを初期化 */
// 初期値なし
let nums1: Vec<i32> = Vec::new();
// 初期値あり
let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* リストを初期化 */
// 初期値なし
var nums1 = listOf<Int>()
// 初期値あり
var numbers = arrayOf(1, 3, 2, 5, 4)
var nums = numbers.toMutableList()
```

```ruby title="list.rb"
# リストを初期化
# 初期値なし
nums1 = []
# 初期値あり
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%AA%E3%81%97%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{access_element} -->
```python title="list.py"
# 要素にアクセス
num: int = nums[1]  # インデックス 1 の要素にアクセス

# 要素を更新
nums[1] = 0    # インデックス 1 の要素を 0 に更新
```

```cpp title="list.cpp"
/* 要素にアクセス */
int num = nums[1];  // インデックス 1 の要素にアクセス

/* 要素を更新 */
nums[1] = 0;  // インデックス 1 の要素を 0 に更新
```

```java title="list.java"
/* 要素にアクセス */
int num = nums.get(1);  // インデックス 1 の要素にアクセス

/* 要素を更新 */
nums.set(1, 0);  // インデックス 1 の要素を 0 に更新
```

```csharp title="list.cs"
/* 要素にアクセス */
int num = nums[1];  // インデックス 1 の要素にアクセス

/* 要素を更新 */
nums[1] = 0;  // インデックス 1 の要素を 0 に更新
```

```go title="list_test.go"
/* 要素にアクセス */
num := nums[1]  // インデックス 1 の要素にアクセス

/* 要素を更新 */
nums[1] = 0     // インデックス 1 の要素を 0 に更新
```

```swift title="list.swift"
/* 要素にアクセス */
let num = nums[1] // インデックス 1 の要素にアクセス

/* 要素を更新 */
nums[1] = 0 // インデックス 1 の要素を 0 に更新
```

```javascript title="list.js"
/* 要素にアクセス */
const num = nums[1];  // インデックス 1 の要素にアクセス

/* 要素を更新 */
nums[1] = 0;  // インデックス 1 の要素を 0 に更新
```

```typescript title="list.ts"
/* 要素にアクセス */
const num: number = nums[1];  // インデックス 1 の要素にアクセス

/* 要素を更新 */
nums[1] = 0;  // インデックス 1 の要素を 0 に更新
```

```dart title="list.dart"
/* 要素にアクセス */
int num = nums[1];  // インデックス 1 の要素にアクセス

/* 要素を更新 */
nums[1] = 0;  // インデックス 1 の要素を 0 に更新
```

```rust title="list.rs"
/* 要素にアクセス */
let num: i32 = nums[1];  // インデックス 1 の要素にアクセス
/* 要素を更新 */
nums[1] = 0;             // インデックス 1 の要素を 0 に更新
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* 要素にアクセス */
val num = nums[1]       // インデックス 1 の要素にアクセス
/* 要素を更新 */
nums[1] = 0             // インデックス 1 の要素を 0 に更新
```

```ruby title="list.rb"
# 要素にアクセス
num = nums[1] # インデックス 1 の要素にアクセス
# 要素を更新
nums[1] = 0 # インデックス 1 の要素を 0 に更新
```

<!-- [tutor]{access_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E6%9B%B4%E6%96%B0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%200%20%E3%81%AB%E6%9B%B4%E6%96%B0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_element} -->
```python title="list.py"
# リストを空にする
nums.clear()

# 末尾に要素を追加
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

# 途中に要素を挿入
nums.insert(3, 6)  # インデックス 3 に数値 6 を挿入

# 要素を削除
nums.pop(3)        # インデックス 3 の要素を削除
```

```cpp title="list.cpp"
/* リストを空にする */
nums.clear();

/* 末尾に要素を追加 */
nums.push_back(1);
nums.push_back(3);
nums.push_back(2);
nums.push_back(5);
nums.push_back(4);

/* 途中に要素を挿入 */
nums.insert(nums.begin() + 3, 6);  // インデックス 3 に数値 6 を挿入

/* 要素を削除 */
nums.erase(nums.begin() + 3);      // インデックス 3 の要素を削除
```

```java title="list.java"
/* リストを空にする */
nums.clear();

/* 末尾に要素を追加 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* 途中に要素を挿入 */
nums.add(3, 6);  // インデックス 3 に数値 6 を挿入

/* 要素を削除 */
nums.remove(3);  // インデックス 3 の要素を削除
```

```csharp title="list.cs"
/* リストを空にする */
nums.Clear();

/* 末尾に要素を追加 */
nums.Add(1);
nums.Add(3);
nums.Add(2);
nums.Add(5);
nums.Add(4);

/* 途中に要素を挿入 */
nums.Insert(3, 6);  // インデックス 3 に数値 6 を挿入

/* 要素を削除 */
nums.RemoveAt(3);  // インデックス 3 の要素を削除
```

```go title="list_test.go"
/* リストを空にする */
nums = nil

/* 末尾に要素を追加 */
nums = append(nums, 1)
nums = append(nums, 3)
nums = append(nums, 2)
nums = append(nums, 5)
nums = append(nums, 4)

/* 途中に要素を挿入 */
nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // インデックス 3 に数値 6 を挿入

/* 要素を削除 */
nums = append(nums[:3], nums[4:]...) // インデックス 3 の要素を削除
```

```swift title="list.swift"
/* リストを空にする */
nums.removeAll()

/* 末尾に要素を追加 */
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

/* 途中に要素を挿入 */
nums.insert(6, at: 3) // インデックス 3 に数値 6 を挿入

/* 要素を削除 */
nums.remove(at: 3) // インデックス 3 の要素を削除
```

```javascript title="list.js"
/* リストを空にする */
nums.length = 0;

/* 末尾に要素を追加 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* 途中に要素を挿入 */
nums.splice(3, 0, 6); // インデックス 3 に数値 6 を挿入

/* 要素を削除 */
nums.splice(3, 1);  // インデックス 3 の要素を削除
```

```typescript title="list.ts"
/* リストを空にする */
nums.length = 0;

/* 末尾に要素を追加 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* 途中に要素を挿入 */
nums.splice(3, 0, 6); // インデックス 3 に数値 6 を挿入

/* 要素を削除 */
nums.splice(3, 1);  // インデックス 3 の要素を削除
```

```dart title="list.dart"
/* リストを空にする */
nums.clear();

/* 末尾に要素を追加 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* 途中に要素を挿入 */
nums.insert(3, 6); // インデックス 3 に数値 6 を挿入

/* 要素を削除 */
nums.removeAt(3); // インデックス 3 の要素を削除
```

```rust title="list.rs"
/* リストを空にする */
nums.clear();

/* 末尾に要素を追加 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* 途中に要素を挿入 */
nums.insert(3, 6);  // インデックス 3 に数値 6 を挿入

/* 要素を削除 */
nums.remove(3);    // インデックス 3 の要素を削除
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* リストを空にする */
nums.clear();

/* 末尾に要素を追加 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* 途中に要素を挿入 */
nums.add(3, 6);    // インデックス 3 に数値 6 を挿入

/* 要素を削除 */
nums.removeAt(3);  // インデックス 3 の要素を削除
```

```ruby title="list.rb"
# リストを空にする
nums.clear

# 末尾に要素を追加
nums << 1
nums << 3
nums << 2
nums << 5
nums << 4

# 途中に要素を挿入
nums.insert(3, 6) # インデックス 3 に数値 6 を挿入

# 要素を削除
nums.delete_at(3) # インデックス 3 の要素を削除
```

<!-- [tutor]{insert_remove_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E7%A9%BA%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20nums.clear()%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20nums.append(1)%0A%20%20%20%20nums.append(3)%0A%20%20%20%20nums.append(2)%0A%20%20%20%20nums.append(5)%0A%20%20%20%20nums.append(4)%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%94%E4%B8%AD%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20nums.insert(3%2C%206)%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AB%E6%95%B0%E5%80%A4%206%20%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20nums.pop(3)%20%20%20%20%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{iterate_list} -->
```python title="list.py"
# インデックスを使ってリストを走査
count = 0
for i in range(len(nums)):
    count += nums[i]

# リストの要素を直接走査
for num in nums:
    count += num
```

```cpp title="list.cpp"
/* インデックスを使ってリストを走査 */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums[i];
}

/* リストの要素を直接走査 */
count = 0;
for (int num : nums) {
    count += num;
}
```

```java title="list.java"
/* インデックスを使ってリストを走査 */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums.get(i);
}

/* リストの要素を直接走査 */
for (int num : nums) {
    count += num;
}
```

```csharp title="list.cs"
/* インデックスを使ってリストを走査 */
int count = 0;
for (int i = 0; i < nums.Count; i++) {
    count += nums[i];
}

/* リストの要素を直接走査 */
count = 0;
foreach (int num in nums) {
    count += num;
}
```

```go title="list_test.go"
/* インデックスを使ってリストを走査 */
count := 0
for i := 0; i < len(nums); i++ {
    count += nums[i]
}

/* リストの要素を直接走査 */
count = 0
for _, num := range nums {
    count += num
}
```

```swift title="list.swift"
/* インデックスを使ってリストを走査 */
var count = 0
for i in nums.indices {
    count += nums[i]
}

/* リストの要素を直接走査 */
count = 0
for num in nums {
    count += num
}
```

```javascript title="list.js"
/* インデックスを使ってリストを走査 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* リストの要素を直接走査 */
count = 0;
for (const num of nums) {
    count += num;
}
```

```typescript title="list.ts"
/* インデックスを使ってリストを走査 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* リストの要素を直接走査 */
count = 0;
for (const num of nums) {
    count += num;
}
```

```dart title="list.dart"
/* インデックスを使ってリストを走査 */
int count = 0;
for (var i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* リストの要素を直接走査 */
count = 0;
for (var num in nums) {
    count += num;
}
```

```rust title="list.rs"
// インデックスを使ってリストを走査
let mut _count = 0;
for i in 0..nums.len() {
    _count += nums[i];
}

// リストの要素を直接走査
_count = 0;
for num in &nums {
    _count += num;
}
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* インデックスを使ってリストを走査 */
var count = 0
for (i in nums.indices) {
    count += nums[i]
}

/* リストの要素を直接走査 */
for (num in nums) {
    count += num
}
```

```ruby title="list.rb"
# インデックスを使ってリストを走査
count = 0
for i in 0...nums.length
    count += nums[i]
end

# リストの要素を直接走査
count = 0
for num in nums
    count += num
end
```

<!-- [tutor]{iterate_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range(len(nums))%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E7%9B%B4%E6%8E%A5%E8%B5%B0%E6%9F%BB%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{concat_list} -->
```python title="list.py"
# 二つのリストを連結
nums1: list[int] = [6, 8, 7, 10, 9]
nums += nums1  # リスト nums1 を nums の後ろに連結
```

```cpp title="list.cpp"
/* 二つのリストを連結 */
vector<int> nums1 = { 6, 8, 7, 10, 9 };
// リスト nums1 を nums の後ろに連結
nums.insert(nums.end(), nums1.begin(), nums1.end());
```

```java title="list.java"
/* 二つのリストを連結 */
List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
nums.addAll(nums1);  // リスト nums1 を nums の後ろに連結
```

```csharp title="list.cs"
/* 二つのリストを連結 */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.AddRange(nums1);  // リスト nums1 を nums の後ろに連結
```

```go title="list_test.go"
/* 二つのリストを連結 */
nums1 := []int{6, 8, 7, 10, 9}
nums = append(nums, nums1...)  // リスト nums1 を nums の後ろに連結
```

```swift title="list.swift"
/* 二つのリストを連結 */
let nums1 = [6, 8, 7, 10, 9]
nums.append(contentsOf: nums1) // リスト nums1 を nums の後ろに連結
```

```javascript title="list.js"
/* 二つのリストを連結 */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);  // リスト nums1 を nums の後ろに連結
```

```typescript title="list.ts"
/* 二つのリストを連結 */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1);  // リスト nums1 を nums の後ろに連結
```

```dart title="list.dart"
/* 二つのリストを連結 */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.addAll(nums1);  // リスト nums1 を nums の後ろに連結
```

```rust title="list.rs"
/* 二つのリストを連結 */
let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
nums.extend(nums1);
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* 二つのリストを連結 */
val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
nums.addAll(nums1)  // リスト nums1 を nums の後ろに連結
```

```ruby title="list.rb"
# 二つのリストを連結
nums1 = [6, 8, 7, 10, 9]
nums += nums1
```

<!-- [tutor]{concat_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%BA%8C%E3%81%A4%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E9%80%A3%E7%B5%90%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%20nums1%20%E3%82%92%20nums%20%E3%81%AE%E5%BE%8C%E3%82%8D%E3%81%AB%E9%80%A3%E7%B5%90&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{sort_list} -->
```python title="list.py"
# リストをソート
nums.sort()  # ソート後、リストの要素は昇順に並ぶ
```

```cpp title="list.cpp"
/* リストをソート */
sort(nums.begin(), nums.end());  // ソート後、リストの要素は昇順に並ぶ
```

```java title="list.java"
/* リストをソート */
Collections.sort(nums);  // ソート後、リストの要素は昇順に並ぶ
```

```csharp title="list.cs"
/* リストをソート */
nums.Sort(); // ソート後、リストの要素は昇順に並ぶ
```

```go title="list_test.go"
/* リストをソート */
sort.Ints(nums)  // ソート後、リストの要素は昇順に並ぶ
```

```swift title="list.swift"
/* リストをソート */
nums.sort() // ソート後、リストの要素は昇順に並ぶ
```

```javascript title="list.js"
/* リストをソート */
nums.sort((a, b) => a - b);  // ソート後、リストの要素は昇順に並ぶ
```

```typescript title="list.ts"
/* リストをソート */
nums.sort((a, b) => a - b);  // ソート後、リストの要素は昇順に並ぶ
```

```dart title="list.dart"
/* リストをソート */
nums.sort(); // ソート後、リストの要素は昇順に並ぶ
```

```rust title="list.rs"
/* リストをソート */
nums.sort(); // ソート後、リストの要素は昇順に並ぶ
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
/* リストをソート */
nums.sort() // ソート後、リストの要素は昇順に並ぶ
```

```ruby title="list.rb"
# リストをソート
nums = nums.sort { |a, b| a <=> b } # ソート後、リストの要素は昇順に並ぶ
```

<!-- [tutor]{sort_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E3%82%BD%E3%83%BC%E3%83%88%0A%20%20%20%20nums.sort()%20%20%23%20%E3%82%BD%E3%83%BC%E3%83%88%E5%BE%8C%E3%81%AF%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E6%98%87%E9%A0%86%E3%81%AB%E4%B8%A6%E3%81%B6&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
