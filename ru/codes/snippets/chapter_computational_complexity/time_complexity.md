<!-- [snippet]{run_time_estimate} -->
```python title=""
# На некоторой платформе выполнения
def algorithm(n: int):
    a = 2      # 1 нс
    a = a + 1  # 1 нс
    a = a * 2  # 10 нс
    # Цикл выполняется n раз
    for _ in range(n):  # 1 нс
        print(0)        # 5 нс
```

```cpp title=""
// На некоторой платформе выполнения
void algorithm(int n) {
    int a = 2;  // 1 нс
    a = a + 1;  // 1 нс
    a = a * 2;  // 10 нс
    // Цикл выполняется n раз
    for (int i = 0; i < n; i++) {  // 1 нс
        cout << 0 << endl;         // 5 нс
    }
}
```

```java title=""
// На некоторой платформе выполнения
void algorithm(int n) {
    int a = 2;  // 1 нс
    a = a + 1;  // 1 нс
    a = a * 2;  // 10 нс
    // Цикл выполняется n раз
    for (int i = 0; i < n; i++) {  // 1 нс
        System.out.println(0);     // 5 нс
    }
}
```

```csharp title=""
// На некоторой платформе выполнения
void Algorithm(int n) {
    int a = 2;  // 1 нс
    a = a + 1;  // 1 нс
    a = a * 2;  // 10 нс
    // Цикл выполняется n раз
    for (int i = 0; i < n; i++) {  // 1 нс
        Console.WriteLine(0);      // 5 нс
    }
}
```

```go title=""
// На некоторой платформе выполнения
func algorithm(n int) {
    a := 2     // 1 нс
    a = a + 1  // 1 нс
    a = a * 2  // 10 нс
    // Цикл выполняется n раз
    for i := 0; i < n; i++ {  // 1 нс
        fmt.Println(a)        // 5 нс
    }
}
```

```swift title=""
// На некоторой платформе выполнения
func algorithm(n: Int) {
    var a = 2 // 1 нс
    a = a + 1 // 1 нс
    a = a * 2 // 10 нс
    // Цикл выполняется n раз
    for _ in 0 ..< n { // 1 нс
        print(0) // 5 нс
    }
}
```

```javascript title=""
// На некоторой платформе выполнения
function algorithm(n) {
    var a = 2; // 1 нс
    a = a + 1; // 1 нс
    a = a * 2; // 10 нс
    // Цикл выполняется n раз
    for(let i = 0; i < n; i++) { // 1 нс
        console.log(0); // 5 нс
    }
}
```

```typescript title=""
// На некоторой платформе выполнения
function algorithm(n: number): void {
    var a: number = 2; // 1 нс
    a = a + 1; // 1 нс
    a = a * 2; // 10 нс
    // Цикл выполняется n раз
    for(let i = 0; i < n; i++) { // 1 нс
        console.log(0); // 5 нс
    }
}
```

```dart title=""
// На некоторой платформе выполнения
void algorithm(int n) {
  int a = 2; // 1 нс
  a = a + 1; // 1 нс
  a = a * 2; // 10 нс
  // Цикл выполняется n раз
  for (int i = 0; i < n; i++) { // 1 нс
    print(0); // 5 нс
  }
}
```

```rust title=""
// На некоторой платформе выполнения
fn algorithm(n: i32) {
    let mut a = 2;      // 1 нс
    a = a + 1;          // 1 нс
    a = a * 2;          // 10 нс
    // Цикл выполняется n раз
    for _ in 0..n {     // 1 нс
        println!("{}", 0);  // 5 нс
    }
}
```

```c title=""
// На некоторой платформе выполнения
void algorithm(int n) {
    int a = 2;  // 1 нс
    a = a + 1;  // 1 нс
    a = a * 2;  // 10 нс
    // Цикл выполняется n раз
    for (int i = 0; i < n; i++) {   // 1 нс
        printf("%d", 0);            // 5 нс
    }
}
```

```kotlin title=""
// На некоторой платформе выполнения
fun algorithm(n: Int) {
    var a = 2 // 1 нс
    a = a + 1 // 1 нс
    a = a * 2 // 10 нс
    // Цикл выполняется n раз
    for (i in 0..<n) {  // 1 нс
        println(0)      // 5 нс
    }
}
```

```ruby title=""
# На некоторой платформе выполнения
def algorithm(n)
    a = 2       # 1 нс
    a = a + 1   # 1 нс
    a = a * 2   # 10 нс
    # Цикл выполняется n раз
    (0...n).each do # 1 нс
        puts 0      # 5 нс
    end
end
```

