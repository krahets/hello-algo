---
comments: true
---

# 15.2 &nbsp; 分数背包问题

!!! question

    给定 $n$ 个物品，第 $i$ 个物品的重量为 $wgt[i-1]$、价值为 $val[i-1]$ ，和一个容量为 $cap$ 的背包。每个物品只能选择一次，**但可以选择物品的一部分，价值根据选择的重量比例计算**，问在限定背包容量下背包中物品的最大价值。示例如图 15-3 所示。

![分数背包问题的示例数据](fractional_knapsack_problem.assets/fractional_knapsack_example.png){ class="animation-figure" }

<p align="center"> 图 15-3 &nbsp; 分数背包问题的示例数据 </p>

分数背包问题和 0-1 背包问题整体上非常相似，状态包含当前物品 $i$ 和容量 $c$ ，目标是求限定背包容量下的最大价值。

不同点在于，本题允许只选择物品的一部分。如图 15-4 所示，**我们可以对物品任意地进行切分，并按照重量比例来计算相应价值**。

1. 对于物品 $i$ ，它在单位重量下的价值为 $val[i-1] / wgt[i-1]$ ，简称单位价值。
2. 假设放入一部分物品 $i$ ，重量为 $w$ ，则背包增加的价值为 $w \times val[i-1] / wgt[i-1]$ 。

![物品在单位重量下的价值](fractional_knapsack_problem.assets/fractional_knapsack_unit_value.png){ class="animation-figure" }

<p align="center"> 图 15-4 &nbsp; 物品在单位重量下的价值 </p>

### 1. &nbsp; 贪心策略确定

最大化背包内物品总价值，**本质上是最大化单位重量下的物品价值**。由此便可推理出图 15-5 所示的贪心策略。

1. 将物品按照单位价值从高到低进行排序。
2. 遍历所有物品，**每轮贪心地选择单位价值最高的物品**。
3. 若剩余背包容量不足，则使用当前物品的一部分填满背包。

![分数背包问题的贪心策略](fractional_knapsack_problem.assets/fractional_knapsack_greedy_strategy.png){ class="animation-figure" }

<p align="center"> 图 15-5 &nbsp; 分数背包问题的贪心策略 </p>

### 2. &nbsp; 代码实现

我们建立了一个物品类 `Item` ，以便将物品按照单位价值进行排序。循环进行贪心选择，当背包已满时跳出并返回解：

=== "Python"

    ```python title="fractional_knapsack.py"
    class Item:
        """物品"""

        def __init__(self, w: int, v: int):
            self.w = w  # 物品重量
            self.v = v  # 物品价值

    def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
        """分数背包：贪心"""
        # 创建物品列表，包含两个属性：重量、价值
        items = [Item(w, v) for w, v in zip(wgt, val)]
        # 按照单位价值 item.v / item.w 从高到低进行排序
        items.sort(key=lambda item: item.v / item.w, reverse=True)
        # 循环贪心选择
        res = 0
        for item in items:
            if item.w <= cap:
                # 若剩余容量充足，则将当前物品整个装进背包
                res += item.v
                cap -= item.w
            else:
                # 若剩余容量不足，则将当前物品的一部分装进背包
                res += (item.v / item.w) * cap
                # 已无剩余容量，因此跳出循环
                break
        return res
    ```

