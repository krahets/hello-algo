<!-- [snippet]{stack_operations} -->
```python title="stack.py"
# 스택 초기화
# Python에는 내장 스택 클래스가 없으므로 list를 스택으로 사용할 수 있다
stack: list[int] = []

# 스택에 원소 삽입
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

# 스택 맨 위 원소에 접근
peek: int = stack[-1]

# 스택에서 원소 꺼내기
pop: int = stack.pop()

# 스택 길이 구하기
size: int = len(stack)

# 비어 있는지 확인
is_empty: bool = len(stack) == 0
```

```cpp title="stack.cpp"
/* 스택 초기화 */
stack<int> stack;

/* 스택에 원소 삽입 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 스택 맨 위 원소에 접근 */
int top = stack.top();

/* 스택에서 원소 꺼내기 */
stack.pop(); // 반환값 없음

/* 스택 길이 구하기 */
int size = stack.size();

/* 비어 있는지 확인 */
bool empty = stack.empty();
```

```java title="stack.java"
/* 스택 초기화 */
Stack<Integer> stack = new Stack<>();

/* 스택에 원소 삽입 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 스택 맨 위 원소에 접근 */
int peek = stack.peek();

/* 스택에서 원소 꺼내기 */
int pop = stack.pop();

/* 스택 길이 구하기 */
int size = stack.size();

/* 비어 있는지 확인 */
boolean isEmpty = stack.isEmpty();
```

```csharp title="stack.cs"
/* 스택 초기화 */
Stack<int> stack = new();

/* 스택에 원소 삽입 */
stack.Push(1);
stack.Push(3);
stack.Push(2);
stack.Push(5);
stack.Push(4);

/* 스택 맨 위 원소에 접근 */
int peek = stack.Peek();

/* 스택에서 원소 꺼내기 */
int pop = stack.Pop();

/* 스택 길이 구하기 */
int size = stack.Count;

/* 비어 있는지 확인 */
bool isEmpty = stack.Count == 0;
```

```go title="stack_test.go"
/* 스택 초기화 */
// Go에서는 Slice를 스택으로 사용하는 것을 권한다
var stack []int

/* 스택에 원소 삽입 */
stack = append(stack, 1)
stack = append(stack, 3)
stack = append(stack, 2)
stack = append(stack, 5)
stack = append(stack, 4)

/* 스택 맨 위 원소에 접근 */
peek := stack[len(stack)-1]

/* 스택에서 원소 꺼내기 */
pop := stack[len(stack)-1]
stack = stack[:len(stack)-1]

/* 스택 길이 구하기 */
size := len(stack)

/* 비어 있는지 확인 */
isEmpty := len(stack) == 0
```

```swift title="stack.swift"
/* 스택 초기화 */
// Swift에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
var stack: [Int] = []

/* 스택에 원소 삽입 */
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

/* 스택 맨 위 원소에 접근 */
let peek = stack.last!

/* 스택에서 원소 꺼내기 */
let pop = stack.removeLast()

/* 스택 길이 구하기 */
let size = stack.count

/* 비어 있는지 확인 */
let isEmpty = stack.isEmpty
```

```javascript title="stack.js"
/* 스택 초기화 */
// JavaScript에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
const stack = [];

/* 스택에 원소 삽입 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 스택 맨 위 원소에 접근 */
const peek = stack[stack.length-1];

/* 스택에서 원소 꺼내기 */
const pop = stack.pop();

/* 스택 길이 구하기 */
const size = stack.length;

/* 비어 있는지 확인 */
const is_empty = stack.length === 0;
```

```typescript title="stack.ts"
/* 스택 초기화 */
// TypeScript에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
const stack: number[] = [];

/* 스택에 원소 삽입 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 스택 맨 위 원소에 접근 */
const peek = stack[stack.length - 1];

/* 스택에서 원소 꺼내기 */
const pop = stack.pop();

/* 스택 길이 구하기 */
const size = stack.length;

/* 비어 있는지 확인 */
const is_empty = stack.length === 0;
```

```dart title="stack.dart"
/* 스택 초기화 */
// Dart에는 내장 스택 클래스가 없으므로 List를 스택으로 사용할 수 있다
List<int> stack = [];

/* 스택에 원소 삽입 */
stack.add(1);
stack.add(3);
stack.add(2);
stack.add(5);
stack.add(4);

/* 스택 맨 위 원소에 접근 */
int peek = stack.last;

/* 스택에서 원소 꺼내기 */
int pop = stack.removeLast();

/* 스택 길이 구하기 */
int size = stack.length;

/* 비어 있는지 확인 */
bool isEmpty = stack.isEmpty;
```

```rust title="stack.rs"
/* 스택 초기화 */
// Vec를 스택으로 사용
let mut stack: Vec<i32> = Vec::new();

/* 스택에 원소 삽입 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 스택 맨 위 원소에 접근 */
let top = stack.last().unwrap();

/* 스택에서 원소 꺼내기 */
let pop = stack.pop().unwrap();

/* 스택 길이 구하기 */
let size = stack.len();

/* 비어 있는지 확인 */
let is_empty = stack.is_empty();
```

```c title="stack.c"
// C는 내장 스택을 제공하지 않는다
```

```kotlin title="stack.kt"
/* 스택 초기화 */
val stack = Stack<Int>()

/* 스택에 원소 삽입 */
stack.push(1)
stack.push(3)
stack.push(2)
stack.push(5)
stack.push(4)

/* 스택 맨 위 원소에 접근 */
val peek = stack.peek()

/* 스택에서 원소 꺼내기 */
val pop = stack.pop()

/* 스택 길이 구하기 */
val size = stack.size

/* 비어 있는지 확인 */
val isEmpty = stack.isEmpty()
```

```ruby title="stack.rb"
# 스택 초기화
# Ruby에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
stack = []

# 스택에 원소 삽입
stack << 1
stack << 3
stack << 2
stack << 5
stack << 4

# 스택 맨 위 원소에 접근
peek = stack.last

# 스택에서 원소 꺼내기
pop = stack.pop

# 스택 길이 구하기
size = stack.length

# 비어 있는지 확인
is_empty = stack.empty?
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20Python%EC%97%90%EB%8A%94%20%EB%82%B4%EC%9E%A5%20%EC%8A%A4%ED%83%9D%20%ED%81%B4%EB%9E%98%EC%8A%A4%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20list%EB%A5%BC%20%EC%8A%A4%ED%83%9D%EC%9C%BC%EB%A1%9C%20%EC%82%AC%EC%9A%A9%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%EC%97%90%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
