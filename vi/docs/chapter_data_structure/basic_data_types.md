# Các kiểu dữ liệu cơ bản

Khi nói về dữ liệu được lưu trữ trong máy tính, chúng ta nghĩ đến nhiều dạng khác nhau như văn bản, hình ảnh, video, âm thanh, mô hình 3D, v.v. Mặc dù các loại dữ liệu này được tổ chức theo nhiều cách khác nhau nhưng chúng đều bao gồm nhiều loại dữ liệu cơ bản khác nhau.

**Các loại dữ liệu cơ bản là các loại mà CPU có thể hoạt động trực tiếp** và chúng được sử dụng trực tiếp trong các thuật toán, chủ yếu bao gồm các loại sau.

- Kiểu số nguyên `byte`, `short`, `int`, `long`.
- Các loại dấu phẩy động `float`, `double`, dùng để biểu thị số thập phân.
- Loại ký tự `char`, được dùng để thể hiện các chữ cái, dấu chấm câu và thậm chí cả biểu tượng cảm xúc bằng nhiều ngôn ngữ khác nhau.
- Loại Boolean `bool`, được sử dụng để thể hiện các phán đoán "có" và "không".

**Các loại dữ liệu cơ bản được lưu trữ ở dạng nhị phân trong máy tính**. Một chữ số nhị phân là một bit. Trong hầu hết các hệ điều hành hiện đại, byte $1$ bao gồm các bit $8$.

Phạm vi giá trị của các kiểu dữ liệu cơ bản phụ thuộc vào kích thước không gian mà chúng chiếm giữ. Dưới đây là một ví dụ sử dụng Java.

- Loại số nguyên `byte` chiếm $1$ byte = $8$ bit và có thể biểu thị các số $2^{8}$.
- Loại số nguyên `int` chiếm $4$ byte = $32$ bit và có thể biểu thị các số $2^{32}$.

Bảng sau liệt kê không gian bị chiếm dụng, phạm vi giá trị và giá trị mặc định của các loại dữ liệu cơ bản khác nhau trong Java. Bạn không cần phải ghi nhớ bảng này; hiểu biết khái quát là đủ, có thể tham khảo khi cần thiết.

<p align="center"> Bảng <id> &nbsp; Không gian bị chiếm dụng và phạm vi giá trị của các loại dữ liệu cơ bản </p>

| Loại | Biểu tượng | Không gian chiếm đóng | Giá trị tối thiểu | Giá trị tối đa | Giá trị mặc định |
| ---------- | -------- | -------------- | ------------------------ | -------------- | -------------- |
| Số nguyên | `byte` | 1 byte | $-2^7$ ($-128$) | $2^7 - 1$ ($127$) | $0$ |
|            | `short` | 2 byte | $-2^{15}$ | $2^{15} - 1$ | $0$ |
|            | `int` | 4 byte | $-2^{31}$ | $2^{31} - 1$ | $0$ |
|            | `long` | 8 byte | $-2^{63}$ | $2^{63} - 1$ | $0$ |
| Phao | `float` | 4 byte | $1,175 \times 10^{-38}$ | $3,403 \times 10^{38}$ | $0,0\text{f}$ |
|            | `double` | 8 byte | $2,225 \times 10^{-308}$ | $1,798 \times 10^{308}$ | $0,0$ |
| Nhân vật | `char` | 2 byte | $0$ | $2^{16} - 1$ | $0$ |
| Boolean | `bool` | 1 byte | $\văn bản{false}$ | $\text{true}$ | $\văn bản{false}$ |

Xin lưu ý rằng bảng trên áp dụng cụ thể cho các kiểu dữ liệu cơ bản của Java. Mỗi ngôn ngữ lập trình có định nghĩa kiểu riêng và cách sử dụng không gian, phạm vi giá trị và giá trị mặc định của chúng có thể khác nhau.

