---
comments: true
---

# 15.2 &nbsp; Fractional Knapsack Problem

!!! question

    Given $n$ items, where the weight of the $i$-th item is $wgt[i-1]$ and its value is $val[i-1]$, and a knapsack with capacity $cap$. Each item can be selected only once, **but a portion of an item can be selected, with the value calculated based on the proportion of weight selected**, what is the maximum value of items in the knapsack under the limited capacity? An example is shown in Figure 15-3.

![Example data for the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_example.png){ class="animation-figure" }

<p align="center"> Figure 15-3 &nbsp; Example data for the fractional knapsack problem </p>

The fractional knapsack problem is very similar overall to the 0-1 knapsack problem, with states including the current item $i$ and capacity $c$, and the goal being to maximize value under the limited knapsack capacity.

The difference is that this problem allows selecting only a portion of an item. As shown in Figure 15-4, **we can arbitrarily split items and calculate the corresponding value based on the weight proportion**.

1. For item $i$, its value per unit weight is $val[i-1] / wgt[i-1]$, referred to as unit value.
2. Suppose we put a portion of item $i$ with weight $w$ into the knapsack, then the value added to the knapsack is $w \times val[i-1] / wgt[i-1]$.

![Value of items per unit weight](fractional_knapsack_problem.assets/fractional_knapsack_unit_value.png){ class="animation-figure" }

<p align="center"> Figure 15-4 &nbsp; Value of items per unit weight </p>

### 1. &nbsp; Greedy Strategy Determination

Maximizing the total value of items in the knapsack **is essentially maximizing the value per unit weight of items**. From this, we can derive the greedy strategy shown in Figure 15-5.

1. Sort items by unit value from high to low.
2. Iterate through all items, **greedily selecting the item with the highest unit value in each round**.
3. If the remaining knapsack capacity is insufficient, use a portion of the current item to fill the knapsack.

![Greedy strategy for the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_greedy_strategy.png){ class="animation-figure" }

<p align="center"> Figure 15-5 &nbsp; Greedy strategy for the fractional knapsack problem </p>

### 2. &nbsp; Code Implementation

We created an `Item` class to facilitate sorting items by unit value. We loop to make greedy selections, breaking when the knapsack is full and returning the solution:

=== "Python"

    ```python title="fractional_knapsack.py"
    class Item:
        """Item"""

        def __init__(self, w: int, v: int):
            self.w = w  # Item weight
            self.v = v  # Item value

    def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
        """Fractional knapsack: Greedy algorithm"""
        # Create item list with two attributes: weight, value
        items = [Item(w, v) for w, v in zip(wgt, val)]
        # Sort by unit value item.v / item.w from high to low
        items.sort(key=lambda item: item.v / item.w, reverse=True)
        # Loop for greedy selection
        res = 0
        for item in items:
            if item.w <= cap:
                # If remaining capacity is sufficient, put the entire current item into the knapsack
                res += item.v
                cap -= item.w
            else:
                # If remaining capacity is insufficient, put part of the current item into the knapsack
                res += (item.v / item.w) * cap
                # No remaining capacity, so break out of the loop
                break
        return res
    ```

=== "C++"

    ```cpp title="fractional_knapsack.cpp"
    /* Item */
    class Item {
      public:
        int w; // Item weight
        int v; // Item value

        Item(int w, int v) : w(w), v(v) {
        }
    };

    /* Fractional knapsack: Greedy algorithm */
    double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
        // Create item list with two attributes: weight, value
        vector<Item> items;
        for (int i = 0; i < wgt.size(); i++) {
            items.push_back(Item(wgt[i], val[i]));
        }
        // Sort by unit value item.v / item.w from high to low
        sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
        // Loop for greedy selection
        double res = 0;
        for (auto &item : items) {
            if (item.w <= cap) {
                // If remaining capacity is sufficient, put the entire current item into the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If remaining capacity is insufficient, put part of the current item into the knapsack
                res += (double)item.v / item.w * cap;
                // No remaining capacity, so break out of the loop
                break;
            }
        }
        return res;
    }
    ```

=== "Java"

    ```java title="fractional_knapsack.java"
    /* Item */
    class Item {
        int w; // Item weight
        int v; // Item value

        public Item(int w, int v) {
            this.w = w;
            this.v = v;
        }
    }

    /* Fractional knapsack: Greedy algorithm */
    double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // Create item list with two attributes: weight, value
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Sort by unit value item.v / item.w from high to low
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // Loop for greedy selection
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // If remaining capacity is sufficient, put the entire current item into the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If remaining capacity is insufficient, put part of the current item into the knapsack
                res += (double) item.v / item.w * cap;
                // No remaining capacity, so break out of the loop
                break;
            }
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="fractional_knapsack.cs"
    /* Item */
    class Item(int w, int v) {
        public int w = w; // Item weight
        public int v = v; // Item value
    }

    /* Fractional knapsack: Greedy algorithm */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // Create item list with two attributes: weight, value
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Sort by unit value item.v / item.w from high to low
        Array.Sort(items, (x, y) => (y.v / y.w).CompareTo(x.v / x.w));
        // Loop for greedy selection
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // If remaining capacity is sufficient, put the entire current item into the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If remaining capacity is insufficient, put part of the current item into the knapsack
                res += (double)item.v / item.w * cap;
                // No remaining capacity, so break out of the loop
                break;
            }
        }
        return res;
    }
    ```

