<!-- [snippet]{builtin_hash} -->
```python title="built_in_hash.py"
num = 3
hash_num = hash(num)
print(f"Integer {num} has hash value {hash_num}")
# Integer 3 has hash value 3

bol = True
hash_bol = hash(bol)
print(f"Boolean {bol} has hash value {hash_bol}")
# Boolean True has hash value 1

dec = 3.14159
hash_dec = hash(dec)
print(f"Floating-point number {dec} has hash value {hash_dec}")
# Floating-point number 3.14159 has hash value 326484311674566659

str = "Hello 算法"
hash_str = hash(str)
print(f"String '{str}' has hash value {hash_str}")
# String 'Hello 算法' has hash value 4617003410720528961

tup = (12836, "小哈")
hash_tup = hash(tup)
print(f"Tuple {tup} has hash value {hash_tup}")
# Tuple (12836, '小哈') has hash value 1029005403108185979

obj = ListNode(0)
hash_obj = hash(obj)
print(f"Node object {obj} has hash value {hash_obj}")
# Node object <modules.list_node.ListNode object at 0x1058fd810> has hash value 274267521
```

```cpp title="built_in_hash.cpp"
int num = 3;
size_t hashNum = hash<int>()(num);
cout << "Integer " << num << " has hash value " << hashNum << "\n";
// Integer 3 has hash value 3

bool bol = true;
size_t hashBol = hash<bool>()(bol);
cout << "Boolean " << bol << " has hash value " << hashBol << "\n";
// Boolean 1 has hash value 1

double dec = 3.14159;
size_t hashDec = hash<double>()(dec);
cout << "Floating-point number " << dec << " has hash value " << hashDec << "\n";
// Floating-point number 3.14159 has hash value 4614256650576692846

string str = "Hello 算法";
size_t hashStr = hash<string>()(str);
cout << "String '" << str << "' has hash value " << hashStr << "\n";
// String 'Hello 算法' has hash value 15466937326284535026

// In C++, the built-in std::hash() only computes hash values for basic data types and some standard library types (such as std::string)
// Hashing arrays and objects requires a custom implementation
```

```java title="built_in_hash.java"
int num = 3;
int hashNum = Integer.hashCode(num);
System.out.println("Integer " + num + " has hash value " + hashNum);
// Integer 3 has hash value 3

boolean bol = true;
int hashBol = Boolean.hashCode(bol);
System.out.println("Boolean " + bol + " has hash value " + hashBol);
// Boolean true has hash value 1231

double dec = 3.14159;
int hashDec = Double.hashCode(dec);
System.out.println("Floating-point number " + dec + " has hash value " + hashDec);
// Floating-point number 3.14159 has hash value -1340954729

String str = "Hello 算法";
int hashStr = str.hashCode();
System.out.println("String '" + str + "' has hash value " + hashStr);
// String 'Hello 算法' has hash value -727081396

Object[] arr = { 12836, "小哈" };
int hashArr = Arrays.hashCode(arr);
System.out.println("Array " + Arrays.toString(arr) + " has hash value " + hashArr);
// Array [12836, 小哈] has hash value 1151158

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode();
System.out.println("Node object " + obj + " has hash value " + hashObj);
// Node object utils.ListNode@7dc5e7b4 has hash value 2110121908
```

```csharp title="built_in_hash.cs"
int num = 3;
int hashNum = num.GetHashCode();
Console.WriteLine("Integer " + num + " has hash value " + hashNum);
// Integer 3 has hash value 3

bool bol = true;
int hashBol = bol.GetHashCode();
Console.WriteLine("Boolean " + bol + " has hash value " + hashBol);
// Boolean True has hash value 1

double dec = 3.14159;
int hashDec = dec.GetHashCode();
Console.WriteLine("Floating-point number " + dec + " has hash value " + hashDec);
// Floating-point number 3.14159 has hash value -1340954729

string str = "Hello 算法";
int hashStr = str.GetHashCode();
Console.WriteLine("String '" + str + "' has hash value " + hashStr);
// String 'Hello 算法' has hash value -586107568

object[] arr = [12836, "小哈"];
int hashArr = arr.GetHashCode();
Console.WriteLine("Array [" + string.Join(", ", arr) + "] has hash value " + hashArr);
// Array [12836, 小哈] has hash value 42931033

ListNode obj = new(0);
int hashObj = obj.GetHashCode();
Console.WriteLine("Node object " + obj + " has hash value " + hashObj);
// Node object 0 has hash value 39053774
```

