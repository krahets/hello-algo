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
# 원소 접근
num: int = nums[1]  # 인덱스 1의 원소에 접근

# 원소 갱신
nums[1] = 0    # 인덱스 1의 원소를 0으로 갱신
```

```cpp title="list.cpp"
/* 원소 접근 */
int num = nums[1];  // 인덱스 1의 원소에 접근

/* 원소 갱신 */
nums[1] = 0;  // 인덱스 1의 원소를 0으로 갱신
```

```java title="list.java"
/* 원소 접근 */
int num = nums.get(1);  // 인덱스 1의 원소에 접근

/* 원소 갱신 */
nums.set(1, 0);  // 인덱스 1의 원소를 0으로 갱신
```

```csharp title="list.cs"
/* 원소 접근 */
int num = nums[1];  // 인덱스 1의 원소에 접근

/* 원소 갱신 */
nums[1] = 0;  // 인덱스 1의 원소를 0으로 갱신
```

```go title="list_test.go"
/* 원소 접근 */
num := nums[1]  // 인덱스 1의 원소에 접근

/* 원소 갱신 */
nums[1] = 0     // 인덱스 1의 원소를 0으로 갱신
```

```swift title="list.swift"
/* 원소 접근 */
let num = nums[1] // 인덱스 1의 원소에 접근

/* 원소 갱신 */
nums[1] = 0 // 인덱스 1의 원소를 0으로 갱신
```

```javascript title="list.js"
/* 원소 접근 */
const num = nums[1];  // 인덱스 1의 원소에 접근

/* 원소 갱신 */
nums[1] = 0;  // 인덱스 1의 원소를 0으로 갱신
```

```typescript title="list.ts"
/* 원소 접근 */
const num: number = nums[1];  // 인덱스 1의 원소에 접근

/* 원소 갱신 */
nums[1] = 0;  // 인덱스 1의 원소를 0으로 갱신
```

```dart title="list.dart"
/* 원소 접근 */
int num = nums[1];  // 인덱스 1의 원소에 접근

/* 원소 갱신 */
nums[1] = 0;  // 인덱스 1의 원소를 0으로 갱신
```

```rust title="list.rs"
/* 원소 접근 */
let num: i32 = nums[1];  // 인덱스 1의 원소에 접근
/* 원소 갱신 */
nums[1] = 0;             // 인덱스 1의 원소를 0으로 갱신
```

```c title="list.c"
// C는 내장 동적 배열을 제공하지 않는다
```

```kotlin title="list.kt"
/* 원소 접근 */
val num = nums[1]       // 인덱스 1의 원소에 접근
/* 원소 갱신 */
nums[1] = 0             // 인덱스 1의 원소를 0으로 갱신
```

```ruby title="list.rb"
# 원소 접근
num = nums[1] # 인덱스 1의 원소에 접근
# 원소 갱신
nums[1] = 0 # 인덱스 1의 원소를 0으로 갱신
```

<!-- [tutor]{access_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20num%20%3D%20nums%5B1%5D%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%201%EC%9D%98%20%EC%9B%90%EC%86%8C%EC%97%90%20%EC%A0%91%EA%B7%BC%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EA%B0%B1%EC%8B%A0%0A%20%20%20%20nums%5B1%5D%20%3D%200%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%201%EC%9D%98%20%EC%9B%90%EC%86%8C%EB%A5%BC%200%EC%9C%BC%EB%A1%9C%20%EA%B0%B1%EC%8B%A0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{insert_remove_element} -->
```python title="list.py"
# 리스트 비우기
nums.clear()

# 끝에 원소 추가
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

# 중간에 원소 삽입
nums.insert(3, 6)  # 인덱스 3에 숫자 6 삽입

# 원소 삭제
nums.pop(3)        # 인덱스 3의 원소 삭제
```

```cpp title="list.cpp"
/* 리스트 비우기 */
nums.clear();

/* 끝에 원소 추가 */
nums.push_back(1);
nums.push_back(3);
nums.push_back(2);
nums.push_back(5);
nums.push_back(4);

/* 중간에 원소 삽입 */
nums.insert(nums.begin() + 3, 6);  // 인덱스 3에 숫자 6 삽입

