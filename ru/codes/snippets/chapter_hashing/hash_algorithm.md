<!-- [snippet]{builtin_hash} -->
```python title="built_in_hash.py"
num = 3
hash_num = hash(num)
print(f"Целое число {num} имеет хеш {hash_num}")
# Целое число 3 имеет хеш 3

bol = True
hash_bol = hash(bol)
print(f"Логическое значение {bol} имеет хеш {hash_bol}")
# Логическое значение True имеет хеш 1

dec = 3.14159
hash_dec = hash(dec)
print(f"Вещественное число {dec} имеет хеш {hash_dec}")
# Вещественное число 3.14159 имеет хеш 326484311674566659

str = "Hello 算法"
hash_str = hash(str)
print(f"Строка «{str}» имеет хеш {hash_str}")
# Строка «Hello 算法» имеет хеш 4617003410720528961

tup = (12836, "小哈")
hash_tup = hash(tup)
print(f"Кортеж {tup} имеет хеш {hash_tup}")
# Кортеж (12836, '小哈') имеет хеш 1029005403108185979

obj = ListNode(0)
hash_obj = hash(obj)
print(f"Объект узла {obj} имеет хеш {hash_obj}")
# Объект узла <modules.list_node.ListNode object at 0x1058fd810> имеет хеш 274267521
```

```cpp title="built_in_hash.cpp"
int num = 3;
size_t hashNum = hash<int>()(num);
cout << "Целое число " << num << " имеет хеш " << hashNum << "\n";
// Целое число 3 имеет хеш 3

bool bol = true;
size_t hashBol = hash<bool>()(bol);
cout << "Логическое значение " << bol << " имеет хеш " << hashBol << "\n";
// Логическое значение 1 имеет хеш 1

double dec = 3.14159;
size_t hashDec = hash<double>()(dec);
cout << "Вещественное число " << dec << " имеет хеш " << hashDec << "\n";
// Вещественное число 3.14159 имеет хеш 4614256650576692846

string str = "Hello 算法";
size_t hashStr = hash<string>()(str);
cout << "Строка «" << str << "» имеет хеш " << hashStr << "\n";
// Строка «Hello 算法» имеет хеш 15466937326284535026

// В C++ встроенный шаблон std::hash() вычисляет хеши только для базовых типов и некоторых типов стандартной библиотеки (например, std::string)
// Для массивов и объектов вычисление хеша нужно реализовать самостоятельно
```

```java title="built_in_hash.java"
int num = 3;
int hashNum = Integer.hashCode(num);
System.out.println("Целое число " + num + " имеет хеш " + hashNum);
// Целое число 3 имеет хеш 3

boolean bol = true;
int hashBol = Boolean.hashCode(bol);
System.out.println("Логическое значение " + bol + " имеет хеш " + hashBol);
// Логическое значение true имеет хеш 1231

double dec = 3.14159;
int hashDec = Double.hashCode(dec);
System.out.println("Вещественное число " + dec + " имеет хеш " + hashDec);
// Вещественное число 3.14159 имеет хеш -1340954729

String str = "Hello 算法";
int hashStr = str.hashCode();
System.out.println("Строка «" + str + "» имеет хеш " + hashStr);
// Строка «Hello 算法» имеет хеш -727081396

Object[] arr = { 12836, "小哈" };
int hashArr = Arrays.hashCode(arr);
System.out.println("Массив " + Arrays.toString(arr) + " имеет хеш " + hashArr);
// Массив [12836, 小哈] имеет хеш 1151158

ListNode obj = new ListNode(0);
int hashObj = obj.hashCode();
System.out.println("Объект узла " + obj + " имеет хеш " + hashObj);
// Объект узла utils.ListNode@7dc5e7b4 имеет хеш 2110121908
```

```csharp title="built_in_hash.cs"
int num = 3;
int hashNum = num.GetHashCode();
Console.WriteLine("Целое число " + num + " имеет хеш " + hashNum);
// Целое число 3 имеет хеш 3

bool bol = true;
int hashBol = bol.GetHashCode();
Console.WriteLine("Логическое значение " + bol + " имеет хеш " + hashBol);
// Логическое значение True имеет хеш 1

double dec = 3.14159;
int hashDec = dec.GetHashCode();
Console.WriteLine("Вещественное число " + dec + " имеет хеш " + hashDec);
// Вещественное число 3.14159 имеет хеш -1340954729

string str = "Hello 算法";
int hashStr = str.GetHashCode();
Console.WriteLine("Строка «" + str + "» имеет хеш " + hashStr);
// Строка «Hello 算法» имеет хеш -586107568

object[] arr = [12836, "小哈"];
int hashArr = arr.GetHashCode();
Console.WriteLine("Массив [" + string.Join(", ", arr) + "] имеет хеш " + hashArr);
// Массив [12836, 小哈] имеет хеш 42931033

ListNode obj = new(0);
int hashObj = obj.GetHashCode();
Console.WriteLine("Объект узла " + obj + " имеет хеш " + hashObj);
// Объект узла 0 имеет хеш 39053774
```

