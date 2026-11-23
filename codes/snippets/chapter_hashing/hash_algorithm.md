<!-- [snippet]{builtin_hash} -->
```python title="built_in_hash.py"
num = 3
hash_num = hash(num)
print(f"整数 {num} 的哈希值为 {hash_num}")
# 整数 3 的哈希值为 3

bol = True
hash_bol = hash(bol)
print(f"布尔量 {bol} 的哈希值为 {hash_bol}")
# 布尔量 True 的哈希值为 1

dec = 3.14159
hash_dec = hash(dec)
print(f"小数 {dec} 的哈希值为 {hash_dec}")
# 小数 3.14159 的哈希值为 326484311674566659

str = "Hello 算法"
hash_str = hash(str)
print(f"字符串“{str}”的哈希值为 {hash_str}")
# 字符串“Hello 算法”的哈希值为 4617003410720528961

tup = (12836, "小哈")
hash_tup = hash(tup)
print(f"元组 {tup} 的哈希值为 {hash_tup}")
# 元组 (12836, '小哈') 的哈希值为 1029005403108185979

obj = ListNode(0)
hash_obj = hash(obj)
print(f"节点对象 {obj} 的哈希值为 {hash_obj}")
# 节点对象 <modules.list_node.ListNode object at 0x1058fd810> 的哈希值为 274267521
```

```cpp title="built_in_hash.cpp"
int num = 3;
size_t hashNum = hash<int>()(num);
cout << "整数 " << num << " 的哈希值为 " << hashNum << "\n";
// 整数 3 的哈希值为 3

bool bol = true;
size_t hashBol = hash<bool>()(bol);
cout << "布尔量 " << bol << " 的哈希值为 " << hashBol << "\n";
// 布尔量 1 的哈希值为 1

double dec = 3.14159;
size_t hashDec = hash<double>()(dec);
cout << "小数 " << dec << " 的哈希值为 " << hashDec << "\n";
// 小数 3.14159 的哈希值为 4614256650576692846

string str = "Hello 算法";
size_t hashStr = hash<string>()(str);
cout << "字符串“" << str << "”的哈希值为 " << hashStr << "\n";
// 字符串“Hello 算法”的哈希值为 15466937326284535026

// 在 C++ 中，内置 std::hash() 仅提供基本数据类型和部分标准库类型（如 std::string）的哈希值计算
// 数组、对象的哈希值计算需要自行实现
```

```java title="built_in_hash.java"
int num = 3;
int hashNum = Integer.hashCode(num);
System.out.println("整数 " + num + " 的哈希值为 " + hashNum);
// 整数 3 的哈希值为 3

boolean bol = true;
int hashBol = Boolean.hashCode(bol);
System.out.println("布尔量 " + bol + " 的哈希值为 " + hashBol);
// 布尔量 true 的哈希值为 1231

double dec = 3.14159;
int hashDec = Double.hashCode(dec);
System.out.println("小数 " + dec + " 的哈希值为 " + hashDec);
// 小数 3.14159 的哈希值为 -1340954729

String str = "Hello 算法";
int hashStr = str.hashCode();
System.out.println("字符串“" + str + "”的哈希值为 " + hashStr);
// 字符串“Hello 算法”的哈希值为 -727081396

Object[] arr = { 12836, "小哈" };
int hashArr = Arrays.hashCode(arr);
System.out.println("数组 " + Arrays.toString(arr) + " 的哈希值为 " + hashArr);
// 数组 [12836, 小哈] 的哈希值为 1151158

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode();
System.out.println("节点对象 " + obj + " 的哈希值为 " + hashObj);
// 节点对象 utils.ListNode@7dc5e7b4 的哈希值为 2110121908
```