/* 원소 삭제 */
nums.erase(nums.begin() + 3);      // 인덱스 3의 원소 삭제
```

```java title="list.java"
/* 리스트 비우기 */
nums.clear();

/* 끝에 원소 추가 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* 중간에 원소 삽입 */
nums.add(3, 6);  // 인덱스 3에 숫자 6 삽입

/* 원소 삭제 */
nums.remove(3);  // 인덱스 3의 원소 삭제
```

```csharp title="list.cs"
/* 리스트 비우기 */
nums.Clear();

/* 끝에 원소 추가 */
nums.Add(1);
nums.Add(3);
nums.Add(2);
nums.Add(5);
nums.Add(4);

/* 중간에 원소 삽입 */
nums.Insert(3, 6);  // 인덱스 3에 숫자 6 삽입

/* 원소 삭제 */
nums.RemoveAt(3);  // 인덱스 3의 원소 삭제
```

```go title="list_test.go"
/* 리스트 비우기 */
nums = nil

/* 끝에 원소 추가 */
nums = append(nums, 1)
nums = append(nums, 3)
nums = append(nums, 2)
nums = append(nums, 5)
nums = append(nums, 4)

/* 중간에 원소 삽입 */
nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 인덱스 3에 숫자 6 삽입

/* 원소 삭제 */
nums = append(nums[:3], nums[4:]...) // 인덱스 3의 원소 삭제
```

```swift title="list.swift"
/* 리스트 비우기 */
nums.removeAll()

/* 끝에 원소 추가 */
nums.append(1)
nums.append(3)
nums.append(2)
nums.append(5)
nums.append(4)

/* 중간에 원소 삽입 */
nums.insert(6, at: 3) // 인덱스 3에 숫자 6 삽입

/* 원소 삭제 */
nums.remove(at: 3) // 인덱스 3의 원소 삭제
```

```javascript title="list.js"
/* 리스트 비우기 */
nums.length = 0;

/* 끝에 원소 추가 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* 중간에 원소 삽입 */
nums.splice(3, 0, 6); // 인덱스 3에 숫자 6 삽입

/* 원소 삭제 */
nums.splice(3, 1);  // 인덱스 3의 원소 삭제
```

```typescript title="list.ts"
/* 리스트 비우기 */
nums.length = 0;

/* 끝에 원소 추가 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* 중간에 원소 삽입 */
nums.splice(3, 0, 6); // 인덱스 3에 숫자 6 삽입

/* 원소 삭제 */
nums.splice(3, 1);  // 인덱스 3의 원소 삭제
```

```dart title="list.dart"
/* 리스트 비우기 */
nums.clear();

/* 끝에 원소 추가 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* 중간에 원소 삽입 */
nums.insert(3, 6); // 인덱스 3에 숫자 6 삽입

/* 원소 삭제 */
nums.removeAt(3); // 인덱스 3의 원소 삭제
```

```rust title="list.rs"
/* 리스트 비우기 */
nums.clear();

/* 끝에 원소 추가 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);

/* 중간에 원소 삽입 */
nums.insert(3, 6);  // 인덱스 3에 숫자 6 삽입

/* 원소 삭제 */
nums.remove(3);    // 인덱스 3의 원소 삭제
```

```c title="list.c"
// C는 내장 동적 배열을 제공하지 않는다
```

```kotlin title="list.kt"
/* 리스트 비우기 */
nums.clear();

/* 끝에 원소 추가 */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);

/* 중간에 원소 삽입 */
nums.add(3, 6);    // 인덱스 3에 숫자 6 삽입

/* 원소 삭제 */
nums.removeAt(3);  // 인덱스 3의 원소 삭제
```

```ruby title="list.rb"
# 리스트 비우기
nums.clear

# 끝에 원소 추가
nums << 1
nums << 3
nums << 2
nums << 5
nums << 4

# 중간에 원소 삽입
nums.insert(3, 6) # 인덱스 3에 숫자 6 삽입