<!-- [snippet]{growth_trend} -->
```python title=""
# Временная сложность алгоритма A: постоянная
def algorithm_A(n: int):
    print(0)
# Временная сложность алгоритма B: линейная
def algorithm_B(n: int):
    for _ in range(n):
        print(0)
# Временная сложность алгоритма C: постоянная
def algorithm_C(n: int):
    for _ in range(1000000):
        print(0)
```

```cpp title=""
// Временная сложность алгоритма A: постоянная
void algorithm_A(int n) {
    cout << 0 << endl;
}
// Временная сложность алгоритма B: линейная
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        cout << 0 << endl;
    }
}
// Временная сложность алгоритма C: постоянная
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        cout << 0 << endl;
    }
}
```

```java title=""
// Временная сложность алгоритма A: постоянная
void algorithm_A(int n) {
    System.out.println(0);
}
// Временная сложность алгоритма B: линейная
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        System.out.println(0);
    }
}
// Временная сложность алгоритма C: постоянная
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        System.out.println(0);
    }
}
```

```csharp title=""
// Временная сложность алгоритма A: постоянная
void AlgorithmA(int n) {
    Console.WriteLine(0);
}
// Временная сложность алгоритма B: линейная
void AlgorithmB(int n) {
    for (int i = 0; i < n; i++) {
        Console.WriteLine(0);
    }
}
// Временная сложность алгоритма C: постоянная
void AlgorithmC(int n) {
    for (int i = 0; i < 1000000; i++) {
        Console.WriteLine(0);
    }
}
```

```go title=""
// Временная сложность алгоритма A: постоянная
func algorithm_A(n int) {
    fmt.Println(0)
}
// Временная сложность алгоритма B: линейная
func algorithm_B(n int) {
    for i := 0; i < n; i++ {
        fmt.Println(0)
    }
}
// Временная сложность алгоритма C: постоянная
func algorithm_C(n int) {
    for i := 0; i < 1000000; i++ {
        fmt.Println(0)
    }
}
```

```swift title=""
// Временная сложность алгоритма A: постоянная
func algorithmA(n: Int) {
    print(0)
}

// Временная сложность алгоритма B: линейная
func algorithmB(n: Int) {
    for _ in 0 ..< n {
        print(0)
    }
}

// Временная сложность алгоритма C: постоянная
func algorithmC(n: Int) {
    for _ in 0 ..< 1_000_000 {
        print(0)
    }
}
```

```javascript title=""
// Временная сложность алгоритма A: постоянная
function algorithm_A(n) {
    console.log(0);
}
// Временная сложность алгоритма B: линейная
function algorithm_B(n) {
    for (let i = 0; i < n; i++) {
        console.log(0);
    }
}
// Временная сложность алгоритма C: постоянная
function algorithm_C(n) {
    for (let i = 0; i < 1000000; i++) {
        console.log(0);
    }
}

```

```typescript title=""
// Временная сложность алгоритма A: постоянная
function algorithm_A(n: number): void {
    console.log(0);
}
// Временная сложность алгоритма B: линейная
function algorithm_B(n: number): void {
    for (let i = 0; i < n; i++) {
        console.log(0);
    }
}
// Временная сложность алгоритма C: постоянная
function algorithm_C(n: number): void {
    for (let i = 0; i < 1000000; i++) {
        console.log(0);
    }
}
```

```dart title=""
// Временная сложность алгоритма A: постоянная
void algorithmA(int n) {
  print(0);
}
// Временная сложность алгоритма B: линейная
void algorithmB(int n) {
  for (int i = 0; i < n; i++) {
    print(0);
  }
}
// Временная сложность алгоритма C: постоянная
void algorithmC(int n) {
  for (int i = 0; i < 1000000; i++) {
    print(0);
  }
}
```

```rust title=""
// Временная сложность алгоритма A: постоянная
fn algorithm_A(n: i32) {
    println!("{}", 0);
}
// Временная сложность алгоритма B: линейная
fn algorithm_B(n: i32) {
    for _ in 0..n {
        println!("{}", 0);
    }
}
// Временная сложность алгоритма C: постоянная
fn algorithm_C(n: i32) {
    for _ in 0..1000000 {
        println!("{}", 0);
    }
}
```

