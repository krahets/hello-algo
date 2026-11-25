<!-- [snippet]{builtin_hash} -->
```python title="built_in_hash.py"
num = 3
hash_num = hash(num)
print(f"정수 {num} → 해시값: {hash_num}")
# 정수 3 → 해시값: 3

bol = True
hash_bol = hash(bol)
print(f"불리언 {bol} → 해시값: {hash_bol}")
# 불리언 True → 해시값: 1

dec = 3.14159
hash_dec = hash(dec)
print(f"실수 {dec} → 해시값: {hash_dec}")
# 실수 3.14159 → 해시값: 326484311674566659

str = "Hello 算法"
hash_str = hash(str)
print(f"문자열 ‘{str}’ → 해시값: {hash_str}")
# 문자열 ‘Hello 算法’ → 해시값: 4617003410720528961

tup = (12836, "小哈")
hash_tup = hash(tup)
print(f"튜플 {tup} → 해시값: {hash_tup}")
# 튜플 (12836, '小哈') → 해시값: 1029005403108185979

obj = ListNode(0)
hash_obj = hash(obj)
print(f"노드 객체 {obj} → 해시값: {hash_obj}")
# 노드 객체 <modules.list_node.ListNode object at 0x1058fd810> → 해시값: 274267521
```

```cpp title="built_in_hash.cpp"
int num = 3;
size_t hashNum = hash<int>()(num);
cout << "정수 " << num << " → 해시값: " << hashNum << "\n";
// 정수 3 → 해시값: 3

bool bol = true;
size_t hashBol = hash<bool>()(bol);
cout << "불리언 " << bol << " → 해시값: " << hashBol << "\n";
// 불리언 1 → 해시값: 1

double dec = 3.14159;
size_t hashDec = hash<double>()(dec);
cout << "실수 " << dec << " → 해시값: " << hashDec << "\n";
// 실수 3.14159 → 해시값: 4614256650576692846

string str = "Hello 算法";
size_t hashStr = hash<string>()(str);
cout << "문자열 ‘" << str << "’ → 해시값: " << hashStr << "\n";
// 문자열 ‘Hello 算法’ → 해시값: 15466937326284535026

// C++의 내장 std::hash()는 기본 자료형과 일부 표준 라이브러리 자료형(예: std::string)에 대해서만 해시값을 계산한다
// 배열과 객체의 해시값을 계산하는 기능은 직접 구현해야 한다
```

```java title="built_in_hash.java"
int num = 3;
int hashNum = Integer.hashCode(num);
System.out.println("정수 " + num + " → 해시값: " + hashNum);
// 정수 3 → 해시값: 3

boolean bol = true;
int hashBol = Boolean.hashCode(bol);
System.out.println("불리언 " + bol + " → 해시값: " + hashBol);
// 불리언 true → 해시값: 1231

double dec = 3.14159;
int hashDec = Double.hashCode(dec);
System.out.println("실수 " + dec + " → 해시값: " + hashDec);
// 실수 3.14159 → 해시값: -1340954729

String str = "Hello 算法";
int hashStr = str.hashCode();
System.out.println("문자열 ‘" + str + "’ → 해시값: " + hashStr);
// 문자열 ‘Hello 算法’ → 해시값: -727081396

Object[] arr = { 12836, "小哈" };
int hashArr = Arrays.hashCode(arr);
System.out.println("배열 " + Arrays.toString(arr) + " → 해시값: " + hashArr);
// 배열 [12836, 小哈] → 해시값: 1151158

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode();
System.out.println("노드 객체 " + obj + " → 해시값: " + hashObj);
// 노드 객체 utils.ListNode@7dc5e7b4 → 해시값: 2110121908
```

```csharp title="built_in_hash.cs"
int num = 3;
int hashNum = num.GetHashCode();
Console.WriteLine("정수 " + num + " → 해시값: " + hashNum);
// 정수 3 → 해시값: 3

bool bol = true;
int hashBol = bol.GetHashCode();
Console.WriteLine("불리언 " + bol + " → 해시값: " + hashBol);
// 불리언 True → 해시값: 1

double dec = 3.14159;
int hashDec = dec.GetHashCode();
Console.WriteLine("실수 " + dec + " → 해시값: " + hashDec);
// 실수 3.14159 → 해시값: -1340954729

string str = "Hello 算法";
int hashStr = str.GetHashCode();
Console.WriteLine("문자열 ‘" + str + "’ → 해시값: " + hashStr);
// 문자열 ‘Hello 算法’ → 해시값: -586107568

object[] arr = [12836, "小哈"];
int hashArr = arr.GetHashCode();
Console.WriteLine("배열 [" + string.Join(", ", arr) + "] → 해시값: " + hashArr);
// 배열 [12836, 小哈] → 해시값: 42931033

ListNode obj = new(0);
int hashObj = obj.GetHashCode();
Console.WriteLine("노드 객체 " + obj + " → 해시값: " + hashObj);
// 노드 객체 0 → 해시값: 39053774
```