# 원소 삭제
nums.delete_at(3) # 인덱스 3의 원소 삭제
```

<!-- [tutor]{insert_remove_element_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B4%88%EA%B9%83%EA%B0%92%20%EC%A7%80%EC%A0%95%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%B9%84%EC%9A%B0%EA%B8%B0%0A%20%20%20%20nums.clear%28%29%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%81%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%B6%94%EA%B0%80%0A%20%20%20%20nums.append%281%29%0A%20%20%20%20nums.append%283%29%0A%20%20%20%20nums.append%282%29%0A%20%20%20%20nums.append%285%29%0A%20%20%20%20nums.append%284%29%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%A4%91%EA%B0%84%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20nums.insert%283%2C%206%29%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%203%EC%97%90%20%EC%88%AB%EC%9E%90%206%20%EC%82%BD%EC%9E%85%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20nums.pop%283%29%20%20%20%20%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%203%EC%9D%98%20%EC%9B%90%EC%86%8C%20%EC%82%AD%EC%A0%9C&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{iterate_list} -->
```python title="list.py"
# 인덱스로 리스트 순회
count = 0
for i in range(len(nums)):
    count += nums[i]

# 리스트 원소를 직접 순회
for num in nums:
    count += num
```

```cpp title="list.cpp"
/* 인덱스로 리스트 순회 */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums[i];
}

/* 리스트 원소를 직접 순회 */
count = 0;
for (int num : nums) {
    count += num;
}
```

```java title="list.java"
/* 인덱스로 리스트 순회 */
int count = 0;
for (int i = 0; i < nums.size(); i++) {
    count += nums.get(i);
}

/* 리스트 원소를 직접 순회 */
for (int num : nums) {
    count += num;
}
```

```csharp title="list.cs"
/* 인덱스로 리스트 순회 */
int count = 0;
for (int i = 0; i < nums.Count; i++) {
    count += nums[i];
}

/* 리스트 원소를 직접 순회 */
count = 0;
foreach (int num in nums) {
    count += num;
}
```

```go title="list_test.go"
/* 인덱스로 리스트 순회 */
count := 0
for i := 0; i < len(nums); i++ {
    count += nums[i]
}

/* 리스트 원소를 직접 순회 */
count = 0
for _, num := range nums {
    count += num
}
```

```swift title="list.swift"
/* 인덱스로 리스트 순회 */
var count = 0
for i in nums.indices {
    count += nums[i]
}

