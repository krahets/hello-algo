<!-- [snippet]{run_time_estimate} -->
```python title=""
# ある実行環境において
def algorithm(n: int):
    a = 2      # 1 ns
    a = a + 1  # 1 ns
    a = a * 2  # 10 ns
    # n 回繰り返す
    for _ in range(n):  # 1 ns
        print(0)        # 5 ns
```

```cpp title=""
// ある実行環境において
void algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // n 回繰り返す
    for (int i = 0; i < n; i++) {  // 1 ns
        cout << 0 << endl;         // 5 ns
    }
}
```

```java title=""
// ある実行環境において
void algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // n 回繰り返す
    for (int i = 0; i < n; i++) {  // 1 ns
        System.out.println(0);     // 5 ns
    }
}
```

```csharp title=""
// ある実行環境において
void Algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // n 回繰り返す
    for (int i = 0; i < n; i++) {  // 1 ns
        Console.WriteLine(0);      // 5 ns
    }
}
```

```go title=""
// ある実行環境において
func algorithm(n int) {
    a := 2     // 1 ns
    a = a + 1  // 1 ns
    a = a * 2  // 10 ns
    // n 回繰り返す
    for i := 0; i < n; i++ {  // 1 ns
        fmt.Println(a)        // 5 ns
    }
}
```

```swift title=""
// ある実行環境において
func algorithm(n: Int) {
    var a = 2 // 1 ns
    a = a + 1 // 1 ns
    a = a * 2 // 10 ns
    // n 回繰り返す
    for _ in 0 ..< n { // 1 ns
        print(0) // 5 ns
    }
}
```

```javascript title=""
// ある実行環境において
function algorithm(n) {
    var a = 2; // 1 ns
    a = a + 1; // 1 ns
    a = a * 2; // 10 ns
    // n 回繰り返す
    for(let i = 0; i < n; i++) { // 1 ns
        console.log(0); // 5 ns
    }
}
```

```typescript title=""
// ある実行環境において
function algorithm(n: number): void {
    var a: number = 2; // 1 ns
    a = a + 1; // 1 ns
    a = a * 2; // 10 ns
    // n 回繰り返す
    for(let i = 0; i < n; i++) { // 1 ns
        console.log(0); // 5 ns
    }
}
```

```dart title=""
// ある実行環境において
void algorithm(int n) {
  int a = 2; // 1 ns
  a = a + 1; // 1 ns
  a = a * 2; // 10 ns
  // n 回繰り返す
  for (int i = 0; i < n; i++) { // 1 ns
    print(0); // 5 ns
  }
}
```

```rust title=""
// ある実行環境において
fn algorithm(n: i32) {
    let mut a = 2;      // 1 ns
    a = a + 1;          // 1 ns
    a = a * 2;          // 10 ns
    // n 回繰り返す
    for _ in 0..n {     // 1 ns
        println!("{}", 0);  // 5 ns
    }
}
```

```c title=""
// ある実行環境において
void algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // n 回繰り返す
    for (int i = 0; i < n; i++) {   // 1 ns
        printf("%d", 0);            // 5 ns
    }
}
```

```kotlin title=""
// ある実行環境において
fun algorithm(n: Int) {
    var a = 2 // 1 ns
    a = a + 1 // 1 ns
    a = a * 2 // 10 ns
    // n 回繰り返す
    for (i in 0..<n) {  // 1 ns
        println(0)      // 5 ns
    }
}
```

```ruby title=""
# ある実行環境において
def algorithm(n)
    a = 2       # 1 ns
    a = a + 1   # 1 ns
    a = a * 2   # 10 ns
    # n 回繰り返す
    (0...n).each do # 1 ns
        puts 0      # 5 ns
    end
end
```

<!-- [snippet]{growth_trend} -->
```python title=""
# アルゴリズム A の時間計算量：定数のオーダー
def algorithm_A(n: int):
    print(0)
# アルゴリズム B の時間計算量：線形のオーダー
def algorithm_B(n: int):
    for _ in range(n):
        print(0)
# アルゴリズム C の時間計算量：定数のオーダー
def algorithm_C(n: int):
    for _ in range(1000000):
        print(0)
```