```go title="built_in_hash.go"
// Go는 해시 코드를 구하는 내장 함수를 제공하지 않는다
```

```swift title="built_in_hash.swift"
let num = 3
let hashNum = num.hashValue
print("정수 \(num) → 해시값: \(hashNum)")
// 정수 3 → 해시값: 9047044699613009734

let bol = true
let hashBol = bol.hashValue
print("불리언 \(bol) → 해시값: \(hashBol)")
// 불리언 true → 해시값: -4431640247352757451

let dec = 3.14159
let hashDec = dec.hashValue
print("실수 \(dec) → 해시값: \(hashDec)")
// 실수 3.14159 → 해시값: -2465384235396674631

let str = "Hello 算法"
let hashStr = str.hashValue
print("문자열 ‘\(str)’ → 해시값: \(hashStr)")
// 문자열 ‘Hello 算法’ → 해시값: -7850626797806988787

let arr = [AnyHashable(12836), AnyHashable("小哈")]
let hashArr = arr.hashValue
print("배열 \(arr) → 해시값: \(hashArr)")
// 배열 [AnyHashable(12836), AnyHashable("小哈")] → 해시값: -2308633508154532996

let obj = ListNode(x: 0)
let hashObj = obj.hashValue
print("노드 객체 \(obj) → 해시값: \(hashObj)")
// 노드 객체 utils.ListNode → 해시값: -2434780518035996159
```

```javascript title="built_in_hash.js"
// JavaScript는 해시 코드를 구하는 내장 함수를 제공하지 않는다
```

```typescript title="built_in_hash.ts"
// TypeScript는 해시 코드를 구하는 내장 함수를 제공하지 않는다
```

```dart title="built_in_hash.dart"
int num = 3;
int hashNum = num.hashCode;
print("정수 $num → 해시값: $hashNum");
// 정수 3 → 해시값: 34803

bool bol = true;
int hashBol = bol.hashCode;
print("불리언 $bol → 해시값: $hashBol");
// 불리언 true → 해시값: 1231

double dec = 3.14159;
int hashDec = dec.hashCode;
print("실수 $dec → 해시값: $hashDec");
// 실수 3.14159 → 해시값: 2570631074981783

String str = "Hello 算法";
int hashStr = str.hashCode;
print("문자열 ‘$str’ → 해시값: $hashStr");
// 문자열 ‘Hello 算法’ → 해시값: 468167534

List arr = [12836, "小哈"];
int hashArr = arr.hashCode;
print("배열 $arr → 해시값: $hashArr");
// 배열 [12836, 小哈] → 해시값: 976512528

ListNode obj = ListNode(0);
int hashObj = obj.hashCode;
print("노드 객체 $obj → 해시값: $hashObj");
// 노드 객체 Instance of 'ListNode' → 해시값: 1033450432
```

```rust title="built_in_hash.rs"
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

let num = 3;
let mut num_hasher = DefaultHasher::new();
num.hash(&mut num_hasher);
let hash_num = num_hasher.finish();
println!("정수 {} → 해시값: {}", num, hash_num);
// 정수 3 → 해시값: 568126464209439262

let bol = true;
let mut bol_hasher = DefaultHasher::new();
bol.hash(&mut bol_hasher);
let hash_bol = bol_hasher.finish();
println!("불리언 {} → 해시값: {}", bol, hash_bol);
// 불리언 true → 해시값: 4952851536318644461

let dec: f32 = 3.14159;
let mut dec_hasher = DefaultHasher::new();
dec.to_bits().hash(&mut dec_hasher);
let hash_dec = dec_hasher.finish();
println!("실수 {} → 해시값: {}", dec, hash_dec);
// 실수 3.14159 → 해시값: 2566941990314602357

let str = "Hello 算法";
let mut str_hasher = DefaultHasher::new();
str.hash(&mut str_hasher);
let hash_str = str_hasher.finish();
println!("문자열 ‘{}’ → 해시값: {}", str, hash_str);
// 문자열 ‘Hello 算法’ → 해시값: 16092673739211250988

let tup = (&12836, &"小哈");
let mut tup_hasher = DefaultHasher::new();
tup.hash(&mut tup_hasher);
let hash_tup = tup_hasher.finish();
println!("튜플 {:?} → 해시값: {}", tup, hash_tup);
// 튜플 (12836, "小哈") → 해시값: 1885128010422702749

let node = ListNode::new(42);
let mut node_hasher = DefaultHasher::new();
node.borrow().val.hash(&mut node_hasher);
let hash_node = node_hasher.finish();
println!("노드 {:?}에 저장된 값의 해시값: {}", node, hash_node);
// 노드 RefCell { value: ListNode { val: 42, next: None } }에 저장된 값의 해시값: 15387811073369036852
```

