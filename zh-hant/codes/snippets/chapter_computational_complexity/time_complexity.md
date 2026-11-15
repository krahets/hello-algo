<!-- [snippet]{run_time_estimate} -->
```python title=""
# 在某執行平臺下
def algorithm(n: int):
    a = 2      # 1 ns
    a = a + 1  # 1 ns
    a = a * 2  # 10 ns
    # 迴圈 n 次
    for _ in range(n):  # 1 ns
        print(0)        # 5 ns
```

```cpp title=""
// 在某執行平臺下
void algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // 迴圈 n 次
    for (int i = 0; i < n; i++) {  // 1 ns
        cout << 0 << endl;         // 5 ns
    }
}
```

```java title=""
// 在某執行平臺下
void algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // 迴圈 n 次
    for (int i = 0; i < n; i++) {  // 1 ns
        System.out.println(0);     // 5 ns
    }
}
```

```csharp title=""
// 在某執行平臺下
void Algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // 迴圈 n 次
    for (int i = 0; i < n; i++) {  // 1 ns
        Console.WriteLine(0);      // 5 ns
    }
}
```

```go title=""
// 在某執行平臺下
func algorithm(n int) {
    a := 2     // 1 ns
    a = a + 1  // 1 ns
    a = a * 2  // 10 ns
    // 迴圈 n 次
    for i := 0; i < n; i++ {  // 1 ns
        fmt.Println(a)        // 5 ns
    }
}
```

```swift title=""
// 在某執行平臺下
func algorithm(n: Int) {
    var a = 2 // 1 ns
    a = a + 1 // 1 ns
    a = a * 2 // 10 ns
    // 迴圈 n 次
    for _ in 0 ..< n { // 1 ns
        print(0) // 5 ns
    }
}
```

```javascript title=""
// 在某執行平臺下
function algorithm(n) {
    var a = 2; // 1 ns
    a = a + 1; // 1 ns
    a = a * 2; // 10 ns
    // 迴圈 n 次
    for(let i = 0; i < n; i++) { // 1 ns
        console.log(0); // 5 ns
    }
}
```

```typescript title=""
// 在某執行平臺下
function algorithm(n: number): void {
    var a: number = 2; // 1 ns
    a = a + 1; // 1 ns
    a = a * 2; // 10 ns
    // 迴圈 n 次
    for(let i = 0; i < n; i++) { // 1 ns
        console.log(0); // 5 ns
    }
}
```

```dart title=""
// 在某執行平臺下
void algorithm(int n) {
  int a = 2; // 1 ns
  a = a + 1; // 1 ns
  a = a * 2; // 10 ns
  // 迴圈 n 次
  for (int i = 0; i < n; i++) { // 1 ns
    print(0); // 5 ns
  }
}
```

```rust title=""
// 在某執行平臺下
fn algorithm(n: i32) {
    let mut a = 2;      // 1 ns
    a = a + 1;          // 1 ns
    a = a * 2;          // 10 ns
    // 迴圈 n 次
    for _ in 0..n {     // 1 ns
        println!("{}", 0);  // 5 ns
    }
}
```

```c title=""
// 在某執行平臺下
void algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // 迴圈 n 次
    for (int i = 0; i < n; i++) {   // 1 ns
        printf("%d", 0);            // 5 ns
    }
}
```

```kotlin title=""
// 在某執行平臺下
fun algorithm(n: Int) {
    var a = 2 // 1 ns
    a = a + 1 // 1 ns
    a = a * 2 // 10 ns
    // 迴圈 n 次
    for (i in 0..<n) {  // 1 ns
        println(0)      // 5 ns
    }
}
```

```ruby title=""
# 在某執行平臺下
def algorithm(n)
    a = 2       # 1 ns
    a = a + 1   # 1 ns
    a = a * 2   # 10 ns
    # 迴圈 n 次
    (0...n).each do # 1 ns
        puts 0      # 5 ns
    end
end
```

<!-- [snippet]{growth_trend} -->
```python title=""
# 演算法 A 的時間複雜度：常數階
def algorithm_A(n: int):
    print(0)
# 演算法 B 的時間複雜度：線性階
def algorithm_B(n: int):
    for _ in range(n):
        print(0)
# 演算法 C 的時間複雜度：常數階
def algorithm_C(n: int):
    for _ in range(1000000):
        print(0)
```

