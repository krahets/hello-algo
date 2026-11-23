# 練習

## 知識鞏固

### 完全、完滿與完美二元樹

下面兩個陣列按層序表示二元樹，`None` 表示空位：

- 樹 A：`[1, 2, 3, 4, 5, 6]`
- 樹 B：`[1, 2, 3, None, None, 6, 7]`

<!-- numbered-subquestions -->

1. 哪一棵是完全二元樹？
2. 哪一棵是完滿二元樹，即每個非葉節點都有兩個子節點？
3. 兩棵樹中是否有完美二元樹？分別說明理由。

??? success "參考答案"

    1. 樹 A 是完全二元樹。它只有最底層未填滿，並且節點從左到右連續排列。
        樹 B 不是完全二元樹，因為最底層左側已有空位，右側卻仍有節點。

    2. 樹 B 是完滿二元樹：節點 1 和節點 3 各有兩個子節點，其餘節點都是葉節點。
        樹 A 不是完滿二元樹，因為節點 3 只有左子節點 6。

    3. 兩棵都不是完美二元樹，因為它們的最底層都沒有完全填滿。

### 同一棵樹的三種走訪順序

將陣列 `[1, 2, 3, 4, 5, 6, 7]` 按層序存入一棵完全二元樹。

<!-- numbered-subquestions -->

1. 畫出這棵樹。
2. 寫出它的前序、中序、後序走訪序列。
3. 在中序序列中，根節點 1 左側和右側的兩段序列，分別對應樹的哪一部分？

??? success "參考答案"

    1. 這棵樹為：

        ```text
              1
            /   \
           2     3
          / \   / \
         4   5 6   7
        ```

    2. 前序走訪為 `1, 2, 4, 5, 3, 6, 7`；
        中序走訪為 `4, 2, 5, 1, 6, 3, 7`；
        後序走訪為 `4, 5, 2, 6, 7, 3, 1`。

    3. 根節點 1 左側的 `4, 2, 5` 是左子樹的中序走訪序列；
        右側的 `6, 3, 7` 是右子樹的中序走訪序列。

### 比較兩棵二元搜尋樹

將下面兩組序列從左到右依次插入空的二元搜尋樹：

- 序列 A：`[4, 2, 6, 1, 3, 5, 7]`
- 序列 B：`[1, 2, 3, 4, 5, 6, 7]`

<!-- numbered-subquestions -->

1. 分別寫出查詢數字 7 時經過的節點。
2. 若高度按根節點到最遠葉節點經過的邊數計算，兩棵樹的高度分別是多少？
3. 根據前兩問，你認為兩棵樹查詢數字 7 時的效率是否相同？請結合兩棵樹的形狀和查詢路徑說明理由。

??? success "參考答案"

    1. 序列 A 建成的樹中，查詢路徑為 `4 → 6 → 7`；
        序列 B 建成的樹中，查詢路徑為 `1 → 2 → 3 → 4 → 5 → 6 → 7`。

    2. 第一棵樹的每一層都填滿，高度為 2；第二棵樹只有右孩子，高度為 6。

    3. 兩棵樹查詢 7 時的效率不同。插入順序改變了二元搜尋樹的形狀和高度。查詢 7 時，第一棵樹只經過 3 個節點，
        第二棵樹則要依次經過 7 個節點；樹越高，最壞情況下需要沿路徑比較的節點就越多。

## 程式設計練習

### 二元樹的最大深度

給定一棵二元樹的根節點 `root`。每個節點都包含一個整數值，以及指向左、右子節點的引用。

把從根節點到最遠葉節點經過的**節點數**稱為二元樹的最大深度。請返回這棵樹的最大深度；空樹的最大深度為 0。
請使用遞迴完成。

??? tip "解題提示"

    1. 本題按節點數計算深度：只有一個根節點時，最大深度為 1
    2. 讓遞迴函式返回以當前節點為根的子樹的最大深度
    3. 空節點返回 0，非空節點返回 max(depth(left), depth(right)) + 1

[LeetCode](https://leetcode.cn/problems/maximum-depth-of-binary-tree/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [題目解析](https://leetcode.cn/problems/maximum-depth-of-binary-tree/solutions/2361697/104-er-cha-shu-de-zui-da-shen-du-hou-xu-txzrx/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 按層走訪二元樹

給定一棵二元樹的根節點 `root`。請使用佇列從上到下逐層訪問所有節點，同一層內按照從左到右的順序訪問。

返回一個二維陣列：第一個子陣列儲存根節點所在層的節點值，第二個子陣列儲存下一層的節點值，依此類推。
若二元樹為空，返回空陣列。

??? tip "解題提示"

    1. 層序走訪需要先進入的節點先訪問，因此使用佇列
    2. 一輪開始時佇列中的節點正好屬於同一層
    3. 先記錄佇列長度，再彈出這麼多個節點並加入它們的孩子

[LeetCode](https://leetcode.cn/problems/binary-tree-level-order-traversal/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [題目解析](https://leetcode.cn/problems/binary-tree-level-order-traversal/solutions/2361604/102-er-cha-shu-de-ceng-xu-bian-li-yan-du-dyf7/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 二元搜尋樹中的第 k 小元素

一棵二元搜尋樹共有 `n` 個節點，各節點值互不相同。
將所有節點值從小到大排列後，位置從 1 開始編號。

給定根節點 `root` 和滿足 `1 <= k <= n` 的整數 `k`，請返回排在第 `k` 位的節點值。
請在中序走訪過程中直接尋找答案，不先收集全部節點值。

??? tip "解題提示"

    1. 二元搜尋樹的中序走訪會按從小到大的順序訪問節點值
    2. 中序走訪依次處理左子樹、當前節點和右子樹；訪問當前節點時把計數加 1
    3. 當計數第一次等於 k 時，當前節點值就是答案，此後無須繼續走訪

[LeetCode](https://leetcode.cn/problems/kth-smallest-element-in-a-bst/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [題目解析](https://leetcode.cn/problems/kth-smallest-element-in-a-bst/solutions/2361685/230-er-cha-sou-suo-shu-zhong-di-k-xiao-d-n3he/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
