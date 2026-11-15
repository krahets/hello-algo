<!-- [snippet]{builtin_hash} -->
```python title="built_in_hash.py"
num = 3
hash_num = hash(num)
# The hash of the integer 3 is 3

bol = True
hash_bol = hash(bol)
# The hash of the Boolean True is 1

dec = 3.14159
hash_dec = hash(dec)
# The hash of the floating-point number 3.14159 is 326484311674566659

str = "Hello 算法"
hash_str = hash(str)
# The hash of the string “Hello 算法” is 4617003410720528961

tup = (12836, "小哈")
hash_tup = hash(tup)
# The hash of the tuple (12836, '小哈') is 1029005403108185979

obj = ListNode(0)
hash_obj = hash(obj)
# The hash of the node object <ListNode object at 0x1058fd810> is 274267521
```

```cpp title="built_in_hash.cpp"
int num = 3;
size_t hashNum = hash<int>()(num);
// The hash of the integer 3 is 3

bool bol = true;
size_t hashBol = hash<bool>()(bol);
// The hash of the Boolean 1 is 1

double dec = 3.14159;
size_t hashDec = hash<double>()(dec);
// The hash of the floating-point number 3.14159 is 4614256650576692846

string str = "Hello 算法";
size_t hashStr = hash<string>()(str);
// The hash of the string “Hello 算法” is 15466937326284535026

// In C++, built-in std::hash() provides hashing only for basic data types
// Hashing for arrays and objects must be implemented separately
```

```java title="built_in_hash.java"
int num = 3;
int hashNum = Integer.hashCode(num);
// The hash of the integer 3 is 3

boolean bol = true;
int hashBol = Boolean.hashCode(bol);
// The hash of the Boolean true is 1231

double dec = 3.14159;
int hashDec = Double.hashCode(dec);
// The hash of the floating-point number 3.14159 is -1340954729

String str = "Hello 算法";
int hashStr = str.hashCode();
// The hash of the string “Hello 算法” is -727081396

Object[] arr = { 12836, "小哈" };
int hashTup = Arrays.hashCode(arr);
// The hash of the array [12836, 小哈] is 1151158

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode();
// The hash of the node object utils.ListNode@7dc5e7b4 is 2110121908
```

```csharp title="built_in_hash.cs"
int num = 3;
int hashNum = num.GetHashCode();
// The hash of the integer 3 is 3;

bool bol = true;
int hashBol = bol.GetHashCode();
// The hash of the Boolean true is 1;

double dec = 3.14159;
int hashDec = dec.GetHashCode();
// The hash of the floating-point number 3.14159 is -1340954729;

string str = "Hello 算法";
int hashStr = str.GetHashCode();
// The hash of the string “Hello 算法” is -586107568;

object[] arr = [12836, "小哈"];
int hashTup = arr.GetHashCode();
// The hash of the array [12836, 小哈] is 42931033;

ListNode obj = new(0);
int hashObj = obj.GetHashCode();
// The hash of the node object 0 is 39053774;
```

```go title="built_in_hash.go"
// Go provides no built-in hash-code function
```

```swift title="built_in_hash.swift"
let num = 3
let hashNum = num.hashValue
// The hash of the integer 3 is 9047044699613009734

let bol = true
let hashBol = bol.hashValue
// The hash of the Boolean true is -4431640247352757451

let dec = 3.14159
let hashDec = dec.hashValue
// The hash of the floating-point number 3.14159 is -2465384235396674631

let str = "Hello 算法"
let hashStr = str.hashValue
// The hash of the string “Hello 算法” is -7850626797806988787

let arr = [AnyHashable(12836), AnyHashable("小哈")]
let hashTup = arr.hashValue
// The hash of the array [AnyHashable(12836), AnyHashable("小哈")] is -2308633508154532996

let obj = ListNode(x: 0)
let hashObj = obj.hashValue
// The hash of the node object utils.ListNode is -2434780518035996159
```

```javascript title="built_in_hash.js"
// JavaScript provides no built-in hash-code function
```

```typescript title="built_in_hash.ts"
// TypeScript provides no built-in hash-code function
```

