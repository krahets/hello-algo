# 哈希查找

「哈希查找 Hash Searching」通过使用哈希表来存储所需的键值对，从而可在 $O(1)$ 时间内完成“键 $\rightarrow$ 值”的查找操作。

与线性查找相比，哈希查找通过利用额外空间来提高效率，体现了“以空间换时间”的算法思想。

## 算法实现

例如，若我们想要在给定数组中找到目标元素 `target` 的索引，则可以使用哈希查找来实现。

![哈希查找数组索引](hashing_search.assets/hash_search_index.png)

=== "Java"

    ```java title="hashing_search.java"
    [class]{hashing_search}-[func]{hashingSearchArray}
    ```

=== "C++"

    ```cpp title="hashing_search.cpp"
    [class]{}-[func]{hashingSearchArray}
    ```

=== "Python"

    ```python title="hashing_search.py"
    [class]{}-[func]{hashing_search_array}
    ```

=== "Go"

    ```go title="hashing_search.go"
    [class]{}-[func]{hashingSearchArray}
    ```

=== "JavaScript"

    ```javascript title="hashing_search.js"
    [class]{}-[func]{hashingSearchArray}
    ```

=== "TypeScript"

    ```typescript title="hashing_search.ts"
    [class]{}-[func]{hashingSearchArray}
    ```

=== "C"

    ```c title="hashing_search.c"
    [class]{}-[func]{hashingSearchArray}
    ```

=== "C#"

    ```csharp title="hashing_search.cs"
    [class]{hashing_search}-[func]{hashingSearchArray}
    ```

=== "Swift"

    ```swift title="hashing_search.swift"
    [class]{}-[func]{hashingSearchArray}
    ```

=== "Zig"

    ```zig title="hashing_search.zig"
    [class]{}-[func]{hashingSearchArray}
    ```

同样，若要根据目标节点值 target 查找对应的链表节点对象，也可以采用哈希查找方法。

![哈希查找链表节点](hashing_search.assets/hash_search_listnode.png)

=== "Java"

    ```java title="hashing_search.java"
    [class]{hashing_search}-[func]{hashingSearchLinkedList}
    ```

=== "C++"

    ```cpp title="hashing_search.cpp"
    [class]{}-[func]{hashingSearchLinkedList}
    ```

=== "Python"

    ```python title="hashing_search.py"
    [class]{}-[func]{hashing_search_linkedlist}
    ```

=== "Go"

    ```go title="hashing_search.go"
    [class]{}-[func]{hashingSearchLinkedList}
    ```

=== "JavaScript"

    ```javascript title="hashing_search.js"
    [class]{}-[func]{hashingSearchLinkedList}
    ```

=== "TypeScript"

    ```typescript title="hashing_search.ts"
    [class]{}-[func]{hashingSearchLinkedList}
    ```

=== "C"

    ```c title="hashing_search.c"
    [class]{}-[func]{hashingSearchLinkedList}
    ```

=== "C#"

    ```csharp title="hashing_search.cs"
    [class]{hashing_search}-[func]{hashingSearchLinkedList}
    ```

=== "Swift"

    ```swift title="hashing_search.swift"
    [class]{}-[func]{hashingSearchLinkedList}
    ```

=== "Zig"

    ```zig title="hashing_search.zig"
    [class]{}-[func]{hashingSearchLinkedList}
    ```

## 复杂度分析

**时间复杂度 $O(1)$** ：哈希表的查找操作使用 $O(1)$ 时间。

**空间复杂度 $O(n)$** ：其中 $n$ 是数组或链表的长度。

## 优点与局限性

哈希查找的性能表现相当优秀，查找、插入、删除操作的平均时间复杂度均为 $O(1)$ 。尽管如此，哈希查找仍然存在一些问题：

- 辅助哈希表需要占用 $O(n)$ 的额外空间，意味着需要预留更多的计算机内存；
- 构建和维护哈希表需要时间，因此哈希查找不适用于高频增删、低频查找的场景；
- 当哈希冲突严重时，哈希表可能退化为链表，导致时间复杂度劣化至 $O(n)$ ；
- 当数据量较小时，线性查找可能比哈希查找更快。这是因为计算哈希函数可能比遍历一个小型数组更慢；

因此，在实际应用中，我们需要根据具体情况灵活选择解决方案。
