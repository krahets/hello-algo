# スタック

<u>スタック</u>は、後入先出（LIFO）の原則に従う線形データ構造です。

スタックをテーブル上の皿の山に例えることができます。底の皿にアクセスするには、まず上の皿を取り除く必要があります。皿を様々な種類の要素（整数、文字、オブジェクトなど）に置き換えることで、スタックと呼ばれるデータ構造を得ることができます。

下図に示すように、要素の山の上部を「スタックのトップ」、下部を「スタックのボトム」と呼びます。スタックのトップに要素を追加する操作を「プッシュ」、トップ要素を削除する操作を「ポップ」と呼びます。

![スタックの後入先出ルール](stack.assets/stack_operations.png)

## スタックの一般的な操作

スタックの一般的な操作を下表に示します。具体的なメソッド名は使用するプログラミング言語によって異なります。ここでは、例として`push()`、`pop()`、`peek()`を使用します。

<p align="center"> 表 <id> &nbsp; スタック操作の効率 </p>

| メソッド   | 説明                                     | 時間計算量 |
| -------- | ----------------------------------------------- | --------------- |
| `push()` | 要素をスタックにプッシュ（トップに追加） | $O(1)$          |
| `pop()`  | スタックからトップ要素をポップ              | $O(1)$          |
| `peek()` | スタックのトップ要素にアクセス             | $O(1)$          |

通常、プログラミング言語に組み込まれているスタッククラスを直接使用できます。ただし、一部の言語では具体的にスタッククラスを提供していない場合があります。これらの場合、言語の「配列」または「連結リスト」をスタックとして使用し、プログラムでスタックロジックに関連しない操作を無視できます。

=== "Python"

    ```python title="stack.py"
    # スタックを初期化
    # Pythonには組み込みのスタッククラスがないため、listをスタックとして使用
    stack: list[int] = []

    # 要素をスタックにプッシュ
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    # スタックのトップ要素にアクセス
    peek: int = stack[-1]

    # スタックから要素をポップ
    pop: int = stack.pop()

    # スタックの長さを取得
    size: int = len(stack)

    # スタックが空かどうかチェック
    is_empty: bool = len(stack) == 0
    ```

=== "C++"

    ```cpp title="stack.cpp"
    /* スタックを初期化 */
    stack<int> stack;

    /* 要素をスタックにプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックのトップ要素にアクセス */
    int top = stack.top();

    /* スタックから要素をポップ */
    stack.pop(); // 戻り値なし

    /* スタックの長さを取得 */
    int size = stack.size();

    /* スタックが空かどうかチェック */
    bool empty = stack.empty();
    ```

=== "Java"

    ```java title="stack.java"
    /* スタックを初期化 */
    Stack<Integer> stack = new Stack<>();

    /* 要素をスタックにプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックのトップ要素にアクセス */
    int peek = stack.peek();

    /* スタックから要素をポップ */
    int pop = stack.pop();

    /* スタックの長さを取得 */
    int size = stack.size();

    /* スタックが空かどうかチェック */
    boolean isEmpty = stack.isEmpty();
    ```

=== "C#"

    ```csharp title="stack.cs"
    /* スタックを初期化 */
    Stack<int> stack = new();

    /* 要素をスタックにプッシュ */
    stack.Push(1);
    stack.Push(3);
    stack.Push(2);
    stack.Push(5);
    stack.Push(4);

    /* スタックのトップ要素にアクセス */
    int peek = stack.Peek();

    /* スタックから要素をポップ */
    int pop = stack.Pop();

    /* スタックの長さを取得 */
    int size = stack.Count;

    /* スタックが空かどうかチェック */
    bool isEmpty = stack.Count == 0;
    ```

=== "Go"

    ```go title="stack_test.go"
    /* スタックを初期化 */
    // Goでは、Sliceをスタックとして使用することが推奨されます
    var stack []int

    /* 要素をスタックにプッシュ */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)

    /* スタックのトップ要素にアクセス */
    peek := stack[len(stack)-1]

    /* スタックから要素をポップ */
    pop := stack[len(stack)-1]
    stack = stack[:len(stack)-1]

    /* スタックの長さを取得 */
    size := len(stack)

    /* スタックが空かどうかチェック */
    isEmpty := len(stack) == 0
    ```