=== "C++"

    ```cpp title="fractional_knapsack.cpp"
    /* 物品 */
    class Item {
      public:
        int w; // 物品重量
        int v; // 物品价值

        Item(int w, int v) : w(w), v(v) {
        }
    };

    /* 分数背包：贪心 */
    double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
        // 创建物品列表，包含两个属性：重量、价值
        vector<Item> items;
        for (int i = 0; i < wgt.size(); i++) {
            items.push_back(Item(wgt[i], val[i]));
        }
        // 按照单位价值 item.v / item.w 从高到低进行排序
        sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
        // 循环贪心选择
        double res = 0;
        for (auto &item : items) {
            if (item.w <= cap) {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += (double)item.v / item.w * cap;
                // 已无剩余容量，因此跳出循环
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
        int v; // 物品价值

        public Item(int w, int v) {
            this.w = w;
            this.v = v;
        }
    }

    /* 分数背包：贪心 */
    double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 创建物品列表，包含两个属性：重量、价值
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 按照单位价值 item.v / item.w 从高到低进行排序
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // 循环贪心选择
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += (double) item.v / item.w * cap;
                // 已无剩余容量，因此跳出循环
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
        public int v = v; // 物品价值
    }

    /* 分数背包：贪心 */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // 创建物品列表，包含两个属性：重量、价值
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // 按照单位价值 item.v / item.w 从高到低进行排序
        Array.Sort(items, (x, y) => (y.v / y.w).CompareTo(x.v / x.w));
        // 循环贪心选择
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += (double)item.v / item.w * cap;
                // 已无剩余容量，因此跳出循环
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
        v int // 物品价值
    }

    /* 分数背包：贪心 */
    func fractionalKnapsack(wgt []int, val []int, cap int) float64 {
        // 创建物品列表，包含两个属性：重量、价值
        items := make([]Item, len(wgt))
        for i := 0; i < len(wgt); i++ {
            items[i] = Item{wgt[i], val[i]}
        }
        // 按照单位价值 item.v / item.w 从高到低进行排序
        sort.Slice(items, func(i, j int) bool {
            return float64(items[i].v)/float64(items[i].w) > float64(items[j].v)/float64(items[j].w)
        })
        // 循环贪心选择
        res := 0.0
        for _, item := range items {
            if item.w <= cap {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += float64(item.v)
                cap -= item.w
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += float64(item.v) / float64(item.w) * float64(cap)
                // 已无剩余容量，因此跳出循环
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
        var v: Int // 物品价值

        init(w: Int, v: Int) {
            self.w = w
            self.v = v
        }
    }

    /* 分数背包：贪心 */
    func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
        // 创建物品列表，包含两个属性：重量、价值
        var items = zip(wgt, val).map { Item(w: $0, v: $1) }
        // 按照单位价值 item.v / item.w 从高到低进行排序
        items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
        // 循环贪心选择
        var res = 0.0
        var cap = cap
        for item in items {
            if item.w <= cap {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += Double(item.v)
                cap -= item.w
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += Double(item.v) / Double(item.w) * Double(cap)
                // 已无剩余容量，因此跳出循环
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
            this.v = v; // 物品价值
        }
    }

    /* 分数背包：贪心 */
    function fractionalKnapsack(wgt, val, cap) {
        // 创建物品列表，包含两个属性：重量、价值
        const items = wgt.map((w, i) => new Item(w, val[i]));
        // 按照单位价值 item.v / item.w 从高到低进行排序
        items.sort((a, b) => b.v / b.w - a.v / a.w);
        // 循环贪心选择
        let res = 0;
        for (const item of items) {
            if (item.w <= cap) {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += (item.v / item.w) * cap;
                // 已无剩余容量，因此跳出循环
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
        v: number; // 物品价值

        constructor(w: number, v: number) {
            this.w = w;
            this.v = v;
        }
    }

    /* 分数背包：贪心 */
    function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
        // 创建物品列表，包含两个属性：重量、价值
        const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
        // 按照单位价值 item.v / item.w 从高到低进行排序
        items.sort((a, b) => b.v / b.w - a.v / a.w);
        // 循环贪心选择
        let res = 0;
        for (const item of items) {
            if (item.w <= cap) {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += item.v;
                cap -= item.w;
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += (item.v / item.w) * cap;
                // 已无剩余容量，因此跳出循环
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
      int v; // 物品价值

      Item(this.w, this.v);
    }

    /* 分数背包：贪心 */
    double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
      // 创建物品列表，包含两个属性：重量、价值
      List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
      // 按照单位价值 item.v / item.w 从高到低进行排序
      items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
      // 循环贪心选择
      double res = 0;
      for (Item item in items) {
        if (item.w <= cap) {
          // 若剩余容量充足，则将当前物品整个装进背包
          res += item.v;
          cap -= item.w;
        } else {
          // 若剩余容量不足，则将当前物品的一部分装进背包
          res += item.v / item.w * cap;
          // 已无剩余容量，因此跳出循环
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
        v: i32, // 物品价值
    }

    impl Item {
        fn new(w: i32, v: i32) -> Self {
            Self { w, v }
        }
    }

    /* 分数背包：贪心 */
    fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
        // 创建物品列表，包含两个属性：重量、价值
        let mut items = wgt
            .iter()
            .zip(val.iter())
            .map(|(&w, &v)| Item::new(w, v))
            .collect::<Vec<Item>>();
        // 按照单位价值 item.v / item.w 从高到低进行排序
        items.sort_by(|a, b| {
            (b.v as f64 / b.w as f64)
                .partial_cmp(&(a.v as f64 / a.w as f64))
                .unwrap()
        });
        // 循环贪心选择
        let mut res = 0.0;
        for item in &items {
            if item.w <= cap {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += item.v as f64;
                cap -= item.w;
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += item.v as f64 / item.w as f64 * cap as f64;
                // 已无剩余容量，因此跳出循环
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
        int v; // 物品价值
    } Item;

    /* 分数背包：贪心 */
    float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
        // 创建物品列表，包含两个属性：重量、价值
        Item *items = malloc(sizeof(Item) * itemCount);
        for (int i = 0; i < itemCount; i++) {
            items[i] = (Item){.w = wgt[i], .v = val[i]};
        }
        // 按照单位价值 item.v / item.w 从高到低进行排序
        qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
        // 循环贪心选择
        float res = 0.0;
        for (int i = 0; i < itemCount; i++) {
            if (items[i].w <= cap) {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += items[i].v;
                cap -= items[i].w;
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
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
        val v: Int // 物品价值
    )

    /* 分数背包：贪心 */
    fun fractionalKnapsack(
        wgt: IntArray,
        value: IntArray,
        c: Int
    ): Double {
        // 创建物品列表，包含两个属性：重量、价值
        var cap = c
        val items = arrayOfNulls<Item>(wgt.size)
        for (i in wgt.indices) {
            items[i] = Item(wgt[i], value[i])
        }
        // 按照单位价值 item.v / item.w 从高到低进行排序
        Arrays.sort(items, Comparator.comparingDouble { item: Item -> -(item.v.toDouble() / item.w) })
        // 循环贪心选择
        var res = 0.0
        for (item in items) {
            if (item!!.w <= cap) {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += item.v.toDouble()
                cap -= item.w
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += item.v.toDouble() / item.w * cap
                // 已无剩余容量，因此跳出循环
                break
            }
        }
        return res
    }

    /* 分数背包：贪心 */
    fun fractionalKnapsack(
        wgt: IntArray,
        value: IntArray,
        c: Int
    ): Double {
        // 创建物品列表，包含两个属性：重量、价值
        var cap = c
        val items = arrayOfNulls<Item>(wgt.size)
        for (i in wgt.indices) {
            items[i] = Item(wgt[i], value[i])
        }
        // 按照单位价值 item.v / item.w 从高到低进行排序
        Arrays.sort(items, Comparator.comparingDouble { item: Item -> -(item.v.toDouble() / item.w) })
        // 循环贪心选择
        var res = 0.0
        for (item in items) {
            if (item!!.w <= cap) {
                // 若剩余容量充足，则将当前物品整个装进背包
                res += item.v.toDouble()
                cap -= item.w
            } else {
                // 若剩余容量不足，则将当前物品的一部分装进背包
                res += item.v.toDouble() / item.w * cap
                // 已无剩余容量，因此跳出循环
                break
            }
        }
        return res
    }
    ```

