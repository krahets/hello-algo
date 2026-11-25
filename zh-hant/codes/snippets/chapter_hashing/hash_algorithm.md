<!-- [snippet]{builtin_hash} -->
```python title="built_in_hash.py"
num = 3
hash_num = hash(num)
print(f"整數 {num} 的雜湊值為 {hash_num}")
# 整數 3 的雜湊值為 3

bol = True
hash_bol = hash(bol)
print(f"布林值 {bol} 的雜湊值為 {hash_bol}")
# 布林值 True 的雜湊值為 1

dec = 3.14159
hash_dec = hash(dec)
print(f"小數 {dec} 的雜湊值為 {hash_dec}")
# 小數 3.14159 的雜湊值為 326484311674566659

str = "Hello 算法"
hash_str = hash(str)
print(f"字串「{str}」的雜湊值為 {hash_str}")
# 字串「Hello 算法」的雜湊值為 4617003410720528961

tup = (12836, "小哈")
hash_tup = hash(tup)
print(f"元組 {tup} 的雜湊值為 {hash_tup}")
# 元組 (12836, '小哈') 的雜湊值為 1029005403108185979

obj = ListNode(0)
hash_obj = hash(obj)
print(f"節點物件 {obj} 的雜湊值為 {hash_obj}")
# 節點物件 <modules.list_node.ListNode object at 0x1058fd810> 的雜湊值為 274267521
```

```cpp title="built_in_hash.cpp"
int num = 3;
size_t hashNum = hash<int>()(num);
cout << "整數 " << num << " 的雜湊值為 " << hashNum << "\n";
// 整數 3 的雜湊值為 3

bool bol = true;
size_t hashBol = hash<bool>()(bol);
cout << "布林值 " << bol << " 的雜湊值為 " << hashBol << "\n";
// 布林值 1 的雜湊值為 1

double dec = 3.14159;
size_t hashDec = hash<double>()(dec);
cout << "小數 " << dec << " 的雜湊值為 " << hashDec << "\n";
// 小數 3.14159 的雜湊值為 4614256650576692846

string str = "Hello 算法";
size_t hashStr = hash<string>()(str);
cout << "字串「" << str << "」的雜湊值為 " << hashStr << "\n";
// 字串「Hello 算法」的雜湊值為 15466937326284535026

// 在 C++ 中，內建的 std::hash() 只支援基本資料型別與部分標準函式庫型別（例如 std::string）的雜湊值計算
// 若要計算陣列與物件的雜湊值，必須自行實作
```

```java title="built_in_hash.java"
int num = 3;
int hashNum = Integer.hashCode(num);
System.out.println("整數 " + num + " 的雜湊值為 " + hashNum);
// 整數 3 的雜湊值為 3

boolean bol = true;
int hashBol = Boolean.hashCode(bol);
System.out.println("布林值 " + bol + " 的雜湊值為 " + hashBol);
// 布林值 true 的雜湊值為 1231

double dec = 3.14159;
int hashDec = Double.hashCode(dec);
System.out.println("小數 " + dec + " 的雜湊值為 " + hashDec);
// 小數 3.14159 的雜湊值為 -1340954729

String str = "Hello 算法";
int hashStr = str.hashCode();
System.out.println("字串「" + str + "」的雜湊值為 " + hashStr);
// 字串「Hello 算法」的雜湊值為 -727081396

Object[] arr = { 12836, "小哈" };
int hashArr = Arrays.hashCode(arr);
System.out.println("陣列 " + Arrays.toString(arr) + " 的雜湊值為 " + hashArr);
// 陣列 [12836, 小哈] 的雜湊值為 1151158

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode();
System.out.println("節點物件 " + obj + " 的雜湊值為 " + hashObj);
// 節點物件 utils.ListNode@7dc5e7b4 的雜湊值為 2110121908
```

```csharp title="built_in_hash.cs"
int num = 3;
int hashNum = num.GetHashCode();
Console.WriteLine("整數 " + num + " 的雜湊值為 " + hashNum);
// 整數 3 的雜湊值為 3

bool bol = true;
int hashBol = bol.GetHashCode();
Console.WriteLine("布林值 " + bol + " 的雜湊值為 " + hashBol);
// 布林值 True 的雜湊值為 1

double dec = 3.14159;
int hashDec = dec.GetHashCode();
Console.WriteLine("小數 " + dec + " 的雜湊值為 " + hashDec);
// 小數 3.14159 的雜湊值為 -1340954729

string str = "Hello 算法";
int hashStr = str.GetHashCode();
Console.WriteLine("字串「" + str + "」的雜湊值為 " + hashStr);
// 字串「Hello 算法」的雜湊值為 -586107568

object[] arr = [12836, "小哈"];
int hashArr = arr.GetHashCode();
Console.WriteLine("陣列 [" + string.Join(", ", arr) + "] 的雜湊值為 " + hashArr);
// 陣列 [12836, 小哈] 的雜湊值為 42931033

ListNode obj = new(0);
int hashObj = obj.GetHashCode();
Console.WriteLine("節點物件 " + obj + " 的雜湊值為 " + hashObj);
// 節點物件 0 的雜湊值為 39053774
```

