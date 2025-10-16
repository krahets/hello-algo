---
comments: true
---

# 4.1 &nbsp; 配列

<u>配列</u>は線形データ構造で、同じような項目が並んでいるようなもので、コンピュータのメモリ内の連続した空間に一緒に格納されます。これは整理された格納を維持するシーケンスのようなものです。この並びの各項目には、<u>インデックス</u>として知られる独自の「位置」があります。以下の図を参照して、配列の動作を観察し、これらの重要な用語を理解してください。

![配列の定義と格納方法](array.assets/array_definition.png){ class="animation-figure" }

<p align="center"> 図 4-1 &nbsp; 配列の定義と格納方法 </p>

## 4.1.1 &nbsp; 配列の一般的な操作

### 1. &nbsp; 配列の初期化

配列は必要に応じて2つの方法で初期化できます：初期値なしまたは指定された初期値付きです。初期値が指定されていない場合、ほとんどのプログラミング言語は配列要素を$0$に設定します：

=== "Python"

    ```python title="array.py"
    # 配列を初期化
    arr: list[int] = [0] * 5  # [ 0, 0, 0, 0, 0 ]
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 配列を初期化 */
    // スタックに格納
    int arr[5];
    int nums[5] = { 1, 3, 2, 5, 4 };
    // ヒープに格納（手動でのメモリ解放が必要）
    int* arr1 = new int[5];
    int* nums1 = new int[5] { 1, 3, 2, 5, 4 };
    ```

=== "Java"

    ```java title="array.java"
    /* 配列を初期化 */
    int[] arr = new int[5]; // { 0, 0, 0, 0, 0 }
    int[] nums = { 1, 3, 2, 5, 4 };
    ```

=== "C#"

    ```csharp title="array.cs"
    /* 配列を初期化 */
    int[] arr = new int[5]; // [ 0, 0, 0, 0, 0 ]
    int[] nums = [1, 3, 2, 5, 4];
    ```

=== "Go"

    ```go title="array.go"
    /* 配列を初期化 */
    var arr [5]int
    // Goでは、長さを指定（[5]int）すると配列を示し、指定しない（[]int）とスライスを示します。
    // Goの配列はコンパイル時に固定長を持つよう設計されているため、長さの指定には定数のみ使用できます。
    // extend()メソッドの実装の便宜上、ここではSliceを配列として扱います。
    nums := []int{1, 3, 2, 5, 4}
    ```

=== "Swift"

    ```swift title="array.swift"
    /* 配列を初期化 */
    let arr = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
    let nums = [1, 3, 2, 5, 4]
    ```

=== "JS"

    ```javascript title="array.js"
    /* 配列を初期化 */
    var arr = new Array(5).fill(0);
    var nums = [1, 3, 2, 5, 4];
    ```

=== "TS"

    ```typescript title="array.ts"
    /* 配列を初期化 */
    let arr: number[] = new Array(5).fill(0);
    let nums: number[] = [1, 3, 2, 5, 4];
    ```

=== "Dart"

    ```dart title="array.dart"
    /* 配列を初期化 */
    List<int> arr = List.filled(5, 0); // [0, 0, 0, 0, 0]
    List<int> nums = [1, 3, 2, 5, 4];
    ```

=== "Rust"

    ```rust title="array.rs"
    /* 配列を初期化 */
    let arr: [i32; 5] = [0; 5]; // [0, 0, 0, 0, 0]
    let slice: &[i32] = &[0; 5];
    // Rustでは、長さを指定（[i32; 5]）すると配列を示し、指定しない（&[i32]）とスライスを示します。
    // Rustの配列はコンパイル時に固定長を持つよう設計されているため、長さの指定には定数のみ使用できます。
    // 一般的にRustでは動的配列としてVectorが使用されます。
    // extend()メソッドの実装の便宜上、ここではベクターを配列として扱います。
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    ```

=== "C"

    ```c title="array.c"
    /* 配列を初期化 */
    int arr[5] = { 0 }; // { 0, 0, 0, 0, 0 }
    int nums[5] = { 1, 3, 2, 5, 4 };
    ```

=== "Kotlin"

    ```kotlin title="array.kt"

    ```

=== "Zig"

    ```zig title="array.zig"
    // 配列を初期化
    var arr = [_]i32{0} ** 5; // { 0, 0, 0, 0, 0 }
    var nums = [_]i32{ 1, 3, 2, 5, 4 };
    ```

