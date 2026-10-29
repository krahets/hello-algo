---
comments: true
---

# 15.4 &nbsp; 整数を分割して積を最大にする問題

!!! question "問題"

    正の整数 $n$ を、少なくとも二つの正の整数の和に分けます。分割後のすべての整数の積の最大値を求めてください。図 15-13 に例を示します。

![整数を分割して積を最大にする問題の定義](max_product_cutting_problem.assets/max_product_cutting_definition.png){ class="animation-figure" }

<p align="center"> 図 15-13 &nbsp; 整数を分割して積を最大にする問題の定義 </p>

$n$ を $m$ 個の整数に分け、それぞれを積の因数とします。$i$ 番目の因数を $n_i$ とすると、次の式が成り立ちます。

$$
n = \sum_{i=1}^{m}n_i
$$

この問題の目標は、すべての整数の因数の積を最大にすることです。すなわち、

$$
\max(\prod_{i=1}^{m}n_i)
$$

考えるべきことは、分割数 $m$ をいくつにし、それぞれの $n_i$ をいくつにするかです。

### 1. &nbsp; 貪欲戦略を決める

経験上、二つの整数の積は、その和より大きくなることがよくあります。$n$ から因数 $2$ を切り出すと、積は $2(n-2)$ です。これを $n$ と比較します。

$$
\begin{aligned}
2(n-2) & \geq n \newline
2n - n - 4 & \geq 0 \newline
n & \geq 4
\end{aligned}
$$

図 15-14 のように、$n \geq 4$ なら $2$ を切り出すことで積が大きくなります。**つまり、$4$ 以上の整数は分割すべきだとわかります**。

**貪欲戦略 1**：分割結果に $\geq 4$ の因数が含まれるなら、それをさらに分割します。最終的に残る因数は、$1$、$2$、$3$ の 3 種類だけにします。

![分割によって積が大きくなる](max_product_cutting_problem.assets/max_product_cutting_greedy_infer1.png){ class="animation-figure" }

<p align="center"> 図 15-14 &nbsp; 分割によって積が大きくなる </p>

次に、どの因数が最もよいかを考えます。$1$、$2$、$3$ の中では、明らかに $1$ が最も不利です。常に $1 \times (n-1) < n$ なので、$1$ を切り出すと、かえって積が小さくなるためです。

図 15-15 のように、$n = 6$ では $3 \times 3 > 2 \times 2 \times 2$ です。**つまり、$2$ より $3$ に分ける方が有利です**。

**貪欲戦略 2**：分割結果の $2$ は、多くても二つにします。三つの $2$ は常に二つの $3$ に置き換えられ、その方が積が大きくなるためです。

![最適な分割の因数](max_product_cutting_problem.assets/max_product_cutting_greedy_infer2.png){ class="animation-figure" }

<p align="center"> 図 15-15 &nbsp; 最適な分割の因数 </p>

以上から、次の貪欲戦略が導けます。

1. 入力された整数 $n$ から因数 $3$ を繰り返し切り出し、余りが $0$、$1$、$2$ のいずれかになるまで続けます。
2. 余りが $0$ なら、$n$ は $3$ の倍数なので、何もしません。
3. 余りが $2$ なら、それ以上分割せずに残します。
4. 余りが $1$ なら、$2 \times 2 > 1 \times 3$ なので、最後の $3$ と余りの $1$ を、二つの $2$ に置き換えます。

### 2. &nbsp; コードの実装

図 15-16 のように、ループで整数を分割する必要はありません。切り捨ての整数除算で $3$ の個数 $a$ を求め、剰余演算で余り $b$ を求めると、次の関係が成り立ちます。

$$
n = 3 a + b
$$

境界の場合 $n \leq 3$ では、必ず $1$ を一つ切り出す必要があり、積は $1 \times (n - 1)$ になります。

=== "Python"

    ```python title="max_product_cutting.py"
    def max_product_cutting(n: int) -> int:
        """分割後の積の最大化：貪欲法"""
        # n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if n <= 3:
            return 1 * (n - 1)
        # 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        a, b = n // 3, n % 3
        if b == 1:
            # 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return int(math.pow(3, a - 1)) * 2 * 2
        if b == 2:
            # 余りが 2 の場合、何もしない
            return int(math.pow(3, a)) * 2
        # 余りが 0 の場合、何もしない
        return int(math.pow(3, a))
    ```

