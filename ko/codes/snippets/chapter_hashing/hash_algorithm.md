<!-- [snippet]{builtin_hash} -->
```python title="built_in_hash.py"
num = 3
hash_num = hash(num)
# 정수 3의 해시값은 3

bol = True
hash_bol = hash(bol)
# 불리언 True의 해시값은 1

dec = 3.14159
hash_dec = hash(dec)
# 소수 3.14159의 해시값은 326484311674566659

str = "Hello 算法"
hash_str = hash(str)
# 문자열 “Hello 算法”의 해시값은 4617003410720528961

tup = (12836, "小哈")
hash_tup = hash(tup)
# 튜플 (12836, '小哈')의 해시값은 1029005403108185979

obj = ListNode(0)
hash_obj = hash(obj)
# 노드 객체 <ListNode object at 0x1058fd810>의 해시값은 274267521
```

```cpp title="built_in_hash.cpp"
int num = 3;
size_t hashNum = hash<int>()(num);
// 정수 3의 해시값은 3

bool bol = true;
size_t hashBol = hash<bool>()(bol);
// 불리언 1의 해시값은 1

double dec = 3.14159;
size_t hashDec = hash<double>()(dec);
// 소수 3.14159의 해시값은 4614256650576692846

string str = "Hello 算法";
size_t hashStr = hash<string>()(str);
// 문자열 “Hello 算法”의 해시값은 15466937326284535026

// C++의 내장 std::hash()는 기본 자료형의 해시값 계산만 제공한다
// 배열과 객체의 해시값 계산은 직접 구현해야 한다
```

```java title="built_in_hash.java"
int num = 3;
int hashNum = Integer.hashCode(num);
// 정수 3의 해시값은 3

boolean bol = true;
int hashBol = Boolean.hashCode(bol);
// 불리언 true의 해시값은 1231

double dec = 3.14159;
int hashDec = Double.hashCode(dec);
// 소수 3.14159의 해시값은 -1340954729

String str = "Hello 算法";
int hashStr = str.hashCode();
// 문자열 “Hello 算法”의 해시값은 -727081396

Object[] arr = { 12836, "小哈" };
int hashTup = Arrays.hashCode(arr);
// 배열 [12836, 小哈]의 해시값은 1151158

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode();
// 노드 객체 utils.ListNode@7dc5e7b4의 해시값은 2110121908
```

```csharp title="built_in_hash.cs"
int num = 3;
int hashNum = num.GetHashCode();
// 정수 3의 해시값은 3;

bool bol = true;
int hashBol = bol.GetHashCode();
// 불리언 true의 해시값은 1;

double dec = 3.14159;
int hashDec = dec.GetHashCode();
// 소수 3.14159의 해시값은 -1340954729;

string str = "Hello 算法";
int hashStr = str.GetHashCode();
// 문자열 “Hello 算法”의 해시값은 -586107568;

object[] arr = [12836, "小哈"];
int hashTup = arr.GetHashCode();
// 배열 [12836, 小哈]의 해시값은 42931033;

ListNode obj = new(0);
int hashObj = obj.GetHashCode();
// 노드 객체 0의 해시값은 39053774;
```

```go title="built_in_hash.go"
// Go는 내장 hash code 함수를 제공하지 않는다
```

```swift title="built_in_hash.swift"
let num = 3
let hashNum = num.hashValue
// 정수 3의 해시값은 9047044699613009734

let bol = true
let hashBol = bol.hashValue
// 불리언 true의 해시값은 -4431640247352757451

let dec = 3.14159
let hashDec = dec.hashValue
// 소수 3.14159의 해시값은 -2465384235396674631

let str = "Hello 算法"
let hashStr = str.hashValue
// 문자열 “Hello 算法”의 해시값은 -7850626797806988787

let arr = [AnyHashable(12836), AnyHashable("小哈")]
let hashTup = arr.hashValue
// 배열 [AnyHashable(12836), AnyHashable("小哈")]의 해시값은 -2308633508154532996

let obj = ListNode(x: 0)
let hashObj = obj.hashValue
// 노드 객체 utils.ListNode의 해시값은 -2434780518035996159
```

```javascript title="built_in_hash.js"
// JavaScript는 내장 hash code 함수를 제공하지 않는다
```

```typescript title="built_in_hash.ts"
// TypeScript는 내장 hash code 함수를 제공하지 않는다
```

