---
comments: true
---

# 15.4 &nbsp; 最大積分割問題

!!! question

    正整数 $n$ が与えられたとき、それを少なくとも 2 つの正整数の和に分割し、分割後のすべての整数の積の最大値を求めよ。下図に示す。

![最大積分割問題の定義](max_product_cutting_problem.assets/max_product_cutting_definition.png){ class="animation-figure" }

<p align="center"> 図 15-13 &nbsp; 最大積分割問題の定義 </p>

仮に $n$ を $m$ 個の整数因子に分割し、そのうち第 $i$ 個の因子を $n_i$ と記すと、

$$
n = \sum_{i=1}^{m}n_i
$$

本問題の目的は、すべての整数因子の積の最大値を求めることであり、すなわち

$$
\max(\prod_{i=1}^{m}n_i)
$$

考えるべきことは、分割数 $m$ をいくつにすべきか、各 $n_i$ をいくつにすべきかである。

### 1. &nbsp; 貪欲戦略の決定

経験的に、2 つの整数の積はその和より大きくなることが多い。$n$ から因子 $2$ を 1 つ切り出すと、それらの積は $2(n-2)$ となる。この積を $n$ と比較すると、

$$
\begin{aligned}
2(n-2) & \geq n \newline
2n - n - 4 & \geq 0 \newline
n & \geq 4
\end{aligned}
$$

下図のように、$n \geq 4$ のとき、$2$ を 1 つ切り出すと積は大きくなる。**これは、$4$ 以上の整数はすべて分割すべきことを意味する**。

**貪欲戦略一**：分割方法に $\geq 4$ の因子が含まれるなら、それはさらに分割すべきである。最終的な分割方法に現れる因子は $1$、$2$、$3$ の 3 種類だけである。

![分割により積が大きくなる](max_product_cutting_problem.assets/max_product_cutting_greedy_infer1.png){ class="animation-figure" }

<p align="center"> 図 15-14 &nbsp; 分割により積が大きくなる </p>

次に、どの因子が最適かを考える。$1$、$2$、$3$ の 3 つの因子のうち、明らかに $1$ が最も悪い。なぜなら $1 \times (n-1) < n$ は常に成り立ち、$1$ を切り出すとかえって積が小さくなるからである。

下図のように、$n = 6$ のとき、$3 \times 3 > 2 \times 2 \times 2$ が成り立つ。**これは、$2$ を切り出すより $3$ を切り出すほうが有利であることを意味する**。

**貪欲戦略二**：分割方法の中に存在してよい $2$ は高々 2 つである。なぜなら、3 つの $2$ は常に 2 つの $3$ に置き換えられ、より大きな積を得られるからである。

![最適な分割因子](max_product_cutting_problem.assets/max_product_cutting_greedy_infer2.png){ class="animation-figure" }

<p align="center"> 図 15-15 &nbsp; 最適な分割因子 </p>

以上より、次の貪欲戦略が導かれる。

1. 整数 $n$ を入力し、余りが $0$、$1$、$2$ になるまで、そこから因子 $3$ を繰り返し切り出す。
2. 余りが $0$ のとき、$n$ は $3$ の倍数であることを表すため、何も処理しない。
3. 余りが $2$ のときは、それ以上分割せず、そのまま残す。
4. 余りが $1$ のとき、$2 \times 2 > 1 \times 3$ であるため、最後の $3$ を $2$ に置き換えるべきである。

### 2. &nbsp; コード実装

下図のように、ループで整数を分割する必要はなく、切り捨て除算によって $3$ の個数 $a$ を、剰余演算によって余り $b$ を得られる。このとき、

$$
n = 3 a + b
$$

なお、$n \leq 3$ の境界ケースでは、必ず $1$ を 1 つ分割する必要があり、積は $1 \times (n - 1)$ となる。

=== "Python"

    ```python title="max_product_cutting.py"
    def max_product_cutting(n: int) -> int:
        """最大切断積：貪欲法"""
        # n <= 3 のときは、必ず 1 を切り出す
        if n <= 3:
            return 1 * (n - 1)
        # 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        a, b = n // 3, n % 3
        if b == 1:
            # 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return int(math.pow(3, a - 1)) * 2 * 2
        if b == 2:
            # 余りが 2 のときは、そのままにする
            return int(math.pow(3, a)) * 2
        # 余りが 0 のときは、そのままにする
        return int(math.pow(3, a))
    ```

