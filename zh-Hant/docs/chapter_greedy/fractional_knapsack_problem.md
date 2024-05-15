---
comments: true
---

# 15.2 &nbsp; 分數背包問題

!!! question

    給定 $n$ 個物品，第 $i$ 個物品的重量為 $wgt[i-1]$、價值為 $val[i-1]$ ，和一個容量為 $cap$ 的背包。每個物品只能選擇一次，**但可以選擇物品的一部分，價值根據選擇的重量比例計算**，問在限定背包容量下背包中物品的最大價值。示例如圖 15-3 所示。

![分數背包問題的示例資料](fractional_knapsack_problem.assets/fractional_knapsack_example.png){ class="animation-figure" }

<p align="center"> 圖 15-3 &nbsp; 分數背包問題的示例資料 </p>

分數背包問題和 0-1 背包問題整體上非常相似，狀態包含當前物品 $i$ 和容量 $c$ ，目標是求限定背包容量下的最大價值。

不同點在於，本題允許只選擇物品的一部分。如圖 15-4 所示，**我們可以對物品任意地進行切分，並按照重量比例來計算相應價值**。

1. 對於物品 $i$ ，它在單位重量下的價值為 $val[i-1] / wgt[i-1]$ ，簡稱單位價值。
2. 假設放入一部分物品 $i$ ，重量為 $w$ ，則背包增加的價值為 $w \times val[i-1] / wgt[i-1]$ 。

![物品在單位重量下的價值](fractional_knapsack_problem.assets/fractional_knapsack_unit_value.png){ class="animation-figure" }

<p align="center"> 圖 15-4 &nbsp; 物品在單位重量下的價值 </p>

### 1. &nbsp; 貪婪策略確定

最大化背包內物品總價值，**本質上是最大化單位重量下的物品價值**。由此便可推理出圖 15-5 所示的貪婪策略。

1. 將物品按照單位價值從高到低進行排序。
2. 走訪所有物品，**每輪貪婪地選擇單位價值最高的物品**。
3. 若剩餘背包容量不足，則使用當前物品的一部分填滿背包。

![分數背包問題的貪婪策略](fractional_knapsack_problem.assets/fractional_knapsack_greedy_strategy.png){ class="animation-figure" }

<p align="center"> 圖 15-5 &nbsp; 分數背包問題的貪婪策略 </p>

### 2. &nbsp; 程式碼實現

我們建立了一個物品類別 `Item` ，以便將物品按照單位價值進行排序。迴圈進行貪婪選擇，當背包已滿時跳出並返回解：

=== "Python"

    ```python title="fractional_knapsack.py"
    class Item:
        """物品"""

        def __init__(self, w: int, v: int):
            self.w = w  # 物品重量
            self.v = v  # 物品價值

    def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
        """分數背包：貪婪"""
        # 建立物品串列，包含兩個屬性：重量、價值
        items = [Item(w, v) for w, v in zip(wgt, val)]
        # 按照單位價值 item.v / item.w 從高到低進行排序
        items.sort(key=lambda item: item.v / item.w, reverse=True)
        # 迴圈貪婪選擇
        res = 0
        for item in items:
            if item.w <= cap:
                # 若剩餘容量充足，則將當前物品整個裝進背包
                res += item.v
                cap -= item.w
            else:
                # 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += (item.v / item.w) * cap
                # 已無剩餘容量，因此跳出迴圈
                break
        return res
    ```

=== "C++"

    ```cpp title="fractional_knapsack.cpp"
    /* 物品 */
    class Item {
      public:
        int w; // 物品重量
        int v; // 物品價值

        Item(int w, int v) : w(w), v(v) {
        }
    };

    /* 分數背包：貪婪 */
    double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
        // 建立物品串列，包含兩個屬性：重量、價值
        vector<Item> items;
        for (int i = 0; i < wgt.size(); i++) {
            items.push_back(Item(wgt[i], val[i]));
        }
        // 按照單位價值 item.v / item.w 從高到低進行排序
        sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
        // 迴圈貪婪選擇
        double res = 0;
        for (auto &item : items) {
            if (item.w <= cap) {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += (double)item.v / item.w * cap;
                // 已無剩餘容量，因此跳出迴圈
                break;
            }
        }
        return res;
    }
    ```

