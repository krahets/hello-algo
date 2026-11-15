<!-- [snippet]{init_list} -->
```python title="list.py"
# Initialize lists
# Without initial values
nums1: list[int] = []
# With initial values
nums: list[int] = [1, 3, 2, 5, 4]
```

```cpp title="list.cpp"
/* Initialize lists */
// In C++, vector is the list type used for nums here
// Without initial values
vector<int> nums1;
// With initial values
vector<int> nums = { 1, 3, 2, 5, 4 };
```

```java title="list.java"
/* Initialize lists */
// Without initial values
List<Integer> nums1 = new ArrayList<>();
// With initial values (use Integer[], the boxed counterpart of int[])
Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
```

```csharp title="list.cs"
/* Initialize lists */
// Without initial values
List<int> nums1 = [];
// With initial values
int[] numbers = [1, 3, 2, 5, 4];
List<int> nums = [.. numbers];
```

```go title="list_test.go"
/* Initialize lists */
// Without initial values
nums1 := []int{}
// With initial values
nums := []int{1, 3, 2, 5, 4}
```

```swift title="list.swift"
/* Initialize lists */
// Without initial values
let nums1: [Int] = []
// With initial values
var nums = [1, 3, 2, 5, 4]
```

```javascript title="list.js"
/* Initialize lists */
// Without initial values
const nums1 = [];
// With initial values
const nums = [1, 3, 2, 5, 4];
```

```typescript title="list.ts"
/* Initialize lists */
// Without initial values
const nums1: number[] = [];
// With initial values
const nums: number[] = [1, 3, 2, 5, 4];
```

```dart title="list.dart"
/* Initialize lists */
// Without initial values
List<int> nums1 = [];
// With initial values
List<int> nums = [1, 3, 2, 5, 4];
```

```rust title="list.rs"
/* Initialize lists */
// Without initial values
let nums1: Vec<i32> = Vec::new();
// With initial values
let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
```

```c title="list.c"
// C does not provide a built-in dynamic array
```

```kotlin title="list.kt"
/* Initialize lists */
// Without initial values
var nums1 = listOf<Int>()
// With initial values
var numbers = arrayOf(1, 3, 2, 5, 4)
var nums = numbers.toMutableList()
```

```ruby title="list.rb"
# Initialize lists
# Without initial values
nums1 = []
# With initial values
nums = [1, 3, 2, 5, 4]
```

<!-- [tutor]{init_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20%23%20Without%20initial%20values%0A%20%20%20%20nums1%20%3D%20%5B%5D%0A%20%20%20%20%23%20With%20initial%20values%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C does not provide a built-in dynamic array
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
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20Access%20an%20element%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20Access%20the%20element%20at%20index%201%0A%0A%20%20%20%20%23%20Update%20an%20element%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20Set%20the%20element%20at%20index%201%20to%200&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C does not provide a built-in dynamic array
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
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20With%20initial%20values%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Clear%20the%20list%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20Append%20elements%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20Insert%20an%20element%20in%20the%20middle%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20Insert%206%20at%20index%203%0A%20%20%20%20%0A%20%20%20%20%23%20Remove%20an%20element%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20Remove%20the%20element%20at%20index%203&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C does not provide a built-in dynamic array
```

```kotlin title="list.kt"
[file]{list}-[region]{iterate_list}
```

```ruby title="list.rb"
[file]{list}-[region]{iterate_list}
```

<!-- [tutor]{iterate_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Traverse%20the%20list%20by%20index%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20Traverse%20list%20elements%20directly%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C does not provide a built-in dynamic array
```

```kotlin title="list.kt"
[file]{list}-[region]{concat_list}
```

```ruby title="list.rb"
[file]{list}-[region]{concat_list}
```

<!-- [tutor]{concat_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Concatenate%20two%20lists%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20Append%20nums1%20to%20nums&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

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
// C does not provide a built-in dynamic array
```

```kotlin title="list.kt"
[file]{list}-[region]{sort_list}
```

```ruby title="list.rb"
[file]{list}-[region]{sort_list}
```

<!-- [tutor]{sort_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Sort%20the%20list%0A%20%20%20%20nums.sort%28%29%20%20%23%20After%20sorting%2C%20elements%20are%20in%20ascending%20order&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