=== "C++"

    ```cpp title="max_product_cutting.cpp"
    /* 最大切断積：貪欲法 */
    int maxProductCutting(int n) {
        // n <= 3 のときは、必ず 1 を切り出す
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return (int)pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 のときは、そのままにする
            return (int)pow(3, a) * 2;
        }
        // 余りが 0 のときは、そのままにする
        return (int)pow(3, a);
    }
    ```

=== "Java"

    ```java title="max_product_cutting.java"
    /* 最大切断積：貪欲法 */
    int maxProductCutting(int n) {
        // n <= 3 のときは、必ず 1 を切り出す
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return (int) Math.pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 のときは、そのままにする
            return (int) Math.pow(3, a) * 2;
        }
        // 余りが 0 のときは、そのままにする
        return (int) Math.pow(3, a);
    }
    ```

=== "C#"

    ```csharp title="max_product_cutting.cs"
    /* 最大切断積：貪欲法 */
    int MaxProductCutting(int n) {
        // n <= 3 のときは、必ず 1 を切り出す
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 のときは、そのままにする
            return (int)Math.Pow(3, a) * 2;
        }
        // 余りが 0 のときは、そのままにする
        return (int)Math.Pow(3, a);
    }
    ```

=== "Go"

    ```go title="max_product_cutting.go"
    /* 最大切断積：貪欲法 */
    func maxProductCutting(n int) int {
        // n <= 3 のときは、必ず 1 を切り出す
        if n <= 3 {
            return 1 * (n - 1)
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        a := n / 3
        b := n % 3
        if b == 1 {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return int(math.Pow(3, float64(a-1))) * 2 * 2
        }
        if b == 2 {
            // 余りが 2 のときは、そのままにする
            return int(math.Pow(3, float64(a))) * 2
        }
        // 余りが 0 のときは、そのままにする
        return int(math.Pow(3, float64(a)))
    }
    ```

=== "Swift"

    ```swift title="max_product_cutting.swift"
    /* 最大切断積：貪欲法 */
    func maxProductCutting(n: Int) -> Int {
        // n <= 3 のときは、必ず 1 を切り出す
        if n <= 3 {
            return 1 * (n - 1)
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        let a = n / 3
        let b = n % 3
        if b == 1 {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return pow(3, a - 1) * 2 * 2
        }
        if b == 2 {
            // 余りが 2 のときは、そのままにする
            return pow(3, a) * 2
        }
        // 余りが 0 のときは、そのままにする
        return pow(3, a)
    }
    ```

=== "JS"

    ```javascript title="max_product_cutting.js"
    /* 最大切断積：貪欲法 */
    function maxProductCutting(n) {
        // n <= 3 のときは、必ず 1 を切り出す
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        let a = Math.floor(n / 3);
        let b = n % 3;
        if (b === 1) {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return Math.pow(3, a - 1) * 2 * 2;
        }
        if (b === 2) {
            // 余りが 2 のときは、そのままにする
            return Math.pow(3, a) * 2;
        }
        // 余りが 0 のときは、そのままにする
        return Math.pow(3, a);
    }
    ```

=== "TS"

    ```typescript title="max_product_cutting.ts"
    /* 最大切断積：貪欲法 */
    function maxProductCutting(n: number): number {
        // n <= 3 のときは、必ず 1 を切り出す
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        let a: number = Math.floor(n / 3);
        let b: number = n % 3;
        if (b === 1) {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return Math.pow(3, a - 1) * 2 * 2;
        }
        if (b === 2) {
            // 余りが 2 のときは、そのままにする
            return Math.pow(3, a) * 2;
        }
        // 余りが 0 のときは、そのままにする
        return Math.pow(3, a);
    }
    ```

=== "Dart"

    ```dart title="max_product_cutting.dart"
    /* 最大切断積：貪欲法 */
    int maxProductCutting(int n) {
      // n <= 3 のときは、必ず 1 を切り出す
      if (n <= 3) {
        return 1 * (n - 1);
      }
      // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
      int a = n ~/ 3;
      int b = n % 3;
      if (b == 1) {
        // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
        return (pow(3, a - 1) * 2 * 2).toInt();
      }
      if (b == 2) {
        // 余りが 2 のときは、そのままにする
        return (pow(3, a) * 2).toInt();
      }
      // 余りが 0 のときは、そのままにする
      return pow(3, a).toInt();
    }
    ```

