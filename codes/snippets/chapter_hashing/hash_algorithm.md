<!-- [snippet]{builtin_hash} -->
```python title="built_in_hash.py"
num = 3
hash_num = hash(num)
# 整数 3 的哈希值为 3

bol = True
hash_bol = hash(bol)
# 布尔量 True 的哈希值为 1

dec = 3.14159
hash_dec = hash(dec)
# 小数 3.14159 的哈希值为 326484311674566659

str = "Hello 算法"
hash_str = hash(str)
# 字符串“Hello 算法”的哈希值为 4617003410720528961

tup = (12836, "小哈")
hash_tup = hash(tup)
# 元组 (12836, '小哈') 的哈希值为 1029005403108185979

obj = ListNode(0)
hash_obj = hash(obj)
# 节点对象 <ListNode object at 0x1058fd810> 的哈希值为 274267521
```

```cpp title="built_in_hash.cpp"
int num = 3;
size_t hashNum = hash<int>()(num);
// 整数 3 的哈希值为 3

bool bol = true;
size_t hashBol = hash<bool>()(bol);
// 布尔量 1 的哈希值为 1

double dec = 3.14159;
size_t hashDec = hash<double>()(dec);
// 小数 3.14159 的哈希值为 4614256650576692846

string str = "Hello 算法";
size_t hashStr = hash<string>()(str);
// 字符串“Hello 算法”的哈希值为 15466937326284535026

// 在 C++ 中，内置 std::hash() 仅提供基本数据类型的哈希值计算
// 数组、对象的哈希值计算需要自行实现
```

```java title="built_in_hash.java"
int num = 3;
int hashNum = Integer.hashCode(num);
// 整数 3 的哈希值为 3

boolean bol = true;
int hashBol = Boolean.hashCode(bol);
// 布尔量 true 的哈希值为 1231

double dec = 3.14159;
int hashDec = Double.hashCode(dec);
// 小数 3.14159 的哈希值为 -1340954729

String str = "Hello 算法";
int hashStr = str.hashCode();
// 字符串“Hello 算法”的哈希值为 -727081396

Object[] arr = { 12836, "小哈" };
int hashTup = Arrays.hashCode(arr);
// 数组 [12836, 小哈] 的哈希值为 1151158

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode();
// 节点对象 utils.ListNode@7dc5e7b4 的哈希值为 2110121908
```

```csharp title="built_in_hash.cs"
int num = 3;
int hashNum = num.GetHashCode();
// 整数 3 的哈希值为 3;

bool bol = true;
int hashBol = bol.GetHashCode();
// 布尔量 true 的哈希值为 1;

double dec = 3.14159;
int hashDec = dec.GetHashCode();
// 小数 3.14159 的哈希值为 -1340954729;

string str = "Hello 算法";
int hashStr = str.GetHashCode();
// 字符串“Hello 算法”的哈希值为 -586107568;

object[] arr = [12836, "小哈"];
int hashTup = arr.GetHashCode();
// 数组 [12836, 小哈] 的哈希值为 42931033;

ListNode obj = new(0);
int hashObj = obj.GetHashCode();
// 节点对象 0 的哈希值为 39053774;
```

```go title="built_in_hash.go"
// Go 未提供内置 hash code 函数
```

```swift title="built_in_hash.swift"
let num = 3
let hashNum = num.hashValue
// 整数 3 的哈希值为 9047044699613009734

let bol = true
let hashBol = bol.hashValue
// 布尔量 true 的哈希值为 -4431640247352757451

let dec = 3.14159
let hashDec = dec.hashValue
// 小数 3.14159 的哈希值为 -2465384235396674631

let str = "Hello 算法"
let hashStr = str.hashValue
// 字符串“Hello 算法”的哈希值为 -7850626797806988787

let arr = [AnyHashable(12836), AnyHashable("小哈")]
let hashTup = arr.hashValue
// 数组 [AnyHashable(12836), AnyHashable("小哈")] 的哈希值为 -2308633508154532996

let obj = ListNode(x: 0)
let hashObj = obj.hashValue
// 节点对象 utils.ListNode 的哈希值为 -2434780518035996159
```

```javascript title="built_in_hash.js"
// JavaScript 未提供内置 hash code 函数
```

```typescript title="built_in_hash.ts"
// TypeScript 未提供内置 hash code 函数
```

