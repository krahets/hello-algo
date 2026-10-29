# ハッシュアルゴリズム

前の二節では、ハッシュテーブルの仕組みと衝突への対処方法を紹介しました。ただし、オープンアドレス法もチェイン法も、**衝突時に正しく動作することを保証するだけで、衝突の発生自体を減らすことはできません**。

衝突が頻繁すぎると、性能は急激に悪化します。下図のチェイン法では、理想的にはペアが各バケットへ均等に分布し、最高の照会効率を得られます。最悪の場合はすべて同じバケットに入り、時間計算量が $O(n)$ に悪化します。

![ハッシュ衝突の最良と最悪の場合](hash_algorithm.assets/hash_collision_best_worst_condition.png)

**ペアの分布を決めるのはハッシュ関数です**。計算手順を思い出すと、まずハッシュ値を求め、配列の長さで剰余を取ります。

```shell
index = hash(key) % capacity
```

この式で容量 `capacity` が固定なら、**ハッシュアルゴリズム `hash()` が出力値を決め**、ひいてはハッシュテーブル内のペアの分布を決めます。

したがって、衝突の確率を減らすには、`hash()` の設計に注目すべきです。

## ハッシュアルゴリズムの目標

速く安定したハッシュテーブルを実現するため、ハッシュアルゴリズムには次の特徴が必要です。

- **決定性**：同じ入力には常に同じ出力を返す必要があります。これにより、ハッシュテーブルの信頼性を確保できます。
- **高い効率**：ハッシュ値を十分速く計算できる必要があります。計算負荷が小さいほど、実用性が高まります。
- **均等な分布**：ペアがテーブル全体に均等に分布する必要があります。均等なほど、衝突の確率が低くなります。

ハッシュアルゴリズムは、ハッシュテーブル以外の分野でも広く使われています。

- **パスワードの保存**：安全性を守るため、通常はパスワードを平文で直接保存せず、ハッシュ値を保存します。入力されたパスワードのハッシュ値を計算し、保存済みの値と比較します。一致すれば、正しいパスワードと見なします。
- **データの完全性の確認**：送信側はデータのハッシュ値を計算して一緒に送り、受信側は受け取ったデータのハッシュ値を再計算して、届いた値と比較できます。一致すれば、データは完全であると見なします。

暗号分野では、ハッシュ値から元のパスワードを推測するなどの逆解析を防ぐため、より高い安全性が必要です。

- **一方向性**：ハッシュ値から入力データに関する情報を逆算できないことです。
- **衝突耐性**：異なる二つの入力で同じハッシュ値になるものを見つけることが、極めて困難であることです。
- **雪崩効果**：入力のわずかな変化が、出力の大きく予測できない変化を引き起こすことです。

**均等な分布と衝突耐性は、独立した概念です**。分布が均等でも、衝突耐性があるとは限りません。例えば、ランダムな `key` に対する `key % 100` は均等な出力を生みます。しかし単純すぎるため、下二桁が等しい `key` はすべて同じ出力になります。そのため、ハッシュ値から使える `key` を容易に逆算し、パスワードを破れます。

## ハッシュアルゴリズムの設計

設計には多くの要因を考慮する必要があり、複雑な問題です。ただし、要件が厳しくない場面では、単純なアルゴリズムも設計できます。

- **加算ハッシュ**：入力の各文字の ASCII コードを足し、その合計をハッシュ値にします。
- **乗算ハッシュ**：乗算による非相関性を利用し、毎回定数を掛けながら各文字の ASCII コードをハッシュ値に累積します。
- **排他的論理和ハッシュ**：入力の各要素を XOR 演算で一つのハッシュ値に累積します。
- **回転ハッシュ**：各文字の ASCII コードを累積する前に、毎回ハッシュ値のビットを回転させます。

```src
[file]{simple_hash}-[class]{}-[func]{rot_hash}
```

どの方法も最後に大きな素数 $1000000007$ で剰余を取り、値を適切な範囲に収めています。なぜ素数を法とすることを強調するのでしょうか。合成数を法とすると、どのような欠点があるのでしょうか。興味深い問いです。

先に結論を述べると、**大きな素数を法とすることで、ハッシュ値の分布をできるだけ均等にできます**。素数はほかの数と公約数を持たないため、剰余による周期的なパターンを減らし、衝突を避けられるからです。