```go title="built_in_hash.go"
// Go provides no built-in hash-code function
```

```swift title="built_in_hash.swift"
let num = 3
let hashNum = num.hashValue
print("Integer \(num) has hash value \(hashNum)")
// Integer 3 has hash value 9047044699613009734

let bol = true
let hashBol = bol.hashValue
print("Boolean \(bol) has hash value \(hashBol)")
// Boolean true has hash value -4431640247352757451

let dec = 3.14159
let hashDec = dec.hashValue
print("Floating-point number \(dec) has hash value \(hashDec)")
// Floating-point number 3.14159 has hash value -2465384235396674631

let str = "Hello 算法"
let hashStr = str.hashValue
print("String '\(str)' has hash value \(hashStr)")
// String 'Hello 算法' has hash value -7850626797806988787

let arr = [AnyHashable(12836), AnyHashable("小哈")]
let hashArr = arr.hashValue
print("Array \(arr) has hash value \(hashArr)")
// Array [AnyHashable(12836), AnyHashable("小哈")] has hash value -2308633508154532996

let obj = ListNode(x: 0)
let hashObj = obj.hashValue
print("Node object \(obj) has hash value \(hashObj)")
// Node object utils.ListNode has hash value -2434780518035996159
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
print("Integer $num has hash value $hashNum");
// Integer 3 has hash value 34803

bool bol = true;
int hashBol = bol.hashCode;
print("Boolean $bol has hash value $hashBol");
// Boolean true has hash value 1231

double dec = 3.14159;
int hashDec = dec.hashCode;
print("Floating-point number $dec has hash value $hashDec");
// Floating-point number 3.14159 has hash value 2570631074981783

String str = "Hello 算法";
int hashStr = str.hashCode;
print("String '$str' has hash value $hashStr");
// String 'Hello 算法' has hash value 468167534

List arr = [12836, "小哈"];
int hashArr = arr.hashCode;
print("Array $arr has hash value $hashArr");
// Array [12836, 小哈] has hash value 976512528

ListNode obj = ListNode(0);
int hashObj = obj.hashCode;
print("Node object $obj has hash value $hashObj");
// Node object Instance of 'ListNode' has hash value 1033450432
```

```rust title="built_in_hash.rs"
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

let num = 3;
let mut num_hasher = DefaultHasher::new();
num.hash(&mut num_hasher);
let hash_num = num_hasher.finish();
println!("Integer {} has hash value {}", num, hash_num);
// Integer 3 has hash value 568126464209439262

let bol = true;
let mut bol_hasher = DefaultHasher::new();
bol.hash(&mut bol_hasher);
let hash_bol = bol_hasher.finish();
println!("Boolean {} has hash value {}", bol, hash_bol);
// Boolean true has hash value 4952851536318644461

let dec: f32 = 3.14159;
let mut dec_hasher = DefaultHasher::new();
dec.to_bits().hash(&mut dec_hasher);
let hash_dec = dec_hasher.finish();
println!("Floating-point number {} has hash value {}", dec, hash_dec);
// Floating-point number 3.14159 has hash value 2566941990314602357

let str = "Hello 算法";
let mut str_hasher = DefaultHasher::new();
str.hash(&mut str_hasher);
let hash_str = str_hasher.finish();
println!("String '{}' has hash value {}", str, hash_str);
// String 'Hello 算法' has hash value 16092673739211250988

let tup = (&12836, &"小哈");
let mut tup_hasher = DefaultHasher::new();
tup.hash(&mut tup_hasher);
let hash_tup = tup_hasher.finish();
println!("Tuple {:?} has hash value {}", tup, hash_tup);
// Tuple (12836, "小哈") has hash value 1885128010422702749

let node = ListNode::new(42);
let mut node_hasher = DefaultHasher::new();
node.borrow().val.hash(&mut node_hasher);
let hash_node = node_hasher.finish();
println!("The value in node {:?} has hash value {}", node, hash_node);
// The value in node RefCell { value: ListNode { val: 42, next: None } } has hash value 15387811073369036852
```

