# 线性查找

「线性查找 Linear Search」是一种简单的查找方法，其从数据结构的一端开始，逐个访问每个元素，直至另一端为止。

## 算法实现

例如，若我们想要在数组 `nums` 中查找目标元素 `target` 的对应索引，可以采用线性查找方法。

![在数组中线性查找元素](linear_search.assets/linear_search.png)

=== "Java"

    ```java title="linear_search.java"
    [class]{linear_search}-[func]{linearSearchArray}
    ```

=== "C++"

    ```cpp title="linear_search.cpp"
    [class]{}-[func]{linearSearchArray}
    ```

=== "Python"

    ```python title="linear_search.py"
    [class]{}-[func]{linear_search_array}
    ```

=== "Go"

    ```go title="linear_search.go"
    [class]{}-[func]{linearSearchArray}
    ```

=== "JavaScript"

    ```javascript title="linear_search.js"
    [class]{}-[func]{linearSearchArray}
    ```

=== "TypeScript"

    ```typescript title="linear_search.ts"
    [class]{}-[func]{linearSearchArray}
    ```

=== "C"

    ```c title="linear_search.c"
    [class]{}-[func]{linearSearchArray}
    ```

=== "C#"

    ```csharp title="linear_search.cs"
    [class]{linear_search}-[func]{linearSearchArray}
    ```

=== "Swift"

    ```swift title="linear_search.swift"
    [class]{}-[func]{linearSearchArray}
    ```

=== "Zig"

    ```zig title="linear_search.zig"
    [class]{}-[func]{linearSearchArray}
    ```

另一个例子，若需要在链表中查找给定目标节点值 `target` 并返回该节点对象，同样可以使用线性查找。

=== "Java"

    ```java title="linear_search.java"
    [class]{linear_search}-[func]{linearSearchLinkedList}
    ```

=== "C++"

    ```cpp title="linear_search.cpp"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "Python"

    ```python title="linear_search.py"
    [class]{}-[func]{linear_search_linkedlist}
    ```

=== "Go"

    ```go title="linear_search.go"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "JavaScript"

    ```javascript title="linear_search.js"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "TypeScript"

    ```typescript title="linear_search.ts"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "C"

    ```c title="linear_search.c"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "C#"

    ```csharp title="linear_search.cs"
    [class]{linear_search}-[func]{linearSearchLinkedList}
    ```

=== "Swift"

    ```swift title="linear_search.swift"
    [class]{}-[func]{linearSearchLinkedList}
    ```

=== "Zig"

    ```zig title="linear_search.zig"
    [class]{}-[func]{linearSearchLinkedList}
    ```

## 复杂度分析

**时间复杂度 $O(n)$** ：其中 $n$ 代表数组或链表的长度。

**空间复杂度 $O(1)$** ：无需借助额外的存储空间。

## 优点与局限性

**线性查找具有极佳的通用性**。由于线性查找是逐个访问元素的，没有跳跃式访问，因此适用于数组和链表的查找。

**线性查找的时间复杂度较高**。当数据量 $n$ 较大时，线性查找的效率较低。
