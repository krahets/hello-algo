<!-- [snippet]{run_time_estimate} -->
```python title=""
# 어떤 실행 플랫폼에서
def algorithm(n: int):
    a = 2      # 1 ns
    a = a + 1  # 1 ns
    a = a * 2  # 10 ns
    # n번 반복
    for _ in range(n):  # 1 ns
        print(0)        # 5 ns
```

```cpp title=""
// 어떤 실행 플랫폼에서
void algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // n번 반복
    for (int i = 0; i < n; i++) {  // 1 ns
        cout << 0 << endl;         // 5 ns
    }
}
```

```java title=""
// 어떤 실행 플랫폼에서
void algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // n번 반복
    for (int i = 0; i < n; i++) {  // 1 ns
        System.out.println(0);     // 5 ns
    }
}
```

```csharp title=""
// 어떤 실행 플랫폼에서
void Algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // n번 반복
    for (int i = 0; i < n; i++) {  // 1 ns
        Console.WriteLine(0);      // 5 ns
    }
}
```

```go title=""
// 어떤 실행 플랫폼에서
func algorithm(n int) {
    a := 2     // 1 ns
    a = a + 1  // 1 ns
    a = a * 2  // 10 ns
    // n번 반복
    for i := 0; i < n; i++ {  // 1 ns
        fmt.Println(a)        // 5 ns
    }
}
```

```swift title=""
// 어떤 실행 플랫폼에서
func algorithm(n: Int) {
    var a = 2 // 1 ns
    a = a + 1 // 1 ns
    a = a * 2 // 10 ns
    // n번 반복
    for _ in 0 ..< n { // 1 ns
        print(0) // 5 ns
    }
}
```

```javascript title=""
// 어떤 실행 플랫폼에서
function algorithm(n) {
    var a = 2; // 1 ns
    a = a + 1; // 1 ns
    a = a * 2; // 10 ns
    // n번 반복
    for(let i = 0; i < n; i++) { // 1 ns
        console.log(0); // 5 ns
    }
}
```

```typescript title=""
// 어떤 실행 플랫폼에서
function algorithm(n: number): void {
    var a: number = 2; // 1 ns
    a = a + 1; // 1 ns
    a = a * 2; // 10 ns
    // n번 반복
    for(let i = 0; i < n; i++) { // 1 ns
        console.log(0); // 5 ns
    }
}
```

```dart title=""
// 어떤 실행 플랫폼에서
void algorithm(int n) {
  int a = 2; // 1 ns
  a = a + 1; // 1 ns
  a = a * 2; // 10 ns
  // n번 반복
  for (int i = 0; i < n; i++) { // 1 ns
    print(0); // 5 ns
  }
}
```

```rust title=""
// 어떤 실행 플랫폼에서
fn algorithm(n: i32) {
    let mut a = 2;      // 1 ns
    a = a + 1;          // 1 ns
    a = a * 2;          // 10 ns
    // n번 반복
    for _ in 0..n {     // 1 ns
        println!("{}", 0);  // 5 ns
    }
}
```

```c title=""
// 어떤 실행 플랫폼에서
void algorithm(int n) {
    int a = 2;  // 1 ns
    a = a + 1;  // 1 ns
    a = a * 2;  // 10 ns
    // n번 반복
    for (int i = 0; i < n; i++) {   // 1 ns
        printf("%d", 0);            // 5 ns
    }
}
```

```kotlin title=""
// 어떤 실행 플랫폼에서
fun algorithm(n: Int) {
    var a = 2 // 1 ns
    a = a + 1 // 1 ns
    a = a * 2 // 10 ns
    // n번 반복
    for (i in 0..<n) {  // 1 ns
        println(0)      // 5 ns
    }
}
```

```ruby title=""
# 어떤 실행 플랫폼에서
def algorithm(n)
    a = 2       # 1 ns
    a = a + 1   # 1 ns
    a = a * 2   # 10 ns
    # n번 반복
    (0...n).each do # 1 ns
        puts 0      # 5 ns
    end
end
```

<!-- [snippet]{growth_trend} -->
```python title=""
# 알고리즘 A의 시간 복잡도: 상수 시간
def algorithm_A(n: int):
    print(0)
# 알고리즘 B의 시간 복잡도: 선형 시간
def algorithm_B(n: int):
    for _ in range(n):
        print(0)
# 알고리즘 C의 시간 복잡도: 상수 시간
def algorithm_C(n: int):
    for _ in range(1000000):
        print(0)
```