=== "Java"

    ```java title="fractional_knapsack.java"
    /* 物品 */
    class Item {
        int w; // 物品重量
        int v; // 物品價值

        public Item(int w, int v) {
            this.w = w;
            this.v = v;
        }
    }

    /* 分數背包：貪婪 */
    double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 建立物品串列，包含兩個屬性：重量、價值
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 按照單位價值 item.v / item.w 從高到低進行排序
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // 迴圈貪婪選擇
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += (double) item.v / item.w * cap;
                // 已無剩餘容量，因此跳出迴圈
                break;
            }
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="fractional_knapsack.cs"
    /* 物品 */
    class Item(int w, int v) {
        public int w = w; // 物品重量
        public int v = v; // 物品價值
    }

    /* 分數背包：貪婪 */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 建立物品串列，包含兩個屬性：重量、價值
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 按照單位價值 item.v / item.w 從高到低進行排序
        Array.Sort(items, (x, y) => (y.v / y.w).CompareTo(x.v / x.w));
        // 迴圈貪婪選擇
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += (double)item.v / item.w * cap;
                // 已無剩餘容量，因此跳出迴圈
                break;
            }
        }
        return res;
    }
    ```

=== "Go"

    ```go title="fractional_knapsack.go"
    /* 物品 */
    type Item struct {
        w int // 物品重量
        v int // 物品價值
    }

    /* 分數背包：貪婪 */
    func fractionalKnapsack(wgt []int, val []int, cap int) float64 {
        // 建立物品串列，包含兩個屬性：重量、價值
        items := make([]Item, len(wgt))
        for i := 0; i < len(wgt); i++ {
            items[i] = Item{wgt[i], val[i]}
        }
        // 按照單位價值 item.v / item.w 從高到低進行排序
        sort.Slice(items, func(i, j int) bool {
            return float64(items[i].v)/float64(items[i].w) > float64(items[j].v)/float64(items[j].w)
        })
        // 迴圈貪婪選擇
        res := 0.0
        for _, item := range items {
            if item.w <= cap {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += float64(item.v)
                cap -= item.w
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += float64(item.v) / float64(item.w) * float64(cap)
                // 已無剩餘容量，因此跳出迴圈
                break
            }
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="fractional_knapsack.swift"
    /* 物品 */
    class Item {
        var w: Int // 物品重量
        var v: Int // 物品價值

        init(w: Int, v: Int) {
            self.w = w
            self.v = v
        }
    }

    /* 分數背包：貪婪 */
    func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
        // 建立物品串列，包含兩個屬性：重量、價值
        var items = zip(wgt, val).map { Item(w: $0, v: $1) }
        // 按照單位價值 item.v / item.w 從高到低進行排序
        items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
        // 迴圈貪婪選擇
        var res = 0.0
        var cap = cap
        for item in items {
            if item.w <= cap {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += Double(item.v)
                cap -= item.w
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += Double(item.v) / Double(item.w) * Double(cap)
                // 已無剩餘容量，因此跳出迴圈
                break
            }
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="fractional_knapsack.js"
    /* 物品 */
    class Item {
        constructor(w, v) {
            this.w = w; // 物品重量
            this.v = v; // 物品價值
        }
    }

    /* 分數背包：貪婪 */
    function fractionalKnapsack(wgt, val, cap) {
        // 建立物品串列，包含兩個屬性：重量、價值
        const items = wgt.map((w, i) => new Item(w, val[i]));
        // 按照單位價值 item.v / item.w 從高到低進行排序
        items.sort((a, b) => b.v / b.w - a.v / a.w);
        // 迴圈貪婪選擇
        let res = 0;
        for (const item of items) {
            if (item.w <= cap) {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += (item.v / item.w) * cap;
                // 已無剩餘容量，因此跳出迴圈
                break;
            }
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="fractional_knapsack.ts"
    /* 物品 */
    class Item {
        w: number; // 物品重量
        v: number; // 物品價值

        constructor(w: number, v: number) {
            this.w = w;
            this.v = v;
        }
    }

    /* 分數背包：貪婪 */
    function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
        // 建立物品串列，包含兩個屬性：重量、價值
        const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
        // 按照單位價值 item.v / item.w 從高到低進行排序
        items.sort((a, b) => b.v / b.w - a.v / a.w);
        // 迴圈貪婪選擇
        let res = 0;
        for (const item of items) {
            if (item.w <= cap) {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += (item.v / item.w) * cap;
                // 已無剩餘容量，因此跳出迴圈
                break;
            }
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="fractional_knapsack.dart"
    /* 物品 */
    class Item {
      int w; // 物品重量
      int v; // 物品價值

      Item(this.w, this.v);
    }

    /* 分數背包：貪婪 */
    double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
      // 建立物品串列，包含兩個屬性：重量、價值
      List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
      // 按照單位價值 item.v / item.w 從高到低進行排序
      items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
      // 迴圈貪婪選擇
      double res = 0;
      for (Item item in items) {
        if (item.w <= cap) {
          // 若剩餘容量充足，則將當前物品整個裝進背包
          res += item.v;
          cap -= item.w;
        } else {
          // 若剩餘容量不足，則將當前物品的一部分裝進背包
          res += item.v / item.w * cap;
          // 已無剩餘容量，因此跳出迴圈
          break;
        }
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="fractional_knapsack.rs"
    /* 物品 */
    struct Item {
        w: i32, // 物品重量
        v: i32, // 物品價值
    }

    impl Item {
        fn new(w: i32, v: i32) -> Self {
            Self { w, v }
        }
    }

    /* 分數背包：貪婪 */
    fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
        // 建立物品串列，包含兩個屬性：重量、價值
        let mut items = wgt
            .iter()
            .zip(val.iter())
            .map(|(&w, &v)| Item::new(w, v))
            .collect::<Vec<Item>>();
        // 按照單位價值 item.v / item.w 從高到低進行排序
        items.sort_by(|a, b| {
            (b.v as f64 / b.w as f64)
                .partial_cmp(&(a.v as f64 / a.w as f64))
                .unwrap()
        });
        // 迴圈貪婪選擇
        let mut res = 0.0;
        for item in &items {
            if item.w <= cap {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += item.v as f64;
                cap -= item.w;
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += item.v as f64 / item.w as f64 * cap as f64;
                // 已無剩餘容量，因此跳出迴圈
                break;
            }
        }
        res
    }
    ```

