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
# Access an element
num: int = nums[1]  # Access the element at index 1

# Update an element
nums[1] = 0    # Set the element at index 1 to 0
```

```cpp title="list.cpp"
/* Access an element */
int num = nums[1];  // Access the element at index 1

/* Update an element */
nums[1] = 0;  // Set the element at index 1 to 0
```

```java title="list.java"
/* Access an element */
int num = nums.get(1);  // Access the element at index 1

/* Update an element */
nums.set(1, 0);  // Set the element at index 1 to 0
```

```csharp title="list.cs"
/* Access an element */
int num = nums[1];  // Access the element at index 1

/* Update an element */
nums[1] = 0;  // Set the element at index 1 to 0
```

```go title="list_test.go"
/* Access an element */
num := nums[1]  // Access the element at index 1

/* Update an element */
nums[1] = 0     // Set the element at index 1 to 0
```

```swift title="list.swift"
/* Access an element */
let num = nums[1] // Access the element at index 1

/* Update an element */
nums[1] = 0 // Set the element at index 1 to 0
```

```javascript title="list.js"
/* Access an element */
const num = nums[1];  // Access the element at index 1

/* Update an element */
nums[1] = 0;  // Set the element at index 1 to 0
```

```typescript title="list.ts"
/* Access an element */
const num: number = nums[1];  // Access the element at index 1

/* Update an element */
nums[1] = 0;  // Set the element at index 1 to 0
```

```dart title="list.dart"
/* Access an element */
int num = nums[1];  // Access the element at index 1

/* Update an element */
nums[1] = 0;  // Set the element at index 1 to 0
```

```rust title="list.rs"
/* Access an element */
let num: i32 = nums[1];  // Access the element at index 1
/* Update an element */
nums[1] = 0;             // Set the element at index 1 to 0
```

```c title="list.c"
// C does not provide a built-in dynamic array
```

```kotlin title="list.kt"
/* Access an element */
val num = nums[1]       // Access the element at index 1
/* Update an element */
nums[1] = 0             // Set the element at index 1 to 0
```

```ruby title="list.rb"
# Access an element
num = nums[1] # Access the element at index 1
# Update an element
nums[1] = 0 # Set the element at index 1 to 0
```

<!-- [tutor]{access_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20Access%20an%20element%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20Access%20the%20element%20at%20index%201%0A%0A%20%20%20%20%23%20Update%20an%20element%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20Set%20the%20element%20at%20index%201%20to%200&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_element} -->
```python title="list.py"
# Clear the list
nums.clear()

# Append elements
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

# Insert an element in the middle
nums.insert(3, 6)  # Insert 6 at index 3

# Remove an element
nums.pop(3)        # Remove the element at index 3
```

```cpp title="list.cpp"
/* Clear the list */
nums.clear();

/* Append elements */
nums.push_back(1);
nums.push_back(3);
nums.push_back(2);
nums.push_back(5);
nums.push_back(4);

/* Insert an element in the middle */
nums.insert(nums.begin() + 3, 6);  // Insert 6 at index 3

/* Remove an element */
nums.erase(nums.begin() + 3);      // Remove the element at index 3
```

```java title="list.java"
/* Clear the list */
nums.clear();

/* Append elements */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* Insert an element in the middle */
nums.add(3, 6);  // Insert 6 at index 3

/* Remove an element */
nums.remove(3);  // Remove the element at index 3
```

```csharp title="list.cs"
/* Clear the list */
nums.Clear();

/* Append elements */
nums.Add(1);
nums.Add(3);
nums.Add(2);
nums.Add(5);
nums.Add(4);

/* Insert an element in the middle */
nums.Insert(3, 6);  // Insert 6 at index 3

/* Remove an element */
nums.RemoveAt(3);  // Remove the element at index 3
```

```go title="list_test.go"
/* Clear the list */
nums = nil

/* Append elements */
nums = append(nums, 1)
nums = append(nums, 3)
nums = append(nums, 2)
nums = append(nums, 5)
nums = append(nums, 4)

/* Insert an element in the middle */
nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Insert 6 at index 3

/* Remove an element */
nums = append(nums[:3], nums[4:]...) // Remove the element at index 3
```

```swift title="list.swift"
/* Clear the list */
nums.removeAll()

