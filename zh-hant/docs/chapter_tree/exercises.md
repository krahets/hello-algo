---
comments: true
---

# 7.7 &nbsp; 練習

## 7.7.1 &nbsp; 觀念複習

### 1. &nbsp; 完全二元樹、完滿二元樹與完美二元樹

以下兩個陣列以層序表示二元樹，`None` 代表空位：

- 樹 A：`[1, 2, 3, 4, 5, 6]`
- 樹 B：`[1, 2, 3, None, None, 6, 7]`

<!-- numbered-subquestions -->

1. 哪一棵是完全二元樹？
2. 哪一棵是完滿二元樹，也就是每個非葉節點都有兩個子節點的二元樹？
3. 這兩棵樹之中有完美二元樹嗎？請分別說明理由。

??? success "參考答案"

    1. 樹 A 是完全二元樹。它只有最底層未填滿，且該層的節點從左到右連續排列。
        樹 B 不是完全二元樹，因為最底層左側已出現空位，右側卻還有節點。

    2. 樹 B 是完滿二元樹。節點 1 和節點 3 各有兩個子節點，其餘都是葉節點。
        樹 A 不是完滿二元樹，因為節點 3 只有一個左子節點 6。

    3. 兩棵樹都不是完美二元樹，因為兩者的最底層都未填滿。

### 2. &nbsp; 同一棵樹的三種走訪順序

將陣列 `[1, 2, 3, 4, 5, 6, 7]` 中的元素依層序存入一棵完全二元樹。

<!-- numbered-subquestions -->

1. 畫出這棵樹。
2. 寫出它的前序、中序與後序走訪序列。
3. 在中序序列中，根節點 1 左右兩側的序列分別對應到樹的哪一部分？

??? success "參考答案"

    1. 這棵樹如下：

        ```text
              1
            /   \
           2     3
          / \   / \
         4   5 6   7
        ```

    2. 前序走訪的序列為 `1, 2, 4, 5, 3, 6, 7`；
        中序走訪的序列為 `4, 2, 5, 1, 6, 3, 7`；
        後序走訪的序列為 `4, 5, 2, 6, 7, 3, 1`。

    3. 根節點 1 左側的 `4, 2, 5` 是左子樹的中序走訪序列；
        右側的 `6, 3, 7` 是右子樹的中序走訪序列。

### 3. &nbsp; 比較兩棵二元搜尋樹

將下列兩組序列分別由左至右依序插入空的二元搜尋樹：

- 序列 A：`[4, 2, 6, 1, 3, 5, 7]`
- 序列 B：`[1, 2, 3, 4, 5, 6, 7]`

<!-- numbered-subquestions -->

1. 分別寫出搜尋數字 7 時沿途經過的節點。
2. 若以根節點到最遠葉節點所經過的邊數計算高度，兩棵樹的高度各是多少？
3. 根據前兩題的結果，你認為在這兩棵樹中搜尋數字 7 的效率相同嗎？請根據樹的形狀和搜尋路徑說明理由。

??? success "參考答案"

    1. 在序列 A 建成的樹中，搜尋路徑為 `4 → 6 → 7`；
        在序列 B 建成的樹中，搜尋路徑為 `1 → 2 → 3 → 4 → 5 → 6 → 7`。

    2. 第一棵樹每一層都已填滿，高度為 2；第二棵樹的子節點全都是右子節點，高度為 6。

    3. 在這兩棵樹中搜尋 7 的效率不同。插入順序會影響二元搜尋樹的形狀和高度。搜尋 7 時，在第一棵樹中只會經過 3 個節點，
        在第二棵樹中則要依序經過 7 個節點。樹越高，最壞情況下沿途要比較的節點就越多。

## 7.7.2 &nbsp; 程式設計練習

### 1. &nbsp; 二元樹的最大深度

給定一棵二元樹的根節點 `root`。每個節點都存有一個整數值，以及指向左右子節點的參照。

從根節點走到最遠的葉節點，沿途經過的**節點數**就是二元樹的最大深度。請回傳這棵樹的最大深度。空樹的最大深度為 0。
請用遞迴完成。

??? tip "解題提示"

    1. 本題以節點數計算深度。若樹中只有根節點，最大深度就是 1
    2. 讓遞迴函式回傳以目前節點為根的子樹的最大深度
    3. 若節點為空，回傳 0，否則回傳 max(depth(left), depth(right)) + 1

[LeetCode](https://leetcode.cn/problems/maximum-depth-of-binary-tree/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [題目解析](https://leetcode.cn/problems/maximum-depth-of-binary-tree/solutions/2361697/104-er-cha-shu-de-zui-da-shen-du-hou-xu-txzrx/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 2. &nbsp; 逐層走訪二元樹

給定一棵二元樹的根節點 `root`。請用佇列由上而下逐層走訪所有節點，每一層都由左至右走訪。

回傳一個二維陣列，第一個子陣列存放根節點所在層的節點值，第二個子陣列存放下一層的節點值，依此類推。
若二元樹為空，回傳空陣列。

??? tip "解題提示"

    1. 層序走訪需要先走訪先加入的節點，因此使用佇列
    2. 每一輪開始時，佇列裡的節點恰好都在同一層
    3. 先記下佇列長度，再依序取出這麼多個節點，並將它們的子節點加入佇列

[LeetCode](https://leetcode.cn/problems/binary-tree-level-order-traversal/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [題目解析](https://leetcode.cn/problems/binary-tree-level-order-traversal/solutions/2361604/102-er-cha-shu-de-ceng-xu-bian-li-yan-du-dyf7/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 3. &nbsp; 二元搜尋樹中的第 k 小元素

一棵二元搜尋樹共有 `n` 個節點，各節點的值互不相同。
將所有節點值由小到大排列，並從 1 開始為各位置編號。

給定根節點 `root` 和滿足 `1 <= k <= n` 的整數 `k`，請回傳排在第 `k` 個位置的節點值。
請在中序走訪的過程中直接找出答案，無須先收集所有節點值。

??? tip "解題提示"

    1. 中序走訪二元搜尋樹時，會依節點值由小到大的順序走訪
    2. 中序走訪依序處理左子樹、目前節點、右子樹。每走訪到一個節點，就將計數加 1
    3. 計數第一次等於 k 時，目前的節點值就是答案，可在此結束走訪

[LeetCode](https://leetcode.cn/problems/kth-smallest-element-in-a-bst/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [題目解析](https://leetcode.cn/problems/kth-smallest-element-in-a-bst/solutions/2361685/230-er-cha-sou-suo-shu-zhong-di-k-xiao-d-n3he/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