```go title="built_in_hash.go"
// Go 沒有內建的雜湊碼函式
```

```swift title="built_in_hash.swift"
let num = 3
let hashNum = num.hashValue
print("整數 \(num) 的雜湊值為 \(hashNum)")
// 整數 3 的雜湊值為 9047044699613009734

let bol = true
let hashBol = bol.hashValue
print("布林值 \(bol) 的雜湊值為 \(hashBol)")
// 布林值 true 的雜湊值為 -4431640247352757451

let dec = 3.14159
let hashDec = dec.hashValue
print("小數 \(dec) 的雜湊值為 \(hashDec)")
// 小數 3.14159 的雜湊值為 -2465384235396674631

let str = "Hello 算法"
let hashStr = str.hashValue
print("字串「\(str)」的雜湊值為 \(hashStr)")
// 字串「Hello 算法」的雜湊值為 -7850626797806988787

let arr = [AnyHashable(12836), AnyHashable("小哈")]
let hashArr = arr.hashValue
print("陣列 \(arr) 的雜湊值為 \(hashArr)")
// 陣列 [AnyHashable(12836), AnyHashable("小哈")] 的雜湊值為 -2308633508154532996

let obj = ListNode(x: 0)
let hashObj = obj.hashValue
print("節點物件 \(obj) 的雜湊值為 \(hashObj)")
// 節點物件 utils.ListNode 的雜湊值為 -2434780518035996159
```

```javascript title="built_in_hash.js"
// JavaScript 沒有內建的雜湊碼函式
```

```typescript title="built_in_hash.ts"
// TypeScript 沒有內建的雜湊碼函式
```

```dart title="built_in_hash.dart"
int num = 3;
int hashNum = num.hashCode;
print("整數 $num 的雜湊值為 $hashNum");
// 整數 3 的雜湊值為 34803

bool bol = true;
int hashBol = bol.hashCode;
print("布林值 $bol 的雜湊值為 $hashBol");
// 布林值 true 的雜湊值為 1231

double dec = 3.14159;
int hashDec = dec.hashCode;
print("小數 $dec 的雜湊值為 $hashDec");
// 小數 3.14159 的雜湊值為 2570631074981783

String str = "Hello 算法";
int hashStr = str.hashCode;
print("字串「$str」的雜湊值為 $hashStr");
// 字串「Hello 算法」的雜湊值為 468167534

List arr = [12836, "小哈"];
int hashArr = arr.hashCode;
print("陣列 $arr 的雜湊值為 $hashArr");
// 陣列 [12836, 小哈] 的雜湊值為 976512528

ListNode obj = ListNode(0);
int hashObj = obj.hashCode;
print("節點物件 $obj 的雜湊值為 $hashObj");
// 節點物件 Instance of 'ListNode' 的雜湊值為 1033450432
```

```rust title="built_in_hash.rs"
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

let num = 3;
let mut num_hasher = DefaultHasher::new();
num.hash(&mut num_hasher);
let hash_num = num_hasher.finish();
println!("整數 {} 的雜湊值為 {}", num, hash_num);
// 整數 3 的雜湊值為 568126464209439262

let bol = true;
let mut bol_hasher = DefaultHasher::new();
bol.hash(&mut bol_hasher);
let hash_bol = bol_hasher.finish();
println!("布林值 {} 的雜湊值為 {}", bol, hash_bol);
// 布林值 true 的雜湊值為 4952851536318644461

let dec: f32 = 3.14159;
let mut dec_hasher = DefaultHasher::new();
dec.to_bits().hash(&mut dec_hasher);
let hash_dec = dec_hasher.finish();
println!("小數 {} 的雜湊值為 {}", dec, hash_dec);
// 小數 3.14159 的雜湊值為 2566941990314602357

let str = "Hello 算法";
let mut str_hasher = DefaultHasher::new();
str.hash(&mut str_hasher);
let hash_str = str_hasher.finish();
println!("字串「{}」的雜湊值為 {}", str, hash_str);
// 字串「Hello 算法」的雜湊值為 16092673739211250988

let tup = (&12836, &"小哈");
let mut tup_hasher = DefaultHasher::new();
tup.hash(&mut tup_hasher);
let hash_tup = tup_hasher.finish();
println!("元組 {:?} 的雜湊值為 {}", tup, hash_tup);
// 元組 (12836, "小哈") 的雜湊值為 1885128010422702749

let node = ListNode::new(42);
let mut node_hasher = DefaultHasher::new();
node.borrow().val.hash(&mut node_hasher);
let hash_node = node_hasher.finish();
println!("節點 {:?} 中所存值的雜湊值為 {}", node, hash_node);
// 節點 RefCell { value: ListNode { val: 42, next: None } } 中所存值的雜湊值為 15387811073369036852
```