=== "C"

    ```c title="fractional_knapsack.c"
    /* 物品 */
    typedef struct {
        int w; // 物品重量
        int v; // 物品價值
    } Item;

    /* 分數背包：貪婪 */
    float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
        // 建立物品串列，包含兩個屬性：重量、價值
        Item *items = malloc(sizeof(Item) * itemCount);
        for (int i = 0; i < itemCount; i++) {
            items[i] = (Item){.w = wgt[i], .v = val[i]};
        }
        // 按照單位價值 item.v / item.w 從高到低進行排序
        qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
        // 迴圈貪婪選擇
        float res = 0.0;
        for (int i = 0; i < itemCount; i++) {
            if (items[i].w <= cap) {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += items[i].v;
                cap -= items[i].w;
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += (float)cap / items[i].w * items[i].v;
                cap = 0;
                break;
            }
        }
        free(items);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="fractional_knapsack.kt"
    /* 物品 */
    class Item(
        val w: Int, // 物品
        val v: Int  // 物品價值
    )

    /* 分數背包：貪婪 */
    fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
        // 建立物品串列，包含兩個屬性：重量、價值
        var cap = c
        val items = arrayOfNulls<Item>(wgt.size)
        for (i in wgt.indices) {
            items[i] = Item(wgt[i], _val[i])
        }
        // 按照單位價值 item.v / item.w 從高到低進行排序
        items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
        // 迴圈貪婪選擇
        var res = 0.0
        for (item in items) {
            if (item!!.w <= cap) {
                // 若剩餘容量充足，則將當前物品整個裝進背包
                res += item.v
                cap -= item.w
            } else {
                // 若剩餘容量不足，則將當前物品的一部分裝進背包
                res += item.v.toDouble() / item.w * cap
                // 已無剩餘容量，因此跳出迴圈
                break
            }
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="fractional_knapsack.rb"
    ### 物品 ###
    class Item
      attr_accessor :w # 物品重量
      attr_accessor :v # 物品價值

      def initialize(w, v)
        @w = w
        @v = v
      end
    end

    ### 分數背包：貪婪 ###
    def fractional_knapsack(wgt, val, cap)
      # 建立物品串列，包含兩個屬性：重量，價值
      items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
      # 按照單位價值 item.v / item.w 從高到低進行排序
      items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
      # 迴圈貪婪選擇
      res = 0
      for item in items
        if item.w <= cap
          # 若剩餘容量充足，則將當前物品整個裝進背包
          res += item.v
          cap -= item.w
        else
          # 若剩餘容量不足，則將當前物品的一部分裝進背包
          res += (item.v.to_f / item.w) * cap
          # 已無剩餘容量，因此跳出迴圈
          break
        end
      end
      res
    end
    ```