```dart title="built_in_hash.dart"
int num = 3;
int hashNum = num.hashCode;
// The hash of the integer 3 is 34803

bool bol = true;
int hashBol = bol.hashCode;
// The hash of the Boolean true is 1231

double dec = 3.14159;
int hashDec = dec.hashCode;
// The hash of the floating-point number 3.14159 is 2570631074981783

String str = "Hello 算法";
int hashStr = str.hashCode;
// The hash of the string “Hello 算法” is 468167534

List arr = [12836, "小哈"];
int hashArr = arr.hashCode;
// The hash of the array [12836, 小哈] is 976512528

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode;
// The hash of the node object Instance of 'ListNode' is 1033450432
```

```rust title="built_in_hash.rs"
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

let num = 3;
let mut num_hasher = DefaultHasher::new();
num.hash(&mut num_hasher);
let hash_num = num_hasher.finish();
// The hash of the integer 3 is 568126464209439262

let bol = true;
let mut bol_hasher = DefaultHasher::new();
bol.hash(&mut bol_hasher);
let hash_bol = bol_hasher.finish();
// The hash of the Boolean true is 4952851536318644461

let dec: f32 = 3.14159;
let mut dec_hasher = DefaultHasher::new();
dec.to_bits().hash(&mut dec_hasher);
let hash_dec = dec_hasher.finish();
// The hash of the floating-point number 3.14159 is 2566941990314602357

let str = "Hello 算法";
let mut str_hasher = DefaultHasher::new();
str.hash(&mut str_hasher);
let hash_str = str_hasher.finish();
// The hash of the string “Hello 算法” is 16092673739211250988

let arr = (&12836, &"小哈");
let mut tup_hasher = DefaultHasher::new();
arr.hash(&mut tup_hasher);
let hash_tup = tup_hasher.finish();
// The hash of the tuple (12836, "小哈") is 1885128010422702749

let node = ListNode::new(42);
let mut hasher = DefaultHasher::new();
node.borrow().val.hash(&mut hasher);
let hash = hasher.finish();
// The hash of the node object RefCell { value: ListNode { val: 42, next: None } } is 15387811073369036852
```

```c title="built_in_hash.c"
// C provides no built-in hash-code function
```

```kotlin title="built_in_hash.kt"
val num = 3
val hashNum = num.hashCode()
// The hash of the integer 3 is 3

val bol = true
val hashBol = bol.hashCode()
// The hash of the Boolean true is 1231

val dec = 3.14159
val hashDec = dec.hashCode()
// The hash of the floating-point number 3.14159 is -1340954729

val str = "Hello 算法"
val hashStr = str.hashCode()
// The hash of the string “Hello 算法” is -727081396

val arr = arrayOf<Any>(12836, "小哈")
val hashTup = arr.hashCode()
// The hash of the array [12836, 小哈] is 189568618

val obj = ListNode(0)
val hashObj = obj.hashCode()
// The hash of the node object utils.ListNode@1d81eb93 is 495053715
```

```ruby title="built_in_hash.rb"
num = 3
hash_num = num.hash
# The hash of the integer 3 is -4385856518450339636

bol = true
hash_bol = bol.hash
# The hash of the Boolean true is -1617938112149317027

dec = 3.14159
hash_dec = dec.hash
# The hash of the floating-point number 3.14159 is -1479186995943067893

str = "Hello 算法"
hash_str = str.hash
# The hash of the string “Hello 算法” is -4075943250025831763

tup = [12836, '小哈']
hash_tup = tup.hash
# The hash of the tuple (12836, '小哈') is 1999544809202288822

obj = ListNode.new(0)
hash_obj = obj.hash
# The hash of the node object #<ListNode:0x000078133140ab70> is 4302940560806366381
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked-list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20integer%203%20is%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20Boolean%20True%20is%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20floating-point%20number%203.14159%20is%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20string%20%E2%80%9CHello%20%E7%AE%97%E6%B3%95%E2%80%9D%20is%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836%2C%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20tuple%20%2812836%2C%20%27%E5%B0%8F%E5%93%88%27%29%20is%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20%23%20The%20hash%20of%20the%20node%20object%20%3CListNode%20object%20at%200x1058fd810%3E%20is%20274267521&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