```go title="built_in_hash.go"
// В Go нет встроенной функции вычисления хеша
```

```swift title="built_in_hash.swift"
let num = 3
let hashNum = num.hashValue
print("Целое число \(num) имеет хеш \(hashNum)")
// Целое число 3 имеет хеш 9047044699613009734

let bol = true
let hashBol = bol.hashValue
print("Логическое значение \(bol) имеет хеш \(hashBol)")
// Логическое значение true имеет хеш -4431640247352757451

let dec = 3.14159
let hashDec = dec.hashValue
print("Вещественное число \(dec) имеет хеш \(hashDec)")
// Вещественное число 3.14159 имеет хеш -2465384235396674631

let str = "Hello 算法"
let hashStr = str.hashValue
print("Строка «\(str)» имеет хеш \(hashStr)")
// Строка «Hello 算法» имеет хеш -7850626797806988787

let arr = [AnyHashable(12836), AnyHashable("小哈")]
let hashArr = arr.hashValue
print("Массив \(arr) имеет хеш \(hashArr)")
// Массив [AnyHashable(12836), AnyHashable("小哈")] имеет хеш -2308633508154532996

let obj = ListNode(x: 0)
let hashObj = obj.hashValue
print("Объект узла \(obj) имеет хеш \(hashObj)")
// Объект узла utils.ListNode имеет хеш -2434780518035996159
```

```javascript title="built_in_hash.js"
// В JavaScript нет встроенной функции вычисления хеша
```

```typescript title="built_in_hash.ts"
// В TypeScript нет встроенной функции вычисления хеша
```

```dart title="built_in_hash.dart"
int num = 3;
int hashNum = num.hashCode;
print("Целое число $num имеет хеш $hashNum");
// Целое число 3 имеет хеш 34803

bool bol = true;
int hashBol = bol.hashCode;
print("Логическое значение $bol имеет хеш $hashBol");
// Логическое значение true имеет хеш 1231

double dec = 3.14159;
int hashDec = dec.hashCode;
print("Вещественное число $dec имеет хеш $hashDec");
// Вещественное число 3.14159 имеет хеш 2570631074981783

String str = "Hello 算法";
int hashStr = str.hashCode;
print("Строка «$str» имеет хеш $hashStr");
// Строка «Hello 算法» имеет хеш 468167534

List arr = [12836, "小哈"];
int hashArr = arr.hashCode;
print("Массив $arr имеет хеш $hashArr");
// Массив [12836, 小哈] имеет хеш 976512528

ListNode obj = ListNode(0);
int hashObj = obj.hashCode;
print("Объект узла $obj имеет хеш $hashObj");
// Объект узла Instance of 'ListNode' имеет хеш 1033450432
```

```rust title="built_in_hash.rs"
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};

let num = 3;
let mut num_hasher = DefaultHasher::new();
num.hash(&mut num_hasher);
let hash_num = num_hasher.finish();
println!("Целое число {} имеет хеш {}", num, hash_num);
// Целое число 3 имеет хеш 568126464209439262

let bol = true;
let mut bol_hasher = DefaultHasher::new();
bol.hash(&mut bol_hasher);
let hash_bol = bol_hasher.finish();
println!("Логическое значение {} имеет хеш {}", bol, hash_bol);
// Логическое значение true имеет хеш 4952851536318644461

let dec: f32 = 3.14159;
let mut dec_hasher = DefaultHasher::new();
dec.to_bits().hash(&mut dec_hasher);
let hash_dec = dec_hasher.finish();
println!("Вещественное число {} имеет хеш {}", dec, hash_dec);
// Вещественное число 3.14159 имеет хеш 2566941990314602357

let str = "Hello 算法";
let mut str_hasher = DefaultHasher::new();
str.hash(&mut str_hasher);
let hash_str = str_hasher.finish();
println!("Строка «{}» имеет хеш {}", str, hash_str);
// Строка «Hello 算法» имеет хеш 16092673739211250988

let tup = (&12836, &"小哈");
let mut tup_hasher = DefaultHasher::new();
tup.hash(&mut tup_hasher);
let hash_tup = tup_hasher.finish();
println!("Кортеж {:?} имеет хеш {}", tup, hash_tup);
// Кортеж (12836, "小哈") имеет хеш 1885128010422702749

let node = ListNode::new(42);
let mut node_hasher = DefaultHasher::new();
node.borrow().val.hash(&mut node_hasher);
let hash_node = node_hasher.finish();
println!("Значение узла {:?} имеет хеш {}", node, hash_node);
// Значение узла RefCell { value: ListNode { val: 42, next: None } } имеет хеш 15387811073369036852
```