```cpp title=""
// 演算法 A 的時間複雜度：常數階
void algorithm_A(int n) {
    cout << 0 << endl;
}
// 演算法 B 的時間複雜度：線性階
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        cout << 0 << endl;
    }
}
// 演算法 C 的時間複雜度：常數階
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        cout << 0 << endl;
    }
}
```

```java title=""
// 演算法 A 的時間複雜度：常數階
void algorithm_A(int n) {
    System.out.println(0);
}
// 演算法 B 的時間複雜度：線性階
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        System.out.println(0);
    }
}
// 演算法 C 的時間複雜度：常數階
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        System.out.println(0);
    }
}
```

```csharp title=""
// 演算法 A 的時間複雜度：常數階
void AlgorithmA(int n) {
    Console.WriteLine(0);
}
// 演算法 B 的時間複雜度：線性階
void AlgorithmB(int n) {
    for (int i = 0; i < n; i++) {
        Console.WriteLine(0);
    }
}
// 演算法 C 的時間複雜度：常數階
void AlgorithmC(int n) {
    for (int i = 0; i < 1000000; i++) {
        Console.WriteLine(0);
    }
}
```

```go title=""
// 演算法 A 的時間複雜度：常數階
func algorithm_A(n int) {
    fmt.Println(0)
}
// 演算法 B 的時間複雜度：線性階
func algorithm_B(n int) {
    for i := 0; i < n; i++ {
        fmt.Println(0)
    }
}
// 演算法 C 的時間複雜度：常數階
func algorithm_C(n int) {
    for i := 0; i < 1000000; i++ {
        fmt.Println(0)
    }
}
```

```swift title=""
// 演算法 A 的時間複雜度：常數階
func algorithmA(n: Int) {
    print(0)
}

// 演算法 B 的時間複雜度：線性階
func algorithmB(n: Int) {
    for _ in 0 ..< n {
        print(0)
    }
}

// 演算法 C 的時間複雜度：常數階
func algorithmC(n: Int) {
    for _ in 0 ..< 1_000_000 {
        print(0)
    }
}
```

```javascript title=""
// 演算法 A 的時間複雜度：常數階
function algorithm_A(n) {
    console.log(0);
}
// 演算法 B 的時間複雜度：線性階
function algorithm_B(n) {
    for (let i = 0; i < n; i++) {
        console.log(0);
    }
}
// 演算法 C 的時間複雜度：常數階
function algorithm_C(n) {
    for (let i = 0; i < 1000000; i++) {
        console.log(0);
    }
}

```

```typescript title=""
// 演算法 A 的時間複雜度：常數階
function algorithm_A(n: number): void {
    console.log(0);
}
// 演算法 B 的時間複雜度：線性階
function algorithm_B(n: number): void {
    for (let i = 0; i < n; i++) {
        console.log(0);
    }
}
// 演算法 C 的時間複雜度：常數階
function algorithm_C(n: number): void {
    for (let i = 0; i < 1000000; i++) {
        console.log(0);
    }
}
```

```dart title=""
// 演算法 A 的時間複雜度：常數階
void algorithmA(int n) {
  print(0);
}
// 演算法 B 的時間複雜度：線性階
void algorithmB(int n) {
  for (int i = 0; i < n; i++) {
    print(0);
  }
}
// 演算法 C 的時間複雜度：常數階
void algorithmC(int n) {
  for (int i = 0; i < 1000000; i++) {
    print(0);
  }
}
```

```rust title=""
// 演算法 A 的時間複雜度：常數階
fn algorithm_A(n: i32) {
    println!("{}", 0);
}
// 演算法 B 的時間複雜度：線性階
fn algorithm_B(n: i32) {
    for _ in 0..n {
        println!("{}", 0);
    }
}
// 演算法 C 的時間複雜度：常數階
fn algorithm_C(n: i32) {
    for _ in 0..1000000 {
        println!("{}", 0);
    }
}
```

```c title=""
// 演算法 A 的時間複雜度：常數階
void algorithm_A(int n) {
    printf("%d", 0);
}
// 演算法 B 的時間複雜度：線性階
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        printf("%d", 0);
    }
}
// 演算法 C 的時間複雜度：常數階
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        printf("%d", 0);
    }
}
```

```kotlin title=""
// 演算法 A 的時間複雜度：常數階
fun algoritm_A(n: Int) {
    println(0)
}
// 演算法 B 的時間複雜度：線性階
fun algorithm_B(n: Int) {
    for (i in 0..<n){
        println(0)
    }
}
// 演算法 C 的時間複雜度：常數階
fun algorithm_C(n: Int) {
    for (i in 0..<1000000) {
        println(0)
    }
}
```

