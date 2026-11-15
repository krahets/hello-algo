<!-- [snippet]{builtin_hash} -->
```python title="built_in_hash.py"
num = 3
hash_num = hash(num)
# 整数 3 のハッシュ値は 3

bol = True
hash_bol = hash(bol)
# 真偽値 True のハッシュ値は 1

dec = 3.14159
hash_dec = hash(dec)
# 小数 3.14159 のハッシュ値は 326484311674566659

str = "Hello 算法"
hash_str = hash(str)
# 文字列「Hello 算法」のハッシュ値は 4617003410720528961

tup = (12836, "小哈")
hash_tup = hash(tup)
# タプル (12836, '小哈') のハッシュ値は 1029005403108185979

obj = ListNode(0)
hash_obj = hash(obj)
# ノードオブジェクト <ListNode object at 0x1058fd810> のハッシュ値は 274267521
```

```cpp title="built_in_hash.cpp"
int num = 3;
size_t hashNum = hash<int>()(num);
// 整数 3 のハッシュ値は 3

bool bol = true;
size_t hashBol = hash<bool>()(bol);
// 真偽値 1 のハッシュ値は 1

double dec = 3.14159;
size_t hashDec = hash<double>()(dec);
// 小数 3.14159 のハッシュ値は 4614256650576692846

string str = "Hello 算法";
size_t hashStr = hash<string>()(str);
// 文字列「Hello 算法」のハッシュ値は 15466937326284535026

// C++ の組み込み std::hash() は基本データ型のハッシュ値計算のみを提供する
// 配列やオブジェクトのハッシュ値計算は自分で実装する
```

```java title="built_in_hash.java"
int num = 3;
int hashNum = Integer.hashCode(num);
// 整数 3 のハッシュ値は 3

boolean bol = true;
int hashBol = Boolean.hashCode(bol);
// 真偽値 true のハッシュ値は 1231

double dec = 3.14159;
int hashDec = Double.hashCode(dec);
// 小数 3.14159 のハッシュ値は -1340954729

String str = "Hello 算法";
int hashStr = str.hashCode();
// 文字列「Hello 算法」のハッシュ値は -727081396

Object[] arr = { 12836, "小哈" };
int hashTup = Arrays.hashCode(arr);
// 配列 [12836, 小哈] のハッシュ値は 1151158

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode();
// ノードオブジェクト utils.ListNode@7dc5e7b4 のハッシュ値は 2110121908
```

```csharp title="built_in_hash.cs"
int num = 3;
int hashNum = num.GetHashCode();
// 整数 3 のハッシュ値は 3;

bool bol = true;
int hashBol = bol.GetHashCode();
// 真偽値 true のハッシュ値は 1;

double dec = 3.14159;
int hashDec = dec.GetHashCode();
// 小数 3.14159 のハッシュ値は -1340954729;

string str = "Hello 算法";
int hashStr = str.GetHashCode();
// 文字列「Hello 算法」のハッシュ値は -586107568;

object[] arr = [12836, "小哈"];
int hashTup = arr.GetHashCode();
// 配列 [12836, 小哈] のハッシュ値は 42931033;

ListNode obj = new(0);
int hashObj = obj.GetHashCode();
// ノードオブジェクト 0 のハッシュ値は 39053774;
```

```go title="built_in_hash.go"
// Go には組み込みの hash code 関数がない
```

```swift title="built_in_hash.swift"
let num = 3
let hashNum = num.hashValue
// 整数 3 のハッシュ値は 9047044699613009734

let bol = true
let hashBol = bol.hashValue
// 真偽値 true のハッシュ値は -4431640247352757451

let dec = 3.14159
let hashDec = dec.hashValue
// 小数 3.14159 のハッシュ値は -2465384235396674631

let str = "Hello 算法"
let hashStr = str.hashValue
// 文字列「Hello 算法」のハッシュ値は -7850626797806988787

let arr = [AnyHashable(12836), AnyHashable("小哈")]
let hashTup = arr.hashValue
// 配列 [AnyHashable(12836), AnyHashable("小哈")] のハッシュ値は -2308633508154532996

let obj = ListNode(x: 0)
let hashObj = obj.hashValue
// ノードオブジェクト utils.ListNode のハッシュ値は -2434780518035996159
```

```javascript title="built_in_hash.js"
// JavaScript には組み込みの hash code 関数がない
```

```typescript title="built_in_hash.ts"
// TypeScript には組み込みの hash code 関数がない
```