```cpp title=""
// アルゴリズム A の時間計算量：定数のオーダー
void algorithm_A(int n) {
    cout << 0 << endl;
}
// アルゴリズム B の時間計算量：線形のオーダー
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        cout << 0 << endl;
    }
}
// アルゴリズム C の時間計算量：定数のオーダー
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        cout << 0 << endl;
    }
}
```

```java title=""
// アルゴリズム A の時間計算量：定数のオーダー
void algorithm_A(int n) {
    System.out.println(0);
}
// アルゴリズム B の時間計算量：線形のオーダー
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        System.out.println(0);
    }
}
// アルゴリズム C の時間計算量：定数のオーダー
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        System.out.println(0);
    }
}
```

```csharp title=""
// アルゴリズム A の時間計算量：定数のオーダー
void AlgorithmA(int n) {
    Console.WriteLine(0);
}
// アルゴリズム B の時間計算量：線形のオーダー
void AlgorithmB(int n) {
    for (int i = 0; i < n; i++) {
        Console.WriteLine(0);
    }
}
// アルゴリズム C の時間計算量：定数のオーダー
void AlgorithmC(int n) {
    for (int i = 0; i < 1000000; i++) {
        Console.WriteLine(0);
    }
}
```

```go title=""
// アルゴリズム A の時間計算量：定数のオーダー
func algorithm_A(n int) {
    fmt.Println(0)
}
// アルゴリズム B の時間計算量：線形のオーダー
func algorithm_B(n int) {
    for i := 0; i < n; i++ {
        fmt.Println(0)
    }
}
// アルゴリズム C の時間計算量：定数のオーダー
func algorithm_C(n int) {
    for i := 0; i < 1000000; i++ {
        fmt.Println(0)
    }
}
```

```swift title=""
// アルゴリズム A の時間計算量：定数のオーダー
func algorithmA(n: Int) {
    print(0)
}

// アルゴリズム B の時間計算量：線形のオーダー
func algorithmB(n: Int) {
    for _ in 0 ..< n {
        print(0)
    }
}

// アルゴリズム C の時間計算量：定数のオーダー
func algorithmC(n: Int) {
    for _ in 0 ..< 1_000_000 {
        print(0)
    }
}
```

```javascript title=""
// アルゴリズム A の時間計算量：定数のオーダー
function algorithm_A(n) {
    console.log(0);
}
// アルゴリズム B の時間計算量：線形のオーダー
function algorithm_B(n) {
    for (let i = 0; i < n; i++) {
        console.log(0);
    }
}
// アルゴリズム C の時間計算量：定数のオーダー
function algorithm_C(n) {
    for (let i = 0; i < 1000000; i++) {
        console.log(0);
    }
}

```

```typescript title=""
// アルゴリズム A の時間計算量：定数のオーダー
function algorithm_A(n: number): void {
    console.log(0);
}
// アルゴリズム B の時間計算量：線形のオーダー
function algorithm_B(n: number): void {
    for (let i = 0; i < n; i++) {
        console.log(0);
    }
}
// アルゴリズム C の時間計算量：定数のオーダー
function algorithm_C(n: number): void {
    for (let i = 0; i < 1000000; i++) {
        console.log(0);
    }
}
```

```dart title=""
// アルゴリズム A の時間計算量：定数のオーダー
void algorithmA(int n) {
  print(0);
}
// アルゴリズム B の時間計算量：線形のオーダー
void algorithmB(int n) {
  for (int i = 0; i < n; i++) {
    print(0);
  }
}
// アルゴリズム C の時間計算量：定数のオーダー
void algorithmC(int n) {
  for (int i = 0; i < 1000000; i++) {
    print(0);
  }
}
```

```rust title=""
// アルゴリズム A の時間計算量：定数のオーダー
fn algorithm_A(n: i32) {
    println!("{}", 0);
}
// アルゴリズム B の時間計算量：線形のオーダー
fn algorithm_B(n: i32) {
    for _ in 0..n {
        println!("{}", 0);
    }
}
// アルゴリズム C の時間計算量：定数のオーダー
fn algorithm_C(n: i32) {
    for _ in 0..1000000 {
        println!("{}", 0);
    }
}
```

```c title=""
// アルゴリズム A の時間計算量：定数のオーダー
void algorithm_A(int n) {
    printf("%d", 0);
}
// アルゴリズム B の時間計算量：線形のオーダー
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        printf("%d", 0);
    }
}
// アルゴリズム C の時間計算量：定数のオーダー
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        printf("%d", 0);
    }
}
```

