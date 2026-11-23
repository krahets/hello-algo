<!-- [snippet]{basic_type_arrays} -->
```python title=""
# Initialize arrays with different basic data types
numbers: list[int] = [0] * 5
decimals: list[float] = [0.0] * 5
# A Python character is a string of length 1
characters: list[str] = ['0'] * 5
bools: list[bool] = [False] * 5
# Python lists can hold different basic data types and object references
data = [0, 0.0, 'a', False, ListNode(0)]
```

```cpp title=""
// Initialize arrays with different basic data types
int numbers[5];
float decimals[5];
char characters[5];
bool bools[5];
```

```java title=""
// Initialize arrays with different basic data types
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
boolean[] bools = new boolean[5];
```

```csharp title=""
// Initialize arrays with different basic data types
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
bool[] bools = new bool[5];
```

```go title=""
// Initialize arrays with different basic data types
var numbers = [5]int{}
var decimals = [5]float64{}
var characters = [5]byte{}
var bools = [5]bool{}
```

```swift title=""
// Initialize arrays with different basic data types
let numbers = Array(repeating: 0, count: 5)
let decimals = Array(repeating: 0.0, count: 5)
let characters: [Character] = Array(repeating: "a", count: 5)
let bools = Array(repeating: false, count: 5)
```

```javascript title=""
// JavaScript arrays can hold different basic data types and objects
const array = [0, 0.0, 'a', false];
```

```typescript title=""
// Initialize arrays with different basic data types
const numbers: number[] = [];
const characters: string[] = [];
const bools: boolean[] = [];
```

```dart title=""
// Initialize arrays with different basic data types
List<int> numbers = List.filled(5, 0);
List<double> decimals = List.filled(5, 0.0);
List<String> characters = List.filled(5, 'a');
List<bool> bools = List.filled(5, false);
```

```rust title=""
// Initialize arrays with different basic data types
let numbers: Vec<i32> = vec![0; 5];
let decimals: Vec<f32> = vec![0.0; 5];
let characters: Vec<char> = vec!['0'; 5];
let bools: Vec<bool> = vec![false; 5];
```

```c title=""
// Initialize arrays with different basic data types
int numbers[10];
float decimals[10];
char characters[10];
bool bools[10];
```

```kotlin title=""
// Initialize arrays with different basic data types
val numbers = IntArray(5)
val decinals = FloatArray(5)
val characters = CharArray(5)
val bools = BooleanArray(5)
```

```ruby title=""
# Ruby arrays can hold different basic data types and object references
data = [0, 0.0, 'a', false, ListNode.new(0)]
```

<!-- [tutor]{basic_type_arrays_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked%20list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20successor%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20arrays%20with%20different%20basic%20data%20types%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20A%20Python%20character%20is%20a%20string%20of%20length%201%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20Python%20lists%20can%20hold%20different%20basic%20data%20types%20and%20object%20references%0A%20%20%20%20data%20%3D%20%5B0%2C%200.0%2C%20%27a%27%2C%20False%2C%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
