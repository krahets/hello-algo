---
comments: true
---

# 15.2 &nbsp; 分数ナップサック問題

!!! question

    $n$ 個のアイテムが与えられ、$i$ 番目のアイテムの重量は $wgt[i-1]$ で値は $val[i-1]$ です。容量が $cap$ のナップサックがあります。各アイテムは1回のみ選択できますが、**アイテムの一部を選択することができ、その値は選択された重量の割合に基づいて計算されます**。限られた容量の下でナップサック内のアイテムの最大値は何ですか？例を下の図に示します。

![分数ナップサック問題の例データ](fractional_knapsack_problem.assets/fractional_knapsack_example.png){ class="animation-figure" }

<p align="center"> 図 15-3 &nbsp; 分数ナップサック問題の例データ </p>

分数ナップサック問題は全体的に0-1ナップサック問題と非常に似ており、現在のアイテム $i$ と容量 $c$ を含み、ナップサックの限られた容量内で値を最大化することを目的としています。

違いは、この問題ではアイテムの一部のみを選択できることです。下の図に示すように、**アイテムを任意に分割し、重量の割合に基づいて対応する値を計算できます**。

1. アイテム $i$ について、その単位重量あたりの値は $val[i-1] / wgt[i-1]$ で、単位値と呼ばれます。
2. 重量 $w$ のアイテム $i$ の一部をナップサックに入れるとすると、ナップサックに追加される値は $w \times val[i-1] / wgt[i-1]$ です。

![アイテムの単位重量あたりの値](fractional_knapsack_problem.assets/fractional_knapsack_unit_value.png){ class="animation-figure" }

<p align="center"> 図 15-4 &nbsp; アイテムの単位重量あたりの値 </p>

### 1. &nbsp; 貪欲戦略の決定

ナップサック内のアイテムの総値を最大化することは、**本質的に単位重量あたりの値を最大化することを意味します**。これから、下の図に示す貪欲戦略を導出できます。

1. アイテムを単位値の高い順から低い順にソートします。
2. すべてのアイテムを反復し、**各ラウンドで最も高い単位値を持つアイテムを貪欲に選択**します。
3. ナップサックの残り容量が不十分な場合、現在のアイテムの一部を使用してナップサックを満たします。

![分数ナップサック問題の貪欲戦略](fractional_knapsack_problem.assets/fractional_knapsack_greedy_strategy.png){ class="animation-figure" }

<p align="center"> 図 15-5 &nbsp; 分数ナップサック問題の貪欲戦略 </p>

### 2. &nbsp; コード実装

アイテムを単位値でソートするために `Item` クラスを作成しました。ナップサックが満たされるまでループして貪欲な選択を行い、その後終了して解を返します：

=== "Python"

    ```python title="fractional_knapsack.py"
    class Item:
        """アイテム"""

        def __init__(self, w: int, v: int):
            self.w = w  # アイテムの重量
            self.v = v  # アイテムの価値

    def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
        """分数ナップサック：貪欲法"""
        # アイテムリストを作成、2 つの属性を含む：重量、価値
        items = [Item(w, v) for w, v in zip(wgt, val)]
        # 単位価値 item.v / item.w で高い順にソート
        items.sort(key=lambda item: item.v / item.w, reverse=True)
        # 貪欲選択をループ
        res = 0
        for item in items:
            if item.w <= cap:
                # 残り容量が十分な場合、アイテム全体をナップサックに入れる
                res += item.v
                cap -= item.w
            else:
                # 残り容量が不十分な場合、アイテムの一部をナップサックに入れる
                res += (item.v / item.w) * cap
                # 残り容量がなくなったため、ループを中断
                break
        return res
    ```