例えば、合成数 $9$ を法に選ぶと、$3$ で割り切れるため、$3$ で割り切れる `key` はすべて $0$、$3$、$6$ の三つに写されます。

$$
\begin{aligned}
\text{modulus} & = 9 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{aligned}
$$

入力 `key` がちょうどこのような等差数列なら、ハッシュ値が集中し、衝突が増えます。`modulus` を素数 $13$ に置き換えると、`key` と `modulus` の間に公約数がないため、出力の均等性は大幅に向上します。

$$
\begin{aligned}
\text{modulus} & = 13 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{aligned}
$$

`key` がランダムかつ一様に分布すると保証できるなら、法は素数でも合成数でもよく、どちらも均等なハッシュ値を出力します。一方、`key` の分布に何らかの周期性があると、合成数ではクラスタリングが起きやすくなります。

したがって、通常は法に素数を選び、できれば十分大きくすることで、周期的なパターンをできるだけ取り除き、アルゴリズムの頑健性を高めます。

## 主なハッシュアルゴリズム

ここまでの単純なアルゴリズムは脆弱で、設計目標には遠く及びません。例えば、加算と XOR は交換法則を満たすため、同じ文字を異なる順序で並べた文字列を区別できません。これは衝突を増やし、安全性の問題も引き起こす可能性があります。

実際には、MD5、SHA-1、SHA-2、SHA-3 などの標準的なアルゴリズムをよく使います。任意の長さの入力を、固定長のハッシュ値へ写せます。

この約一世紀、ハッシュアルゴリズムは改良と最適化を重ねてきました。性能向上に取り組む研究者がいる一方、安全性の問題を探す研究者やハッカーもいます。実用でよく使われるものを下表に示します。

- MD5 と SHA-1 への攻撃は何度も成功しているため、各種のセキュリティ用途では使用されなくなっています。
- SHA-2 系列の SHA-256 は最も安全なハッシュアルゴリズムの一つで、攻撃の成功例がまだないため、各種のセキュリティ用途やプロトコルでよく使われています。
- SHA-3 は SHA-2 より実装の負担が小さく、計算効率が高いものの、現時点での普及度は SHA-2 系列に及びません。

<p align="center"> 表 <id> &nbsp; 主なハッシュアルゴリズム </p>

|          | MD5                            | SHA-1            | SHA-2                        | SHA-3               |
| -------- | ------------------------------ | ---------------- | ---------------------------- | ------------------- |
| 登場年 | 1992                           | 1995             | 2002                         | 2008                |
| 出力長 | 128 bit                        | 160 bit          | 256/512 bit                  | 224/256/384/512 bit |
| ハッシュ衝突 | 比較的多い                           | 比較的多い             | 非常に少ない                         | 非常に少ない                |
| 安全性 | 低い、攻撃の成功例あり               | 低い、攻撃の成功例あり | 高い                           | 高い                  |
| 用途     | 使用中止、データの完全性の確認には引き続き使用 | 使用中止         | 暗号資産の取引検証、電子署名など | SHA-2 の代替に使用可能    |

## データ構造のハッシュ値

ハッシュテーブルの `key` には、整数、小数、文字列などを使えます。言語は通常、これらの型に組み込みのハッシュアルゴリズムを用意し、バケットのインデックスの計算に使います。Python では、`hash()` でさまざまな型のハッシュ値を求められます。

- 整数と真偽値のハッシュ値は、その値自体です。
- 浮動小数点数と文字列の計算はやや複雑なので、興味があれば調べてみてください。
- タプルは各要素をハッシュ化し、それらを組み合わせて一つのハッシュ値にします。
- オブジェクトはメモリアドレスに基づいてハッシュ値を生成します。ハッシュメソッドをオーバーライドすれば、内容に基づく生成も可能です。

