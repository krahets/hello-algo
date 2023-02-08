---
comments: true
---

# 7.2. 二叉树遍历

非线性数据结构的遍历操作比线性数据结构更加复杂，往往需要使用搜索算法来实现。常见的二叉树遍历方式有层序遍历、前序遍历、中序遍历、后序遍历。

## 7.2.1. 层序遍历

「层序遍历 Hierarchical-Order Traversal」从顶至底、一层一层地遍历二叉树，并在每层中按照从左到右的顺序访问结点。

层序遍历本质上是「广度优先搜索 Breadth-First Traversal」，其体现着一种“一圈一圈向外”的层进遍历方式。

![binary_tree_bfs](binary_tree_traversal.assets/binary_tree_bfs.png)

<p align="center"> Fig. 二叉树的层序遍历 </p>

广度优先遍历一般借助「队列」来实现。队列的规则是“先进先出”，广度优先遍历的规则是 ”一层层平推“ ，两者背后的思想是一致的。

=== "Java"

    ```java title="binary_tree_bfs.java"
    [class]{binary_tree_bfs}-[func]{hierOrder}
    ```

=== "C++"

    ```cpp title="binary_tree_bfs.cpp"
    [class]{}-[func]{hierOrder}
    ```

=== "Python"

    ```python title="binary_tree_bfs.py"
    [class]{}-[func]{hier_order}
    ```

=== "Go"

    ```go title="binary_tree_bfs.go"
    [class]{}-[func]{hierOrder}
    ```

=== "JavaScript"

    ```javascript title="binary_tree_bfs.js"
    [class]{}-[func]{hierOrder}
    ```

=== "TypeScript"

    ```typescript title="binary_tree_bfs.ts"
    [class]{}-[func]{hierOrder}
    ```

=== "C"

    ```c title="binary_tree_bfs.c"
    
    ```

=== "C#"

    ```csharp title="binary_tree_bfs.cs"
    [class]{binary_tree_bfs}-[func]{hierOrder}
    ```

=== "Swift"

    ```swift title="binary_tree_bfs.swift"
    [class]{}-[func]{hierOrder}
    ```

=== "Zig"

    ```zig title="binary_tree_bfs.zig"

    ```

## 7.2.2. 前序、中序、后序遍历

相对地，前、中、后序遍历皆属于「深度优先遍历 Depth-First Traversal」，其体现着一种“先走到尽头，再回头继续”的回溯遍历方式。

如下图所示，左侧是深度优先遍历的的示意图，右上方是对应的递归实现代码。深度优先遍历就像是绕着整个二叉树的外围“走”一圈，走的过程中，在每个结点都会遇到三个位置，分别对应前序遍历、中序遍历、后序遍历。

![binary_tree_dfs](binary_tree_traversal.assets/binary_tree_dfs.png)

<p align="center"> Fig. 二叉树的前 / 中 / 后序遍历 </p>

<div class="center-table" markdown>

| 位置       | 含义                                 | 此处访问结点时对应            |
| ---------- | ------------------------------------ | ----------------------------- |
| 橙色圆圈处 | 刚进入此结点，即将访问该结点的左子树 | 前序遍历 Pre-Order Traversal  |
| 蓝色圆圈处 | 已访问完左子树，即将访问右子树       | 中序遍历 In-Order Traversal   |
| 紫色圆圈处 | 已访问完左子树和右子树，即将返回     | 后序遍历 Post-Order Traversal |

</div>

=== "Java"

    ```java title="binary_tree_dfs.java"
    [class]{binary_tree_dfs}-[func]{preOrder}

    [class]{binary_tree_dfs}-[func]{inOrder}

    [class]{binary_tree_dfs}-[func]{postOrder}
    ```

=== "C++"

    ```cpp title="binary_tree_dfs.cpp"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Python"

    ```python title="binary_tree_dfs.py"
    [class]{}-[func]{pre_order}

    [class]{}-[func]{in_order}

    [class]{}-[func]{post_order}
    ```

=== "Go"

    ```go title="binary_tree_dfs.go"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "JavaScript"

    ```javascript title="binary_tree_dfs.js"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "TypeScript"

    ```typescript title="binary_tree_dfs.ts"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "C"

    ```c title="binary_tree_dfs.c"
    
    ```

=== "C#"

    ```csharp title="binary_tree_dfs.cs"
    [class]{binary_tree_dfs}-[func]{preOrder}

    [class]{binary_tree_dfs}-[func]{inOrder}

    [class]{binary_tree_dfs}-[func]{postOrder}
    ```

=== "Swift"

    ```swift title="binary_tree_dfs.swift"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Zig"

    ```zig title="binary_tree_dfs.zig"

    ```

!!! note

    使用循环一样可以实现前、中、后序遍历，但代码相对繁琐，有兴趣的同学可以自行实现。