=== "Go"

    ```go title="fractional_knapsack.go"
    /* Item */
    type Item struct {
        w int // Item weight
        v int // Item value
    }

    /* Fractional knapsack: Greedy algorithm */
    func fractionalKnapsack(wgt []int, val []int, cap int) float64 {
        // Create item list with two attributes: weight, value
        items := make([]Item, len(wgt))
        for i := 0; i < len(wgt); i++ {
            items[i] = Item{wgt[i], val[i]}
        }
        // Sort by unit value item.v / item.w from high to low
        sort.Slice(items, func(i, j int) bool {
            return float64(items[i].v)/float64(items[i].w) > float64(items[j].v)/float64(items[j].w)
        })
        // Loop for greedy selection
        res := 0.0
        for _, item := range items {
            if item.w <= cap {
                // If remaining capacity is sufficient, put the entire current item into the knapsack
                res += float64(item.v)
                cap -= item.w
            } else {
                // If remaining capacity is insufficient, put part of the current item into the knapsack
                res += float64(item.v) / float64(item.w) * float64(cap)
                // No remaining capacity, so break out of the loop
                break
            }
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="fractional_knapsack.swift"
    /* Item */
    class Item {
        var w: Int // Item weight
        var v: Int // Item value

        init(w: Int, v: Int) {
            self.w = w
            self.v = v
        }
    }

    /* Fractional knapsack: Greedy algorithm */
    func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
        // Create item list with two attributes: weight, value
        var items = zip(wgt, val).map { Item(w: $0, v: $1) }
        // Sort by unit value item.v / item.w from high to low
        items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
        // Loop for greedy selection
        var res = 0.0
        var cap = cap
        for item in items {
            if item.w <= cap {
                // If remaining capacity is sufficient, put the entire current item into the knapsack
                res += Double(item.v)
                cap -= item.w
            } else {
                // If remaining capacity is insufficient, put part of the current item into the knapsack
                res += Double(item.v) / Double(item.w) * Double(cap)
                // No remaining capacity, so break out of the loop
                break
            }
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="fractional_knapsack.js"
    /* Item */
    class Item {
        constructor(w, v) {
            this.w = w; // Item weight
            this.v = v; // Item value
        }
    }

    /* Fractional knapsack: Greedy algorithm */
    function fractionalKnapsack(wgt, val, cap) {
        // Create item list with two attributes: weight, value
        const items = wgt.map((w, i) => new Item(w, val[i]));
        // Sort by unit value item.v / item.w from high to low
        items.sort((a, b) => b.v / b.w - a.v / a.w);
        // Loop for greedy selection
        let res = 0;
        for (const item of items) {
            if (item.w <= cap) {
                // If remaining capacity is sufficient, put the entire current item into the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If remaining capacity is insufficient, put part of the current item into the knapsack
                res += (item.v / item.w) * cap;
                // No remaining capacity, so break out of the loop
                break;
            }
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="fractional_knapsack.ts"
    /* Item */
    class Item {
        w: number; // Item weight
        v: number; // Item value

        constructor(w: number, v: number) {
            this.w = w;
            this.v = v;
        }
    }

    /* Fractional knapsack: Greedy algorithm */
    function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
        // Create item list with two attributes: weight, value
        const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
        // Sort by unit value item.v / item.w from high to low
        items.sort((a, b) => b.v / b.w - a.v / a.w);
        // Loop for greedy selection
        let res = 0;
        for (const item of items) {
            if (item.w <= cap) {
                // If remaining capacity is sufficient, put the entire current item into the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If remaining capacity is insufficient, put part of the current item into the knapsack
                res += (item.v / item.w) * cap;
                // No remaining capacity, so break out of the loop
                break;
            }
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="fractional_knapsack.dart"
    /* Item */
    class Item {
      int w; // Item weight
      int v; // Item value

      Item(this.w, this.v);
    }

    /* Fractional knapsack: Greedy algorithm */
    double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
      // Create item list with two attributes: weight, value
      List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
      // Sort by unit value item.v / item.w from high to low
      items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
      // Loop for greedy selection
      double res = 0;
      for (Item item in items) {
        if (item.w <= cap) {
          // If remaining capacity is sufficient, put the entire current item into the knapsack
          res += item.v;
          cap -= item.w;
        } else {
          // If remaining capacity is insufficient, put part of the current item into the knapsack
          res += item.v / item.w * cap;
          // No remaining capacity, so break out of the loop
          break;
        }
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="fractional_knapsack.rs"
    /* Item */
    struct Item {
        w: i32, // Item weight
        v: i32, // Item value
    }

    impl Item {
        fn new(w: i32, v: i32) -> Self {
            Self { w, v }
        }
    }

    /* Fractional knapsack: Greedy algorithm */
    fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
        // Create item list with two attributes: weight, value
        let mut items = wgt
            .iter()
            .zip(val.iter())
            .map(|(&w, &v)| Item::new(w, v))
            .collect::<Vec<Item>>();
        // Sort by unit value item.v / item.w from high to low
        items.sort_by(|a, b| {
            (b.v as f64 / b.w as f64)
                .partial_cmp(&(a.v as f64 / a.w as f64))
                .unwrap()
        });
        // Loop for greedy selection
        let mut res = 0.0;
        for item in &items {
            if item.w <= cap {
                // If remaining capacity is sufficient, put the entire current item into the knapsack
                res += item.v as f64;
                cap -= item.w;
            } else {
                // If remaining capacity is insufficient, put part of the current item into the knapsack
                res += item.v as f64 / item.w as f64 * cap as f64;
                // No remaining capacity, so break out of the loop
                break;
            }
        }
        res
    }
    ```