=== "Zig"

    ```zig title="fractional_knapsack.zig"
    [class]{Item}-[func]{}

    [class]{}-[func]{fractionalKnapsack}
    ```

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20Item%3A%0A%20%20%20%20%22%22%22%E7%89%A9%E5%93%81%22%22%22%0A%20%20%20%20def%20__init__%28self,%20w%3A%20int,%20v%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.w%20%3D%20w%20%20%23%20%E7%89%A9%E5%93%81%E9%87%8D%E9%87%8F%0A%20%20%20%20%20%20%20%20self.v%20%3D%20v%20%20%23%20%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%0A%0Adef%20fractional_knapsack%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%88%86%E6%95%B0%E8%83%8C%E5%8C%85%EF%BC%9A%E8%B4%AA%E5%BF%83%22%22%22%0A%20%20%20%20%23%20%E5%88%9B%E5%BB%BA%E7%89%A9%E5%93%81%E5%88%97%E8%A1%A8%EF%BC%8C%E5%8C%85%E5%90%AB%E4%B8%A4%E4%B8%AA%E5%B1%9E%E6%80%A7%EF%BC%9A%E9%87%8D%E9%87%8F%E3%80%81%E4%BB%B7%E5%80%BC%0A%20%20%20%20items%20%3D%20%5BItem%28w,%20v%29%20for%20w,%20v%20in%20zip%28wgt,%20val%29%5D%0A%20%20%20%20%23%20%E6%8C%89%E7%85%A7%E5%8D%95%E4%BD%8D%E4%BB%B7%E5%80%BC%20item.v%20/%20item.w%20%E4%BB%8E%E9%AB%98%E5%88%B0%E4%BD%8E%E8%BF%9B%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20items.sort%28key%3Dlambda%20item%3A%20item.v%20/%20item.w,%20reverse%3DTrue%29%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E8%B4%AA%E5%BF%83%E9%80%89%E6%8B%A9%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20for%20item%20in%20items%3A%0A%20%20%20%20%20%20%20%20if%20item.w%20%3C%3D%20cap%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%89%A9%E4%BD%99%E5%AE%B9%E9%87%8F%E5%85%85%E8%B6%B3%EF%BC%8C%E5%88%99%E5%B0%86%E5%BD%93%E5%89%8D%E7%89%A9%E5%93%81%E6%95%B4%E4%B8%AA%E8%A3%85%E8%BF%9B%E8%83%8C%E5%8C%85%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20item.v%0A%20%20%20%20%20%20%20%20%20%20%20%20cap%20-%3D%20item.w%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%89%A9%E4%BD%99%E5%AE%B9%E9%87%8F%E4%B8%8D%E8%B6%B3%EF%BC%8C%E5%88%99%E5%B0%86%E5%BD%93%E5%89%8D%E7%89%A9%E5%93%81%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86%E8%A3%85%E8%BF%9B%E8%83%8C%E5%8C%85%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20%28item.v%20/%20item.w%29%20*%20cap%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%B7%B2%E6%97%A0%E5%89%A9%E4%BD%99%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%9B%A0%E6%AD%A4%E8%B7%B3%E5%87%BA%E5%BE%AA%E7%8E%AF%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E8%B4%AA%E5%BF%83%E7%AE%97%E6%B3%95%0A%20%20%20%20res%20%3D%20fractional_knapsack%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Item%3A%0A%20%20%20%20%22%22%22%E7%89%A9%E5%93%81%22%22%22%0A%20%20%20%20def%20__init__%28self,%20w%3A%20int,%20v%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.w%20%3D%20w%20%20%23%20%E7%89%A9%E5%93%81%E9%87%8D%E9%87%8F%0A%20%20%20%20%20%20%20%20self.v%20%3D%20v%20%20%23%20%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%0A%0Adef%20fractional_knapsack%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%88%86%E6%95%B0%E8%83%8C%E5%8C%85%EF%BC%9A%E8%B4%AA%E5%BF%83%22%22%22%0A%20%20%20%20%23%20%E5%88%9B%E5%BB%BA%E7%89%A9%E5%93%81%E5%88%97%E8%A1%A8%EF%BC%8C%E5%8C%85%E5%90%AB%E4%B8%A4%E4%B8%AA%E5%B1%9E%E6%80%A7%EF%BC%9A%E9%87%8D%E9%87%8F%E3%80%81%E4%BB%B7%E5%80%BC%0A%20%20%20%20items%20%3D%20%5BItem%28w,%20v%29%20for%20w,%20v%20in%20zip%28wgt,%20val%29%5D%0A%20%20%20%20%23%20%E6%8C%89%E7%85%A7%E5%8D%95%E4%BD%8D%E4%BB%B7%E5%80%BC%20item.v%20/%20item.w%20%E4%BB%8E%E9%AB%98%E5%88%B0%E4%BD%8E%E8%BF%9B%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20items.sort%28key%3Dlambda%20item%3A%20item.v%20/%20item.w,%20reverse%3DTrue%29%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E8%B4%AA%E5%BF%83%E9%80%89%E6%8B%A9%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20for%20item%20in%20items%3A%0A%20%20%20%20%20%20%20%20if%20item.w%20%3C%3D%20cap%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%89%A9%E4%BD%99%E5%AE%B9%E9%87%8F%E5%85%85%E8%B6%B3%EF%BC%8C%E5%88%99%E5%B0%86%E5%BD%93%E5%89%8D%E7%89%A9%E5%93%81%E6%95%B4%E4%B8%AA%E8%A3%85%E8%BF%9B%E8%83%8C%E5%8C%85%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20item.v%0A%20%20%20%20%20%20%20%20%20%20%20%20cap%20-%3D%20item.w%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%89%A9%E4%BD%99%E5%AE%B9%E9%87%8F%E4%B8%8D%E8%B6%B3%EF%BC%8C%E5%88%99%E5%B0%86%E5%BD%93%E5%89%8D%E7%89%A9%E5%93%81%E7%9A%84%E4%B8%80%E9%83%A8%E5%88%86%E8%A3%85%E8%BF%9B%E8%83%8C%E5%8C%85%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20%28item.v%20/%20item.w%29%20*%20cap%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%B7%B2%E6%97%A0%E5%89%A9%E4%BD%99%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%9B%A0%E6%AD%A4%E8%B7%B3%E5%87%BA%E5%BE%AA%E7%8E%AF%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E8%B4%AA%E5%BF%83%E7%AE%97%E6%B3%95%0A%20%20%20%20res%20%3D%20fractional_knapsack%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

