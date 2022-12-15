---
comments: true
---

# 哈希表

哈希表通过建立「键 key」和「值 value」之间的映射，实现高效的元素查找。具体地，输入一个 key ，在哈希表中查询并获取 value ，时间复杂度为 $O(1)$ 。

例如，给定一个包含 $n$ 个学生的数据库，每个学生有 "姓名 `name` ” 和 “学号 `id` ” 两项数据，希望实现一个查询功能：**输入一个学号，返回对应的姓名**，则可以使用哈希表实现。

![hash_map](hash_map.assets/hash_map.png)

<p align="center"> Fig. 哈希表抽象表示 </p>

## 哈希表优势

除了哈希表之外，还可以使用以下数据结构来实现上述查询功能：

- **无序数组：** 每个元素为  `[学号, 姓名]` ；
- **有序数组：** 将 `1.` 中的数组按照学号从小到大排序；
- **链表：** 每个结点的值为 `[学号, 姓名]` ；
- **二叉搜索树：** 每个结点的值为 `[学号, 姓名]` ，根据学号大小来构建树；

使用上述方法，各项操作的时间复杂度如下表所示（在此不做赘述，详解可见 [二叉搜索树章节](https://www.hello-algo.com/chapter_tree/binary_search_tree/#_6)）。无论是查找元素、还是增删元素，哈希表的时间复杂度都是 $O(1)$ ，全面胜出！

<div class="center-table" markdown>

|          | 无序数组 | 有序数组    | 链表   | 二叉搜索树  | 哈希表 |
| -------- | -------- | ----------- | ------ | ----------- | ------ |
| 查找元素 | $O(n)$   | $O(\log n)$ | $O(n)$ | $O(\log n)$ | $O(1)$ |
| 插入元素 | $O(1)$   | $O(n)$      | $O(1)$ | $O(\log n)$ | $O(1)$ |
| 删除元素 | $O(n)$   | $O(n)$      | $O(n)$ | $O(\log n)$ | $O(1)$ |

</div>

## 哈希表常用操作

哈希表的基本操作包括 **初始化、查询操作、添加与删除键值对**。

=== "Java"

    ```java title="hash_map.java"
    /* 初始化哈希表 */
    Map<Integer, String> map = new HashMap<>();

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈");   
    map.put(15937, "小啰");   
    map.put(16750, "小算");   
    map.put(13276, "小法");
    map.put(10583, "小鸭");

    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    String name = map.get(15937);

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583);
    ```

=== "C++"

    ```cpp title="hash_map.cpp"

    ```

=== "Python"

    ```python title="hash_map.py"

    ```

=== "Go"

    ```go title="hash_map.go"

    ```

=== "JavaScript"

    ```js title="hash_map.js"

    ```

=== "TypeScript"

    ```typescript title="hash_map.ts"

    ```

=== "C"

    ```c title="hash_map.c"

    ```

=== "C#"

    ```csharp title="hash_map.cs"

    ```

遍历哈希表有三种方式，即 **遍历键值对、遍历键、遍历值**。

=== "Java"

    ```java title="hash_map.java"
    /* 遍历哈希表 */
    // 遍历键值对 key->value
    for (Map.Entry <Integer, String> kv: map.entrySet()) {
        System.out.println(kv.getKey() + " -> " + kv.getValue());
    }
    // 单独遍历键 key
    for (int key: map.keySet()) {
        System.out.println(key);
    }
    // 单独遍历值 value
    for (String val: map.values()) {
        System.out.println(val);
    }
    ```

=== "C++"

    ```cpp title="hash_map.cpp"

    ```

=== "Python"

    ```python title="hash_map.py"

    ```

=== "Go"

    ```go title="hash_map.go"

    ```

=== "JavaScript"

    ```js title="hash_map.js"

    ```

=== "TypeScript"

    ```typescript title="hash_map.ts"

    ```

=== "C"

    ```c title="hash_map.c"

    ```

=== "C#"

    ```csharp title="hash_map.cs"

    ```

## 哈希函数

哈希表中存储元素的数据结构被称为「桶 Bucket」，底层实现可能是数组、链表、二叉树（红黑树），或是它们的组合。

最简单地，**我们可以仅用一个「数组」来实现哈希表**。首先，将所有 value 放入数组中，那么每个 value 在数组中都有唯一的「索引」。显然，访问 value 需要给定索引，而为了 **建立 key 和索引之间的映射关系**，我们需要使用「哈希函数 Hash Function」。

设数组为 `bucket` ，哈希函数为 `f(x)` ，输入键为 `key` 。那么获取 value 的步骤为：

1. 通过哈希函数计算出索引，即 `index = f(key)` ；
2. 通过索引在数组中获取值，即 `value = bucket[index]` ；

以上述学生数据 `key 学号 -> value 姓名` 为例，我们可以将「哈希函数」设计为

$$
f(x) = x \% 100
$$

![hash_function](hash_map.assets/hash_function.png)

<p align="center"> Fig. 哈希函数 </p>

=== "Java"

    ```java title="array_hash_map.java"
    /* 键值对 int->String */
    class Entry {
        public int key;     // 键
        public String val;  // 值
        public Entry(int key, String val) {
            this.key = key;
            this.val = val;
        }
    }

    /* 基于数组简易实现的哈希表 */
    class ArrayHashMap {
        private List<Entry> bucket;
        public ArrayHashMap() {
            // 初始化一个长度为 100 的桶（数组）
            bucket = new ArrayList<>();
            for (int i = 0; i < 100; i++) {
                bucket.add(null);
            }
        }

        /* 哈希函数 */
        private int hashFunc(int key) {
            int index = key % 100;
            return index;
        }

        /* 查询操作 */
        public String get(int key) {
            int index = hashFunc(key);
            Entry pair = bucket.get(index);
            if (pair == null) return null;
            return pair.val;
        }

        /* 添加操作 */
        public void put(int key, String val) {
            Entry pair = new Entry(key, val);
            int index = hashFunc(key);
            bucket.set(index, pair);
        }

        /* 删除操作 */
        public void remove(int key) {
            int index = hashFunc(key);
            // 置为空字符，代表删除
            bucket.set(index, null);
        }
    }
    ```

=== "C++"

    ```cpp title="array_hash_map.cpp"

    ```

=== "Python"

    ```python title="array_hash_map.py"

    ```

=== "Go"

    ```go title="array_hash_map.go"

    ```

=== "JavaScript"

    ```js title="array_hash_map.js"

    ```

=== "TypeScript"

    ```typescript title="array_hash_map.ts"

    ```

=== "C"

    ```c title="array_hash_map.c"

    ```

=== "C#"

    ```csharp title="array_hash_map.cs"

    ```

## 哈希冲突

细心的同学可能会发现，**哈希函数 $f(x) = x \% 100$ 会在某些情况下失效**。具体地，当输入的 key 后两位相同时，哈希函数的计算结果也相同，指向同一个 value 。例如，分别查询两个学号 12836 和 20336 ，则有

$$
f(12836) = f(20336) = 36
$$

两个学号指向了同一个姓名，这明显是不对的，我们将这种现象称为「哈希冲突 Hash Collision」，其会严重影响查询的正确性。如何避免哈希冲突的问题将被留在下章讨论。

![hash_collision](hash_map.assets/hash_collision.png)

<p align="center"> Fig. 哈希冲突 </p>

综上所述，一个优秀的「哈希函数」应该具备以下特性：

- 尽量少地发生哈希冲突；
- 时间复杂度 $O(1)$ ，计算尽可能高效；
- 空间使用率高，即 “键值对占用空间 / 哈希表总占用空间” 尽可能大；

## 常用哈希函数

下面介绍两种常见的哈希类型，数字哈希和字符串哈希。

### 数字哈希

对于需要将数字哈希化的场景，常采用对大质数取模的方式作为哈希函数以此来减少冲突。若用 $N$ 来表示所选取的大质数，则哈希函数 $f(x)$ 可表达为

$$
f(x) = (x (\mod N) + N)(\mod N)
$$

该函数在第一次取模后还有一次加 $N$ 的操作是因为在某些编程语言如 C/C++ 中负数取模会得到负数，这与数学中的取模运算定义不同（数学定义中无论正负数取模的结果均为正数）。另外，我们常常将取模后的值作为数组中的索引，这样正数也能保证数组索引的正确性。

大质数的选择取决于你希望哈希后的长度，若一堆数字你希望哈希后分布在 $0-n$ 之间，则 $N$ 选择大于 $n$ 的大质数即可。选择算法示例如下：

=== "C"

    ```c title="prime_num_sel.c"
        int main() {
            for (int i = 1000; ;i++) {
				int flag = 0;
                for (int j = 2; j < i; j++) {
                    if (i % j == 0) {
                        flag = 1;
						break;
                    }
                }
                if (flag == 0) {
                    printf("the prime number is %d", i);
                    break;
                }
            }
            return 0;
        }
    ```
    
### 字符串哈希

这里介绍一种被称作“字符串前缀哈希”的算法来实现字符串的哈希化。若有一字符串 `str = "abcedacbd"`，则哈希表中的元素表示从左边起到第 `i` 个位置上的子字符串的哈希值。即，`f(1) -> "a"; f(2) -> "ab"; f(3) -> "abc"`，以此类推。

具体过程如下

1. 将字符串存储在下标为 `1` 的 `char` 数组中；
2. 计算字符串的前缀数字，将他们哈希化，将字符串看作是一个 `P` 进制数，这里 `P = 131` 或者 `P = 13331`。按照经验，这两个值对字符串哈希会产生非常小的冲突可能。
3. 将这个 `P` 进制数转换为10进制，通常转换出来的数字会很大，则将其对 `Q` 取模。这样任意一个字符串都可以转换成 $0 \cdots Q - 1$ 之间的数字：$(1234)_P => (1 * P^3 + 2 * P^2 + 3 * P^1 + 4 * P^0) \mod Q$
4. 对于`Hash`函数，将计算字符串中从 `l` 到 `r` 的哈希值，通过前缀哈希表以及下公式计算，注意左侧为低位，右侧为高位。

`f(r) - f(l - 1) * p[r - l + 1]` ，其中 `p` 数组存放了从 $P^0 \sim P^N$ 的所有数字，方便查询。