=== "C"

    ```c title="fractional_knapsack.c"
    /* Item */
    typedef struct {
        int w; // Item weight
        int v; // Item value
    } Item;

    /* Fractional knapsack: Greedy algorithm */
    float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
        // Create item list with two attributes: weight, value
        Item *items = malloc(sizeof(Item) * itemCount);
        for (int i = 0; i < itemCount; i++) {
            items[i] = (Item){.w = wgt[i], .v = val[i]};
        }
        // Sort by unit value item.v / item.w from high to low
        qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
        // Loop for greedy selection
        float res = 0.0;
        for (int i = 0; i < itemCount; i++) {
            if (items[i].w <= cap) {
                // If remaining capacity is sufficient, put the entire current item into the knapsack
                res += items[i].v;
                cap -= items[i].w;
            } else {
                // If remaining capacity is insufficient, put part of the current item into the knapsack
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
    /* Item */
    class Item(
        val w: Int, // Item
        val v: Int  // Item value
    )

    /* Fractional knapsack: Greedy algorithm */
    fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
        // Create item list with two attributes: weight, value
        var cap = c
        val items = arrayOfNulls<Item>(wgt.size)
        for (i in wgt.indices) {
            items[i] = Item(wgt[i], _val[i])
        }
        // Sort by unit value item.v / item.w from high to low
        items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
        // Loop for greedy selection
        var res = 0.0
        for (item in items) {
            if (item!!.w <= cap) {
                // If remaining capacity is sufficient, put the entire current item into the knapsack
                res += item.v
                cap -= item.w
            } else {
                // If remaining capacity is insufficient, put part of the current item into the knapsack
                res += item.v.toDouble() / item.w * cap
                // No remaining capacity, so break out of the loop
                break
            }
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="fractional_knapsack.rb"
    ### Item ###
    class Item
      attr_accessor :w # Item weight
      attr_accessor :v # Item value

      def initialize(w, v)
        @w = w
        @v = v
      end
    end

    ### Fractional knapsack: greedy ###
    def fractional_knapsack(wgt, val, cap)
      # Create item list with two attributes: weight, value
      items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
      # Sort by unit value item.v / item.w from high to low
      items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
      # Loop for greedy selection
      res = 0
      for item in items
        if item.w <= cap
          # If remaining capacity is sufficient, put the entire current item into the knapsack
          res += item.v
          cap -= item.w
        else
          # If remaining capacity is insufficient, put part of the current item into the knapsack
          res += (item.v.to_f / item.w) * cap
          # No remaining capacity, so break out of the loop
          break
        end
      end
      res
    end
    ```

The time complexity of built-in sorting algorithms is usually $O(\log n)$, and the space complexity is usually $O(\log n)$ or $O(n)$, depending on the specific implementation of the programming language.

Apart from sorting, in the worst case the entire item list needs to be traversed, **therefore the time complexity is $O(n)$**, where $n$ is the number of items.

Since an `Item` object list is initialized, **the space complexity is $O(n)$**.

### 3. &nbsp; Correctness Proof

Using proof by contradiction. Suppose item $x$ has the highest unit value, and some algorithm yields a maximum value of `res`, but this solution does not include item $x$.

Now remove a unit weight of any item from the knapsack and replace it with a unit weight of item $x$. Since item $x$ has the highest unit value, the total value after replacement will definitely be greater than `res`. **This contradicts the assumption that `res` is the optimal solution, proving that the optimal solution must include item $x$**.

For other items in this solution, we can also construct the above contradiction. In summary, **items with greater unit value are always better choices**, which proves that the greedy strategy is effective.

As shown in Figure 15-6, if we view item weight and item unit value as the horizontal and vertical axes of a two-dimensional chart respectively, then the fractional knapsack problem can be transformed into "finding the maximum area enclosed within a limited horizontal axis range". This analogy can help us understand the effectiveness of the greedy strategy from a geometric perspective.

![Geometric representation of the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_area_chart.png){ class="animation-figure" }

<p align="center"> Figure 15-6 &nbsp; Geometric representation of the fractional knapsack problem </p>