```dart title="built_in_hash.dart"
int num = 3;
int hashNum = num.hashCode;
// 整数 3 的哈希值为 34803

bool bol = true;
int hashBol = bol.hashCode;
// 布尔值 true 的哈希值为 1231

double dec = 3.14159;
int hashDec = dec.hashCode;
// 小数 3.14159 的哈希值为 2570631074981783

String str = "Hello 算法";
int hashStr = str.hashCode;
// 字符串“Hello 算法”的哈希值为 468167534

List arr = [12836, "小哈"];
int hashArr = arr.hashCode;
// 数组 [12836, 小哈] 的哈希值为 976512528

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode;
// 节点对象 Instance of 'ListNode' 的哈希值为 1033450432
```

```rust title="built_in_hash.rs"
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

let num = 3;
let mut num_hasher = DefaultHasher::new();
num.hash(&mut num_hasher);
let hash_num = num_hasher.finish();
// 整数 3 的哈希值为 568126464209439262

let bol = true;
let mut bol_hasher = DefaultHasher::new();
bol.hash(&mut bol_hasher);
let hash_bol = bol_hasher.finish();
// 布尔量 true 的哈希值为 4952851536318644461

let dec: f32 = 3.14159;
let mut dec_hasher = DefaultHasher::new();
dec.to_bits().hash(&mut dec_hasher);
let hash_dec = dec_hasher.finish();
// 小数 3.14159 的哈希值为 2566941990314602357

let str = "Hello 算法";
let mut str_hasher = DefaultHasher::new();
str.hash(&mut str_hasher);
let hash_str = str_hasher.finish();
// 字符串“Hello 算法”的哈希值为 16092673739211250988

let arr = (&12836, &"小哈");
let mut tup_hasher = DefaultHasher::new();
arr.hash(&mut tup_hasher);
let hash_tup = tup_hasher.finish();
// 元组 (12836, "小哈") 的哈希值为 1885128010422702749

let node = ListNode::new(42);
let mut hasher = DefaultHasher::new();
node.borrow().val.hash(&mut hasher);
let hash = hasher.finish();
// 节点对象 RefCell { value: ListNode { val: 42, next: None } } 的哈希值为15387811073369036852
```

```c title="built_in_hash.c"
// C 未提供内置 hash code 函数
```

```kotlin title="built_in_hash.kt"
val num = 3
val hashNum = num.hashCode()
// 整数 3 的哈希值为 3

val bol = true
val hashBol = bol.hashCode()
// 布尔量 true 的哈希值为 1231

val dec = 3.14159
val hashDec = dec.hashCode()
// 小数 3.14159 的哈希值为 -1340954729

val str = "Hello 算法"
val hashStr = str.hashCode()
// 字符串“Hello 算法”的哈希值为 -727081396

val arr = arrayOf<Any>(12836, "小哈")
val hashTup = arr.hashCode()
// 数组 [12836, 小哈] 的哈希值为 189568618

val obj = ListNode(0)
val hashObj = obj.hashCode()
// 节点对象 utils.ListNode@1d81eb93 的哈希值为 495053715
```

```ruby title="built_in_hash.rb"
num = 3
hash_num = num.hash
# 整数 3 的哈希值为 -4385856518450339636

bol = true
hash_bol = bol.hash
# 布尔量 true 的哈希值为 -1617938112149317027

dec = 3.14159
hash_dec = dec.hash
# 小数 3.14159 的哈希值为 -1479186995943067893

str = "Hello 算法"
hash_str = str.hash
# 字符串“Hello 算法”的哈希值为 -4075943250025831763

tup = [12836, '小哈']
hash_tup = tup.hash
# 元组 (12836, '小哈') 的哈希值为 1999544809202288822

obj = ListNode.new(0)
hash_obj = obj.hash
# 节点对象 #<ListNode:0x000078133140ab70> 的哈希值为 4302940560806366381
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B0%203%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20%23%20%E5%B8%83%E5%B0%94%E9%87%8F%20True%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20%23%20%E5%B0%8F%E6%95%B0%203.14159%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20%23%20%E5%AD%97%E7%AC%A6%E4%B8%B2%E2%80%9CHello%20%E7%AE%97%E6%B3%95%E2%80%9D%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20%23%20%E5%85%83%E7%BB%84%20%2812836,%20'%E5%B0%8F%E5%93%88'%29%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20%23%20%E8%8A%82%E7%82%B9%E5%AF%B9%E8%B1%A1%20%3CListNode%20object%20at%200x1058fd810%3E%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20274267521&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