!!! tip

    組み込みのハッシュ値計算関数の定義や方法は、言語ごとに異なります。

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    # 整数 3 のハッシュ値は 3

    bol = True
    hash_bol = hash(bol)
    # 真偽値 True のハッシュ値は 1

    dec = 3.14159
    hash_dec = hash(dec)
    # 小数 3.14159 のハッシュ値は 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    # 文字列「Hello 算法」のハッシュ値は 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    # タプル (12836, '小哈') のハッシュ値は 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    # ノードオブジェクト <ListNode object at 0x1058fd810> のハッシュ値は 274267521
    ```

=== "C++"

    ```cpp title="built_in_hash.cpp"
    int num = 3;
    size_t hashNum = hash<int>()(num);
    // 整数 3 のハッシュ値は 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    // 真偽値 1 のハッシュ値は 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    // 小数 3.14159 のハッシュ値は 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    // 文字列「Hello 算法」のハッシュ値は 15466937326284535026

    // C++ の組み込み std::hash() は基本データ型のハッシュ値計算のみを提供する
    // 配列やオブジェクトのハッシュ値計算は自分で実装する
    ```

=== "Java"

    ```java title="built_in_hash.java"
    int num = 3;
    int hashNum = Integer.hashCode(num);
    // 整数 3 のハッシュ値は 3

    boolean bol = true;
    int hashBol = Boolean.hashCode(bol);
    // 真偽値 true のハッシュ値は 1231

    double dec = 3.14159;
    int hashDec = Double.hashCode(dec);
    // 小数 3.14159 のハッシュ値は -1340954729

    String str = "Hello 算法";
    int hashStr = str.hashCode();
    // 文字列「Hello 算法」のハッシュ値は -727081396

    Object[] arr = { 12836, "小哈" };
    int hashTup = Arrays.hashCode(arr);
    // 配列 [12836, 小哈] のハッシュ値は 1151158

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode();
    // ノードオブジェクト utils.ListNode@7dc5e7b4 のハッシュ値は 2110121908
    ```

=== "C#"

    ```csharp title="built_in_hash.cs"
    int num = 3;
    int hashNum = num.GetHashCode();
    // 整数 3 のハッシュ値は 3;

    bool bol = true;
    int hashBol = bol.GetHashCode();
    // 真偽値 true のハッシュ値は 1;

    double dec = 3.14159;
    int hashDec = dec.GetHashCode();
    // 小数 3.14159 のハッシュ値は -1340954729;

    string str = "Hello 算法";
    int hashStr = str.GetHashCode();
    // 文字列「Hello 算法」のハッシュ値は -586107568;

    object[] arr = [12836, "小哈"];
    int hashTup = arr.GetHashCode();
    // 配列 [12836, 小哈] のハッシュ値は 42931033;

    ListNode obj = new(0);
    int hashObj = obj.GetHashCode();
    // ノードオブジェクト 0 のハッシュ値は 39053774;
    ```

=== "Go"

    ```go title="built_in_hash.go"
    // Go には組み込みの hash code 関数がない
    ```

=== "Swift"

    ```swift title="built_in_hash.swift"
    let num = 3
    let hashNum = num.hashValue
    // 整数 3 のハッシュ値は 9047044699613009734

    let bol = true
    let hashBol = bol.hashValue
    // 真偽値 true のハッシュ値は -4431640247352757451

    let dec = 3.14159
    let hashDec = dec.hashValue
    // 小数 3.14159 のハッシュ値は -2465384235396674631

    let str = "Hello 算法"
    let hashStr = str.hashValue
    // 文字列「Hello 算法」のハッシュ値は -7850626797806988787

    let arr = [AnyHashable(12836), AnyHashable("小哈")]
    let hashTup = arr.hashValue
    // 配列 [AnyHashable(12836), AnyHashable("小哈")] のハッシュ値は -2308633508154532996

    let obj = ListNode(x: 0)
    let hashObj = obj.hashValue
    // ノードオブジェクト utils.ListNode のハッシュ値は -2434780518035996159
    ```

=== "JS"

    ```javascript title="built_in_hash.js"
    // JavaScript には組み込みの hash code 関数がない
    ```

=== "TS"

    ```typescript title="built_in_hash.ts"
    // TypeScript には組み込みの hash code 関数がない
    ```

=== "Dart"

    ```dart title="built_in_hash.dart"
    int num = 3;
    int hashNum = num.hashCode;
    // 整数 3 のハッシュ値は 34803

    bool bol = true;
    int hashBol = bol.hashCode;
    // 真偽値 true のハッシュ値は 1231

    double dec = 3.14159;
    int hashDec = dec.hashCode;
    // 小数 3.14159 のハッシュ値は 2570631074981783

    String str = "Hello 算法";
    int hashStr = str.hashCode;
    // 文字列「Hello 算法」のハッシュ値は 468167534

    List arr = [12836, "小哈"];
    int hashArr = arr.hashCode;
    // 配列 [12836, 小哈] のハッシュ値は 976512528

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode;
    // ノードオブジェクト Instance of 'ListNode' のハッシュ値は 1033450432
    ```

=== "Rust"

    ```rust title="built_in_hash.rs"
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};

    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    // 整数 3 のハッシュ値は 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    // 真偽値 true のハッシュ値は 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    // 小数 3.14159 のハッシュ値は 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    // 文字列「Hello 算法」のハッシュ値は 16092673739211250988

    let arr = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    arr.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    // タプル (12836, "小哈") のハッシュ値は 1885128010422702749

    let node = ListNode::new(42);
    let mut hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut hasher);
    let hash = hasher.finish();
    // ノードオブジェクト RefCell { value: ListNode { val: 42, next: None } } のハッシュ値は 15387811073369036852
    ```

=== "C"

    ```c title="built_in_hash.c"
    // C には組み込みの hash code 関数がない
    ```

=== "Kotlin"

    ```kotlin title="built_in_hash.kt"
    val num = 3
    val hashNum = num.hashCode()
    // 整数 3 のハッシュ値は 3

    val bol = true
    val hashBol = bol.hashCode()
    // 真偽値 true のハッシュ値は 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    // 小数 3.14159 のハッシュ値は -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    // 文字列「Hello 算法」のハッシュ値は -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashTup = arr.hashCode()
    // 配列 [12836, 小哈] のハッシュ値は 189568618

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    // ノードオブジェクト utils.ListNode@1d81eb93 のハッシュ値は 495053715
    ```

=== "Ruby"

    ```ruby title="built_in_hash.rb"
    num = 3
    hash_num = num.hash
    # 整数 3 のハッシュ値は -4385856518450339636

    bol = true
    hash_bol = bol.hash
    # 真偽値 true のハッシュ値は -1617938112149317027

    dec = 3.14159
    hash_dec = dec.hash
    # 小数 3.14159 のハッシュ値は -1479186995943067893

    str = "Hello 算法"
    hash_str = str.hash
    # 文字列「Hello 算法」のハッシュ値は -4075943250025831763

    tup = [12836, '小哈']
    hash_tup = tup.hash
    # タプル (12836, '小哈') のハッシュ値は 1999544809202288822

    obj = ListNode.new(0)
    hash_obj = obj.hash
    # ノードオブジェクト #<ListNode:0x000078133140ab70> のハッシュ値は 4302940560806366381
    ```

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%80%A3%E7%B5%90%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__(self%2C%20val%3A%20int)%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash(num)%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B0%203%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash(bol)%0A%20%20%20%20%23%20%E7%9C%9F%E5%81%BD%E5%80%A4%20True%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash(dec)%0A%20%20%20%20%23%20%E5%B0%8F%E6%95%B0%203.14159%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash(str)%0A%20%20%20%20%23%20%E6%96%87%E5%AD%97%E5%88%97%E3%80%8CHello%20%E7%AE%97%E6%B3%95%E3%80%8D%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20(12836%2C%20%22%E5%B0%8F%E5%93%88%22)%0A%20%20%20%20hash_tup%20%3D%20hash(tup)%0A%20%20%20%20%23%20%E3%82%BF%E3%83%97%E3%83%AB%20(12836%2C%20'%E5%B0%8F%E5%93%88')%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode(0)%0A%20%20%20%20hash_obj%20%3D%20hash(obj)%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%20%3CListNode%20object%20at%200x1058fd810%3E%20%E3%81%AE%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E5%80%A4%E3%81%AF%20274267521&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

多くの言語では、**不変オブジェクトだけがハッシュテーブルの `key` になれます**。リスト（動的配列）を `key` にすると、内容の変化とともにハッシュ値も変わり、元の `value` を照会できなくなります。

連結リストのノードなど、自分で定義したオブジェクトは、メンバー変数が可変でもハッシュ化できます。**通常、ハッシュ値がメモリアドレスに基づくためです**。内容が変わってもアドレスが変わらなければ、ハッシュ値は変わりません。

異なるコンソールで実行すると、出力されるハッシュ値が異なることに気付くかもしれません。**Python インタープリタは起動のたびに、文字列のハッシュ関数へランダムなソルト（salt）を加えるためです**。これにより HashDoS 攻撃を効果的に防ぎ、安全性を高めます。