```ruby title=""
# 演算法 A 的時間複雜度：常數階
def algorithm_A(n)
    puts 0
end

# 演算法 B 的時間複雜度：線性階
def algorithm_B(n)
    (0...n).each { puts 0 }
end

# 演算法 C 的時間複雜度：常數階
def algorithm_C(n)
    (0...1_000_000).each { puts 0 }
end
```

<!-- [snippet]{asymptotic_upper_bound} -->
```python title=""
def algorithm(n: int):
    a = 1      # +1
    a = a + 1  # +1
    a = a * 2  # +1
    # 迴圈 n 次
    for i in range(n):  # +1
        print(0)        # +1
```

```cpp title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // 迴圈 n 次
    for (int i = 0; i < n; i++) { // +1（每輪都執行 i ++）
        cout << 0 << endl;    // +1
    }
}
```

```java title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // 迴圈 n 次
    for (int i = 0; i < n; i++) { // +1（每輪都執行 i ++）
        System.out.println(0);    // +1
    }
}
```

```csharp title=""
void Algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // 迴圈 n 次
    for (int i = 0; i < n; i++) {   // +1（每輪都執行 i ++）
        Console.WriteLine(0);   // +1
    }
}
```

```go title=""
func algorithm(n int) {
    a := 1      // +1
    a = a + 1   // +1
    a = a * 2   // +1
    // 迴圈 n 次
    for i := 0; i < n; i++ {   // +1
        fmt.Println(a)         // +1
    }
}
```

```swift title=""
func algorithm(n: Int) {
    var a = 1 // +1
    a = a + 1 // +1
    a = a * 2 // +1
    // 迴圈 n 次
    for _ in 0 ..< n { // +1
        print(0) // +1
    }
}
```

```javascript title=""
function algorithm(n) {
    var a = 1; // +1
    a += 1; // +1
    a *= 2; // +1
    // 迴圈 n 次
    for(let i = 0; i < n; i++){ // +1（每輪都執行 i ++）
        console.log(0); // +1
    }
}
```

```typescript title=""
function algorithm(n: number): void{
    var a: number = 1; // +1
    a += 1; // +1
    a *= 2; // +1
    // 迴圈 n 次
    for(let i = 0; i < n; i++){ // +1（每輪都執行 i ++）
        console.log(0); // +1
    }
}
```

```dart title=""
void algorithm(int n) {
  int a = 1; // +1
  a = a + 1; // +1
  a = a * 2; // +1
  // 迴圈 n 次
  for (int i = 0; i < n; i++) { // +1（每輪都執行 i ++）
    print(0); // +1
  }
}
```

```rust title=""
fn algorithm(n: i32) {
    let mut a = 1;   // +1
    a = a + 1;      // +1
    a = a * 2;      // +1

    // 迴圈 n 次
    for _ in 0..n { // +1（每輪都執行 i ++）
        println!("{}", 0); // +1
    }
}
```

```c title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // 迴圈 n 次
    for (int i = 0; i < n; i++) {   // +1（每輪都執行 i ++）
        printf("%d", 0);            // +1
    }
}
```

```kotlin title=""
fun algorithm(n: Int) {
    var a = 1 // +1
    a = a + 1 // +1
    a = a * 2 // +1
    // 迴圈 n 次
    for (i in 0..<n) { // +1（每輪都執行 i ++）
        println(0) // +1
    }
}
```

```ruby title=""
def algorithm(n)
    a = 1       # +1
    a = a + 1   # +1
    a = a * 2   # +1
    # 迴圈 n 次
    (0...n).each do # +1
        puts 0      # +1
    end
end
```

<!-- [snippet]{count_operations} -->
```python title=""
def algorithm(n: int):
    a = 1      # +0（技巧 1）
    a = a + n  # +0（技巧 1）
    # +n（技巧 2）
    for i in range(5 * n + 1):
        print(0)
    # +n*n（技巧 3）
    for i in range(2 * n):
        for j in range(n + 1):
            print(0)
```

```cpp title=""
void algorithm(int n) {
    int a = 1;  // +0（技巧 1）
    a = a + n;  // +0（技巧 1）
    // +n（技巧 2）
    for (int i = 0; i < 5 * n + 1; i++) {
        cout << 0 << endl;
    }
    // +n*n（技巧 3）
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            cout << 0 << endl;
        }
    }
}
```