除排序之外，在最差情况下，需要遍历整个物品列表，**因此时间复杂度为 $O(n)$** ，其中 $n$ 为物品数量。

由于初始化了一个 `Item` 对象列表，**因此空间复杂度为 $O(n)$** 。

### 3. &nbsp; 正确性证明

采用反证法。假设物品 $x$ 是单位价值最高的物品，使用某算法求得最大价值为 `res` ，但该解中不包含物品 $x$ 。

现在从背包中拿出单位重量的任意物品，并替换为单位重量的物品 $x$ 。由于物品 $x$ 的单位价值最高，因此替换后的总价值一定大于 `res` 。**这与 `res` 是最优解矛盾，说明最优解中必须包含物品 $x$** 。

对于该解中的其他物品，我们也可以构建出上述矛盾。总而言之，**单位价值更大的物品总是更优选择**，这说明贪心策略是有效的。

如图 15-6 所示，如果将物品重量和物品单位价值分别看作一张二维图表的横轴和纵轴，则分数背包问题可转化为“求在有限横轴区间下围成的最大面积”。这个类比可以帮助我们从几何角度理解贪心策略的有效性。

![分数背包问题的几何表示](fractional_knapsack_problem.assets/fractional_knapsack_area_chart.png){ class="animation-figure" }

<p align="center"> 图 15-6 &nbsp; 分数背包问题的几何表示 </p>
