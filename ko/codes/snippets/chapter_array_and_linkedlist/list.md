<!-- [snippet]{init_list} -->
```python title="list.py"
# 리스트 초기화
# 초깃값 없음
nums1: list[int] = []
# 초깃값 지정
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="list.cpp"
/* 리스트 초기화 */
// C++의 vector가 이 글에서 설명하는 nums에 해당한다
// 초깃값 없음
vector<int> nums1;
// 초깃값 지정
vector<int> nums = { 1, 3, 2, 5, 4 };
```

```java title="list.java"
/* 리스트 초기화 */
// 초깃값 없음
List<Integer> nums1 = new ArrayList<>();
// 초깃값 지정(배열은 int[]의 래퍼형인 Integer[]여야 함)
Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
```

```csharp title="list.cs"
/* 리스트 초기화 */
// 초깃값 없음
List<int> nums1 = [];
// 초깃값 지정
int[] numbers = [1, 3, 2, 5, 4];
List<int> nums = [.. numbers];
```

```go title="list_test.go"
/* 리스트 초기화 */
// 초깃값 없음
nums1 := []int{}
// 초깃값 지정
nums := []int{1, 3, 2, 5, 4}
```

```swift title="list.swift"
/* 리스트 초기화 */
// 초깃값 없음
let nums1: [Int] = []
// 초깃값 지정
var nums = [1, 3, 2, 5, 4]
```

```javascript title="list.js"
/* 리스트 초기화 */
// 초깃값 없음
const nums1 = [];
// 초깃값 지정
const nums = [1, 3, 2, 5, 4];
```

```typescript title="list.ts"
/* 리스트 초기화 */
// 초깃값 없음
const nums1: number[] = [];
// 초깃값 지정
const nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="list.dart"
/* 리스트 초기화 */
// 초깃값 없음
List<int> nums1 = [];
// 초깃값 지정
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="list.rs"
/* 리스트 초기화 */
// 초깃값 없음
let nums1: Vec<i32> = Vec::new();
// 초깃값 지정
let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="list.c"
// C는 내장 동적 배열을 제공하지 않는다
```

```kotlin title="list.kt"
/* 리스트 초기화 */
// 초깃값 없음
var nums1 = listOf<Int>()
// 초깃값 지정
var numbers = arrayOf(1, 3, 2, 5, 4)
var nums = numbers.toMutableList()
```

```ruby title="list.rb"
# 리스트 초기화
# 초깃값 없음
nums1 = []
# 초깃값 지정
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20%EC%B4%88%EA%B9%83%EA%B0%92%20%EC%97%86%EC%9D%8C%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20%EC%B4%88%EA%B9%83%EA%B0%92%20%EC%A7%80%EC%A0%95%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C는 내장 동적 배열을 제공하지 않는다
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
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%201%EC%9D%98%20%EC%9B%90%EC%86%8C%EC%97%90%20%EC%A0%91%EA%B7%BC%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B0%B1%EC%8B%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%201%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%200%EC%9C%BC%EB%A1%9C%20%EA%B0%B1%EC%8B%A0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C는 내장 동적 배열을 제공하지 않는다
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
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B4%88%EA%B9%83%EA%B0%92%20%EC%A7%80%EC%A0%95%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%B9%84%EC%9A%B0%EA%B8%B0%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%81%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%B6%94%EA%B0%80%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%A4%91%EA%B0%84%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%203%EC%97%90%20%EC%88%AB%EC%9E%90%206%20%EC%82%BD%EC%9E%85%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%203%EC%9D%98%20%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C는 내장 동적 배열을 제공하지 않는다
```

```kotlin title="list.kt"
[file]{list}-[region]{iterate_list}
```

```ruby title="list.rb"
[file]{list}-[region]{iterate_list}
```

<!-- [tutor]{iterate_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A1%9C%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%A7%81%EC%A0%91%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C는 내장 동적 배열을 제공하지 않는다
```

```kotlin title="list.kt"
[file]{list}-[region]{concat_list}
```

```ruby title="list.rb"
[file]{list}-[region]{concat_list}
```

<!-- [tutor]{concat_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%91%90%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%97%B0%EA%B2%B0%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20nums1%EC%9D%84%20nums%20%EB%92%A4%EC%97%90%20%EC%97%B0%EA%B2%B0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C는 내장 동적 배열을 제공하지 않는다
```

```kotlin title="list.kt"
[file]{list}-[region]{sort_list}
```

```ruby title="list.rb"
[file]{list}-[region]{sort_list}
```

<!-- [tutor]{sort_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20nums.sort%28%29%20%20%23%20%EC%A0%95%EB%A0%AC%20%ED%9B%84%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EC%98%A4%EB%A6%84%EC%B0%A8%EC%88%9C%EC%9C%BC%EB%A1%9C%20%EB%B0%B0%EC%B9%98%EB%90%A8&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