=== "C++"

    ```cpp title="max_product_cutting.cpp"
    /* 分割後の積の最大化：貪欲法 */
    int maxProductCutting(int n) {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return (int)pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 の場合、何もしない
            return (int)pow(3, a) * 2;
        }
        // 余りが 0 の場合、何もしない
        return (int)pow(3, a);
    }
    ```

=== "Java"

    ```java title="max_product_cutting.java"
    /* 分割後の積の最大化：貪欲法 */
    int maxProductCutting(int n) {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return (int) Math.pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 の場合、何もしない
            return (int) Math.pow(3, a) * 2;
        }
        // 余りが 0 の場合、何もしない
        return (int) Math.pow(3, a);
    }
    ```

=== "C#"

    ```csharp title="max_product_cutting.cs"
    /* 分割後の積の最大化：貪欲法 */
    int MaxProductCutting(int n) {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 の場合、何もしない
            return (int)Math.Pow(3, a) * 2;
        }
        // 余りが 0 の場合、何もしない
        return (int)Math.Pow(3, a);
    }
    ```

=== "Go"

    ```go title="max_product_cutting.go"
    /* 分割後の積の最大化：貪欲法 */
    func maxProductCutting(n int) int {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if n <= 3 {
            return 1 * (n - 1)
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        a := n / 3
        b := n % 3
        if b == 1 {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return int(math.Pow(3, float64(a-1))) * 2 * 2
        }
        if b == 2 {
            // 余りが 2 の場合、何もしない
            return int(math.Pow(3, float64(a))) * 2
        }
        // 余りが 0 の場合、何もしない
        return int(math.Pow(3, float64(a)))
    }
    ```

=== "Swift"

    ```swift title="max_product_cutting.swift"
    /* 分割後の積の最大化：貪欲法 */
    func maxProductCutting(n: Int) -> Int {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if n <= 3 {
            return 1 * (n - 1)
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        let a = n / 3
        let b = n % 3
        if b == 1 {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return pow(3, a - 1) * 2 * 2
        }
        if b == 2 {
            // 余りが 2 の場合、何もしない
            return pow(3, a) * 2
        }
        // 余りが 0 の場合、何もしない
        return pow(3, a)
    }
    ```

=== "JS"

    ```javascript title="max_product_cutting.js"
    /* 分割後の積の最大化：貪欲法 */
    function maxProductCutting(n) {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        let a = Math.floor(n / 3);
        let b = n % 3;
        if (b === 1) {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return Math.pow(3, a - 1) * 2 * 2;
        }
        if (b === 2) {
            // 余りが 2 の場合、何もしない
            return Math.pow(3, a) * 2;
        }
        // 余りが 0 の場合、何もしない
        return Math.pow(3, a);
    }
    ```

=== "TS"

    ```typescript title="max_product_cutting.ts"
    /* 分割後の積の最大化：貪欲法 */
    function maxProductCutting(n: number): number {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        let a: number = Math.floor(n / 3);
        let b: number = n % 3;
        if (b === 1) {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return Math.pow(3, a - 1) * 2 * 2;
        }
        if (b === 2) {
            // 余りが 2 の場合、何もしない
            return Math.pow(3, a) * 2;
        }
        // 余りが 0 の場合、何もしない
        return Math.pow(3, a);
    }
    ```

=== "Dart"

    ```dart title="max_product_cutting.dart"
    /* 分割後の積の最大化：貪欲法 */
    int maxProductCutting(int n) {
      // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
      if (n <= 3) {
        return 1 * (n - 1);
      }
      // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
      int a = n ~/ 3;
      int b = n % 3;
      if (b == 1) {
        // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
        return (pow(3, a - 1) * 2 * 2).toInt();
      }
      if (b == 2) {
        // 余りが 2 の場合、何もしない
        return (pow(3, a) * 2).toInt();
      }
      // 余りが 0 の場合、何もしない
      return pow(3, a).toInt();
    }
    ```