```c title=""
// Временная сложность алгоритма A: постоянная
void algorithm_A(int n) {
    printf("%d", 0);
}
// Временная сложность алгоритма B: линейная
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        printf("%d", 0);
    }
}
// Временная сложность алгоритма C: постоянная
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        printf("%d", 0);
    }
}
```

```kotlin title=""
// Временная сложность алгоритма A: постоянная
fun algoritm_A(n: Int) {
    println(0)
}
// Временная сложность алгоритма B: линейная
fun algorithm_B(n: Int) {
    for (i in 0..<n){
        println(0)
    }
}
// Временная сложность алгоритма C: постоянная
fun algorithm_C(n: Int) {
    for (i in 0..<1000000) {
        println(0)
    }
}
```

```ruby title=""
# Временная сложность алгоритма A: постоянная
def algorithm_A(n)
    puts 0
end

# Временная сложность алгоритма B: линейная
def algorithm_B(n)
    (0...n).each { puts 0 }
end

# Временная сложность алгоритма C: постоянная
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
    # Цикл выполняется n раз
    for i in range(n):  # +1
        print(0)        # +1
```

```cpp title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // Цикл выполняется n раз
    for (int i = 0; i < n; i++) { // +1 (каждый раз выполняется i ++)
        cout << 0 << endl;    // +1
    }
}
```

```java title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // Цикл выполняется n раз
    for (int i = 0; i < n; i++) { // +1 (каждый раз выполняется i ++)
        System.out.println(0);    // +1
    }
}
```

```csharp title=""
void Algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // Цикл выполняется n раз
    for (int i = 0; i < n; i++) {   // +1 (каждый раз выполняется i ++)
        Console.WriteLine(0);   // +1
    }
}
```

```go title=""
func algorithm(n int) {
    a := 1      // +1
    a = a + 1   // +1
    a = a * 2   // +1
    // Цикл выполняется n раз
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
    // Цикл выполняется n раз
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
    // Цикл выполняется n раз
    for(let i = 0; i < n; i++){ // +1 (каждый раз выполняется i ++)
        console.log(0); // +1
    }
}
```

```typescript title=""
function algorithm(n: number): void{
    var a: number = 1; // +1
    a += 1; // +1
    a *= 2; // +1
    // Цикл выполняется n раз
    for(let i = 0; i < n; i++){ // +1 (каждый раз выполняется i ++)
        console.log(0); // +1
    }
}
```

```dart title=""
void algorithm(int n) {
  int a = 1; // +1
  a = a + 1; // +1
  a = a * 2; // +1
  // Цикл выполняется n раз
  for (int i = 0; i < n; i++) { // +1 (каждый раз выполняется i ++)
    print(0); // +1
  }
}
```

```rust title=""
fn algorithm(n: i32) {
    let mut a = 1;   // +1
    a = a + 1;      // +1
    a = a * 2;      // +1

    // Цикл выполняется n раз
    for _ in 0..n { // +1 (каждый раз выполняется i ++)
        println!("{}", 0); // +1
    }
}
```

```c title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // Цикл выполняется n раз
    for (int i = 0; i < n; i++) {   // +1 (каждый раз выполняется i ++)
        printf("%d", 0);            // +1
    }
}
```

```kotlin title=""
fun algorithm(n: Int) {
    var a = 1 // +1
    a = a + 1 // +1
    a = a * 2 // +1
    // Цикл выполняется n раз
    for (i in 0..<n) { // +1 (каждый раз выполняется i ++)
        println(0) // +1
    }
}
```

```ruby title=""
def algorithm(n)
    a = 1       # +1
    a = a + 1   # +1
    a = a * 2   # +1
    # Цикл выполняется n раз
    (0...n).each do # +1
        puts 0      # +1
    end
end
```

<!-- [snippet]{count_operations} -->
```python title=""
def algorithm(n: int):
    a = 1      # +0 (прием 1)
    a = a + n  # +0 (прием 1)
    # +n (прием 2)
    for i in range(5 * n + 1):
        print(0)
    # +n*n (прием 3)
    for i in range(2 * n):
        for j in range(n + 1):
            print(0)
```

```cpp title=""
void algorithm(int n) {
    int a = 1;  // +0 (прием 1)
    a = a + n;  // +0 (прием 1)
    // +n (прием 2)
    for (int i = 0; i < 5 * n + 1; i++) {
        cout << 0 << endl;
    }
    // +n*n (прием 3)
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            cout << 0 << endl;
        }
    }
}
```