### 2. &nbsp; 要素へのアクセス

配列内の要素は連続したメモリ空間に格納されるため、各要素のメモリアドレスを計算することが簡単になります。以下の図に示されている公式は、配列のメモリアドレス（特に、最初の要素のアドレス）と要素のインデックスを利用して、要素のメモリアドレスを決定するのに役立ちます。この計算により、目的の要素への直接アクセスが合理化されます。

![配列要素のメモリアドレス計算](array.assets/array_memory_location_calculation.png){ class="animation-figure" }

<p align="center"> 図 4-2 &nbsp; 配列要素のメモリアドレス計算 </p>

上の図で観察されるように、配列のインデックスは慣例的に$0$から始まります。これは直感に反するように見えるかもしれません。数を数えるのは通常$1$から始まるためですが、アドレス計算公式内では、**インデックスは本質的にメモリアドレスからのオフセット**です。最初の要素のアドレスでは、このオフセットは$0$で、そのインデックスが$0$であることを検証しています。

配列内の要素へのアクセスは非常に効率的で、$O(1)$時間で任意の要素にランダムアクセスできます。

=== "Python"

    ```python title="array.py"
    def random_access(nums: list[int]) -> int:
        """要素へのランダムアクセス"""
        # 区間 [0, len(nums)-1] から数値をランダムに選択
        random_index = random.randint(0, len(nums) - 1)
        # ランダムな要素を取得して返す
        random_num = nums[random_index]
        return random_num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 要素への乱数アクセス */
    int randomAccess(int *nums, int size) {
        // [0, size)の範囲で乱数を選択
        int randomIndex = rand() % size;
        // 乱数要素を取得して返却
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 要素へのランダムアクセス */
    int randomAccess(int[] nums) {
        // 区間 [0, nums.length) からランダムに数を選択
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // ランダム要素を取得して返す
        int randomNum = nums[randomIndex];
        return randomNum;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{RandomAccess}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{randomAccess}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{randomAccess}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{randomAccess}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{randomAccess}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{randomAccess}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{random_access}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{randomAccess}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{randomAccess}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{random_access}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{randomAccess}
    ```

### 3. &nbsp; 要素の挿入

配列要素はメモリ内で密に詰まっており、それらの間に追加データを収容するための空間はありません。以下の図に示すように、配列の中央に要素を挿入するには、後続のすべての要素を1つずつ後ろにシフトして、新しい要素のための空間を作る必要があります。

![配列要素挿入の例](array.assets/array_insert_element.png){ class="animation-figure" }

<p align="center"> 図 4-3 &nbsp; 配列要素挿入の例 </p>

配列の長さが固定されているため、要素を挿入すると必然的に配列の最後の要素が失われることに注意することが重要です。この問題を解決する方法は「リスト」の章で探求されます。

=== "Python"

    ```python title="array.py"
    def insert(nums: list[int], num: int, index: int):
        """インデックス index に要素 num を挿入"""
        # インデックス index より後のすべての要素を1つ後ろに移動
        for i in range(len(nums) - 1, index, -1):
            nums[i] = nums[i - 1]
        # num を index の位置の要素に代入
        nums[index] = num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* `index`に要素numを挿入 */
    void insert(int *nums, int size, int num, int index) {
        // `index`より後のすべての要素を1つ後ろに移動
        for (int i = size - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // indexの位置にnumを代入
        nums[index] = num;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* `index` に要素 num を挿入 */
    void insert(int[] nums, int num, int index) {
        // `index` より後のすべての要素を1つ後ろに移動
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // index の要素に num を代入
        nums[index] = num;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{Insert}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{insert}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{insert}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{insert}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{insert}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{insert}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{insert}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{insert}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{insert}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{insert}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{insert}
    ```

### 4. &nbsp; 要素の削除

同様に、以下の図に示すように、インデックス$i$の要素を削除するには、インデックス$i$に続くすべての要素を1つずつ前に移動する必要があります。

![配列要素削除の例](array.assets/array_remove_element.png){ class="animation-figure" }

<p align="center"> 図 4-4 &nbsp; 配列要素削除の例 </p>

削除後、元の最後の要素は「意味がない」ものになるため、特定の修正は必要ないことに注意してください。

