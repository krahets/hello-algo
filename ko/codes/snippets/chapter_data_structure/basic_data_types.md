<!-- [snippet]{basic_type_arrays} -->
```python title=""
# 여러 기본 자료형으로 배열 초기화
numbers: list[int] = [0] * 5
decimals: list[float] = [0.0] * 5
# Python의 문자는 실제로 길이가 1인 문자열이다
characters: list[str] = ['0'] * 5
bools: list[bool] = [False] * 5
# Python의 리스트는 여러 기본 자료형과 객체 참조를 자유롭게 저장할 수 있다
data = [0, 0.0, 'a', False, ListNode(0)]
```

```cpp title=""
// 여러 기본 자료형으로 배열 초기화
int numbers[5];
float decimals[5];
char characters[5];
bool bools[5];
```

```java title=""
// 여러 기본 자료형으로 배열 초기화
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
boolean[] bools = new boolean[5];
```

```csharp title=""
// 여러 기본 자료형으로 배열 초기화
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
bool[] bools = new bool[5];
```

```go title=""
// 여러 기본 자료형으로 배열 초기화
var numbers = [5]int{}
var decimals = [5]float64{}
var characters = [5]byte{}
var bools = [5]bool{}
```

```swift title=""
// 여러 기본 자료형으로 배열 초기화
let numbers = Array(repeating: 0, count: 5)
let decimals = Array(repeating: 0.0, count: 5)
let characters: [Character] = Array(repeating: "a", count: 5)
let bools = Array(repeating: false, count: 5)
```

```javascript title=""
// JavaScript의 배열은 여러 기본 자료형과 객체를 자유롭게 저장할 수 있다
const array = [0, 0.0, 'a', false];
```

```typescript title=""
// 여러 기본 자료형으로 배열 초기화
const numbers: number[] = [];
const characters: string[] = [];
const bools: boolean[] = [];
```

```dart title=""
// 여러 기본 자료형으로 배열 초기화
List<int> numbers = List.filled(5, 0);
List<double> decimals = List.filled(5, 0.0);
List<String> characters = List.filled(5, 'a');
List<bool> bools = List.filled(5, false);
```

```rust title=""
// 여러 기본 자료형으로 배열 초기화
let numbers: Vec<i32> = vec![0; 5];
let decimals: Vec<f32> = vec![0.0; 5];
let characters: Vec<char> = vec!['0'; 5];
let bools: Vec<bool> = vec![false; 5];
```

```c title=""
// 여러 기본 자료형으로 배열 초기화
int numbers[10];
float decimals[10];
char characters[10];
bool bools[10];
```

```kotlin title=""
// 여러 기본 자료형으로 배열 초기화
val numbers = IntArray(5)
val decinals = FloatArray(5)
val characters = CharArray(5)
val bools = BooleanArray(5)
```

```ruby title=""
# Ruby의 리스트는 여러 기본 자료형과 객체 참조를 자유롭게 저장할 수 있다
data = [0, 0.0, 'a', false, ListNode.new(0)]
```

<!-- [tutor]{basic_type_arrays_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%97%AC%EB%9F%AC%20%EA%B8%B0%EB%B3%B8%20%EC%9E%90%EB%A3%8C%ED%98%95%EC%9C%BC%EB%A1%9C%20%EB%B0%B0%EC%97%B4%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20Python%EC%9D%98%20%EB%AC%B8%EC%9E%90%EB%8A%94%20%EC%8B%A4%EC%A0%9C%EB%A1%9C%20%EA%B8%B8%EC%9D%B4%EA%B0%80%201%EC%9D%B8%20%EB%AC%B8%EC%9E%90%EC%97%B4%EC%9D%B4%EB%8B%A4%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20Python%EC%9D%98%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%8A%94%20%EC%97%AC%EB%9F%AC%20%EA%B8%B0%EB%B3%B8%20%EC%9E%90%EB%A3%8C%ED%98%95%EA%B3%BC%20%EA%B0%9D%EC%B2%B4%20%EC%B0%B8%EC%A1%B0%EB%A5%BC%20%EC%9E%90%EC%9C%A0%EB%A1%AD%EA%B2%8C%20%EC%A0%80%EC%9E%A5%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20data%20%3D%20%5B0%2C%200.0%2C%20%27a%27%2C%20False%2C%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