=== "Zig"

    ```zig title="fractional_knapsack.zig"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractionalKnapsack}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20Item%3A%0A%20%20%20%20%22%22%22%E7%89%A9%E5%93%81%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20w%3A%20int%2C%20v%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.w%20%3D%20w%20%20%23%20%E7%89%A9%E5%93%81%E9%87%8D%E9%87%8F%0A%20%20%20%20%20%20%20%20self.v%20%3D%20v%20%20%23%20%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%0A%0Adef%20fractional_knapsack%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%88%86%E6%95%B8%E8%83%8C%E5%8C%85%EF%BC%9A%E8%B2%AA%E5%A9%AA%22%22%22%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E7%89%A9%E5%93%81%E4%B8%B2%E5%88%97%EF%BC%8C%E5%8C%85%E5%90%AB%E5%85%A9%E5%80%8B%E5%B1%AC%E6%80%A7%EF%BC%9A%E9%87%8D%E9%87%8F%E3%80%81%E5%83%B9%E5%80%BC%0A%20%20%20%20items%20%3D%20%5BItem%28w%2C%20v%29%20for%20w%2C%20v%20in%20zip%28wgt%2C%20val%29%5D%0A%20%20%20%20%23%20%E6%8C%89%E7%85%A7%E5%96%AE%E4%BD%8D%E5%83%B9%E5%80%BC%20item.v%20/%20item.w%20%E5%BE%9E%E9%AB%98%E5%88%B0%E4%BD%8E%E9%80%B2%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20items.sort%28key%3Dlambda%20item%3A%20item.v%20/%20item.w%2C%20reverse%3DTrue%29%0A%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E8%B2%AA%E5%A9%AA%E9%81%B8%E6%93%87%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20for%20item%20in%20items%3A%0A%20%20%20%20%20%20%20%20if%20item.w%20%3C%3D%20cap%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%89%A9%E9%A4%98%E5%AE%B9%E9%87%8F%E5%85%85%E8%B6%B3%EF%BC%8C%E5%89%87%E5%B0%87%E7%95%B6%E5%89%8D%E7%89%A9%E5%93%81%E6%95%B4%E5%80%8B%E8%A3%9D%E9%80%B2%E8%83%8C%E5%8C%85%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20item.v%0A%20%20%20%20%20%20%20%20%20%20%20%20cap%20-%3D%20item.w%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%89%A9%E9%A4%98%E5%AE%B9%E9%87%8F%E4%B8%8D%E8%B6%B3%EF%BC%8C%E5%89%87%E5%B0%87%E7%95%B6%E5%89%8D%E7%89%A9%E5%93%81%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86%E8%A3%9D%E9%80%B2%E8%83%8C%E5%8C%85%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20%28item.v%20/%20item.w%29%20%2A%20cap%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%B7%B2%E7%84%A1%E5%89%A9%E9%A4%98%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%9B%A0%E6%AD%A4%E8%B7%B3%E5%87%BA%E8%BF%B4%E5%9C%88%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E8%B2%AA%E5%A9%AA%E6%BC%94%E7%AE%97%E6%B3%95%0A%20%20%20%20res%20%3D%20fractional_knapsack%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%E7%82%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Item%3A%0A%20%20%20%20%22%22%22%E7%89%A9%E5%93%81%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20w%3A%20int%2C%20v%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.w%20%3D%20w%20%20%23%20%E7%89%A9%E5%93%81%E9%87%8D%E9%87%8F%0A%20%20%20%20%20%20%20%20self.v%20%3D%20v%20%20%23%20%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%0A%0Adef%20fractional_knapsack%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%88%86%E6%95%B8%E8%83%8C%E5%8C%85%EF%BC%9A%E8%B2%AA%E5%A9%AA%22%22%22%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E7%89%A9%E5%93%81%E4%B8%B2%E5%88%97%EF%BC%8C%E5%8C%85%E5%90%AB%E5%85%A9%E5%80%8B%E5%B1%AC%E6%80%A7%EF%BC%9A%E9%87%8D%E9%87%8F%E3%80%81%E5%83%B9%E5%80%BC%0A%20%20%20%20items%20%3D%20%5BItem%28w%2C%20v%29%20for%20w%2C%20v%20in%20zip%28wgt%2C%20val%29%5D%0A%20%20%20%20%23%20%E6%8C%89%E7%85%A7%E5%96%AE%E4%BD%8D%E5%83%B9%E5%80%BC%20item.v%20/%20item.w%20%E5%BE%9E%E9%AB%98%E5%88%B0%E4%BD%8E%E9%80%B2%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20items.sort%28key%3Dlambda%20item%3A%20item.v%20/%20item.w%2C%20reverse%3DTrue%29%0A%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E8%B2%AA%E5%A9%AA%E9%81%B8%E6%93%87%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20for%20item%20in%20items%3A%0A%20%20%20%20%20%20%20%20if%20item.w%20%3C%3D%20cap%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%89%A9%E9%A4%98%E5%AE%B9%E9%87%8F%E5%85%85%E8%B6%B3%EF%BC%8C%E5%89%87%E5%B0%87%E7%95%B6%E5%89%8D%E7%89%A9%E5%93%81%E6%95%B4%E5%80%8B%E8%A3%9D%E9%80%B2%E8%83%8C%E5%8C%85%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20item.v%0A%20%20%20%20%20%20%20%20%20%20%20%20cap%20-%3D%20item.w%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%89%A9%E9%A4%98%E5%AE%B9%E9%87%8F%E4%B8%8D%E8%B6%B3%EF%BC%8C%E5%89%87%E5%B0%87%E7%95%B6%E5%89%8D%E7%89%A9%E5%93%81%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86%E8%A3%9D%E9%80%B2%E8%83%8C%E5%8C%85%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20%28item.v%20/%20item.w%29%20%2A%20cap%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%B7%B2%E7%84%A1%E5%89%A9%E9%A4%98%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%9B%A0%E6%AD%A4%E8%B7%B3%E5%87%BA%E8%BF%B4%E5%9C%88%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E8%B2%AA%E5%A9%AA%E6%BC%94%E7%AE%97%E6%B3%95%0A%20%20%20%20res%20%3D%20fractional_knapsack%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%E7%82%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

除排序之外，在最差情況下，需要走訪整個物品串列，**因此時間複雜度為 $O(n)$** ，其中 $n$ 為物品數量。

由於初始化了一個 `Item` 物件串列，**因此空間複雜度為 $O(n)$** 。

### 3. &nbsp; 正確性證明

採用反證法。假設物品 $x$ 是單位價值最高的物品，使用某演算法求得最大價值為 `res` ，但該解中不包含物品 $x$ 。

現在從背包中拿出單位重量的任意物品，並替換為單位重量的物品 $x$ 。由於物品 $x$ 的單位價值最高，因此替換後的總價值一定大於 `res` 。**這與 `res` 是最優解矛盾，說明最優解中必須包含物品 $x$** 。

對於該解中的其他物品，我們也可以構建出上述矛盾。總而言之，**單位價值更大的物品總是更優選擇**，這說明貪婪策略是有效的。

如圖 15-6 所示，如果將物品重量和物品單位價值分別看作一張二維圖表的橫軸和縱軸，則分數背包問題可轉化為“求在有限橫軸區間下圍成的最大面積”。這個類比可以幫助我們從幾何角度理解貪婪策略的有效性。

![分數背包問題的幾何表示](fractional_knapsack_problem.assets/fractional_knapsack_area_chart.png){ class="animation-figure" }

<p align="center"> 圖 15-6 &nbsp; 分數背包問題的幾何表示 </p>