```c title="built_in_hash.c"
// C provides no built-in hash-code function
```

```kotlin title="built_in_hash.kt"
val num = 3
val hashNum = num.hashCode()
println("Integer $num has hash value $hashNum")
// Integer 3 has hash value 3

val bol = true
val hashBol = bol.hashCode()
println("Boolean $bol has hash value $hashBol")
// Boolean true has hash value 1231

val dec = 3.14159
val hashDec = dec.hashCode()
println("Floating-point number $dec has hash value $hashDec")
// Floating-point number 3.14159 has hash value -1340954729

val str = "Hello 算法"
val hashStr = str.hashCode()
println("String '$str' has hash value $hashStr")
// String 'Hello 算法' has hash value -727081396

val arr = arrayOf<Any>(12836, "小哈")
val hashArr = arr.contentHashCode()
println("Array ${arr.contentToString()} has hash value $hashArr")
// Array [12836, 小哈] has hash value 1151158

val obj = ListNode(0)
val hashObj = obj.hashCode()
println("Node object $obj has hash value $hashObj")
// Node object utils.ListNode@1d81eb93 has hash value 495053715
```

```ruby title="built_in_hash.rb"
num = 3
hash_num = num.hash
puts "Integer #{num} has hash value #{hash_num}"
# Integer 3 has hash value -4385856518450339636

bol = true
hash_bol = bol.hash
puts "Boolean #{bol} has hash value #{hash_bol}"
# Boolean true has hash value -1617938112149317027

dec = 3.14159
hash_dec = dec.hash
puts "Floating-point number #{dec} has hash value #{hash_dec}"
# Floating-point number 3.14159 has hash value -1479186995943067893

str = "Hello 算法"
hash_str = str.hash
puts "String '#{str}' has hash value #{hash_str}"
# String 'Hello 算法' has hash value -4075943250025831763

arr = [12836, '小哈']
hash_arr = arr.hash
puts "Array #{arr} has hash value #{hash_arr}"
# Array [12836, "小哈"] has hash value 1999544809202288822

obj = ListNode.new(0)
hash_obj = obj.hash
puts "Node object #{obj} has hash value #{hash_obj}"
# Node object #<ListNode:0x000078133140ab70> has hash value 4302940560806366381
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22Linked-list%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20next%20node%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22Integer%20%7Bnum%7D%20has%20hash%20value%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20Integer%203%20has%20hash%20value%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22Boolean%20%7Bbol%7D%20has%20hash%20value%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20Boolean%20True%20has%20hash%20value%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22Floating-point%20number%20%7Bdec%7D%20has%20hash%20value%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20Floating-point%20number%203.14159%20has%20hash%20value%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22String%20%27%7Bstr%7D%27%20has%20hash%20value%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20String%20%27Hello%20%E7%AE%97%E6%B3%95%27%20has%20hash%20value%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836%2C%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22Tuple%20%7Btup%7D%20has%20hash%20value%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20Tuple%20%2812836%2C%20%27%E5%B0%8F%E5%93%88%27%29%20has%20hash%20value%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22Node%20object%20%7Bobj%7D%20has%20hash%20value%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20Node%20object%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20has%20hash%20value%20274267521%0A&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
