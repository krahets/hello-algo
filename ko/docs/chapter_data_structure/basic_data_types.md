---
comments: true
---

# 3.2 &nbsp; 기본 자료형

컴퓨터의 데이터라고 하면 글, 이미지, 영상, 음성, 3D 모델 등 다양한 형태가 떠오른다. 구성 방식은 제각각이지만 모두 여러 기본 자료형으로 이루어진다.

**기본 자료형은 CPU가 직접 연산할 수 있는 자료형**으로 알고리즘에서도 바로 사용한다. 주요 종류는 다음과 같다.

- 정수형에는 `byte`, `short`, `int`, `long`이 있다.
- 부동소수점형 `float`와 `double`은 소수를 표현한다.
- 문자형 `char`는 여러 언어의 글자와 문장 부호, 이모지 등을 표현한다.
- 불리언형 `bool`은 ‘예’와 ‘아니요’라는 판단을 표현한다.

**컴퓨터는 기본 자료형의 값을 이진 형태로 저장한다**. 이진수 한 자리가 $1$비트이다. 오늘날 거의 모든 운영체제에서 $1$바이트(byte)는 $8$비트(bit)로 이루어진다.

기본 자료형이 표현할 수 있는 값의 범위는 차지하는 공간의 크기에 따라 정해진다. Java를 예로 들어 보자.

- 정수형 `byte`는 $1$바이트 = $8$비트를 차지하며 $2^{8}$개의 수를 표현할 수 있다.
- 정수형 `int`는 $4$바이트 = $32$비트를 차지하며 $2^{32}$개의 수를 표현할 수 있다.

다음 표(3-1)는 Java의 각 기본 자료형이 차지하는 공간, 값의 범위, 기본값을 보여 준다. 표를 외울 필요는 없다. 대략적인 의미를 이해하고 필요할 때 다시 찾아보면 된다.

<p align="center"> 표 3-1 &nbsp; 기본 자료형의 크기와 값의 범위 </p>

<div class="center-table" markdown>

| 유형   | 기호     | 차지하는 공간 | 최솟값                   | 최댓값                  | 기본값         |
| ------ | -------- | -------- | ------------------------ | ----------------------- | -------------- |
| 정수   | `byte`   | 1바이트   | $-2^7$ ($-128$)          | $2^7 - 1$ ($127$)       | $0$            |
|        | `short`  | 2바이트   | $-2^{15}$                | $2^{15} - 1$            | $0$            |
|        | `int`    | 4바이트   | $-2^{31}$                | $2^{31} - 1$            | $0$            |
|        | `long`   | 8바이트   | $-2^{63}$                | $2^{63} - 1$            | $0$            |
| 부동소수점 수 | `float`  | 4바이트   | $1.175 \times 10^{-38}$  | $3.403 \times 10^{38}$  | $0.0\text{f}$  |
|        | `double` | 8바이트   | $2.225 \times 10^{-308}$ | $1.798 \times 10^{308}$ | $0.0$          |
| 문자   | `char`   | 2바이트   | $0$                      | $2^{16} - 1$            | $0$            |
| 불리언   | `bool`   | 1바이트   | $\text{false}$           | $\text{true}$           | $\text{false}$ |

</div>

위 표(3-1)는 Java의 기본 자료형을 기준으로 한다. 언어마다 자료형을 따로 정의하므로 차지하는 공간, 값의 범위, 기본값이 다를 수 있다.

