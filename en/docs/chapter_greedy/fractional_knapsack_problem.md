---
comments: true
---

# 15.2 &nbsp; Fractional knapsack problem

!!! question

    Given $n$ items, where item $i$ has weight $wgt[i-1]$ and value $val[i-1]$, and a knapsack with capacity $cap$, each item may be selected only once. **However, you may take a fraction of an item, with its value proportional to the weight taken**. What is the maximum total value that fits within the knapsack's capacity? An example is shown in Figure 15-3.

![Example input for the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_example.png){ class="animation-figure" }

<p align="center"> Figure 15-3 &nbsp; Example input for the fractional knapsack problem </p>

The fractional knapsack problem is very similar to the 0-1 knapsack problem. The state consists of the current item $i$ and capacity $c$, and the goal is to maximize value within the knapsack's capacity.

The difference is that we may take only part of an item. As shown in Figure 15-4, **we can divide items into arbitrary fractions and calculate their values in proportion to their weights**.

1. For item $i$, the value per unit weight is $val[i-1] / wgt[i-1]$, which we call its unit value.
2. If we take a portion of item $i$ weighing $w$, the value added to the knapsack is $w \times val[i-1] / wgt[i-1]$.

![Value per unit weight of each item](fractional_knapsack_problem.assets/fractional_knapsack_unit_value.png){ class="animation-figure" }

<p align="center"> Figure 15-4 &nbsp; Value per unit weight of each item </p>

### 1. &nbsp; Choosing a greedy strategy

Maximizing the total value in the knapsack **essentially means maximizing the value obtained per unit weight**. This leads to the greedy strategy shown in Figure 15-5.

1. Sort the items by unit value in descending order.
2. Iterate through the items, **greedily choosing the item with the highest unit value at each step**.
3. If the remaining capacity is insufficient, take just enough of the current item to fill the knapsack.

![Greedy strategy for the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_greedy_strategy.png){ class="animation-figure" }

<p align="center"> Figure 15-5 &nbsp; Greedy strategy for the fractional knapsack problem </p>

### 2. &nbsp; Code implementation

We define an `Item` class to make it easier to sort items by unit value. We repeatedly make greedy choices, stopping and returning the result when the knapsack is full:

=== "Python"

    ```python title="fractional_knapsack.py"
    class Item:
        """Item"""

        def __init__(self, w: int, v: int):
            self.w = w  # Item weight
            self.v = v  # Item value

    def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
        """Fractional knapsack: greedy algorithm"""
        # Create a list of items, each with two attributes: weight and value
        items = [Item(w, v) for w, v in zip(wgt, val)]
        # Sort by value per unit weight, item.v / item.w, in descending order
        items.sort(key=lambda item: item.v / item.w, reverse=True)
        # Repeatedly make greedy choices
        res = 0
        for item in items:
            if item.w <= cap:
                # If enough capacity remains, put the entire current item in the knapsack
                res += item.v
                cap -= item.w
            else:
                # If the remaining capacity is insufficient, put part of the current item in the knapsack
                res += (item.v / item.w) * cap
                # No capacity remains, so exit the loop
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

    /* Fractional knapsack: greedy algorithm */
    double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
        // Create a list of items, each with two attributes: weight and value
        vector<Item> items;
        for (int i = 0; i < wgt.size(); i++) {
            items.push_back(Item(wgt[i], val[i]));
        }
        // Sort by value per unit weight, item.v / item.w, in descending order
        sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
        // Repeatedly make greedy choices
        double res = 0;
        for (auto &item : items) {
            if (item.w <= cap) {
                // If enough capacity remains, put the entire current item in the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If the remaining capacity is insufficient, put part of the current item in the knapsack
                res += (double)item.v / item.w * cap;
                // No capacity remains, so exit the loop
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

    /* Fractional knapsack: greedy algorithm */
    double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // Create a list of items, each with two attributes: weight and value
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Sort by value per unit weight, item.v / item.w, in descending order
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // Repeatedly make greedy choices
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // If enough capacity remains, put the entire current item in the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If the remaining capacity is insufficient, put part of the current item in the knapsack
                res += (double) item.v / item.w * cap;
                // No capacity remains, so exit the loop
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

    /* Fractional knapsack: greedy algorithm */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // Create a list of items, each with two attributes: weight and value
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Sort by value per unit weight, item.v / item.w, in descending order
        Array.Sort(items, (x, y) => (y.v / y.w).CompareTo(x.v / x.w));
        // Repeatedly make greedy choices
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // If enough capacity remains, put the entire current item in the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If the remaining capacity is insufficient, put part of the current item in the knapsack
                res += (double)item.v / item.w * cap;
                // No capacity remains, so exit the loop
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

    /* Fractional knapsack: greedy algorithm */
    func fractionalKnapsack(wgt []int, val []int, cap int) float64 {
        // Create a list of items, each with two attributes: weight and value
        items := make([]Item, len(wgt))
        for i := 0; i < len(wgt); i++ {
            items[i] = Item{wgt[i], val[i]}
        }
        // Sort by value per unit weight, item.v / item.w, in descending order
        sort.Slice(items, func(i, j int) bool {
            return float64(items[i].v)/float64(items[i].w) > float64(items[j].v)/float64(items[j].w)
        })
        // Repeatedly make greedy choices
        res := 0.0
        for _, item := range items {
            if item.w <= cap {
                // If enough capacity remains, put the entire current item in the knapsack
                res += float64(item.v)
                cap -= item.w
            } else {
                // If the remaining capacity is insufficient, put part of the current item in the knapsack
                res += float64(item.v) / float64(item.w) * float64(cap)
                // No capacity remains, so exit the loop
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

    /* Fractional knapsack: greedy algorithm */
    func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
        // Create a list of items, each with two attributes: weight and value
        var items = zip(wgt, val).map { Item(w: $0, v: $1) }
        // Sort by value per unit weight, item.v / item.w, in descending order
        items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
        // Repeatedly make greedy choices
        var res = 0.0
        var cap = cap
        for item in items {
            if item.w <= cap {
                // If enough capacity remains, put the entire current item in the knapsack
                res += Double(item.v)
                cap -= item.w
            } else {
                // If the remaining capacity is insufficient, put part of the current item in the knapsack
                res += Double(item.v) / Double(item.w) * Double(cap)
                // No capacity remains, so exit the loop
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

    /* Fractional knapsack: greedy algorithm */
    function fractionalKnapsack(wgt, val, cap) {
        // Create a list of items, each with two attributes: weight and value
        const items = wgt.map((w, i) => new Item(w, val[i]));
        // Sort by value per unit weight, item.v / item.w, in descending order
        items.sort((a, b) => b.v / b.w - a.v / a.w);
        // Repeatedly make greedy choices
        let res = 0;
        for (const item of items) {
            if (item.w <= cap) {
                // If enough capacity remains, put the entire current item in the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If the remaining capacity is insufficient, put part of the current item in the knapsack
                res += (item.v / item.w) * cap;
                // No capacity remains, so exit the loop
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

    /* Fractional knapsack: greedy algorithm */
    function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
        // Create a list of items, each with two attributes: weight and value
        const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
        // Sort by value per unit weight, item.v / item.w, in descending order
        items.sort((a, b) => b.v / b.w - a.v / a.w);
        // Repeatedly make greedy choices
        let res = 0;
        for (const item of items) {
            if (item.w <= cap) {
                // If enough capacity remains, put the entire current item in the knapsack
                res += item.v;
                cap -= item.w;
            } else {
                // If the remaining capacity is insufficient, put part of the current item in the knapsack
                res += (item.v / item.w) * cap;
                // No capacity remains, so exit the loop
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

    /* Fractional knapsack: greedy algorithm */
    double fractionalKnapsack(List<int> wgt, List<int> val, int cap) {
      // Create a list of items, each with two attributes: weight and value
      List<Item> items = List.generate(wgt.length, (i) => Item(wgt[i], val[i]));
      // Sort by value per unit weight, item.v / item.w, in descending order
      items.sort((a, b) => (b.v / b.w).compareTo(a.v / a.w));
      // Repeatedly make greedy choices
      double res = 0;
      for (Item item in items) {
        if (item.w <= cap) {
          // If enough capacity remains, put the entire current item in the knapsack
          res += item.v;
          cap -= item.w;
        } else {
          // If the remaining capacity is insufficient, put part of the current item in the knapsack
          res += item.v / item.w * cap;
          // No capacity remains, so exit the loop
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

    /* Fractional knapsack: greedy algorithm */
    fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
        // Create a list of items, each with two attributes: weight and value
        let mut items = wgt
            .iter()
            .zip(val.iter())
            .map(|(&w, &v)| Item::new(w, v))
            .collect::<Vec<Item>>();
        // Sort by value per unit weight, item.v / item.w, in descending order
        items.sort_by(|a, b| {
            (b.v as f64 / b.w as f64)
                .partial_cmp(&(a.v as f64 / a.w as f64))
                .unwrap()
        });
        // Repeatedly make greedy choices
        let mut res = 0.0;
        for item in &items {
            if item.w <= cap {
                // If enough capacity remains, put the entire current item in the knapsack
                res += item.v as f64;
                cap -= item.w;
            } else {
                // If the remaining capacity is insufficient, put part of the current item in the knapsack
                res += item.v as f64 / item.w as f64 * cap as f64;
                // No capacity remains, so exit the loop
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

    /* Fractional knapsack: greedy algorithm */
    float fractionalKnapsack(int wgt[], int val[], int itemCount, int cap) {
        // Create a list of items, each with two attributes: weight and value
        Item *items = malloc(sizeof(Item) * itemCount);
        for (int i = 0; i < itemCount; i++) {
            items[i] = (Item){.w = wgt[i], .v = val[i]};
        }
        // Sort by value per unit weight, item.v / item.w, in descending order
        qsort(items, (size_t)itemCount, sizeof(Item), sortByValueDensity);
        // Repeatedly make greedy choices
        float res = 0.0;
        for (int i = 0; i < itemCount; i++) {
            if (items[i].w <= cap) {
                // If enough capacity remains, put the entire current item in the knapsack
                res += items[i].v;
                cap -= items[i].w;
            } else {
                // If the remaining capacity is insufficient, put part of the current item in the knapsack
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
        val w: Int, // Item weight
        val v: Int  // Item value
    )

    /* Fractional knapsack: greedy algorithm */
    fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
        // Create a list of items, each with two attributes: weight and value
        var cap = c
        val items = arrayOfNulls<Item>(wgt.size)
        for (i in wgt.indices) {
            items[i] = Item(wgt[i], _val[i])
        }
        // Sort by value per unit weight, item.v / item.w, in descending order
        items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
        // Repeatedly make greedy choices
        var res = 0.0
        for (item in items) {
            if (item!!.w <= cap) {
                // If enough capacity remains, put the entire current item in the knapsack
                res += item.v
                cap -= item.w
            } else {
                // If the remaining capacity is insufficient, put part of the current item in the knapsack
                res += item.v.toDouble() / item.w * cap
                // No capacity remains, so exit the loop
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

    ### Fractional knapsack: greedy algorithm ###
    def fractional_knapsack(wgt, val, cap)
      # Create a list of items, each with two attributes: weight and value
      items = wgt.each_with_index.map { |w, i| Item.new(w, val[i]) }
      # Sort by value per unit weight, item.v / item.w, in descending order
      items.sort! { |a, b| (b.v.to_f / b.w) <=> (a.v.to_f / a.w) }
      # Repeatedly make greedy choices
      res = 0
      for item in items
        if item.w <= cap
          # If enough capacity remains, put the entire current item in the knapsack
          res += item.v
          cap -= item.w
        else
          # If the remaining capacity is insufficient, put part of the current item in the knapsack
          res += (item.v.to_f / item.w) * cap
          # No capacity remains, so exit the loop
          break
        end
      end
      res
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20Item%3A%0A%20%20%20%20%22%22%22Item%22%22%22%0A%20%20%20%20def%20__init__%28self,%20w%3A%20int,%20v%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.w%20%3D%20w%20%20%23%20Item%20weight%0A%20%20%20%20%20%20%20%20self.v%20%3D%20v%20%20%23%20Item%20value%0A%0Adef%20fractional_knapsack%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Fractional%20knapsack%3A%20greedy%20algorithm%22%22%22%0A%20%20%20%20%23%20Create%20a%20list%20of%20items,%20each%20with%20two%20attributes%3A%20weight%20and%20value%0A%20%20%20%20items%20%3D%20%5BItem%28w,%20v%29%20for%20w,%20v%20in%20zip%28wgt,%20val%29%5D%0A%20%20%20%20%23%20Sort%20by%20value%20per%20unit%20weight,%20item.v%20/%20item.w,%20in%20descending%20order%0A%20%20%20%20items.sort%28key%3Dlambda%20item%3A%20item.v%20/%20item.w,%20reverse%3DTrue%29%0A%20%20%20%20%23%20Repeatedly%20make%20greedy%20choices%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20for%20item%20in%20items%3A%0A%20%20%20%20%20%20%20%20if%20item.w%20%3C%3D%20cap%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20enough%20capacity%20remains,%20put%20the%20entire%20current%20item%20in%20the%20knapsack%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20item.v%0A%20%20%20%20%20%20%20%20%20%20%20%20cap%20-%3D%20item.w%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20the%20remaining%20capacity%20is%20insufficient,%20put%20part%20of%20the%20current%20item%20in%20the%20knapsack%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20%28item.v%20/%20item.w%29%20%2A%20cap%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20No%20capacity%20remains,%20so%20exit%20the%20loop%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20Greedy%20algorithm%0A%20%20%20%20res%20%3D%20fractional_knapsack%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20Item%3A%0A%20%20%20%20%22%22%22Item%22%22%22%0A%20%20%20%20def%20__init__%28self,%20w%3A%20int,%20v%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.w%20%3D%20w%20%20%23%20Item%20weight%0A%20%20%20%20%20%20%20%20self.v%20%3D%20v%20%20%23%20Item%20value%0A%0Adef%20fractional_knapsack%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Fractional%20knapsack%3A%20greedy%20algorithm%22%22%22%0A%20%20%20%20%23%20Create%20a%20list%20of%20items,%20each%20with%20two%20attributes%3A%20weight%20and%20value%0A%20%20%20%20items%20%3D%20%5BItem%28w,%20v%29%20for%20w,%20v%20in%20zip%28wgt,%20val%29%5D%0A%20%20%20%20%23%20Sort%20by%20value%20per%20unit%20weight,%20item.v%20/%20item.w,%20in%20descending%20order%0A%20%20%20%20items.sort%28key%3Dlambda%20item%3A%20item.v%20/%20item.w,%20reverse%3DTrue%29%0A%20%20%20%20%23%20Repeatedly%20make%20greedy%20choices%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20for%20item%20in%20items%3A%0A%20%20%20%20%20%20%20%20if%20item.w%20%3C%3D%20cap%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20enough%20capacity%20remains,%20put%20the%20entire%20current%20item%20in%20the%20knapsack%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20item.v%0A%20%20%20%20%20%20%20%20%20%20%20%20cap%20-%3D%20item.w%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20the%20remaining%20capacity%20is%20insufficient,%20put%20part%20of%20the%20current%20item%20in%20the%20knapsack%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20%28item.v%20/%20item.w%29%20%2A%20cap%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20No%20capacity%20remains,%20so%20exit%20the%20loop%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20Greedy%20algorithm%0A%20%20%20%20res%20%3D%20fractional_knapsack%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22Maximum%20total%20value%20within%20the%20knapsack%20capacity%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=8&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Built-in sorting algorithms typically take $O(n \log n)$ time and $O(\log n)$ or $O(n)$ space, depending on the programming language's implementation.

Apart from sorting, the worst case requires traversing the entire item list, **so the time complexity is $O(n)$**, where $n$ is the number of items.

Initializing a list of `Item` objects requires **$O(n)$ space**.

### 3. &nbsp; Proof of correctness

We use proof by contradiction. Suppose item $x$ has the highest unit value, and an algorithm produces a maximum value of `res`, but its solution does not include item $x$.

Now remove one unit of weight of any item from the knapsack and replace it with one unit of weight of item $x$. Since $x$ has the highest unit value, the total value after replacement must exceed `res`. **This contradicts the assumption that `res` is optimal, showing that an optimal solution must include item $x$**.

We can construct the same contradiction for other items in the solution. Thus, **an item with a higher unit value is always a better choice**, which establishes the greedy strategy.

As shown in Figure 15-6, if we plot item weight on the horizontal axis and unit value on the vertical axis, the fractional knapsack problem becomes a problem of maximizing the area within a limited horizontal interval. This analogy provides a geometric view of why the greedy strategy works.

![Geometric representation of the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_area_chart.png){ class="animation-figure" }

<p align="center"> Figure 15-6 &nbsp; Geometric representation of the fractional knapsack problem </p>