```cpp title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
void algorithm_A(int n) {
    cout << 0 << endl;
}
// 알고리즘 B의 시간 복잡도: 선형 시간
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        cout << 0 << endl;
    }
}
// 알고리즘 C의 시간 복잡도: 상수 시간
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        cout << 0 << endl;
    }
}
```

```java title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
void algorithm_A(int n) {
    System.out.println(0);
}
// 알고리즘 B의 시간 복잡도: 선형 시간
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        System.out.println(0);
    }
}
// 알고리즘 C의 시간 복잡도: 상수 시간
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        System.out.println(0);
    }
}
```

```csharp title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
void AlgorithmA(int n) {
    Console.WriteLine(0);
}
// 알고리즘 B의 시간 복잡도: 선형 시간
void AlgorithmB(int n) {
    for (int i = 0; i < n; i++) {
        Console.WriteLine(0);
    }
}
// 알고리즘 C의 시간 복잡도: 상수 시간
void AlgorithmC(int n) {
    for (int i = 0; i < 1000000; i++) {
        Console.WriteLine(0);
    }
}
```

```go title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
func algorithm_A(n int) {
    fmt.Println(0)
}
// 알고리즘 B의 시간 복잡도: 선형 시간
func algorithm_B(n int) {
    for i := 0; i < n; i++ {
        fmt.Println(0)
    }
}
// 알고리즘 C의 시간 복잡도: 상수 시간
func algorithm_C(n int) {
    for i := 0; i < 1000000; i++ {
        fmt.Println(0)
    }
}
```

```swift title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
func algorithmA(n: Int) {
    print(0)
}

// 알고리즘 B의 시간 복잡도: 선형 시간
func algorithmB(n: Int) {
    for _ in 0 ..< n {
        print(0)
    }
}

// 알고리즘 C의 시간 복잡도: 상수 시간
func algorithmC(n: Int) {
    for _ in 0 ..< 1_000_000 {
        print(0)
    }
}
```

```javascript title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
function algorithm_A(n) {
    console.log(0);
}
// 알고리즘 B의 시간 복잡도: 선형 시간
function algorithm_B(n) {
    for (let i = 0; i < n; i++) {
        console.log(0);
    }
}
// 알고리즘 C의 시간 복잡도: 상수 시간
function algorithm_C(n) {
    for (let i = 0; i < 1000000; i++) {
        console.log(0);
    }
}

```

```typescript title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
function algorithm_A(n: number): void {
    console.log(0);
}
// 알고리즘 B의 시간 복잡도: 선형 시간
function algorithm_B(n: number): void {
    for (let i = 0; i < n; i++) {
        console.log(0);
    }
}
// 알고리즘 C의 시간 복잡도: 상수 시간
function algorithm_C(n: number): void {
    for (let i = 0; i < 1000000; i++) {
        console.log(0);
    }
}
```

```dart title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
void algorithmA(int n) {
  print(0);
}
// 알고리즘 B의 시간 복잡도: 선형 시간
void algorithmB(int n) {
  for (int i = 0; i < n; i++) {
    print(0);
  }
}
// 알고리즘 C의 시간 복잡도: 상수 시간
void algorithmC(int n) {
  for (int i = 0; i < 1000000; i++) {
    print(0);
  }
}
```

```rust title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
fn algorithm_A(n: i32) {
    println!("{}", 0);
}
// 알고리즘 B의 시간 복잡도: 선형 시간
fn algorithm_B(n: i32) {
    for _ in 0..n {
        println!("{}", 0);
    }
}
// 알고리즘 C의 시간 복잡도: 상수 시간
fn algorithm_C(n: i32) {
    for _ in 0..1000000 {
        println!("{}", 0);
    }
}
```

```c title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
void algorithm_A(int n) {
    printf("%d", 0);
}
// 알고리즘 B의 시간 복잡도: 선형 시간
void algorithm_B(int n) {
    for (int i = 0; i < n; i++) {
        printf("%d", 0);
    }
}
// 알고리즘 C의 시간 복잡도: 상수 시간
void algorithm_C(int n) {
    for (int i = 0; i < 1000000; i++) {
        printf("%d", 0);
    }
}
```