- Python의 정수형 `int`는 사용 가능한 메모리 범위 안에서 크기에 제한이 없다. 부동소수점형 `float`는 64비트 배정밀도이다. 별도의 `char` 자료형은 없으며 문자 하나는 실제로 길이가 1인 문자열 `str`이다.
- C와 C++에서는 기본 자료형의 크기를 명시적으로 정하지 않아 구현과 플랫폼에 따라 크기가 달라진다. 위 표(3-1)는 Linux와 macOS를 비롯한 64비트 Unix 운영체제에서 사용하는 LP64 [데이터 모델](https://en.cppreference.com/w/cpp/language/types#Properties)을 따른다.
- 문자형 `char`의 크기는 C와 C++에서 1바이트이다. 대부분의 프로그래밍 언어에서는 구체적인 문자 인코딩 방식에 따라 달라진다. 자세한 내용은 ‘문자 인코딩’ 절을 참조하라.
- 불리언 값을 나타내려면 1비트($0$ 또는 $1$)면 충분하지만 메모리에는 보통 1바이트로 저장한다. 현대 컴퓨터의 CPU는 일반적으로 1바이트를 주소 지정의 최소 단위로 삼기 때문이다.

그렇다면 기본 자료형과 자료 구조는 어떤 관계일까? 자료 구조는 컴퓨터에서 데이터를 조직하고 저장하는 방식이다. 이 설명의 중심은 ‘데이터’가 아니라 ‘구조’이다.

‘한 줄로 놓인 수’를 나타내려면 자연스럽게 배열을 떠올리게 된다. 배열의 선형 구조가 수들의 이웃 관계와 순서를 표현할 수 있기 때문이다. 저장하는 내용이 정수 `int`인지, 소수 `float`인지, 문자 `char`인지는 ‘자료 구조’와 무관하다.

다시 말해 **기본 자료형은 데이터의 ‘내용 유형’을, 자료 구조는 데이터의 ‘조직 방식’을 정한다**. 예를 들어 다음 코드에서는 같은 자료 구조인 배열로 `int`, `float`, `char`, `bool` 등 서로 다른 기본 자료형의 값을 저장하고 표현한다.

=== "Python"

    ```python title=""
    # 여러 기본 자료형의 값으로 배열 초기화
    numbers: list[int] = [0] * 5
    decimals: list[float] = [0.0] * 5
    # Python에서 문자는 실제로 길이가 1인 문자열이다.
    characters: list[str] = ['0'] * 5
    bools: list[bool] = [False] * 5
    # Python 리스트에는 여러 기본 자료형의 값과 객체 참조를 자유롭게 저장할 수 있다.
    data = [0, 0.0, 'a', False, ListNode(0)]
    ```

=== "C++"

    ```cpp title=""
    // 여러 기본 자료형의 값으로 배열 초기화
    int numbers[5];
    float decimals[5];
    char characters[5];
    bool bools[5];
    ```

=== "Java"

    ```java title=""
    // 여러 기본 자료형의 값으로 배열 초기화
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    boolean[] bools = new boolean[5];
    ```

=== "C#"

    ```csharp title=""
    // 여러 기본 자료형의 값으로 배열 초기화
    int[] numbers = new int[5];
    float[] decimals = new float[5];
    char[] characters = new char[5];
    bool[] bools = new bool[5];
    ```

=== "Go"

    ```go title=""
    // 여러 기본 자료형의 값으로 배열 초기화
    var numbers = [5]int{}
    var decimals = [5]float64{}
    var characters = [5]byte{}
    var bools = [5]bool{}
    ```

=== "Swift"

    ```swift title=""
    // 여러 기본 자료형의 값으로 배열 초기화
    let numbers = Array(repeating: 0, count: 5)
    let decimals = Array(repeating: 0.0, count: 5)
    let characters: [Character] = Array(repeating: "a", count: 5)
    let bools = Array(repeating: false, count: 5)
    ```

=== "JS"

    ```javascript title=""
    // JavaScript 배열에는 여러 기본 자료형의 값과 객체를 자유롭게 저장할 수 있다.
    const array = [0, 0.0, 'a', false];
    ```

=== "TS"

    ```typescript title=""
    // 여러 기본 자료형의 값으로 배열 초기화
    const numbers: number[] = [];
    const characters: string[] = [];
    const bools: boolean[] = [];
    ```

=== "Dart"

    ```dart title=""
    // 여러 기본 자료형의 값으로 배열 초기화
    List<int> numbers = List.filled(5, 0);
    List<double> decimals = List.filled(5, 0.0);
    List<String> characters = List.filled(5, 'a');
    List<bool> bools = List.filled(5, false);
    ```

=== "Rust"

    ```rust title=""
    // 여러 기본 자료형의 값으로 배열 초기화
    let numbers: Vec<i32> = vec![0; 5];
    let decimals: Vec<f32> = vec![0.0; 5];
    let characters: Vec<char> = vec!['0'; 5];
    let bools: Vec<bool> = vec![false; 5];
    ```

=== "C"

    ```c title=""
    // 여러 기본 자료형의 값으로 배열 초기화
    int numbers[10];
    float decimals[10];
    char characters[10];
    bool bools[10];
    ```

=== "Kotlin"

    ```kotlin title=""
    // 여러 기본 자료형의 값으로 배열 초기화
    val numbers = IntArray(5)
    val decinals = FloatArray(5)
    val characters = CharArray(5)
    val bools = BooleanArray(5)
    ```

=== "Ruby"

    ```ruby title=""
    # Ruby 리스트에는 여러 기본 자료형의 값과 객체 참조를 자유롭게 저장할 수 있다.
    data = [0, 0.0, 'a', false, ListNode.new(0)]
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%9D%98%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%85%B8%EB%93%9C%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%97%AC%EB%9F%AC%20%EA%B8%B0%EB%B3%B8%20%EC%9E%90%EB%A3%8C%ED%98%95%EC%9C%BC%EB%A1%9C%20%EB%B0%B0%EC%97%B4%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20%ED%8C%8C%EC%9D%B4%EC%8D%AC%EC%97%90%EC%84%9C%20%EB%AC%B8%EC%9E%90%20%ED%95%98%EB%82%98%EB%8A%94%20%EA%B8%B8%EC%9D%B4%EA%B0%80%201%EC%9D%B8%20%EB%AC%B8%EC%9E%90%EC%97%B4%EC%9D%B4%EB%8B%A4%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20%ED%8C%8C%EC%9D%B4%EC%8D%AC%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%97%90%EB%8A%94%20%EC%97%AC%EB%9F%AC%20%EA%B8%B0%EB%B3%B8%20%EC%9E%90%EB%A3%8C%ED%98%95%EC%9D%98%20%EA%B0%92%EA%B3%BC%20%EA%B0%9D%EC%B2%B4%20%EC%B0%B8%EC%A1%B0%EB%A5%BC%20%ED%95%A8%EA%BB%98%20%EB%8B%B4%EC%9D%84%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20%27a%27,%20False,%20ListNode%280%29%5D&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%EC%97%B0%EA%B2%B0%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%9D%98%20%EB%85%B8%EB%93%9C%20%ED%81%B4%EB%9E%98%EC%8A%A4%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%EB%85%B8%EB%93%9C%20%EA%B0%92%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%85%B8%EB%93%9C%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%B0%B8%EC%A1%B0%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%97%AC%EB%9F%AC%20%EA%B8%B0%EB%B3%B8%20%EC%9E%90%EB%A3%8C%ED%98%95%EC%9C%BC%EB%A1%9C%20%EB%B0%B0%EC%97%B4%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20numbers%20%3D%20%5B0%5D%20%2A%205%0A%20%20%20%20decimals%20%3D%20%5B0.0%5D%20%2A%205%0A%20%20%20%20%23%20%ED%8C%8C%EC%9D%B4%EC%8D%AC%EC%97%90%EC%84%9C%20%EB%AC%B8%EC%9E%90%20%ED%95%98%EB%82%98%EB%8A%94%20%EA%B8%B8%EC%9D%B4%EA%B0%80%201%EC%9D%B8%20%EB%AC%B8%EC%9E%90%EC%97%B4%EC%9D%B4%EB%8B%A4%0A%20%20%20%20characters%20%3D%20%5B%270%27%5D%20%2A%205%0A%20%20%20%20bools%20%3D%20%5BFalse%5D%20%2A%205%0A%20%20%20%20%23%20%ED%8C%8C%EC%9D%B4%EC%8D%AC%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EC%97%90%EB%8A%94%20%EC%97%AC%EB%9F%AC%20%EA%B8%B0%EB%B3%B8%20%EC%9E%90%EB%A3%8C%ED%98%95%EC%9D%98%20%EA%B0%92%EA%B3%BC%20%EA%B0%9D%EC%B2%B4%20%EC%B0%B8%EC%A1%B0%EB%A5%BC%20%ED%95%A8%EA%BB%98%20%EB%8B%B4%EC%9D%84%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20data%20%3D%20%5B0,%200.0,%20%27a%27,%20False,%20ListNode%280%29%5D&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>