=== "Rust"

    ```rust title="max_product_cutting.rs"
    /* 分割後の積の最大化：貪欲法 */
    fn max_product_cutting(n: i32) -> i32 {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if n <= 3 {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        let a = n / 3;
        let b = n % 3;
        if b == 1 {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            3_i32.pow(a as u32 - 1) * 2 * 2
        } else if b == 2 {
            // 余りが 2 の場合、何もしない
            3_i32.pow(a as u32) * 2
        } else {
            // 余りが 0 の場合、何もしない
            3_i32.pow(a as u32)
        }
    }
    ```

=== "C"

    ```c title="max_product_cutting.c"
    /* 分割後の積の最大化：貪欲法 */
    int maxProductCutting(int n) {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 の場合、何もしない
            return pow(3, a) * 2;
        }
        // 余りが 0 の場合、何もしない
        return pow(3, a);
    }
    ```

=== "Kotlin"

    ```kotlin title="max_product_cutting.kt"
    /* 分割後の積の最大化：貪欲法 */
    fun maxProductCutting(n: Int): Int {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if (n <= 3) {
            return 1 * (n - 1)
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        val a = n / 3
        val b = n % 3
        if (b == 1) {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return 3.0.pow((a - 1)).toInt() * 2 * 2
        }
        if (b == 2) {
            // 余りが 2 の場合、何もしない
            return 3.0.pow(a).toInt() * 2 * 2
        }
        // 余りが 0 の場合、何もしない
        return 3.0.pow(a).toInt()
    }
    ```