```kotlin title=""
// 알고리즘 A의 시간 복잡도: 상수 시간
fun algoritm_A(n: Int) {
    println(0)
}
// 알고리즘 B의 시간 복잡도: 선형 시간
fun algorithm_B(n: Int) {
    for (i in 0..<n){
        println(0)
    }
}
// 알고리즘 C의 시간 복잡도: 상수 시간
fun algorithm_C(n: Int) {
    for (i in 0..<1000000) {
        println(0)
    }
}
```

```ruby title=""
# 알고리즘 A의 시간 복잡도: 상수 시간
def algorithm_A(n)
    puts 0
end

# 알고리즘 B의 시간 복잡도: 선형 시간
def algorithm_B(n)
    (0...n).each { puts 0 }
end

# 알고리즘 C의 시간 복잡도: 상수 시간
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
    # n번 반복
    for i in range(n):  # +1
        print(0)        # +1
```

```cpp title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // n번 반복
    for (int i = 0; i < n; i++) { // +1(매번 i ++ 실행)
        cout << 0 << endl;    // +1
    }
}
```

```java title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // n번 반복
    for (int i = 0; i < n; i++) { // +1(매번 i ++ 실행)
        System.out.println(0);    // +1
    }
}
```

```csharp title=""
void Algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // n번 반복
    for (int i = 0; i < n; i++) {   // +1(매번 i ++ 실행)
        Console.WriteLine(0);   // +1
    }
}
```

```go title=""
func algorithm(n int) {
    a := 1      // +1
    a = a + 1   // +1
    a = a * 2   // +1
    // n번 반복
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
    // n번 반복
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
    // n번 반복
    for(let i = 0; i < n; i++){ // +1(매번 i ++ 실행)
        console.log(0); // +1
    }
}
```

```typescript title=""
function algorithm(n: number): void{
    var a: number = 1; // +1
    a += 1; // +1
    a *= 2; // +1
    // n번 반복
    for(let i = 0; i < n; i++){ // +1(매번 i ++ 실행)
        console.log(0); // +1
    }
}
```

```dart title=""
void algorithm(int n) {
  int a = 1; // +1
  a = a + 1; // +1
  a = a * 2; // +1
  // n번 반복
  for (int i = 0; i < n; i++) { // +1(매번 i ++ 실행)
    print(0); // +1
  }
}
```

```rust title=""
fn algorithm(n: i32) {
    let mut a = 1;   // +1
    a = a + 1;      // +1
    a = a * 2;      // +1

    // n번 반복
    for _ in 0..n { // +1(매번 i ++ 실행)
        println!("{}", 0); // +1
    }
}
```

```c title=""
void algorithm(int n) {
    int a = 1;  // +1
    a = a + 1;  // +1
    a = a * 2;  // +1
    // n번 반복
    for (int i = 0; i < n; i++) {   // +1(매번 i ++ 실행)
        printf("%d", 0);            // +1
    }
}
```

```kotlin title=""
fun algorithm(n: Int) {
    var a = 1 // +1
    a = a + 1 // +1
    a = a * 2 // +1
    // n번 반복
    for (i in 0..<n) { // +1(매번 i ++ 실행)
        println(0) // +1
    }
}
```

```ruby title=""
def algorithm(n)
    a = 1       # +1
    a = a + 1   # +1
    a = a * 2   # +1
    # n번 반복
    (0...n).each do # +1
        puts 0      # +1
    end
end
```

<!-- [snippet]{count_operations} -->
```python title=""
def algorithm(n: int):
    a = 1      # +0(요령 1)
    a = a + n  # +0(요령 1)
    # +n(요령 2)
    for i in range(5 * n + 1):
        print(0)
    # +n*n(요령 3)
    for i in range(2 * n):
        for j in range(n + 1):
            print(0)
```

```cpp title=""
void algorithm(int n) {
    int a = 1;  // +0(요령 1)
    a = a + n;  // +0(요령 1)
    // +n(요령 2)
    for (int i = 0; i < 5 * n + 1; i++) {
        cout << 0 << endl;
    }
    // +n*n(요령 3)
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            cout << 0 << endl;
        }
    }
}
```