- Trong Python, loại số nguyên `int` có thể có kích thước bất kỳ, chỉ bị giới hạn bởi bộ nhớ khả dụng; loại dấu phẩy động `float` có độ chính xác kép 64-bit; không có loại `char`, một ký tự đơn thực sự là một chuỗi `str` có độ dài 1.
- C và C++ không chỉ định rõ ràng kích thước của các kiểu dữ liệu cơ bản, kích thước này thay đổi tùy theo cách triển khai và nền tảng. Bảng trên tuân theo LP64 [mô hình dữ liệu](https://en.cppreference.com/w/cpp/language/types#Properties), được sử dụng trong các hệ điều hành Unix 64-bit bao gồm Linux và macOS.
- Kích thước của ký tự `char` là 1 byte trong C và C++ và trong hầu hết các ngôn ngữ lập trình, kích thước này phụ thuộc vào phương pháp mã hóa ký tự cụ thể, như được nêu chi tiết trong phần "Mã hóa ký tự".
- Mặc dù việc biểu thị một giá trị boolean chỉ yêu cầu 1 bit ($0$ hoặc $1$), nhưng nó thường được lưu dưới dạng 1 byte trong bộ nhớ. Điều này là do CPU máy tính hiện đại thường sử dụng 1 byte làm đơn vị bộ nhớ có thể định địa chỉ tối thiểu.

Vậy mối quan hệ giữa các kiểu dữ liệu cơ bản và cấu trúc dữ liệu là gì? Chúng ta biết rằng cấu trúc dữ liệu là cách tổ chức và lưu trữ dữ liệu trong máy tính. Ở đây, điểm nhấn là "cấu trúc" chứ không phải "dữ liệu".

Nếu chúng ta muốn biểu diễn "một hàng số", chúng ta đương nhiên nghĩ đến việc sử dụng mảng. Điều này là do cấu trúc tuyến tính của một mảng có thể biểu thị các mối quan hệ kề và thứ tự của các số, nhưng nội dung được lưu trữ là số nguyên `int`, dấu phẩy động `float` hay ký tự `char` thì không liên quan đến "cấu trúc dữ liệu".

Nói cách khác, **kiểu dữ liệu cơ bản cung cấp "loại nội dung" của dữ liệu, trong khi cấu trúc dữ liệu cung cấp "phương pháp tổ chức" dữ liệu**. Ví dụ: trong đoạn mã sau, chúng tôi sử dụng cùng một cấu trúc dữ liệu (mảng) để lưu trữ và biểu thị các loại dữ liệu cơ bản khác nhau, bao gồm `int`, `float`, `char`, `bool`, v.v.

=== "Python"

    ```python title=""
    # Initialize arrays using various basic data types
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # In Python, characters are actually strings of length 1
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python lists can freely store various basic data types and object references
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // Initialize arrays using various basic data types
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // Initialize arrays using various basic data types
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // Initialize arrays using various basic data types
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // Initialize arrays using various basic data types
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // Initialize arrays using various basic data types
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript arrays can freely store various basic data types and objects
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // Initialize arrays using various basic data types
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // Initialize arrays using various basic data types
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // Initialize arrays using various basic data types
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0; 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // Initialize arrays using various basic data types
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""
    // Initialize arrays using various basic data types
    val numbers = IntArray(5)
    val decinals = FloatArray(5)
    val characters = CharArray(5)
    val bools = BooleanArray(5)
    ```

=== "Ruby"

    ```ruby title=""
    # Ruby lists can freely store various basic data types and object references
    data = [0, 0.0, 'a', false, ListNode(0)]
    ```

??? pythontutor "Thực thi trực quan"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%B E%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A% 20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7% 82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20 %20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code% 22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8% E5%A4%9A%E7%A7%8D%E5%9F%BA%E6%9C%AC%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B%E6%9D%A5%E5%88%9D%E5% A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%0A%20%20%20%20số%20%3D%20%5B0%5D%20*%205%0A%20%20%20%20 số thập phân%20%3D%20%5B0.0%5D%20*%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%AD%97%E7%AC%A6% E5%AE%9E%E9%99%85%E4%B8%8A%E6%98%AF%E9%95%BF%E5%BA%A6%E4%B8%BA%201%20%E7%9A%84%E5%AD%97%E7%AC %A6%E4%B8%B2%0A%20%20%20%20 ký tự%20%3D%20%5B'0'%5D%20*%205%0A%20%20%20%20bools%20%3D%20% 5BFalse%5D%20*%205%0A%20%20%20%20%23%20Python%20%E7%9A%84%E5%88%97%E8%A1%A8%E5%8F%AF%E4%BB%A5 %E8%87%AA%E7%94%B1%E5%AD%98%E5%82%A8%E5%90%84%E7%A7%8D%E5%9F%BA%E6%9C%AC%E6%95%B0%E6%8D%AE%E 7%B1%BB%E5%9E%8B%E5%92%8C%E5%AF%B9%E8%B1%A1%E5%BC%95%E7%94%A8%0A%20%20%20%20data%20%3D%20%5B0 ,%200.0,%20'a',%20False,%20ListNode%280%29%5D&cumulative=false&curInstr=12&heapPrimitives=nvernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