/* Append elements */
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

/* Insert an element in the middle */
nums.insert(6, at: 3) // Insert 6 at index 3

/* Remove an element */
nums.remove(at: 3) // Remove the element at index 3
```

```javascript title="list.js"
/* Clear the list */
nums.length = 0;

/* Append elements */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* Insert an element in the middle */
nums.splice(3, 0, 6); // Insert 6 at index 3

/* Remove an element */
nums.splice(3, 1);  // Remove the element at index 3
```

```typescript title="list.ts"
/* Clear the list */
nums.length = 0;

/* Append elements */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* Insert an element in the middle */
nums.splice(3, 0, 6); // Insert 6 at index 3

/* Remove an element */
nums.splice(3, 1);  // Remove the element at index 3
```

```dart title="list.dart"
/* Clear the list */
nums.clear();

/* Append elements */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* Insert an element in the middle */
nums.insert(3, 6); // Insert 6 at index 3

/* Remove an element */
nums.removeAt(3); // Remove the element at index 3
```

```rust title="list.rs"
/* Clear the list */
nums.clear();

/* Append elements */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* Insert an element in the middle */
nums.insert(3, 6);  // Insert 6 at index 3

/* Remove an element */
nums.remove(3);    // Remove the element at index 3
```

```c title="list.c"
// C does not provide a built-in dynamic array
```

```kotlin title="list.kt"
/* Clear the list */
nums.clear();

/* Append elements */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* Insert an element in the middle */
nums.add(3, 6);    // Insert 6 at index 3

/* Remove an element */
nums.removeAt(3);  // Remove the element at index 3
```

```ruby title="list.rb"
# Clear the list
nums.clear

# Append elements
nums << 1
nums << 3
nums << 2
nums << 5
nums << 4

# Insert an element in the middle
nums.insert(3, 6) # Insert 6 at index 3

# Remove an element
nums.delete_at(3) # Remove the element at index 3
```

<!-- [tutor]{insert_remove_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20With%20initial%20values%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Clear%20the%20list%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20Append%20elements%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20Insert%20an%20element%20in%20the%20middle%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20Insert%206%20at%20index%203%0A%20%20%20%20%0A%20%20%20%20%23%20Remove%20an%20element%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20Remove%20the%20element%20at%20index%203&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{iterate_list} -->
```python title="list.py"
# Traverse the list by index
count = 0
for i in range(len(nums)):
    count += nums[i]

# Traverse list elements directly
for num in nums:
    count += num
```

```cpp title="list.cpp"
/* Traverse the list by index */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums[i];
}

/* Traverse list elements directly */
count = 0;
for (int num : nums) {
    count += num;
}
```

```java title="list.java"
/* Traverse the list by index */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums.get(i);
}

/* Traverse list elements directly */
for (int num : nums) {
    count += num;
}
```

```csharp title="list.cs"
/* Traverse the list by index */
int count = 0;
for (int i = 0; i < nums.Count; i++) {
    count += nums[i];
}

/* Traverse list elements directly */
count = 0;
foreach (int num in nums) {
    count += num;
}
```

```go title="list_test.go"
/* Traverse the list by index */
count := 0
for i := 0; i < len(nums); i++ {
    count += nums[i]
}

/* Traverse list elements directly */
count = 0
for _, num := range nums {
    count += num
}
```

```swift title="list.swift"
/* Traverse the list by index */
var count = 0
for i in nums.indices {
    count += nums[i]
}