=== "Swift"

    ```swift title="stack.swift"
    /* スタックを初期化 */
    // Swiftには組み込みのスタッククラスがないため、Arrayをスタックとして使用
    var stack: [Int] = []

    /* 要素をスタックにプッシュ */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    /* スタックのトップ要素にアクセス */
    let peek = stack.last!

    /* スタックから要素をポップ */
    let pop = stack.removeLast()

    /* スタックの長さを取得 */
    let size = stack.count

    /* スタックが空かどうかチェック */
    let isEmpty = stack.isEmpty
    ```

=== "JS"

    ```javascript title="stack.js"
    /* スタックを初期化 */
    // JavaScriptには組み込みのスタッククラスがないため、Arrayをスタックとして使用
    const stack = [];

    /* 要素をスタックにプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックのトップ要素にアクセス */
    const peek = stack[stack.length-1];

    /* スタックから要素をポップ */
    const pop = stack.pop();

    /* スタックの長さを取得 */
    const size = stack.length;

    /* スタックが空かどうかチェック */
    const is_empty = stack.length === 0;
    ```

=== "TS"

    ```typescript title="stack.ts"
    /* スタックを初期化 */
    // TypeScriptには組み込みのスタッククラスがないため、Arrayをスタックとして使用
    const stack: number[] = [];

    /* 要素をスタックにプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックのトップ要素にアクセス */
    const peek = stack[stack.length - 1];

    /* スタックから要素をポップ */
    const pop = stack.pop();

    /* スタックの長さを取得 */
    const size = stack.length;

    /* スタックが空かどうかチェック */
    const is_empty = stack.length === 0;
    ```

=== "Dart"

    ```dart title="stack.dart"
    /* スタックを初期化 */
    // Dartには組み込みのスタッククラスがないため、Listをスタックとして使用
    List<int> stack = [];

    /* 要素をスタックにプッシュ */
    stack.add(1);
    stack.add(3);
    stack.add(2);
    stack.add(5);
    stack.add(4);

    /* スタックのトップ要素にアクセス */
    int peek = stack.last;

    /* スタックから要素をポップ */
    int pop = stack.removeLast();

    /* スタックの長さを取得 */
    int size = stack.length;

    /* スタックが空かどうかチェック */
    bool isEmpty = stack.isEmpty;
    ```

=== "Rust"

    ```rust title="stack.rs"
    /* スタックを初期化 */
    // Vecをスタックとして使用
    let mut stack: Vec<i32> = Vec::new();

    /* 要素をスタックにプッシュ */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* スタックのトップ要素にアクセス */
    let top = stack.last().unwrap();

    /* スタックから要素をポップ */
    let pop = stack.pop().unwrap();

    /* スタックの長さを取得 */
    let size = stack.len();

    /* スタックが空かどうかチェック */
    let is_empty = stack.is_empty();
    ```

=== "C"

    ```c title="stack.c"
    // Cは組み込みのスタックを提供していません
    ```

=== "Kotlin"

    ```kotlin title="stack.kt"

    ```

=== "Zig"

    ```zig title="stack.zig"

    ```

## スタックの実装

スタックがどのように動作するかをより深く理解するために、自分でスタッククラスを実装してみましょう。

スタックは後入先出の原則に従うため、スタックのトップでのみ要素を追加または削除できます。しかし、配列と連結リストの両方は任意の位置で要素を追加・削除できるため、**スタックは制限された配列または連結リストと見なすことができます**。言い換えれば、配列や連結リストの特定の無関係な操作を「遮蔽」して、外部の動作をスタックの特性に合わせることができます。

### 連結リストベースの実装

連結リストを使用してスタックを実装する場合、リストのヘッドノードをスタックのトップ、テールノードをスタックのボトムと考えることができます。