=== "Rust"

    ```rust title="max_product_cutting.rs"
    /* 最大切断積：貪欲法 */
    fn max_product_cutting(n: i32) -> i32 {
        // n <= 3 のときは、必ず 1 を切り出す
        if n <= 3 {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        let a = n / 3;
        let b = n % 3;
        if b == 1 {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            3_i32.pow(a as u32 - 1) * 2 * 2
        } else if b == 2 {
            // 余りが 2 のときは、そのままにする
            3_i32.pow(a as u32) * 2
        } else {
            // 余りが 0 のときは、そのままにする
            3_i32.pow(a as u32)
        }
    }
    ```

=== "C"

    ```c title="max_product_cutting.c"
    /* 最大切断積：貪欲法 */
    int maxProductCutting(int n) {
        // n <= 3 のときは、必ず 1 を切り出す
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 のときは、そのままにする
            return pow(3, a) * 2;
        }
        // 余りが 0 のときは、そのままにする
        return pow(3, a);
    }
    ```

=== "Kotlin"

    ```kotlin title="max_product_cutting.kt"
    /* 最大切断積：貪欲法 */
    fun maxProductCutting(n: Int): Int {
        // n <= 3 のときは、必ず 1 を切り出す
        if (n <= 3) {
            return 1 * (n - 1)
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        val a = n / 3
        val b = n % 3
        if (b == 1) {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return 3.0.pow((a - 1)).toInt() * 2 * 2
        }
        if (b == 2) {
            // 余りが 2 のときは、そのままにする
            return 3.0.pow(a).toInt() * 2 * 2
        }
        // 余りが 0 のときは、そのままにする
        return 3.0.pow(a).toInt()
    }
    ```