=== "Python"

    ```python title="array.py"
    def remove(nums: list[int], index: int):
        """インデックス index の要素を削除"""
        # インデックス index より後のすべての要素を1つ前に移動
        for i in range(index, len(nums) - 1):
            nums[i] = nums[i + 1]
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* `index`の要素を削除 */
    void remove(int *nums, int size, int index) {
        // `index`より後のすべての要素を1つ前に移動
        for (int i = index; i < size - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* `index` の要素を削除 */
    void remove(int[] nums, int index) {
        // `index` より後のすべての要素を1つ前に移動
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{Remove}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{remove}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{remove}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{remove}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{remove}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{remove}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{remove}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{removeItem}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{remove}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{remove}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{remove}
    ```

要約すると、配列の挿入と削除操作には以下の欠点があります：

- **高い時間計算量**：配列の挿入と削除の両方の平均時間計算量は$O(n)$で、ここで$n$は配列の長さです。
- **要素の損失**：配列の長さが固定されているため、挿入時に配列の容量を超える要素は失われます。
- **メモリの無駄**：より長い配列を初期化して前部分のみを利用すると、挿入時に「意味のない」末尾要素が生じ、メモリ空間の無駄につながります。

### 5. &nbsp; 配列の走査

ほとんどのプログラミング言語では、インデックスを使用するか、各要素を直接反復することで配列を走査できます：

=== "Python"

    ```python title="array.py"
    def traverse(nums: list[int]):
        """配列の走査"""
        count = 0
        # インデックスによる配列の走査
        for i in range(len(nums)):
            count += nums[i]
        # 配列要素の走査
        for num in nums:
            count += num
        # データのインデックスと要素の両方を走査
        for i, num in enumerate(nums):
            count += nums[i]
            count += num
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 配列の走査 */
    void traverse(int *nums, int size) {
        int count = 0;
        // インデックスによる配列の走査
        for (int i = 0; i < size; i++) {
            count += nums[i];
        }
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 配列を走査 */
    void traverse(int[] nums) {
        int count = 0;
        // インデックスによる配列の走査
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 配列要素の走査
        for (int num : nums) {
            count += num;
        }
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{Traverse}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{traverse}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{traverse}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{traverse}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{traverse}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{traverse}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{traverse}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{traverse}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{traverse}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{traverse}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{traverse}
    ```

### 6. &nbsp; 要素の検索

配列内の特定の要素を見つけることは、配列を反復し、各要素をチェックして目的の値と一致するかどうかを決定することを含みます。

配列は線形データ構造であるため、この操作は一般的に「線形探索」と呼ばれます。

=== "Python"

    ```python title="array.py"
    def find(nums: list[int], target: int) -> int:
        """配列内の指定された要素を検索"""
        for i in range(len(nums)):
            if nums[i] == target:
                return i
        return -1
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 配列内の指定要素を検索 */
    int find(int *nums, int size, int target) {
        for (int i = 0; i < size; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 配列内で指定された要素を検索 */
    int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{Find}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{find}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{find}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{find}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{find}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{find}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{find}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{find}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{find}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{find}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{find}
    ```

### 7. &nbsp; 配列の拡張

複雑なシステム環境では、安全な容量拡張のために配列の後にメモリ空間の可用性を確保することが困難になります。その結果、ほとんどのプログラミング言語では、**配列の長さは不変**です。

配列を拡張するには、より大きな配列を作成し、元の配列から要素をコピーする必要があります。この操作の時間計算量は$O(n)$で、大きな配列では時間がかかる可能性があります。コードは以下の通りです：

=== "Python"

    ```python title="array.py"
    def extend(nums: list[int], enlarge: int) -> list[int]:
        """配列の長さを拡張"""
        # 拡張された長さの配列を初期化
        res = [0] * (len(nums) + enlarge)
        # 元の配列のすべての要素を新しい配列にコピー
        for i in range(len(nums)):
            res[i] = nums[i]
        # 拡張後の新しい配列を返す
        return res
    ```

=== "C++"

    ```cpp title="array.cpp"
    /* 配列長の拡張 */
    int *extend(int *nums, int size, int enlarge) {
        // 拡張された長さの配列を初期化
        int *res = new int[size + enlarge];
        // 元の配列の全要素を新しい配列にコピー
        for (int i = 0; i < size; i++) {
            res[i] = nums[i];
        }
        // メモリを解放
        delete[] nums;
        // 拡張後の新しい配列を返却
        return res;
    }
    ```