下図に示すように、プッシュ操作では、単に連結リストのヘッドに要素を挿入します。このノード挿入方法は「ヘッド挿入」として知られています。ポップ操作では、リストからヘッドノードを削除するだけです。

=== "LinkedListStack"
    ![連結リストによるスタック実装のプッシュとポップ操作](stack.assets/linkedlist_stack_step1.png)

=== "push()"
    ![linkedlist_stack_push](stack.assets/linkedlist_stack_step2_push.png)

=== "pop()"
    ![linkedlist_stack_pop](stack.assets/linkedlist_stack_step3_pop.png)

以下は、連結リストに基づくスタック実装のサンプルコードです：

```src
[file]{linkedlist_stack}-[class]{linked_list_stack}-[func]{}
```

### 配列ベースの実装

配列を使用してスタックを実装する場合、配列の末尾をスタックのトップと考えることができます。下図に示すように、プッシュとポップ操作は、それぞれ配列の末尾での要素の追加と削除に対応し、どちらも時間計算量$O(1)$です。

=== "ArrayStack"
    ![配列によるスタック実装のプッシュとポップ操作](stack.assets/array_stack_step1.png)

=== "push()"
    ![array_stack_push](stack.assets/array_stack_step2_push.png)

=== "pop()"
    ![array_stack_pop](stack.assets/array_stack_step3_pop.png)

スタックにプッシュされる要素が継続的に増加する可能性があるため、動的配列を使用でき、配列拡張を自分で処理する必要がありません。以下はサンプルコードです：

```src
[file]{array_stack}-[class]{array_stack}-[func]{}
```

## 2つの実装の比較

**サポートされる操作**

両方の実装は、スタックで定義されたすべての操作をサポートします。配列実装はさらにランダムアクセスをサポートしますが、これはスタック定義の範囲を超えており、一般的には使用されません。

**時間効率**

配列ベースの実装では、プッシュとポップ操作の両方が事前に割り当てられた連続メモリで発生し、良好なキャッシュ局所性があるため効率が高くなります。しかし、プッシュ操作が配列容量を超える場合、リサイズメカニズムがトリガーされ、そのプッシュ操作の時間計算量は$O(n)$になります。

連結リスト実装では、リスト拡張は非常に柔軟で、配列拡張のような効率低下の問題はありません。しかし、プッシュ操作にはノードオブジェクトの初期化とポインタの変更が必要なため、効率は比較的低くなります。プッシュされる要素がすでにノードオブジェクトの場合、初期化ステップをスキップでき、効率が向上します。

したがって、プッシュとポップ操作の要素が`int`や`double`などの基本データ型の場合、以下の結論を導くことができます：

- 配列ベースのスタック実装は拡張時に効率が低下しますが、拡張は低頻度操作であるため、平均効率は高くなります。
- 連結リストベースのスタック実装はより安定した効率パフォーマンスを提供します。

**空間効率**

リストを初期化する際、システムは「初期容量」を割り当てますが、これは実際の必要量を超える可能性があります。さらに、拡張メカニズムは通常、特定の係数（2倍など）で容量を増加させ、これも実際の必要量を超える可能性があります。したがって、**配列ベースのスタックは一部の空間を無駄にする可能性があります**。

しかし、連結リストノードはポインタを格納するための追加空間が必要なため、**連結リストノードが占有する空間は比較的大きくなります**。

まとめると、どちらの実装がよりメモリ効率的かを単純に判断することはできません。特定の状況に基づく分析が必要です。

## スタックの典型的な応用

- **ブラウザの戻ると進む、ソフトウェアの元に戻すとやり直し**。新しいWebページを開くたびに、ブラウザは前のページをスタックにプッシュし、戻る操作（本質的にはポップ操作）を通じて前のページに戻ることができます。戻ると進むの両方をサポートするには、2つのスタックが連携して動作する必要があります。
- **プログラムのメモリ管理**。関数が呼び出されるたびに、システムはスタックのトップにスタックフレームを追加して関数のコンテキスト情報を記録します。再帰関数では、下方向の再帰フェーズはスタックへのプッシュを続け、上方向のバックトラッキングフェーズはスタックからのポップを続けます。