```dart title="built_in_hash.dart"
int num = 3;
int hashNum = num.hashCode;
// 整数 3 のハッシュ値は 34803

bool bol = true;
int hashBol = bol.hashCode;
// 真偽値 true のハッシュ値は 1231

double dec = 3.14159;
int hashDec = dec.hashCode;
// 小数 3.14159 のハッシュ値は 2570631074981783

String str = "Hello 算法";
int hashStr = str.hashCode;
// 文字列「Hello 算法」のハッシュ値は 468167534

List arr = [12836, "小哈"];
int hashArr = arr.hashCode;
// 配列 [12836, 小哈] のハッシュ値は 976512528

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode;
// ノードオブジェクト Instance of 'ListNode' のハッシュ値は 1033450432
```

```rust title="built_in_hash.rs"
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

let num = 3;
let mut num_hasher = DefaultHasher::new();
num.hash(&mut num_hasher);
let hash_num = num_hasher.finish();
// 整数 3 のハッシュ値は 568126464209439262

let bol = true;
let mut bol_hasher = DefaultHasher::new();
bol.hash(&mut bol_hasher);
let hash_bol = bol_hasher.finish();
// 真偽値 true のハッシュ値は 4952851536318644461

let dec: f32 = 3.14159;
let mut dec_hasher = DefaultHasher::new();
dec.to_bits().hash(&mut dec_hasher);
let hash_dec = dec_hasher.finish();
// 小数 3.14159 のハッシュ値は 2566941990314602357

let str = "Hello 算法";
let mut str_hasher = DefaultHasher::new();
str.hash(&mut str_hasher);
let hash_str = str_hasher.finish();
// 文字列「Hello 算法」のハッシュ値は 16092673739211250988

let arr = (&12836, &"小哈");
let mut tup_hasher = DefaultHasher::new();
arr.hash(&mut tup_hasher);
let hash_tup = tup_hasher.finish();
// タプル (12836, "小哈") のハッシュ値は 1885128010422702749

let node = ListNode::new(42);
let mut hasher = DefaultHasher::new();
node.borrow().val.hash(&mut hasher);
let hash = hasher.finish();
// ノードオブジェクト RefCell { value: ListNode { val: 42, next: None } } のハッシュ値は 15387811073369036852
```

```c title="built_in_hash.c"
// C には組み込みの hash code 関数がない
```

```kotlin title="built_in_hash.kt"
val num = 3
val hashNum = num.hashCode()
// 整数 3 のハッシュ値は 3

val bol = true
val hashBol = bol.hashCode()
// 真偽値 true のハッシュ値は 1231

val dec = 3.14159
val hashDec = dec.hashCode()
// 小数 3.14159 のハッシュ値は -1340954729

val str = "Hello 算法"
val hashStr = str.hashCode()
// 文字列「Hello 算法」のハッシュ値は -727081396

val arr = arrayOf<Any>(12836, "小哈")
val hashTup = arr.hashCode()
// 配列 [12836, 小哈] のハッシュ値は 189568618

val obj = ListNode(0)
val hashObj = obj.hashCode()
// ノードオブジェクト utils.ListNode@1d81eb93 のハッシュ値は 495053715
```

```ruby title="built_in_hash.rb"
num = 3
hash_num = num.hash
# 整数 3 のハッシュ値は -4385856518450339636

bol = true
hash_bol = bol.hash
# 真偽値 true のハッシュ値は -1617938112149317027

dec = 3.14159
hash_dec = dec.hash
# 小数 3.14159 のハッシュ値は -1479186995943067893

str = "Hello 算法"
hash_str = str.hash
# 文字列「Hello 算法」のハッシュ値は -4075943250025831763

tup = [12836, '小哈']
hash_tup = tup.hash
# タプル (12836, '小哈') のハッシュ値は 1999544809202288822

obj = ListNode.new(0)
hash_obj = obj.hash
# ノードオブジェクト #<ListNode:0x000078133140ab70> のハッシュ値は 4302940560806366381
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash(num)%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B0%203%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash(bol)%0A%20%20%20%20%23%20%E7%9C%9F%E5%81%BD%E5%80%A4%20True%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash(dec)%0A%20%20%20%20%23%20%E5%B0%8F%E6%95%B0%203.14159%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash(str)%0A%20%20%20%20%23%20%E6%96%87%E5%AD%97%E5%88%97%E3%80%8CHello%20%E7%AE%97%E6%B3%95%E3%80%8D%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20(12836%2C%20%22%E5%B0%8F%E5%93%88%22)%0A%20%20%20%20hash_tup%20%3D%20hash(tup)%0A%20%20%20%20%23%20%E3%82%BF%E3%83%97%E3%83%AB%20(12836%2C%20'%E5%B0%8F%E5%93%88')%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode(0)%0A%20%20%20%20hash_obj%20%3D%20hash(obj)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%20%3CListNode%20object%20at%200x1058fd810%3E%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20274267521&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