=== "Java"

    ```java title="array.java"
    /* 配列長の拡張 */
    int[] extend(int[] nums, int enlarge) {
        // 拡張された長さの配列を初期化
        int[] res = new int[nums.length + enlarge];
        // 元の配列のすべての要素を新しい配列にコピー
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 拡張後の新しい配列を返す
        return res;
    }
    ```

=== "C#"

    ```csharp title="array.cs"
    [class]{array}-[func]{Extend}
    ```

=== "Go"

    ```go title="array.go"
    [class]{}-[func]{extend}
    ```

=== "Swift"

    ```swift title="array.swift"
    [class]{}-[func]{extend}
    ```

=== "JS"

    ```javascript title="array.js"
    [class]{}-[func]{extend}
    ```

=== "TS"

    ```typescript title="array.ts"
    [class]{}-[func]{extend}
    ```

=== "Dart"

    ```dart title="array.dart"
    [class]{}-[func]{extend}
    ```

=== "Rust"

    ```rust title="array.rs"
    [class]{}-[func]{extend}
    ```

=== "C"

    ```c title="array.c"
    [class]{}-[func]{extend}
    ```

=== "Kotlin"

    ```kotlin title="array.kt"
    [class]{}-[func]{extend}
    ```

=== "Ruby"

    ```ruby title="array.rb"
    [class]{}-[func]{extend}
    ```

=== "Zig"

    ```zig title="array.zig"
    [class]{}-[func]{extend}
    ```

## 4.1.2 &nbsp; 配列の利点と制限

配列は連続したメモリ空間に格納され、同じ型の要素で構成されます。このアプローチは、システムがデータ構造操作の効率を最適化するために活用できる実質的な事前情報を提供します。

- **高い空間効率**：配列はデータのための連続したメモリブロックを割り当て、追加の構造的オーバーヘッドの必要性を排除します。
- **ランダムアクセスのサポート**：配列は任意の要素への$O(1)$時間アクセスを可能にします。
- **キャッシュ局所性**：配列要素にアクセスするとき、コンピュータはそれらを読み込むだけでなく、周囲のデータもキャッシュし、高速キャッシュを利用して後続の操作速度を向上させます。

しかし、連続空間格納は諸刃の剣で、以下の制限があります：

- **挿入と削除の効率が低い**：配列に多くの要素が蓄積されると、要素の挿入や削除には大量の要素をシフトする必要があります。
- **固定長**：配列の長さは初期化後に固定されます。配列を拡張するには、すべてのデータを新しい配列にコピーする必要があり、大きなコストがかかります。
- **空間の無駄**：割り当てられた配列サイズが必要以上に大きい場合、余分な空間が無駄になります。

## 4.1.3 &nbsp; 配列の典型的な応用

配列は基本的で広く使用されるデータ構造です。様々なアルゴリズムで頻繁に応用され、複雑なデータ構造の実装に役立ちます。

- **ランダムアクセス**：配列はランダムサンプリングが必要なときのデータ格納に理想的です。インデックスに基づいてランダムシーケンスを生成することで、効率的にランダムサンプリングを実現できます。
- **ソートと検索**：配列はソートと検索アルゴリズムで最も一般的に使用されるデータ構造です。クイックソート、マージソート、二分探索などの技術は主に配列で動作します。
- **ルックアップテーブル**：配列は迅速な要素や関係の取得のための効率的なルックアップテーブルとして機能します。例えば、文字をASCIIコードにマッピングすることは、ASCIIコード値をインデックスとして使用し、対応する要素を配列に格納することで簡単になります。
- **機械学習**：ニューラルネットワークの領域では、配列はベクトル、行列、テンソルを含む重要な線形代数演算の実行において重要な役割を果たします。配列はニューラルネットワークプログラミングにおいて主要かつ最も広範囲に使用されるデータ構造として機能します。
- **データ構造の実装**：配列は、スタック、キュー、ハッシュ表、ヒープ、グラフなど、様々なデータ構造を実装するための構成要素として機能します。例えば、グラフの隣接行列表現は本質的に二次元配列です。
