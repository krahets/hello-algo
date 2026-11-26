<!-- [snippet]{basic_type_arrays} -->
```python title=""
# 複数の基本データ型を使って配列を初期化する
numbers: list[int] = [0] * 5
decimals: list[float] = [0.0] * 5
# Python の文字は、実際には長さ 1 の文字列
characters: list[str] = ['0'] * 5
bools: list[bool] = [False] * 5
# Python のリストには、さまざまな基本データ型の値やオブジェクトへの参照を自由に格納できる
data = [0, 0.0, 'a', False, ListNode(0)]
```

```cpp title=""
// 複数の基本データ型を使って配列を初期化する
int numbers[5];
float decimals[5];
char characters[5];
bool bools[5];
```

```java title=""
// 複数の基本データ型を使って配列を初期化する
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
boolean[] bools = new boolean[5];
```

```csharp title=""
// 複数の基本データ型を使って配列を初期化する
int[] numbers = new int[5];
float[] decimals = new float[5];
char[] characters = new char[5];
bool[] bools = new bool[5];
```

```go title=""
// 複数の基本データ型を使って配列を初期化する
var numbers = [5]int{}
var decimals = [5]float64{}
var characters = [5]byte{}
var bools = [5]bool{}
```

```swift title=""
// 複数の基本データ型を使って配列を初期化する
let numbers = Array(repeating: 0, count: 5)
let decimals = Array(repeating: 0.0, count: 5)
let characters: [Character] = Array(repeating: "a", count: 5)
let bools = Array(repeating: false, count: 5)
```

```javascript title=""
// JavaScript の配列には、さまざまな基本データ型の値やオブジェクトを自由に格納できる
const array = [0, 0.0, 'a', false];
```

```typescript title=""
// 複数の基本データ型を使って配列を初期化する
const numbers: number[] = [];
const characters: string[] = [];
const bools: boolean[] = [];
```

```dart title=""
// 複数の基本データ型を使って配列を初期化する
List<int> numbers = List.filled(5, 0);
List<double> decimals = List.filled(5, 0.0);
List<String> characters = List.filled(5, 'a');
List<bool> bools = List.filled(5, false);
```

```rust title=""
// 複数の基本データ型を使って配列を初期化する
let numbers: Vec<i32> = vec![0; 5];
let decimals: Vec<f32> = vec![0.0; 5];
let characters: Vec<char> = vec!['0'; 5];
let bools: Vec<bool> = vec![false; 5];
```

```c title=""
// 複数の基本データ型を使って配列を初期化する
int numbers[10];
float decimals[10];
char characters[10];
bool bools[10];
```

```kotlin title=""
// 複数の基本データ型を使って配列を初期化する
val numbers = IntArray(5)
val decinals = FloatArray(5)
val characters = CharArray(5)
val bools = BooleanArray(5)
```

```ruby title=""
# Ruby のリストには、さまざまな基本データ型の値やオブジェクトへの参照を自由に格納できる
data = [0, 0.0, 'a', false, ListNode.new(0)]
```

<!-- [tutor]{basic_type_arrays_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%A1%A8%E3%81%99%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E5%9F%BA%E6%9C%AC%E3%83%87%E3%83%BC%E3%82%BF%E5%9E%8B%E3%81%AE%E5%80%A4%E3%81%A7%E9%85%8D%E5%88%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E3%81%A7%E3%81%AF%E3%80%81%E6%96%87%E5%AD%97%E3%81%AF%E9%95%B7%E3%81%95%201%20%E3%81%AE%E6%96%87%E5%AD%97%E5%88%97%E3%81%A8%E3%81%97%E3%81%A6%E8%A1%A8%E3%81%99%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20Python%20%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AB%E3%81%AF%E3%80%81%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E5%9F%BA%E6%9C%AC%E3%83%87%E3%83%BC%E3%82%BF%E5%9E%8B%E3%81%AE%E5%80%A4%E3%82%84%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%E3%82%92%E6%B7%B7%E5%9C%A8%E3%81%95%E3%81%9B%E3%82%89%E3%82%8C%E3%82%8B%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20%27a%27,%20False,%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