```java title=""
void algorithm(int n) {
    int a = 1;  // +0(요령 1)
    a = a + n;  // +0(요령 1)
    // +n(요령 2)
    for (int i = 0; i < 5 * n + 1; i++) {
        System.out.println(0);
    }
    // +n*n(요령 3)
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            System.out.println(0);
        }
    }
}
```

```csharp title=""
void Algorithm(int n) {
    int a = 1;  // +0(요령 1)
    a = a + n;  // +0(요령 1)
    // +n(요령 2)
    for (int i = 0; i < 5 * n + 1; i++) {
        Console.WriteLine(0);
    }
    // +n*n(요령 3)
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            Console.WriteLine(0);
        }
    }
}
```

```go title=""
func algorithm(n int) {
    a := 1     // +0(요령 1)
    a = a + n  // +0(요령 1)
    // +n(요령 2)
    for i := 0; i < 5 * n + 1; i++ {
        fmt.Println(0)
    }
    // +n*n(요령 3)
    for i := 0; i < 2 * n; i++ {
        for j := 0; j < n + 1; j++ {
            fmt.Println(0)
        }
    }
}
```

```swift title=""
func algorithm(n: Int) {
    var a = 1 // +0(요령 1)
    a = a + n // +0(요령 1)
    // +n(요령 2)
    for _ in 0 ..< (5 * n + 1) {
        print(0)
    }
    // +n*n(요령 3)
    for _ in 0 ..< (2 * n) {
        for _ in 0 ..< (n + 1) {
            print(0)
        }
    }
}
```

```javascript title=""
function algorithm(n) {
    let a = 1;  // +0(요령 1)
    a = a + n;  // +0(요령 1)
    // +n(요령 2)
    for (let i = 0; i < 5 * n + 1; i++) {
        console.log(0);
    }
    // +n*n(요령 3)
    for (let i = 0; i < 2 * n; i++) {
        for (let j = 0; j < n + 1; j++) {
            console.log(0);
        }
    }
}
```

```typescript title=""
function algorithm(n: number): void {
    let a = 1;  // +0(요령 1)
    a = a + n;  // +0(요령 1)
    // +n(요령 2)
    for (let i = 0; i < 5 * n + 1; i++) {
        console.log(0);
    }
    // +n*n(요령 3)
    for (let i = 0; i < 2 * n; i++) {
        for (let j = 0; j < n + 1; j++) {
            console.log(0);
        }
    }
}
```

```dart title=""
void algorithm(int n) {
  int a = 1; // +0(요령 1)
  a = a + n; // +0(요령 1)
  // +n(요령 2)
  for (int i = 0; i < 5 * n + 1; i++) {
    print(0);
  }
  // +n*n(요령 3)
  for (int i = 0; i < 2 * n; i++) {
    for (int j = 0; j < n + 1; j++) {
      print(0);
    }
  }
}
```

```rust title=""
fn algorithm(n: i32) {
    let mut a = 1;     // +0(요령 1)
    a = a + n;        // +0(요령 1)

    // +n(요령 2)
    for i in 0..(5 * n + 1) {
        println!("{}", 0);
    }

    // +n*n(요령 3)
    for i in 0..(2 * n) {
        for j in 0..(n + 1) {
            println!("{}", 0);
        }
    }
}
```

```c title=""
void algorithm(int n) {
    int a = 1;  // +0(요령 1)
    a = a + n;  // +0(요령 1)
    // +n(요령 2)
    for (int i = 0; i < 5 * n + 1; i++) {
        printf("%d", 0);
    }
    // +n*n(요령 3)
    for (int i = 0; i < 2 * n; i++) {
        for (int j = 0; j < n + 1; j++) {
            printf("%d", 0);
        }
    }
}
```

```kotlin title=""
fun algorithm(n: Int) {
    var a = 1   // +0(요령 1)
    a = a + n   // +0(요령 1)
    // +n(요령 2)
    for (i in 0..<5 * n + 1) {
        println(0)
    }
    // +n*n(요령 3)
    for (i in 0..<2 * n) {
        for (j in 0..<n + 1) {
            println(0)
        }
    }
}
```

```ruby title=""
def algorithm(n)
    a = 1       # +0(요령 1)
    a = a + n   # +0(요령 1)
    # +n(요령 2)
    (0...(5 * n + 1)).each { puts 0 }
    # +n*n(요령 3)
    (0...(2 * n)).each do
        (0...(n + 1)).each { puts 0 }
    end
end
```