```c title="built_in_hash.c"
// В C нет встроенной функции вычисления хеша
```

```kotlin title="built_in_hash.kt"
val num = 3
val hashNum = num.hashCode()
println("Целое число $num имеет хеш $hashNum")
// Целое число 3 имеет хеш 3

val bol = true
val hashBol = bol.hashCode()
println("Логическое значение $bol имеет хеш $hashBol")
// Логическое значение true имеет хеш 1231

val dec = 3.14159
val hashDec = dec.hashCode()
println("Вещественное число $dec имеет хеш $hashDec")
// Вещественное число 3.14159 имеет хеш -1340954729

val str = "Hello 算法"
val hashStr = str.hashCode()
println("Строка «$str» имеет хеш $hashStr")
// Строка «Hello 算法» имеет хеш -727081396

val arr = arrayOf<Any>(12836, "小哈")
val hashArr = arr.contentHashCode()
println("Массив ${arr.contentToString()} имеет хеш $hashArr")
// Массив [12836, 小哈] имеет хеш 1151158

val obj = ListNode(0)
val hashObj = obj.hashCode()
println("Объект узла $obj имеет хеш $hashObj")
// Объект узла utils.ListNode@1d81eb93 имеет хеш 495053715
```

```ruby title="built_in_hash.rb"
num = 3
hash_num = num.hash
puts "Целое число #{num} имеет хеш #{hash_num}"
# Целое число 3 имеет хеш -4385856518450339636

bol = true
hash_bol = bol.hash
puts "Логическое значение #{bol} имеет хеш #{hash_bol}"
# Логическое значение true имеет хеш -1617938112149317027

dec = 3.14159
hash_dec = dec.hash
puts "Вещественное число #{dec} имеет хеш #{hash_dec}"
# Вещественное число 3.14159 имеет хеш -1479186995943067893

str = "Hello 算法"
hash_str = str.hash
puts "Строка «#{str}» имеет хеш #{hash_str}"
# Строка «Hello 算法» имеет хеш -4075943250025831763

arr = [12836, '小哈']
hash_arr = arr.hash
puts "Массив #{arr} имеет хеш #{hash_arr}"
# Массив [12836, "小哈"] имеет хеш 1999544809202288822

obj = ListNode.new(0)
hash_obj = obj.hash
puts "Объект узла #{obj} имеет хеш #{hash_obj}"
# Объект узла #<ListNode:0x000078133140ab70> имеет хеш 4302940560806366381
```

<!-- [tutor]{builtin_hash_tutor} -->
https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D1%86%D0%B5%D0%BB%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%7Bnum%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_num%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D1%86%D0%B5%D0%BB%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%203%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BB%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%7Bbol%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_bol%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%BB%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20True%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%B4%D1%80%D0%BE%D0%B1%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%20%7Bdec%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_dec%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%B4%D1%80%D0%BE%D0%B1%D0%BD%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0%203.14159%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%C2%AB%7Bstr%7D%C2%BB%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_str%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8%20%C2%ABHello%20%E7%AE%97%E6%B3%95%C2%BB%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BA%D0%BE%D1%80%D1%82%D0%B5%D0%B6%D0%B0%20%7Btup%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_tup%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%BA%D0%BE%D1%80%D1%82%D0%B5%D0%B6%D0%B0%20%2812836,%20%27%E5%B0%8F%E5%93%88%27%29%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20print%28f%22%D0%A5%D0%B5%D1%88%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%20%7Bobj%7D%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20%7Bhash_obj%7D%22%29%0A%20%20%20%20%23%20%D0%A5%D0%B5%D1%88%20%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%B0%20%D1%83%D0%B7%D0%BB%D0%B0%20%3Cmodules.list_node.ListNode%20object%20at%200x1058fd810%3E%20%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%20274267521%0A&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