=== "C++"

    ```cpp title="fractional_knapsack.cpp"
    /* アイテム */
    class Item {
      public:
        int w; // アイテムの重量
        int v; // アイテムの価値

        Item(int w, int v) : w(w), v(v) {
        }
    };

    /* 分数ナップサック：貪欲法 */
    double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
        // アイテムリストを作成、2つの属性を含む：重量、価値
        vector<Item> items;
        for (int i = 0; i < wgt.size(); i++) {
            items.push_back(Item(wgt[i], val[i]));
        }
        // 単位価値 item.v / item.w で高い順にソート
        sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
        // 貪欲選択をループ
        double res = 0;
        for (auto &item : items) {
            if (item.w <= cap) {
                // 残り容量が十分な場合、アイテム全体をナップサックに入れる
                res += item.v;
                cap -= item.w;
            } else {
                // 残り容量が不十分な場合、アイテムの一部をナップサックに入れる
                res += (double)item.v / item.w * cap;
                // 残り容量がなくなったため、ループを中断
                break;
            }
        }
        return res;
    }
    ```

=== "Java"

    ```java title="fractional_knapsack.java"
    /* アイテム */
    class Item {
        int w; // アイテムの重量
        int v; // アイテムの価値

        public Item(int w, int v) {
            this.w = w;
            this.v = v;
        }
    }

    /* 分数ナップサック：貪欲法 */
    double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // アイテムリストを作成、2つの属性を含む：重量、価値
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 単位価値 item.v / item.w で高い順にソート
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // 貪欲選択をループ
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // 残り容量が十分な場合、アイテム全体をナップサックに入れる
                res += item.v;
                cap -= item.w;
            } else {
                // 残り容量が不十分な場合、アイテムの一部をナップサックに入れる
                res += (double) item.v / item.w * cap;
                // 残り容量がなくなったため、ループを中断
                break;
            }
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="fractional_knapsack.cs"
    [class]{Item}-[func]{}

    [class]{fractional_knapsack}-[func]{FractionalKnapsack}
    ```

=== "Go"

    ```go title="fractional_knapsack.go"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractionalKnapsack}
    ```

=== "Swift"

    ```swift title="fractional_knapsack.swift"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractionalKnapsack}
    ```

=== "JS"

    ```javascript title="fractional_knapsack.js"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractionalKnapsack}
    ```

=== "TS"

    ```typescript title="fractional_knapsack.ts"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractionalKnapsack}
    ```

=== "Dart"

    ```dart title="fractional_knapsack.dart"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractionalKnapsack}
    ```

=== "Rust"

    ```rust title="fractional_knapsack.rs"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractional_knapsack}
    ```

=== "C"

    ```c title="fractional_knapsack.c"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractionalKnapsack}
    ```

=== "Kotlin"

    ```kotlin title="fractional_knapsack.kt"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractionalKnapsack}
    ```

=== "Ruby"

    ```ruby title="fractional_knapsack.rb"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractional_knapsack}
    ```

ソート以外に、最悪の場合、アイテムのリスト全体を走査する必要があるため、**時間計算量は $O(n)$** です。ここで $n$ はアイテムの数です。

`Item` オブジェクトリストが初期化されるため、**空間計算量は $O(n)$** です。

### 3. &nbsp; 正しさの証明

背理法を使用します。アイテム $x$ が最高の単位値を持ち、あるアルゴリズムが最大値 `res` を生成するが、解にアイテム $x$ が含まれていないと仮定します。

今、ナップサックから任意のアイテムの単位重量を取り除き、アイテム $x$ の単位重量で置き換えます。アイテム $x$ の単位値が最高であるため、置き換え後の総値は確実に `res` より大きくなります。**これは `res` が最適解であるという仮定と矛盾し、最適解には必ずアイテム $x$ が含まれることを証明します**。

この解の他のアイテムについても、上記の矛盾を構築できます。全体的に、**単位値がより大きいアイテムは常により良い選択**であり、貪欲戦略が効果的であることを証明します。

下の図に示すように、アイテムの重量と単位値をそれぞれ二次元チャートの横軸と縦軸と見なすと、分数ナップサック問題は「限られた横軸範囲内で囲まれる最大面積を求める」ことに変換できます。この類推は、幾何学的観点から貪欲戦略の効果を理解するのに役立ちます。

![分数ナップサック問題の幾何学的表現](fractional_knapsack_problem.assets/fractional_knapsack_area_chart.png){ class="animation-figure" }

<p align="center"> 図 15-6 &nbsp; 分数ナップサック問題の幾何学的表現 </p>