```java title=""
void algorithm(int n) {
    int a = 1;  // +0（技巧 1）
    a = a + n;  // +0（技巧 1）
    // +n（技巧 2）
    for (int i = 0; i < 5 * n + 1; i++) {
        System.out.println(0);
    }
    // +n*n（技巧 3）
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            System.out.println(0);
        }
    }
}
```

```csharp title=""
void Algorithm(int n) {
    int a = 1;  // +0（技巧 1）
    a = a + n;  // +0（技巧 1）
    // +n（技巧 2）
    for (int i = 0; i < 5 * n + 1; i++) {
        Console.WriteLine(0);
    }
    // +n*n（技巧 3）
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            Console.WriteLine(0);
        }
    }
}
```

```go title=""
func algorithm(n int) {
    a := 1     // +0（技巧 1）
    a = a + n  // +0（技巧 1）
    // +n（技巧 2）
    for i := 0; i < 5 * n + 1; i++ {
        fmt.Println(0)
    }
    // +n*n（技巧 3）
    for i := 0; i < 2 * n; i++ {
        for j := 0; j < n + 1; j++ {
            fmt.Println(0)
        }
    }
}
```

```swift title=""
func algorithm(n: Int) {
    var a = 1 // +0（技巧 1）
    a = a + n // +0（技巧 1）
    // +n（技巧 2）
    for _ in 0 ..< (5 * n + 1) {
        print(0)
    }
    // +n*n（技巧 3）
    for _ in 0 ..< (2 * n) {
        for _ in 0 ..< (n + 1) {
            print(0)
        }
    }
}
```

```javascript title=""
function algorithm(n) {
    let a = 1;  // +0（技巧 1）
    a = a + n;  // +0（技巧 1）
    // +n（技巧 2）
    for (let i = 0; i < 5 * n + 1; i++) {
        console.log(0);
    }
    // +n*n（技巧 3）
    for (let i = 0; i < 2 * n; i++) {
        for (let j = 0; j < n + 1; j++) {
            console.log(0);
        }
    }
}
```

```typescript title=""
function algorithm(n: number): void {
    let a = 1;  // +0（技巧 1）
    a = a + n;  // +0（技巧 1）
    // +n（技巧 2）
    for (let i = 0; i < 5 * n + 1; i++) {
        console.log(0);
    }
    // +n*n（技巧 3）
    for (let i = 0; i < 2 * n; i++) {
        for (let j = 0; j < n + 1; j++) {
            console.log(0);
        }
    }
}
```

```dart title=""
void algorithm(int n) {
  int a = 1; // +0（技巧 1）
  a = a + n; // +0（技巧 1）
  // +n（技巧 2）
  for (int i = 0; i < 5 * n + 1; i++) {
    print(0);
  }
  // +n*n（技巧 3）
  for (int i = 0; i < 2 * n; i++) {
    for (int j = 0; j < n + 1; j++) {
      print(0);
    }
  }
}
```

```rust title=""
fn algorithm(n: i32) {
    let mut a = 1;     // +0（技巧 1）
    a = a + n;        // +0（技巧 1）

    // +n（技巧 2）
    for i in 0..(5 * n + 1) {
        println!("{}", 0);
    }

    // +n*n（技巧 3）
    for i in 0..(2 * n) {
        for j in 0..(n + 1) {
            println!("{}", 0);
        }
    }
}
```

```c title=""
void algorithm(int n) {
    int a = 1;  // +0（技巧 1）
    a = a + n;  // +0（技巧 1）
    // +n（技巧 2）
    for (int i = 0; i < 5 * n + 1; i++) {
        printf("%d", 0);
    }
    // +n*n（技巧 3）
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            printf("%d", 0);
        }
    }
}
```

```kotlin title=""
fun algorithm(n: Int) {
    var a = 1   // +0（技巧 1）
    a = a + n   // +0（技巧 1）
    // +n（技巧 2）
    for (i in 0..<5 * n + 1) {
        println(0)
    }
    // +n*n（技巧 3）
    for (i in 0..<2 * n) {
        for (j in 0..<n + 1) {
            println(0)
        }
    }
}
```

```ruby title=""
def algorithm(n)
    a = 1       # +0（技巧 1）
    a = a + n   # +0（技巧 1）
    # +n（技巧 2）
    (0...(5 * n + 1)).each { puts 0 }
    # +n*n（技巧 3）
    (0...(2 * n)).each do
        (0...(n + 1)).each { puts 0 }
    end
end
```