```java title=""
void algorithm(int n) {
    int a = 1;  // +0 (прием 1)
    a = a + n;  // +0 (прием 1)
    // +n (прием 2)
    for (int i = 0; i < 5 * n + 1; i++) {
        System.out.println(0);
    }
    // +n*n (прием 3)
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            System.out.println(0);
        }
    }
}
```

```csharp title=""
void Algorithm(int n) {
    int a = 1;  // +0 (прием 1)
    a = a + n;  // +0 (прием 1)
    // +n (прием 2)
    for (int i = 0; i < 5 * n + 1; i++) {
        Console.WriteLine(0);
    }
    // +n*n (прием 3)
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            Console.WriteLine(0);
        }
    }
}
```

```go title=""
func algorithm(n int) {
    a := 1     // +0 (прием 1)
    a = a + n  // +0 (прием 1)
    // +n (прием 2)
    for i := 0; i < 5 * n + 1; i++ {
        fmt.Println(0)
    }
    // +n*n (прием 3)
    for i := 0; i < 2 * n; i++ {
        for j := 0; j < n + 1; j++ {
            fmt.Println(0)
        }
    }
}
```

```swift title=""
func algorithm(n: Int) {
    var a = 1 // +0 (прием 1)
    a = a + n // +0 (прием 1)
    // +n (прием 2)
    for _ in 0 ..< (5 * n + 1) {
        print(0)
    }
    // +n*n (прием 3)
    for _ in 0 ..< (2 * n) {
        for _ in 0 ..< (n + 1) {
            print(0)
        }
    }
}
```

```javascript title=""
function algorithm(n) {
    let a = 1;  // +0 (прием 1)
    a = a + n;  // +0 (прием 1)
    // +n (прием 2)
    for (let i = 0; i < 5 * n + 1; i++) {
        console.log(0);
    }
    // +n*n (прием 3)
    for (let i = 0; i < 2 * n; i++) {
        for (let j = 0; j < n + 1; j++) {
            console.log(0);
        }
    }
}
```

```typescript title=""
function algorithm(n: number): void {
    let a = 1;  // +0 (прием 1)
    a = a + n;  // +0 (прием 1)
    // +n (прием 2)
    for (let i = 0; i < 5 * n + 1; i++) {
        console.log(0);
    }
    // +n*n (прием 3)
    for (let i = 0; i < 2 * n; i++) {
        for (let j = 0; j < n + 1; j++) {
            console.log(0);
        }
    }
}
```

```dart title=""
void algorithm(int n) {
  int a = 1; // +0 (прием 1)
  a = a + n; // +0 (прием 1)
  // +n (прием 2)
  for (int i = 0; i < 5 * n + 1; i++) {
    print(0);
  }
  // +n*n (прием 3)
  for (int i = 0; i < 2 * n; i++) {
    for (int j = 0; j < n + 1; j++) {
      print(0);
    }
  }
}
```

```rust title=""
fn algorithm(n: i32) {
    let mut a = 1;     // +0 (прием 1)
    a = a + n;        // +0 (прием 1)

    // +n (прием 2)
    for i in 0..(5 * n + 1) {
        println!("{}", 0);
    }

    // +n*n (прием 3)
    for i in 0..(2 * n) {
        for j in 0..(n + 1) {
            println!("{}", 0);
        }
    }
}
```

```c title=""
void algorithm(int n) {
    int a = 1;  // +0 (прием 1)
    a = a + n;  // +0 (прием 1)
    // +n (прием 2)
    for (int i = 0; i < 5 * n + 1; i++) {
        printf("%d", 0);
    }
    // +n*n (прием 3)
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            printf("%d", 0);
        }
    }
}
```

```kotlin title=""
fun algorithm(n: Int) {
    var a = 1   // +0 (прием 1)
    a = a + n   // +0 (прием 1)
    // +n (прием 2)
    for (i in 0..<5 * n + 1) {
        println(0)
    }
    // +n*n (прием 3)
    for (i in 0..<2 * n) {
        for (j in 0..<n + 1) {
            println(0)
        }
    }
}
```

```ruby title=""
def algorithm(n)
    a = 1       # +0 (прием 1)
    a = a + n   # +0 (прием 1)
    # +n (прием 2)
    (0...(5 * n + 1)).each { puts 0 }
    # +n*n (прием 3)
    (0...(2 * n)).each do
        (0...(n + 1)).each { puts 0 }
    end
end
```