/* Traverse list elements directly */
count = 0
for num in nums {
    count += num
}
```

```javascript title="list.js"
/* Traverse the list by index */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* Traverse list elements directly */
count = 0;
for (const num of nums) {
    count += num;
}
```

```typescript title="list.ts"
/* Traverse the list by index */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* Traverse list elements directly */
count = 0;
for (const num of nums) {
    count += num;
}
```

```dart title="list.dart"
/* Traverse the list by index */
int count = 0;
for (var i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* Traverse list elements directly */
count = 0;
for (var num in nums) {
    count += num;
}
```

```rust title="list.rs"
// Traverse the list by index
let mut _count = 0;
for i in 0..nums.len() {
    _count += nums[i];
}

// Traverse list elements directly
_count = 0;
for num in &nums {
    _count += num;
}
```

```c title="list.c"
// C does not provide a built-in dynamic array
```

```kotlin title="list.kt"
/* Traverse the list by index */
var count = 0
for (i in nums.indices) {
    count += nums[i]
}

/* Traverse list elements directly */
for (num in nums) {
    count += num
}
```

```ruby title="list.rb"
# Traverse the list by index
count = 0
for i in 0...nums.length
    count += nums[i]
end

# Traverse list elements directly
count = 0
for num in nums
    count += num
end
```

<!-- [tutor]{iterate_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Traverse%20the%20list%20by%20index%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20Traverse%20list%20elements%20directly%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{concat_list} -->
```python title="list.py"
# Concatenate two lists
nums1: list[int] = [6, 8, 7, 10, 9]
nums += nums1  # Append nums1 to nums
```

```cpp title="list.cpp"
/* Concatenate two lists */
vector<int> nums1 = { 6, 8, 7, 10, 9 };
// Append nums1 to nums
nums.insert(nums.end(), nums1.begin(), nums1.end());
```

```java title="list.java"
/* Concatenate two lists */
List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
nums.addAll(nums1);  // Append nums1 to nums
```

```csharp title="list.cs"
/* Concatenate two lists */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.AddRange(nums1);  // Append nums1 to nums
```

```go title="list_test.go"
/* Concatenate two lists */
nums1 := []int{6, 8, 7, 10, 9}
nums = append(nums, nums1...)  // Append nums1 to nums
```

```swift title="list.swift"
/* Concatenate two lists */
let nums1 = [6, 8, 7, 10, 9]
nums.append(contentsOf: nums1) // Append nums1 to nums
```

```javascript title="list.js"
/* Concatenate two lists */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);  // Append nums1 to nums
```

```typescript title="list.ts"
/* Concatenate two lists */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1);  // Append nums1 to nums
```

```dart title="list.dart"
/* Concatenate two lists */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.addAll(nums1);  // Append nums1 to nums
```

```rust title="list.rs"
/* Concatenate two lists */
let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
nums.extend(nums1);
```

```c title="list.c"
// C does not provide a built-in dynamic array
```

```kotlin title="list.kt"
/* Concatenate two lists */
val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
nums.addAll(nums1)  // Append nums1 to nums
```

```ruby title="list.rb"
# Concatenate two lists
nums1 = [6, 8, 7, 10, 9]
nums += nums1
```

<!-- [tutor]{concat_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Concatenate%20two%20lists%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20Append%20nums1%20to%20nums&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{sort_list} -->
```python title="list.py"
# Sort the list
nums.sort()  # After sorting, elements are in ascending order
```

```cpp title="list.cpp"
/* Sort the list */
sort(nums.begin(), nums.end());  // After sorting, elements are in ascending order
```

```java title="list.java"
/* Sort the list */
Collections.sort(nums);  // After sorting, elements are in ascending order
```

```csharp title="list.cs"
/* Sort the list */
nums.Sort(); // After sorting, elements are in ascending order
```

```go title="list_test.go"
/* Sort the list */
sort.Ints(nums)  // After sorting, elements are in ascending order
```

```swift title="list.swift"
/* Sort the list */
nums.sort() // After sorting, elements are in ascending order
```

```javascript title="list.js"
/* Sort the list */
nums.sort((a, b) => a - b);  // After sorting, elements are in ascending order
```

```typescript title="list.ts"
/* Sort the list */
nums.sort((a, b) => a - b);  // After sorting, elements are in ascending order
```

```dart title="list.dart"
/* Sort the list */
nums.sort(); // After sorting, elements are in ascending order
```

```rust title="list.rs"
/* Sort the list */
nums.sort(); // After sorting, elements are in ascending order
```

```c title="list.c"
// C does not provide a built-in dynamic array
```

```kotlin title="list.kt"
/* Sort the list */
nums.sort() // After sorting, elements are in ascending order
```

```ruby title="list.rb"
# Sort the list
nums = nums.sort { |a, b| a <=> b } # After sorting, elements are in ascending order
```

<!-- [tutor]{sort_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20lists%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20Sort%20the%20list%0A%20%20%20%20nums.sort%28%29%20%20%23%20After%20sorting%2C%20elements%20are%20in%20ascending%20order&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