=== "Ruby"

    ```ruby title="max_product_cutting.rb"
    ### 最大分割積：貪欲法 ###
    def max_product_cutting(n)
      # n <= 3 のときは、必ず 1 を切り出す
      return 1 * (n - 1) if n <= 3
      # 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
      a, b = n / 3, n % 3
      # 余りが 1 のときは、1 * 3 を 2 * 2 に変える
      return (3.pow(a - 1) * 2 * 2).to_i if b == 1
      # 余りが 2 のときは、そのままにする
      return (3.pow(a) * 2).to_i if b == 2
      # 余りが 0 のときは、そのままにする
      3.pow(a).to_i
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=import%20math%0A%0Adef%20max_product_cutting%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%88%87%E6%96%AD%E7%A9%8D%EF%BC%9A%E8%B2%AA%E6%AC%B2%E6%B3%95%22%22%22%0A%20%20%20%20%23%20n%20%3C%3D%203%20%E3%81%AE%E3%81%A8%E3%81%8D%E3%81%AF%E3%80%81%E5%BF%85%E3%81%9A%201%20%E3%82%92%E5%88%87%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20if%20n%20%3C%3D%203%3A%0A%20%20%20%20%20%20%20%20return%201%20%2A%20%28n%20-%201%29%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E3%81%AB%203%20%E3%82%92%E5%88%87%E3%82%8A%E5%87%BA%E3%81%97%E3%80%81a%20%E3%82%92%203%20%E3%81%AE%E5%80%8B%E6%95%B0%E3%80%81b%20%E3%82%92%E4%BD%99%E3%82%8A%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20%20a%2C%20b%20%3D%20n%20%2F%2F%203%2C%20n%20%25%203%0A%20%20%20%20if%20b%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%201%20%E3%81%AE%E3%81%A8%E3%81%8D%E3%81%AF%E3%80%811%20%2A%203%20%E3%82%92%202%20%2A%202%20%E3%81%AB%E5%A4%89%E3%81%88%E3%82%8B%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283%2C%20a%20-%201%29%29%20%2A%202%20%2A%202%0A%20%20%20%20if%20b%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%202%20%E3%81%AE%E3%81%A8%E3%81%8D%E3%81%AF%E3%80%81%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283%2C%20a%29%29%20%2A%202%0A%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%200%20%E3%81%AE%E3%81%A8%E3%81%8D%E3%81%AF%E3%80%81%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20return%20int%28math.pow%283%2C%20a%29%29%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2058%0A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E6%B3%95%0A%20%20%20%20res%20%3D%20max_product_cutting%28n%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%A4%A7%E5%88%86%E5%89%B2%E7%A9%8D%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=import%20math%0A%0Adef%20max_product_cutting%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%88%87%E6%96%AD%E7%A9%8D%EF%BC%9A%E8%B2%AA%E6%AC%B2%E6%B3%95%22%22%22%0A%20%20%20%20%23%20n%20%3C%3D%203%20%E3%81%AE%E3%81%A8%E3%81%8D%E3%81%AF%E3%80%81%E5%BF%85%E3%81%9A%201%20%E3%82%92%E5%88%87%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20if%20n%20%3C%3D%203%3A%0A%20%20%20%20%20%20%20%20return%201%20%2A%20%28n%20-%201%29%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E3%81%AB%203%20%E3%82%92%E5%88%87%E3%82%8A%E5%87%BA%E3%81%97%E3%80%81a%20%E3%82%92%203%20%E3%81%AE%E5%80%8B%E6%95%B0%E3%80%81b%20%E3%82%92%E4%BD%99%E3%82%8A%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20%20a%2C%20b%20%3D%20n%20%2F%2F%203%2C%20n%20%25%203%0A%20%20%20%20if%20b%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%201%20%E3%81%AE%E3%81%A8%E3%81%8D%E3%81%AF%E3%80%811%20%2A%203%20%E3%82%92%202%20%2A%202%20%E3%81%AB%E5%A4%89%E3%81%88%E3%82%8B%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283%2C%20a%20-%201%29%29%20%2A%202%20%2A%202%0A%20%20%20%20if%20b%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%202%20%E3%81%AE%E3%81%A8%E3%81%8D%E3%81%AF%E3%80%81%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20return%20int%28math.pow%283%2C%20a%29%29%20%2A%202%0A%20%20%20%20%23%20%E4%BD%99%E3%82%8A%E3%81%8C%200%20%E3%81%AE%E3%81%A8%E3%81%8D%E3%81%AF%E3%80%81%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E3%81%AB%E3%81%99%E3%82%8B%0A%20%20%20%20return%20int%28math.pow%283%2C%20a%29%29%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%2058%0A%0A%20%20%20%20%23%20%E8%B2%AA%E6%AC%B2%E6%B3%95%0A%20%20%20%20res%20%3D%20max_product_cutting%28n%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%A4%A7%E5%88%86%E5%89%B2%E7%A9%8D%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

![最大積分割の計算方法](max_product_cutting_problem.assets/max_product_cutting_greedy_calculation.png){ class="animation-figure" }

<p align="center"> 図 15-16 &nbsp; 最大積分割の計算方法 </p>

**時間計算量は、プログラミング言語におけるべき乗演算の実装方法に依存する**。Python を例に取ると、よく使われるべき乗計算関数は 3 種類ある。

- 演算子 `**` と関数 `pow()` の時間計算量はいずれも $O(\log⁡ a)$ である。
- 関数 `math.pow()` は内部で C 言語ライブラリの `pow()` 関数を呼び出し、浮動小数点のべき乗を実行するため、時間計算量は $O(1)$ である。

変数 $a$ と $b$ が使う追加領域は定数サイズであり、**したがって空間計算量は $O(1)$ である**。

### 3. &nbsp; 正しさの証明

背理法を用い、$n \geq 4$ の場合のみを考える。

1. **すべての因子は $\leq 3$** ：最適な分割方法に $\geq 4$ の因子 $x$ が存在すると仮定すると、それは必ずさらに $2(x-2)$ に分割でき、より大きい（または等しい）積が得られる。これは仮定に矛盾する。
2. **分割方法に $1$ は含まれない** ：最適な分割方法に因子 $1$ が 1 つ存在すると仮定すると、それは必ず別の因子に併合でき、より大きい積を得られる。これは仮定に矛盾する。
3. **分割方法に含まれる $2$ は高々 2 つ** ：最適な分割方法に 3 つの $2$ が含まれると仮定すると、それは必ず 2 つの $3$ に置き換えられ、積はより大きくなる。これは仮定に矛盾する。