```kotlin title=""
// アルゴリズム A の時間計算量：定数のオーダー
fun algoritm_A(n: Int) {
    println(0)
}
// アルゴリズム B の時間計算量：線形のオーダー
fun algorithm_B(n: Int) {
    for (i in 0..<n){
        println(0)
    }
}
// アルゴリズム C の時間計算量：定数のオーダー
fun algorithm_C(n: Int) {
    for (i in 0..<1000000) {
        println(0)
    }
}
```

```ruby title=""
# アルゴリズム A の時間計算量：定数のオーダー
def algorithm_A(n)
    puts 0
end

# アルゴリズム B の時間計算量：線形のオーダー
def algorithm_B(n)
    (0...n).each { puts 0 }
end

# アルゴリズム C の時間計算量：定数のオーダー
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
    # n 回繰り返す
    for i in range(n):  # +1
        print(0)        # +1
```

```cpp title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // n 回繰り返す
    for (int i = 0; i < n; i++) { // +1（毎回 i ++ を実行）
        cout << 0 << endl;    // +1
    }
}
```

```java title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // n 回繰り返す
    for (int i = 0; i < n; i++) { // +1（毎回 i ++ を実行）
        System.out.println(0);    // +1
    }
}
```

```csharp title=""
void Algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // n 回繰り返す
    for (int i = 0; i < n; i++) {   // +1（毎回 i ++ を実行）
        Console.WriteLine(0);   // +1
    }
}
```

```go title=""
func algorithm(n int) {
    a := 1      // +1
    a = a + 1   // +1
    a = a * 2   // +1
    // n 回繰り返す
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
    // n 回繰り返す
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
    // n 回繰り返す
    for(let i = 0; i < n; i++){ // +1（毎回 i ++ を実行）
        console.log(0); // +1
    }
}
```

```typescript title=""
function algorithm(n: number): void{
    var a: number = 1; // +1
    a += 1; // +1
    a *= 2; // +1
    // n 回繰り返す
    for(let i = 0; i < n; i++){ // +1（毎回 i ++ を実行）
        console.log(0); // +1
    }
}
```

```dart title=""
void algorithm(int n) {
  int a = 1; // +1
  a = a + 1; // +1
  a = a * 2; // +1
  // n 回繰り返す
  for (int i = 0; i < n; i++) { // +1（毎回 i ++ を実行）
    print(0); // +1
  }
}
```

```rust title=""
fn algorithm(n: i32) {
    let mut a = 1;   // +1
    a = a + 1;      // +1
    a = a * 2;      // +1

    // n 回繰り返す
    for _ in 0..n { // +1（毎回 i ++ を実行）
        println!("{}", 0); // +1
    }
}
```

```c title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // n 回繰り返す
    for (int i = 0; i < n; i++) {   // +1（毎回 i ++ を実行）
        printf("%d", 0);            // +1
    }
}
```

```kotlin title=""
fun algorithm(n: Int) {
    var a = 1 // +1
    a = a + 1 // +1
    a = a * 2 // +1
    // n 回繰り返す
    for (i in 0..<n) { // +1（毎回 i ++ を実行）
        println(0) // +1
    }
}
```

```ruby title=""
def algorithm(n)
    a = 1       # +1
    a = a + 1   # +1
    a = a * 2   # +1
    # n 回繰り返す
    (0...n).each do # +1
        puts 0      # +1
    end
end
```

<!-- [snippet]{count_operations} -->
```python title=""
def algorithm(n: int):
    a = 1      # +0（工夫 1）
    a = a + n  # +0（工夫 1）
    # +n（工夫 2）
    for i in range(5 * n + 1):
        print(0)
    # +n*n（工夫 3）
    for i in range(2 * n):
        for j in range(n + 1):
            print(0)
```

```cpp title=""
void algorithm(int n) {
    int a = 1;  // +0（工夫 1）
    a = a + n;  // +0（工夫 1）
    // +n（工夫 2）
    for (int i = 0; i < 5 * n + 1; i++) {
        cout << 0 << endl;
    }
    // +n*n（工夫 3）
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            cout << 0 << endl;
        }
    }
}
```