```c title="built_in_hash.c"
// C 沒有內建的雜湊碼函式
```

```kotlin title="built_in_hash.kt"
val num = 3
val hashNum = num.hashCode()
println("整數 $num 的雜湊值為 $hashNum")
// 整數 3 的雜湊值為 3

val bol = true
val hashBol = bol.hashCode()
println("布林值 $bol 的雜湊值為 $hashBol")
// 布林值 true 的雜湊值為 1231

val dec = 3.14159
val hashDec = dec.hashCode()
println("小數 $dec 的雜湊值為 $hashDec")
// 小數 3.14159 的雜湊值為 -1340954729

val str = "Hello 算法"
val hashStr = str.hashCode()
println("字串「$str」的雜湊值為 $hashStr")
// 字串「Hello 算法」的雜湊值為 -727081396

val arr = arrayOf<Any>(12836, "小哈")
val hashArr = arr.contentHashCode()
println("陣列 ${arr.contentToString()} 的雜湊值為 $hashArr")
// 陣列 [12836, 小哈] 的雜湊值為 1151158

val obj = ListNode(0)
val hashObj = obj.hashCode()
println("節點物件 $obj 的雜湊值為 $hashObj")
// 節點物件 utils.ListNode@1d81eb93 的雜湊值為 495053715
```

```ruby title="built_in_hash.rb"
num = 3
hash_num = num.hash
puts "整數 #{num} 的雜湊值為 #{hash_num}"
# 整數 3 的雜湊值為 -4385856518450339636

bol = true
hash_bol = bol.hash
puts "布林值 #{bol} 的雜湊值為 #{hash_bol}"
# 布林值 true 的雜湊值為 -1617938112149317027

dec = 3.14159
hash_dec = dec.hash
puts "小數 #{dec} 的雜湊值為 #{hash_dec}"
# 小數 3.14159 的雜湊值為 -1479186995943067893

str = "Hello 算法"
hash_str = str.hash
puts "字串「#{str}」的雜湊值為 #{hash_str}"
# 字串「Hello 算法」的雜湊值為 -4075943250025831763

arr = [12836, '小哈']
hash_arr = arr.hash
puts "陣列 #{arr} 的雜湊值為 #{hash_arr}"
# 陣列 [12836, "小哈"] 的雜湊值為 1999544809202288822

obj = ListNode.new(0)
hash_obj = obj.hash
puts "節點物件 #{obj} 的雜湊值為 #{hash_obj}"
# 節點物件 #<ListNode:0x000078133140ab70> 的雜湊值為 4302940560806366381
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%8F%88%E7%B5%90%E4%B8%B2%E5%88%97%E7%9A%84%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%8C%87%E5%90%91%E4%B8%8B%E4%B8%80%E5%80%8B%E7%AF%80%E9%BB%9E%E7%9A%84%E5%8F%83%E7%85%A7%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%E6%95%B4%E6%95%B8%20%7Bnum%7D%20%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B8%203%20%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%E5%B8%83%E6%9E%97%E5%80%BC%20%7Bbol%7D%20%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%E5%B8%83%E6%9E%97%E5%80%BC%20True%20%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%E5%B0%8F%E6%95%B8%20%7Bdec%7D%20%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%E5%B0%8F%E6%95%B8%203.14159%20%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%E5%AD%97%E4%B8%B2%E3%80%8C%7Bstr%7D%E3%80%8D%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%E5%AD%97%E4%B8%B2%E3%80%8CHello%20%E7%AE%97%E6%B3%95%E3%80%8D%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%E5%85%83%E7%B5%84%20%7Btup%7D%20%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%E5%85%83%E7%B5%84%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%20%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%E7%AF%80%E9%BB%9E%E7%89%A9%E4%BB%B6%20%7Bobj%7D%20%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E7%89%A9%E4%BB%B6%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%E7%9A%84%E9%9B%9C%E6%B9%8A%E5%80%BC%E7%82%BA%20274267521%0A&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
