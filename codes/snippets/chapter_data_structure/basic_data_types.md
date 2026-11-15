<!-- [snippet]{basic_type_arrays} -->
```python title=""
# 使用多种基本数据类型来初始化数组
numbers: list[int] = [0] * 5
decimals: list[float] = [0.0] * 5
# Python 的字符实际上是长度为 1 的字符串
characters: list[str] = ['0'] * 5
bools: list[bool] = [False] * 5
# Python 的列表可以自由存储各种基本数据类型和对象引用
data = [0, 0.0, 'a', False, ListNode(0)]
```

```cpp title=""
// 使用多种基本数据类型来初始化数组
int numbers[5];
float decimals[5];
char characters[5];
bool bools[5];
```

```java title=""
// 使用多种基本数据类型来初始化数组
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
boolean[] bools = new boolean[5];
```

```csharp title=""
// 使用多种基本数据类型来初始化数组
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
bool[] bools = new bool[5];
```

```go title=""
// 使用多种基本数据类型来初始化数组
var numbers = [5]int{}
var decimals = [5]float64{}
var characters = [5]byte{}
var bools = [5]bool{}
```

```swift title=""
// 使用多种基本数据类型来初始化数组
let numbers = Array(repeating: 0, count: 5)
let decimals = Array(repeating: 0.0, count: 5)
let characters: [Character] = Array(repeating: "a", count: 5)
let bools = Array(repeating: false, count: 5)
```

```javascript title=""
// JavaScript 的数组可以自由存储各种基本数据类型和对象
const array = [0, 0.0, 'a', false];
```

```typescript title=""
// 使用多种基本数据类型来初始化数组
const numbers: number[] = [];
const characters: string[] = [];
const bools: boolean[] = [];
```

```dart title=""
// 使用多种基本数据类型来初始化数组
List<int> numbers = List.filled(5, 0);
List<double> decimals = List.filled(5, 0.0);
List<String> characters = List.filled(5, 'a');
List<bool> bools = List.filled(5, false);
```

```rust title=""
// 使用多种基本数据类型来初始化数组
let numbers: Vec<i32> = vec![0; 5];
let decimals: Vec<f32> = vec![0.0; 5];
let characters: Vec<char> = vec!['0'; 5];
let bools: Vec<bool> = vec![false; 5];
```

```c title=""
// 使用多种基本数据类型来初始化数组
int numbers[10];
float decimals[10];
char characters[10];
bool bools[10];
```

```kotlin title=""
// 使用多种基本数据类型来初始化数组
val numbers = IntArray(5)
val decinals = FloatArray(5)
val characters = CharArray(5)
val bools = BooleanArray(5)
```

```ruby title=""
# Ruby 的列表可以自由存储各种基本数据类型和对象引用
data = [0, 0.0, 'a', false, ListNode.new(0)]
```

<!-- [tutor]{basic_type_arrays_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E5%A4%9A%E7%A7%8D%E5%9F%BA%E6%9C%AC%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B%E6%9D%A5%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20*%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20*%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%AD%97%E7%AC%A6%E5%AE%9E%E9%99%85%E4%B8%8A%E6%98%AF%E9%95%BF%E5%BA%A6%E4%B8%BA%201%20%E7%9A%84%E5%AD%97%E7%AC%A6%E4%B8%B2%0A%20%20%20%20characters%20%3D%20%5B'0'%5D%20*%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20*%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%88%97%E8%A1%A8%E5%8F%AF%E4%BB%A5%E8%87%AA%E7%94%B1%E5%AD%98%E5%82%A8%E5%90%84%E7%A7%8D%E5%9F%BA%E6%9C%AC%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B%E5%92%8C%E5%AF%B9%E8%B1%A1%E5%BC%95%E7%94%A8%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20'a',%20False,%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