```java title=""
void algorithm(int n) {
    int a = 1;  // +0（工夫 1）
    a = a + n;  // +0（工夫 1）
    // +n（工夫 2）
    for (int i = 0; i < 5 * n + 1; i++) {
        System.out.println(0);
    }
    // +n*n（工夫 3）
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            System.out.println(0);
        }
    }
}
```

```csharp title=""
void Algorithm(int n) {
    int a = 1;  // +0（工夫 1）
    a = a + n;  // +0（工夫 1）
    // +n（工夫 2）
    for (int i = 0; i < 5 * n + 1; i++) {
        Console.WriteLine(0);
    }
    // +n*n（工夫 3）
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            Console.WriteLine(0);
        }
    }
}
```

```go title=""
func algorithm(n int) {
    a := 1     // +0（工夫 1）
    a = a + n  // +0（工夫 1）
    // +n（工夫 2）
    for i := 0; i < 5 * n + 1; i++ {
        fmt.Println(0)
    }
    // +n*n（工夫 3）
    for i := 0; i < 2 * n; i++ {
        for j := 0; j < n + 1; j++ {
            fmt.Println(0)
        }
    }
}
```

```swift title=""
func algorithm(n: Int) {
    var a = 1 // +0（工夫 1）
    a = a + n // +0（工夫 1）
    // +n（工夫 2）
    for _ in 0 ..< (5 * n + 1) {
        print(0)
    }
    // +n*n（工夫 3）
    for _ in 0 ..< (2 * n) {
        for _ in 0 ..< (n + 1) {
            print(0)
        }
    }
}
```

```javascript title=""
function algorithm(n) {
    let a = 1;  // +0（工夫 1）
    a = a + n;  // +0（工夫 1）
    // +n（工夫 2）
    for (let i = 0; i < 5 * n + 1; i++) {
        console.log(0);
    }
    // +n*n（工夫 3）
    for (let i = 0; i < 2 * n; i++) {
        for (let j = 0; j < n + 1; j++) {
            console.log(0);
        }
    }
}
```

```typescript title=""
function algorithm(n: number): void {
    let a = 1;  // +0（工夫 1）
    a = a + n;  // +0（工夫 1）
    // +n（工夫 2）
    for (let i = 0; i < 5 * n + 1; i++) {
        console.log(0);
    }
    // +n*n（工夫 3）
    for (let i = 0; i < 2 * n; i++) {
        for (let j = 0; j < n + 1; j++) {
            console.log(0);
        }
    }
}
```

```dart title=""
void algorithm(int n) {
  int a = 1; // +0（工夫 1）
  a = a + n; // +0（工夫 1）
  // +n（工夫 2）
  for (int i = 0; i < 5 * n + 1; i++) {
    print(0);
  }
  // +n*n（工夫 3）
  for (int i = 0; i < 2 * n; i++) {
    for (int j = 0; j < n + 1; j++) {
      print(0);
    }
  }
}
```

```rust title=""
fn algorithm(n: i32) {
    let mut a = 1;     // +0（工夫 1）
    a = a + n;        // +0（工夫 1）

    // +n（工夫 2）
    for i in 0..(5 * n + 1) {
        println!("{}", 0);
    }

    // +n*n（工夫 3）
    for i in 0..(2 * n) {
        for j in 0..(n + 1) {
            println!("{}", 0);
        }
    }
}
```

```c title=""
void algorithm(int n) {
    int a = 1;  // +0（工夫 1）
    a = a + n;  // +0（工夫 1）
    // +n（工夫 2）
    for (int i = 0; i < 5 * n + 1; i++) {
        printf("%d", 0);
    }
    // +n*n（工夫 3）
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            printf("%d", 0);
        }
    }
}
```

```kotlin title=""
fun algorithm(n: Int) {
    var a = 1   // +0（工夫 1）
    a = a + n   // +0（工夫 1）
    // +n（工夫 2）
    for (i in 0..<5 * n + 1) {
        println(0)
    }
    // +n*n（工夫 3）
    for (i in 0..<2 * n) {
        for (j in 0..<n + 1) {
            println(0)
        }
    }
}
```

```ruby title=""
def algorithm(n)
    a = 1       # +0（工夫 1）
    a = a + n   # +0（工夫 1）
    # +n（工夫 2）
    (0...(5 * n + 1)).each { puts 0 }
    # +n*n（工夫 3）
    (0...(2 * n)).each do
        (0...(n + 1)).each { puts 0 }
    end
end
```