=== "Ruby"

    ```ruby title="max_product_cutting.rb"
    ### 分割後の積の最大化：貪欲法 ###
    def max_product_cutting(n)
      # n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
      return 1 * (n - 1) if n <= 3
      # 貪欲に 3 を切り出す。a は 3 の個数、b は余り
      a, b = n / 3, n % 3
      # 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
      return (3.pow(a - 1) * 2 * 2).to_i if b == 1
      # 余りが 2 の場合、何もしない
      return (3.pow(a) * 2).to_i if b == 2
      # 余りが 0 の場合、何もしない
      3.pow(a).to_i
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=import%20math%0A%0Adef%20max_product_cutting%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%88%86%E5%89%B2%E5%BE%8C%E3%81%AE%E7%A9%8D%E3%81%AE%E6%9C%80%E5%A4%A7%E5%8C%96%EF%BC%9A%E8%B2%AA%E6%AC%B2%E6%B3%95%22%22%22%0A%20%20%20%20%23%20n%20%3C%3D%203%20%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E5%BF%85%E3%81%9A%201%20%E3%82%92%201%20%E3%81%A4%E5%88%87%E3%82%8A%E5%87%BA%E3%81%99%E5%BF%85%E8%A6%81%E3%81%8C%E3%81%82%E3%82%8B%0A%20%20%20%20if%20n%20%3C%3D%203%3A%0A%20%20%20%20%20%20%20%20return%201%20%2A%20%28n%20-%201%29%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E3%81%AB%203%20%E3%82%92%E5%88%87%E3%82%8A%E5%87%BA%E3%81%99%E3%80%82a%20%E3%81%AF%203%20%E3%81%AE%E5%80%8B%E6%95%B0%E3%80%81b%20%E3%81%AF%E4%BD%99%E3%82%8A%0A%20%20%20%20a,%20b%20%3D%20n%20//%203,%20n%20%25%203%0A%20%20%20%20if%20b%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%201%20%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%811%20%2A%203%20%E3%81%AE%E7%B5%84%E3%82%92%202%20%2A%202%20%E3%81%AB%E5%A4%89%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%20-%201%29%29%20%2A%202%20%2A%202%0A%20%20%20%20if%20b%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%202%20%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E4%BD%95%E3%82%82%E3%81%97%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%29%29%20%2A%202%0A%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%200%20%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E4%BD%95%E3%82%82%E3%81%97%E3%81%AA%E3%81%84%0A%20%20%20%20return%20int%28math.pow%283,%20a%29%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2058%0A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E3%82%A2%E3%83%AB%E3%82%B4%E3%83%AA%E3%82%BA%E3%83%A0%0A%20%20%20%20res%20%3D%20max_product_cutting%28n%29%0A%20%20%20%20print%28f%22%E5%88%86%E5%89%B2%E5%BE%8C%E3%81%AE%E7%A9%8D%E3%81%AE%E6%9C%80%E5%A4%A7%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20math%0A%0Adef%20max_product_cutting%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%88%86%E5%89%B2%E5%BE%8C%E3%81%AE%E7%A9%8D%E3%81%AE%E6%9C%80%E5%A4%A7%E5%8C%96%EF%BC%9A%E8%B2%AA%E6%AC%B2%E6%B3%95%22%22%22%0A%20%20%20%20%23%20n%20%3C%3D%203%20%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E5%BF%85%E3%81%9A%201%20%E3%82%92%201%20%E3%81%A4%E5%88%87%E3%82%8A%E5%87%BA%E3%81%99%E5%BF%85%E8%A6%81%E3%81%8C%E3%81%82%E3%82%8B%0A%20%20%20%20if%20n%20%3C%3D%203%3A%0A%20%20%20%20%20%20%20%20return%201%20%2A%20%28n%20-%201%29%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E3%81%AB%203%20%E3%82%92%E5%88%87%E3%82%8A%E5%87%BA%E3%81%99%E3%80%82a%20%E3%81%AF%203%20%E3%81%AE%E5%80%8B%E6%95%B0%E3%80%81b%20%E3%81%AF%E4%BD%99%E3%82%8A%0A%20%20%20%20a,%20b%20%3D%20n%20//%203,%20n%20%25%203%0A%20%20%20%20if%20b%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%201%20%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%811%20%2A%203%20%E3%81%AE%E7%B5%84%E3%82%92%202%20%2A%202%20%E3%81%AB%E5%A4%89%E6%8F%9B%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%20-%201%29%29%20%2A%202%20%2A%202%0A%20%20%20%20if%20b%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%202%20%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E4%BD%95%E3%82%82%E3%81%97%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283,%20a%29%29%20%2A%202%0A%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%200%20%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E4%BD%95%E3%82%82%E3%81%97%E3%81%AA%E3%81%84%0A%20%20%20%20return%20int%28math.pow%283,%20a%29%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2058%0A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E3%82%A2%E3%83%AB%E3%82%B4%E3%83%AA%E3%82%BA%E3%83%A0%0A%20%20%20%20res%20%3D%20max_product_cutting%28n%29%0A%20%20%20%20print%28f%22%E5%88%86%E5%89%B2%E5%BE%8C%E3%81%AE%E7%A9%8D%E3%81%AE%E6%9C%80%E5%A4%A7%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

![分割後の最大の積の計算方法](max_product_cutting_problem.assets/max_product_cutting_greedy_calculation.png){ class="animation-figure" }

<p align="center"> 図 15-16 &nbsp; 分割後の最大の積の計算方法 </p>

**時間計算量は、プログラミング言語の累乗演算の実装によって決まります**。Python を例にすると、よく使われる累乗の計算方法には三つあります。

- 演算子 `**` と関数 `pow()` の時間計算量は、どちらも $O(\log⁡ a)$ です。
- 関数 `math.pow()` は内部で C 標準ライブラリの `pow()` を呼び出します。浮動小数点の累乗を計算し、時間計算量は $O(1)$ です。

変数 $a$ と $b$ が使う追加の空間は一定なので、**空間計算量は $O(1)$ です**。

### 3. &nbsp; 正しさの証明

背理法を使い、$n \geq 4$ の場合だけを考えます。

1. **すべての因数は $\leq 3$**：最適な分割に $\geq 4$ の因数 $x$ が含まれると仮定します。これをさらに $2(x-2)$ に分けると、積を大きくする（または等しく保つ）ことができます。これは仮定に矛盾します。
2. **分割結果に $1$ は含まれない**：最適な分割に因数 $1$ が含まれると仮定します。それを別の因数に足してまとめれば、積を大きくできます。これは仮定に矛盾します。
3. **分割結果の $2$ は多くても二つ**：最適な分割に三つの $2$ が含まれると仮定します。これを二つの $3$ に置き換えると、積が大きくなります。これは仮定に矛盾します。