```csharp title="built_in_hash.cs"
int num = 3;
int hashNum = num.GetHashCode();
Console.WriteLine("整数 " + num + " 的哈希值为 " + hashNum);
// 整数 3 的哈希值为 3

bool bol = true;
int hashBol = bol.GetHashCode();
Console.WriteLine("布尔量 " + bol + " 的哈希值为 " + hashBol);
// 布尔量 True 的哈希值为 1

double dec = 3.14159;
int hashDec = dec.GetHashCode();
Console.WriteLine("小数 " + dec + " 的哈希值为 " + hashDec);
// 小数 3.14159 的哈希值为 -1340954729

string str = "Hello 算法";
int hashStr = str.GetHashCode();
Console.WriteLine("字符串“" + str + "”的哈希值为 " + hashStr);
// 字符串“Hello 算法”的哈希值为 -586107568

object[] arr = [12836, "小哈"];
int hashArr = arr.GetHashCode();
Console.WriteLine("数组 [" + string.Join(", ", arr) + "] 的哈希值为 " + hashArr);
// 数组 [12836, 小哈] 的哈希值为 42931033

ListNode obj = new(0);
int hashObj = obj.GetHashCode();
Console.WriteLine("节点对象 " + obj + " 的哈希值为 " + hashObj);
// 节点对象 0 的哈希值为 39053774
```

```go title="built_in_hash.go"
// Go 未提供内置 hash code 函数
```

```swift title="built_in_hash.swift"
let num = 3
let hashNum = num.hashValue
print("整数 \(num) 的哈希值为 \(hashNum)")
// 整数 3 的哈希值为 9047044699613009734

let bol = true
let hashBol = bol.hashValue
print("布尔量 \(bol) 的哈希值为 \(hashBol)")
// 布尔量 true 的哈希值为 -4431640247352757451

let dec = 3.14159
let hashDec = dec.hashValue
print("小数 \(dec) 的哈希值为 \(hashDec)")
// 小数 3.14159 的哈希值为 -2465384235396674631

let str = "Hello 算法"
let hashStr = str.hashValue
print("字符串“\(str)”的哈希值为 \(hashStr)")
// 字符串“Hello 算法”的哈希值为 -7850626797806988787

let arr = [AnyHashable(12836), AnyHashable("小哈")]
let hashArr = arr.hashValue
print("数组 \(arr) 的哈希值为 \(hashArr)")
// 数组 [AnyHashable(12836), AnyHashable("小哈")] 的哈希值为 -2308633508154532996

let obj = ListNode(x: 0)
let hashObj = obj.hashValue
print("节点对象 \(obj) 的哈希值为 \(hashObj)")
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
print("整数 $num 的哈希值为 $hashNum");
// 整数 3 的哈希值为 34803

bool bol = true;
int hashBol = bol.hashCode;
print("布尔量 $bol 的哈希值为 $hashBol");
// 布尔量 true 的哈希值为 1231

double dec = 3.14159;
int hashDec = dec.hashCode;
print("小数 $dec 的哈希值为 $hashDec");
// 小数 3.14159 的哈希值为 2570631074981783

String str = "Hello 算法";
int hashStr = str.hashCode;
print("字符串“$str”的哈希值为 $hashStr");
// 字符串“Hello 算法”的哈希值为 468167534

List arr = [12836, "小哈"];
int hashArr = arr.hashCode;
print("数组 $arr 的哈希值为 $hashArr");
// 数组 [12836, 小哈] 的哈希值为 976512528

ListNode obj = ListNode(0);
int hashObj = obj.hashCode;
print("节点对象 $obj 的哈希值为 $hashObj");
// 节点对象 Instance of 'ListNode' 的哈希值为 1033450432
```

```rust title="built_in_hash.rs"
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

let num = 3;
let mut num_hasher = DefaultHasher::new();
num.hash(&mut num_hasher);
let hash_num = num_hasher.finish();
println!("整数 {} 的哈希值为 {}", num, hash_num);
// 整数 3 的哈希值为 568126464209439262

let bol = true;
let mut bol_hasher = DefaultHasher::new();
bol.hash(&mut bol_hasher);
let hash_bol = bol_hasher.finish();
println!("布尔量 {} 的哈希值为 {}", bol, hash_bol);
// 布尔量 true 的哈希值为 4952851536318644461

let dec: f32 = 3.14159;
let mut dec_hasher = DefaultHasher::new();
dec.to_bits().hash(&mut dec_hasher);
let hash_dec = dec_hasher.finish();
println!("小数 {} 的哈希值为 {}", dec, hash_dec);
// 小数 3.14159 的哈希值为 2566941990314602357

let str = "Hello 算法";
let mut str_hasher = DefaultHasher::new();
str.hash(&mut str_hasher);
let hash_str = str_hasher.finish();
println!("字符串“{}”的哈希值为 {}", str, hash_str);
// 字符串“Hello 算法”的哈希值为 16092673739211250988

let tup = (&12836, &"小哈");
let mut tup_hasher = DefaultHasher::new();
tup.hash(&mut tup_hasher);
let hash_tup = tup_hasher.finish();
println!("元组 {:?} 的哈希值为 {}", tup, hash_tup);
// 元组 (12836, "小哈") 的哈希值为 1885128010422702749

let node = ListNode::new(42);
let mut node_hasher = DefaultHasher::new();
node.borrow().val.hash(&mut node_hasher);
let hash_node = node_hasher.finish();
println!("节点 {:?} 中节点值的哈希值为 {}", node, hash_node);
// 节点 RefCell { value: ListNode { val: 42, next: None } } 中节点值的哈希值为 15387811073369036852
```