```c title="built_in_hash.c"
// C는 해시 코드를 구하는 내장 함수를 제공하지 않는다
```

```kotlin title="built_in_hash.kt"
val num = 3
val hashNum = num.hashCode()
println("정수 $num → 해시값: $hashNum")
// 정수 3 → 해시값: 3

val bol = true
val hashBol = bol.hashCode()
println("불리언 $bol → 해시값: $hashBol")
// 불리언 true → 해시값: 1231

val dec = 3.14159
val hashDec = dec.hashCode()
println("실수 $dec → 해시값: $hashDec")
// 실수 3.14159 → 해시값: -1340954729

val str = "Hello 算法"
val hashStr = str.hashCode()
println("문자열 ‘$str’ → 해시값: $hashStr")
// 문자열 ‘Hello 算法’ → 해시값: -727081396

val arr = arrayOf<Any>(12836, "小哈")
val hashArr = arr.contentHashCode()
println("배열 ${arr.contentToString()} → 해시값: $hashArr")
// 배열 [12836, 小哈] → 해시값: 1151158

val obj = ListNode(0)
val hashObj = obj.hashCode()
println("노드 객체 $obj → 해시값: $hashObj")
// 노드 객체 utils.ListNode@1d81eb93 → 해시값: 495053715
```

```ruby title="built_in_hash.rb"
num = 3
hash_num = num.hash
puts "정수 #{num} → 해시값: #{hash_num}"
# 정수 3 → 해시값: -4385856518450339636

bol = true
hash_bol = bol.hash
puts "불리언 #{bol} → 해시값: #{hash_bol}"
# 불리언 true → 해시값: -1617938112149317027

dec = 3.14159
hash_dec = dec.hash
puts "실수 #{dec} → 해시값: #{hash_dec}"
# 실수 3.14159 → 해시값: -1479186995943067893

str = "Hello 算法"
hash_str = str.hash
puts "문자열 ‘#{str}’ → 해시값: #{hash_str}"
# 문자열 ‘Hello 算法’ → 해시값: -4075943250025831763

arr = [12836, '小哈']
hash_arr = arr.hash
puts "배열 #{arr} → 해시값: #{hash_arr}"
# 배열 [12836, "小哈"] → 해시값: 1999544809202288822

obj = ListNode.new(0)
hash_obj = obj.hash
puts "노드 객체 #{obj} → 해시값: #{hash_obj}"
# 노드 객체 #<ListNode:0x000078133140ab70> → 해시값: 4302940560806366381
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%9D%98%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%85%B8%EB%93%9C%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%EC%A0%95%EC%88%98%20%7Bnum%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%EC%A0%95%EC%88%98%203%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%EB%B6%88%EB%A6%AC%EC%96%B8%20%EA%B0%92%20%7Bbol%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%EB%B6%88%EB%A6%AC%EC%96%B8%20%EA%B0%92%20True%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%EB%B6%80%EB%8F%99%EC%86%8C%EC%88%98%EC%A0%90%20%EC%88%98%20%7Bdec%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%EB%B6%80%EB%8F%99%EC%86%8C%EC%88%98%EC%A0%90%20%EC%88%98%203.14159%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%EB%AC%B8%EC%9E%90%EC%97%B4%20%E2%80%98%7Bstr%7D%E2%80%99%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%EB%AC%B8%EC%9E%90%EC%97%B4%20%E2%80%98Hello%20%E7%AE%97%E6%B3%95%E2%80%99%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%ED%8A%9C%ED%94%8C%20%7Btup%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%ED%8A%9C%ED%94%8C%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%EB%85%B8%EB%93%9C%20%EA%B0%9D%EC%B2%B4%20%7Bobj%7D%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%9D%EC%B2%B4%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%EC%9D%98%20%ED%95%B4%EC%8B%9C%EA%B0%92%3A%20274267521%0A&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