/* 리스트 원소를 직접 순회 */
count = 0
for num in nums {
    count += num
}
```

```javascript title="list.js"
/* 인덱스로 리스트 순회 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* 리스트 원소를 직접 순회 */
count = 0;
for (const num of nums) {
    count += num;
}
```

```typescript title="list.ts"
/* 인덱스로 리스트 순회 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* 리스트 원소를 직접 순회 */
count = 0;
for (const num of nums) {
    count += num;
}
```

```dart title="list.dart"
/* 인덱스로 리스트 순회 */
int count = 0;
for (var i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* 리스트 원소를 직접 순회 */
count = 0;
for (var num in nums) {
    count += num;
}
```

```rust title="list.rs"
// 인덱스로 리스트 순회
let mut _count = 0;
for i in 0..nums.len() {
    _count += nums[i];
}

// 리스트 원소를 직접 순회
_count = 0;
for num in &nums {
    _count += num;
}
```

```c title="list.c"
// C는 내장 동적 배열을 제공하지 않는다
```

```kotlin title="list.kt"
/* 인덱스로 리스트 순회 */
var count = 0
for (i in nums.indices) {
    count += nums[i]
}

/* 리스트 원소를 직접 순회 */
for (num in nums) {
    count += num
}
```

```ruby title="list.rb"
# 인덱스로 리스트 순회
count = 0
for i in 0...nums.length
    count += nums[i]
end

# 리스트 원소를 직접 순회
count = 0
for num in nums
    count += num
end
```

<!-- [tutor]{iterate_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EB%A1%9C%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20count%20%3D%200%0A%20%20%20%20for%20i%20in%20range%28len%28nums%29%29%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20nums%5Bi%5D%0A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EB%A5%BC%20%EC%A7%81%EC%A0%91%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20count%20%2B%3D%20num&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{concat_list} -->
```python title="list.py"
# 두 리스트 연결
nums1: list[int] = [6, 8, 7, 10, 9]
nums += nums1  # 리스트 nums1을 nums 뒤에 연결
```

```cpp title="list.cpp"
/* 두 리스트 연결 */
vector<int> nums1 = { 6, 8, 7, 10, 9 };
// 리스트 nums1을 nums 뒤에 연결
nums.insert(nums.end(), nums1.begin(), nums1.end());
```

```java title="list.java"
/* 두 리스트 연결 */
List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
nums.addAll(nums1);  // 리스트 nums1을 nums 뒤에 연결
```

```csharp title="list.cs"
/* 두 리스트 연결 */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.AddRange(nums1);  // 리스트 nums1을 nums 뒤에 연결
```

```go title="list_test.go"
/* 두 리스트 연결 */
nums1 := []int{6, 8, 7, 10, 9}
nums = append(nums, nums1...)  // 리스트 nums1을 nums 뒤에 연결
```

```swift title="list.swift"
/* 두 리스트 연결 */
let nums1 = [6, 8, 7, 10, 9]
nums.append(contentsOf: nums1) // 리스트 nums1을 nums 뒤에 연결
```

```javascript title="list.js"
/* 두 리스트 연결 */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);  // 리스트 nums1을 nums 뒤에 연결
```

```typescript title="list.ts"
/* 두 리스트 연결 */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1);  // 리스트 nums1을 nums 뒤에 연결
```

```dart title="list.dart"
/* 두 리스트 연결 */
List<int> nums1 = [6, 8, 7, 10, 9];
nums.addAll(nums1);  // 리스트 nums1을 nums 뒤에 연결
```

```rust title="list.rs"
/* 두 리스트 연결 */
let nums1: Vec<i32> = vec![6, 8, 7, 10, 9];
nums.extend(nums1);
```

```c title="list.c"
// C는 내장 동적 배열을 제공하지 않는다
```

```kotlin title="list.kt"
/* 두 리스트 연결 */
val nums1 = intArrayOf(6, 8, 7, 10, 9).toMutableList()
nums.addAll(nums1)  // 리스트 nums1을 nums 뒤에 연결
```

```ruby title="list.rb"
# 두 리스트 연결
nums1 = [6, 8, 7, 10, 9]
nums += nums1
```

<!-- [tutor]{concat_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%91%90%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%97%B0%EA%B2%B0%0A%20%20%20%20nums1%20%3D%20%5B6%2C%208%2C%207%2C%2010%2C%209%5D%0A%20%20%20%20nums%20%2B%3D%20nums1%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20nums1%EC%9D%84%20nums%20%EB%92%A4%EC%97%90%20%EC%97%B0%EA%B2%B0&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

<!-- [snippet]{sort_list} -->
```python title="list.py"
# 리스트 정렬
nums.sort()  # 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```cpp title="list.cpp"
/* 리스트 정렬 */
sort(nums.begin(), nums.end());  // 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```java title="list.java"
/* 리스트 정렬 */
Collections.sort(nums);  // 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```csharp title="list.cs"
/* 리스트 정렬 */
nums.Sort(); // 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```go title="list_test.go"
/* 리스트 정렬 */
sort.Ints(nums)  // 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```swift title="list.swift"
/* 리스트 정렬 */
nums.sort() // 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```javascript title="list.js"
/* 리스트 정렬 */
nums.sort((a, b) => a - b);  // 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```typescript title="list.ts"
/* 리스트 정렬 */
nums.sort((a, b) => a - b);  // 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```dart title="list.dart"
/* 리스트 정렬 */
nums.sort(); // 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```rust title="list.rs"
/* 리스트 정렬 */
nums.sort(); // 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```c title="list.c"
// C는 내장 동적 배열을 제공하지 않는다
```

```kotlin title="list.kt"
/* 리스트 정렬 */
nums.sort() // 정렬 후 리스트 원소가 오름차순으로 배치됨
```

```ruby title="list.rb"
# 리스트 정렬
nums = nums.sort { |a, b| a <=> b } # 정렬 후 리스트 원소가 오름차순으로 배치됨
```

<!-- [tutor]{sort_list_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20nums%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%A0%95%EB%A0%AC%0A%20%20%20%20nums.sort%28%29%20%20%23%20%EC%A0%95%EB%A0%AC%20%ED%9B%84%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%9B%90%EC%86%8C%EA%B0%80%20%EC%98%A4%EB%A6%84%EC%B0%A8%EC%88%9C%EC%9C%BC%EB%A1%9C%20%EB%B0%B0%EC%B9%98%EB%90%A8&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
