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
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

```cpp title="list.cpp"
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

```java title="list.java"
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

```csharp title="list.cs"
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

```go title="list_test.go"
[file]{list_test}-[region]{access_element}

[file]{list_test}-[region]{update_element}
```

```swift title="list.swift"
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

```javascript title="list.js"
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

```typescript title="list.ts"
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

```dart title="list.dart"
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

```rust title="list.rs"
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

```ruby title="list.rb"
[file]{list}-[region]{access_element}

[file]{list}-[region]{update_element}
```

<!-- [tutor]{access_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E6%9B%B4%E6%96%B0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%201%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%200%20%E3%81%AB%E6%9B%B4%E6%96%B0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_element} -->
```python title="list.py"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

```cpp title="list.cpp"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

```java title="list.java"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

```csharp title="list.cs"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

```go title="list_test.go"
[file]{list_test}-[region]{clear_list}

[file]{list_test}-[region]{append_element}

[file]{list_test}-[region]{insert_element}

[file]{list_test}-[region]{remove_element}
```

```swift title="list.swift"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

```javascript title="list.js"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

```typescript title="list.ts"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

```dart title="list.dart"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

```rust title="list.rs"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

```ruby title="list.rb"
[file]{list}-[region]{clear_list}

[file]{list}-[region]{append_element}

[file]{list}-[region]{insert_element}

[file]{list}-[region]{remove_element}
```

<!-- [tutor]{insert_remove_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E5%80%A4%E3%81%82%E3%82%8A%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E7%A9%BA%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20nums.clear()%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20nums.append(1)%0A%20%20%20%20nums.append(3)%0A%20%20%20%20nums.append(2)%0A%20%20%20%20nums.append(5)%0A%20%20%20%20nums.append(4)%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%80%94%E4%B8%AD%E3%81%AB%E8%A6%81%E7%B4%A0%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20nums.insert(3%2C%206)%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AB%E6%95%B0%E5%80%A4%206%20%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20nums.pop(3)%20%20%20%20%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%203%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%89%8A%E9%99%A4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{iterate_list} -->
```python title="list.py"
[file]{list}-[region]{iterate_list}
```

```cpp title="list.cpp"
[file]{list}-[region]{iterate_list}
```

```java title="list.java"
[file]{list}-[region]{iterate_list}
```

```csharp title="list.cs"
[file]{list}-[region]{iterate_list}
```

```go title="list_test.go"
[file]{list_test}-[region]{iterate_list}
```

```swift title="list.swift"
[file]{list}-[region]{iterate_list}
```

```javascript title="list.js"
[file]{list}-[region]{iterate_list}
```

```typescript title="list.ts"
[file]{list}-[region]{iterate_list}
```

```dart title="list.dart"
[file]{list}-[region]{iterate_list}
```

```rust title="list.rs"
[file]{list}-[region]{iterate_list}
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
[file]{list}-[region]{iterate_list}
```

```ruby title="list.rb"
[file]{list}-[region]{iterate_list}
```

<!-- [tutor]{iterate_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range(len(nums))%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E7%9B%B4%E6%8E%A5%E8%B5%B0%E6%9F%BB%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{concat_list} -->
```python title="list.py"
[file]{list}-[region]{concat_list}
```

```cpp title="list.cpp"
[file]{list}-[region]{concat_list}
```

```java title="list.java"
[file]{list}-[region]{concat_list}
```

```csharp title="list.cs"
[file]{list}-[region]{concat_list}
```

```go title="list_test.go"
[file]{list_test}-[region]{concat_list}
```

```swift title="list.swift"
[file]{list}-[region]{concat_list}
```

```javascript title="list.js"
[file]{list}-[region]{concat_list}
```

```typescript title="list.ts"
[file]{list}-[region]{concat_list}
```

```dart title="list.dart"
[file]{list}-[region]{concat_list}
```

```rust title="list.rs"
[file]{list}-[region]{concat_list}
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
[file]{list}-[region]{concat_list}
```

```ruby title="list.rb"
[file]{list}-[region]{concat_list}
```

<!-- [tutor]{concat_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E4%BA%8C%E3%81%A4%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E9%80%A3%E7%B5%90%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%20nums1%20%E3%82%92%20nums%20%E3%81%AE%E5%BE%8C%E3%82%8D%E3%81%AB%E9%80%A3%E7%B5%90&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{sort_list} -->
```python title="list.py"
[file]{list}-[region]{sort_list}
```

```cpp title="list.cpp"
[file]{list}-[region]{sort_list}
```

```java title="list.java"
[file]{list}-[region]{sort_list}
```

```csharp title="list.cs"
[file]{list}-[region]{sort_list}
```

```go title="list_test.go"
[file]{list_test}-[region]{sort_list}
```

```swift title="list.swift"
[file]{list}-[region]{sort_list}
```

```javascript title="list.js"
[file]{list}-[region]{sort_list}
```

```typescript title="list.ts"
[file]{list}-[region]{sort_list}
```

```dart title="list.dart"
[file]{list}-[region]{sort_list}
```

```rust title="list.rs"
[file]{list}-[region]{sort_list}
```

```c title="list.c"
// C には組み込みの動的配列がない
```

```kotlin title="list.kt"
[file]{list}-[region]{sort_list}
```

```ruby title="list.rb"
[file]{list}-[region]{sort_list}
```

<!-- [tutor]{sort_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E3%82%BD%E3%83%BC%E3%83%88%0A%20%20%20%20nums.sort()%20%20%23%20%E3%82%BD%E3%83%BC%E3%83%88%E5%BE%8C%E3%81%AF%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E8%A6%81%E7%B4%A0%E3%81%8C%E6%98%87%E9%A0%86%E3%81%AB%E4%B8%A6%E3%81%B6&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