```c title="built_in_hash.c"
// C 未提供内置 hash code 函数
```

```kotlin title="built_in_hash.kt"
val num = 3
val hashNum = num.hashCode()
println("整数 $num 的哈希值为 $hashNum")
// 整数 3 的哈希值为 3

val bol = true
val hashBol = bol.hashCode()
println("布尔量 $bol 的哈希值为 $hashBol")
// 布尔量 true 的哈希值为 1231

val dec = 3.14159
val hashDec = dec.hashCode()
println("小数 $dec 的哈希值为 $hashDec")
// 小数 3.14159 的哈希值为 -1340954729

val str = "Hello 算法"
val hashStr = str.hashCode()
println("字符串“$str”的哈希值为 $hashStr")
// 字符串“Hello 算法”的哈希值为 -727081396

val arr = arrayOf<Any>(12836, "小哈")
val hashArr = arr.contentHashCode()
println("数组 ${arr.contentToString()} 的哈希值为 $hashArr")
// 数组 [12836, 小哈] 的哈希值为 1151158

val obj = ListNode(0)
val hashObj = obj.hashCode()
println("节点对象 $obj 的哈希值为 $hashObj")
// 节点对象 utils.ListNode@1d81eb93 的哈希值为 495053715
```

```ruby title="built_in_hash.rb"
num = 3
hash_num = num.hash
puts "整数 #{num} 的哈希值为 #{hash_num}"
# 整数 3 的哈希值为 -4385856518450339636

bol = true
hash_bol = bol.hash
puts "布尔量 #{bol} 的哈希值为 #{hash_bol}"
# 布尔量 true 的哈希值为 -1617938112149317027

dec = 3.14159
hash_dec = dec.hash
puts "小数 #{dec} 的哈希值为 #{hash_dec}"
# 小数 3.14159 的哈希值为 -1479186995943067893

str = "Hello 算法"
hash_str = str.hash
puts "字符串“#{str}”的哈希值为 #{hash_str}"
# 字符串“Hello 算法”的哈希值为 -4075943250025831763

arr = [12836, '小哈']
hash_arr = arr.hash
puts "数组 #{arr} 的哈希值为 #{hash_arr}"
# 数组 [12836, "小哈"] 的哈希值为 1999544809202288822

obj = ListNode.new(0)
hash_obj = obj.hash
puts "节点对象 #{obj} 的哈希值为 #{hash_obj}"
# 节点对象 #<ListNode:0x000078133140ab70> 的哈希值为 4302940560806366381
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%E6%95%B4%E6%95%B0%20%7Bnum%7D%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B0%203%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%E5%B8%83%E5%B0%94%E9%87%8F%20%7Bbol%7D%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%E5%B8%83%E5%B0%94%E9%87%8F%20True%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%E5%B0%8F%E6%95%B0%20%7Bdec%7D%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%E5%B0%8F%E6%95%B0%203.14159%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%E5%AD%97%E7%AC%A6%E4%B8%B2%E2%80%9C%7Bstr%7D%E2%80%9D%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%E5%AD%97%E7%AC%A6%E4%B8%B2%E2%80%9CHello%20%E7%AE%97%E6%B3%95%E2%80%9D%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%BB%84%20%7Btup%7D%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%E5%85%83%E7%BB%84%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%E8%8A%82%E7%82%B9%E5%AF%B9%E8%B1%A1%20%7Bobj%7D%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%E8%8A%82%E7%82%B9%E5%AF%B9%E8%B1%A1%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20274267521%0A&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