```dart title="built_in_hash.dart"
int num = 3;
int hashNum = num.hashCode;
// 정수 3의 해시값은 34803

bool bol = true;
int hashBol = bol.hashCode;
// 불리언 true의 해시값은 1231

double dec = 3.14159;
int hashDec = dec.hashCode;
// 소수 3.14159의 해시값은 2570631074981783

String str = "Hello 算法";
int hashStr = str.hashCode;
// 문자열 “Hello 算法”의 해시값은 468167534

List arr = [12836, "小哈"];
int hashArr = arr.hashCode;
// 배열 [12836, 小哈]의 해시값은 976512528

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode;
// 노드 객체 Instance of 'ListNode'의 해시값은 1033450432
```

```rust title="built_in_hash.rs"
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

let num = 3;
let mut num_hasher = DefaultHasher::new();
num.hash(&mut num_hasher);
let hash_num = num_hasher.finish();
// 정수 3의 해시값은 568126464209439262

let bol = true;
let mut bol_hasher = DefaultHasher::new();
bol.hash(&mut bol_hasher);
let hash_bol = bol_hasher.finish();
// 불리언 true의 해시값은 4952851536318644461

let dec: f32 = 3.14159;
let mut dec_hasher = DefaultHasher::new();
dec.to_bits().hash(&mut dec_hasher);
let hash_dec = dec_hasher.finish();
// 소수 3.14159의 해시값은 2566941990314602357

let str = "Hello 算法";
let mut str_hasher = DefaultHasher::new();
str.hash(&mut str_hasher);
let hash_str = str_hasher.finish();
// 문자열 “Hello 算法”의 해시값은 16092673739211250988

let arr = (&12836, &"小哈");
let mut tup_hasher = DefaultHasher::new();
arr.hash(&mut tup_hasher);
let hash_tup = tup_hasher.finish();
// 튜플 (12836, "小哈")의 해시값은 1885128010422702749

let node = ListNode::new(42);
let mut hasher = DefaultHasher::new();
node.borrow().val.hash(&mut hasher);
let hash = hasher.finish();
// 노드 객체 RefCell { value: ListNode { val: 42, next: None } }의 해시값은 15387811073369036852
```

```c title="built_in_hash.c"
// C는 내장 hash code 함수를 제공하지 않는다
```

```kotlin title="built_in_hash.kt"
val num = 3
val hashNum = num.hashCode()
// 정수 3의 해시값은 3

val bol = true
val hashBol = bol.hashCode()
// 불리언 true의 해시값은 1231

val dec = 3.14159
val hashDec = dec.hashCode()
// 소수 3.14159의 해시값은 -1340954729

val str = "Hello 算法"
val hashStr = str.hashCode()
// 문자열 “Hello 算法”의 해시값은 -727081396

val arr = arrayOf<Any>(12836, "小哈")
val hashTup = arr.hashCode()
// 배열 [12836, 小哈]의 해시값은 189568618

val obj = ListNode(0)
val hashObj = obj.hashCode()
// 노드 객체 utils.ListNode@1d81eb93의 해시값은 495053715
```

```ruby title="built_in_hash.rb"
num = 3
hash_num = num.hash
# 정수 3의 해시값은 -4385856518450339636

bol = true
hash_bol = bol.hash
# 불리언 true의 해시값은 -1617938112149317027

dec = 3.14159
hash_dec = dec.hash
# 소수 3.14159의 해시값은 -1479186995943067893

str = "Hello 算法"
hash_str = str.hash
# 문자열 “Hello 算法”의 해시값은 -4075943250025831763

tup = [12836, '小哈']
hash_tup = tup.hash
# 튜플 (12836, '小哈')의 해시값은 1999544809202288822

obj = ListNode.new(0)
hash_obj = obj.hash
# 노드 객체 #<ListNode:0x000078133140ab70>의 해시값은 4302940560806366381
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%ED%9B%84%EC%86%8D%20%EB%85%B8%EB%93%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20%23%20%EC%A0%95%EC%88%98%203%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%EC%9D%80%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20%23%20%EB%B6%88%EB%A6%AC%EC%96%B8%20True%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%EC%9D%80%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20%23%20%EC%86%8C%EC%88%98%203.14159%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%EC%9D%80%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20%23%20%EB%AC%B8%EC%9E%90%EC%97%B4%20%E2%80%9CHello%20%E7%AE%97%E6%B3%95%E2%80%9D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%EC%9D%80%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836%2C%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20%23%20%ED%8A%9C%ED%94%8C%20%2812836%2C%20%27%E5%B0%8F%E5%93%88%27%29%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%EC%9D%80%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%9D%EC%B2%B4%20%3CListNode%20object%20at%200x1058fd810%3E%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%EC%9D%80%20274267521&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
