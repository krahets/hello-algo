# 練習

## 知識鞏固

### 迭代與遞迴的時間和空間

下面兩段程式碼都計算 $1 + 2 + \dots + n$（設 $n \ge 1$）。請把 `n` 設為 4，
按照程式實際執行的順序回答問題，然後比較兩種寫法的效率。

```python
def sum_iter(n):
    s = 0
    for i in range(1, n + 1):
        s += i
    return s

def sum_recur(n):
    if n == 1:
        return 1
    return n + sum_recur(n - 1)
```

<!-- numbered-subquestions -->

1. 執行 `sum_iter(4)` 時，每輪迴圈結束後，變數 `s` 的值分別是多少？
2. 執行 `sum_recur(4)` 時，會依次呼叫哪些函式？從最深的一層開始返回時，結果怎樣得到？
3. 兩種寫法的時間複雜度和空間複雜度分別是多少？結合第 1、2 問的執行過程說明理由。

??? success "參考答案"

    1. 迴圈變數 `i` 依次為 `1、2、3、4`，每輪結束後，`s` 依次變為
        `1、3、6、10`，所以 `sum_iter(4)` 返回 10。

    2. 函式依次呼叫
        `sum_recur(4) → sum_recur(3) → sum_recur(2) → sum_recur(1)`。
        `sum_recur(1)` 返回 1，隨後各層依次得到 `2 + 1 = 3`、`3 + 3 = 6`、`4 + 6 = 10`。
        在最深處，4 次函式呼叫都尚未結束。

    3. 兩段程式碼都進行與 $n$ 成正比的迴圈或呼叫，因此時間複雜度均為 $O(n)$ 。
        空間複雜度不同：迭代版只使用常數個變數，為 $O(1)$ ；
        遞迴版在到達終止條件前，前面的函式呼叫都要等待返回結果，因此呼叫堆疊中最多同時儲存 $n$ 次呼叫，
        空間複雜度為 $O(n)$。

        分析空間複雜度時，除程式碼中的變數外，還要考慮遞迴呼叫佔用的空間。

### 三段程式碼的時間複雜度

以下三個程式碼片段的輸入均為正整數 $n$ 。請按時間複雜度從低到高排序，並寫出各自的複雜度。

```python
# 片段一
s = 0
for i in range(n):
    s += i

# 片段二
s = 0
for i in range(n):
    for j in range(i, n):
        s += j

# 片段三
while n > 1:
    n = n // 2
```

??? success "參考答案"

    從低到高為：片段三 $O(\log n)$、片段一 $O(n)$、片段二 $O(n^2)$。
    片段三每輪把 $n$ 縮小為原來的一半，約迴圈 $\log_2 n$ 次。
    片段一的迴圈恰好執行 $n$ 次。片段二的內層迴圈次數依次為
    $n,n-1,\dots,1$，總次數為 $n(n+1)/2$，因此屬於平方階。

### 哪種反轉更節省空間

要將陣列 `nums` 中的元素全部反轉，有兩種做法：

<!-- numbered-subquestions -->

1. 新建一個等長陣列 `res`，倒序複製後返回；
2. 用兩個索引 `i` 和 `j` 分別從首、尾向中間移動，逐對交換 `nums[i]` 與 `nums[j]` 。

    兩種做法的空間複雜度各是多少？哪種屬於“原地”操作？

??? success "參考答案"

    1. 需要與輸入等長的輔助陣列，空間複雜度 $O(n)$。

    2. 只使用兩個索引變數，
        空間複雜度 $O(1)$ ，屬於原地操作。

        需要注意：原地反轉會修改輸入陣列，
        僅在允許修改輸入時才應優先選用；若需保留原陣列，第 1 種做法的複製開銷不可避免。

## 程式設計練習

### 費波那契數

費波那契數列滿足：$F(0)=0$、$F(1)=1$，並且當 $n\ge2$ 時，
$F(n)=F(n-1)+F(n-2)$。

給定非負整數 `n`，請使用迴圈計算並返回 $F(n)$，不使用遞迴。

??? tip "解題提示"

    1. 先單獨處理 n 為 0 和 1 的情況
    2. 計算下一項時只需要前兩項，無須儲存整個數列
    3. 更新兩個變數時，注意不要過早覆蓋仍會用到的舊值

[LeetCode](https://leetcode.cn/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [題目解析](https://leetcode.cn/problems/fibonacci-number/solutions/2361746/509-fei-bo-na-qi-shu-dong-tai-gui-hua-qi-so8h/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
