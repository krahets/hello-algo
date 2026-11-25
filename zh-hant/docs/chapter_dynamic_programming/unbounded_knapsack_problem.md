# 完全背包問題

本節先求解另一種常見的背包問題：完全背包，再認識它的一個特例：零錢兌換。

## 完全背包問題

!!! question

    給定 $n$ 種物品，第 $i$ 種的重量為 $wgt[i-1]$、價值為 $val[i-1]$，背包容量為 $cap$。**每種物品都可以重複選取**。請問在背包容量限制下，可以裝入的物品最大總價值是多少？範例如下圖所示。

![完全背包問題的範例資料](unbounded_knapsack_problem.assets/unbounded_knapsack_example.svg)

### 動態規劃的思路

完全背包與 0-1 背包非常相似，**唯一的差別在於完全背包不限制每種物品的選取次數**。

- 在 0-1 背包問題中，每種物品只有一件，因此將物品 $i$ 放入背包後，只能從前 $i-1$ 件物品中選擇。
- 在完全背包問題中，每種物品的數量不限，因此將物品 $i$ 放入背包後，**仍能從前 $i$ 種物品中選擇**。

依完全背包的規則，狀態 $[i, c]$ 的變化分成兩種情況。

- **不放入物品 $i$**：與 0-1 背包相同，轉移至 $[i-1, c]$。
- **放入物品 $i$**：與 0-1 背包不同，轉移至 $[i, c-wgt[i-1]]$。

因此，狀態轉移方程式變成：

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### 程式實作

比較兩道題的程式，在狀態轉移中，只有一處從 $i-1$ 改為 $i$，其餘都相同：

```src
[file]{unbounded_knapsack}-[class]{}-[func]{unbounded_knapsack_dp}
```

### 空間最佳化

目前狀態來自左方與上方的狀態，**因此做空間最佳化後，應正向走訪 $dp$ 表中的每一列**。

這個走訪順序與 0-1 背包恰好相反。請對照下圖理解兩者的差異。

=== "<1>"
    ![完全背包問題在空間最佳化後的動態規劃過程](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.svg)

=== "<2>"
    ![unbounded_knapsack_dp_comp_step2](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step2.svg)

=== "<3>"
    ![unbounded_knapsack_dp_comp_step3](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step3.svg)

=== "<4>"
    ![unbounded_knapsack_dp_comp_step4](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step4.svg)

=== "<5>"
    ![unbounded_knapsack_dp_comp_step5](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step5.svg)

=== "<6>"
    ![unbounded_knapsack_dp_comp_step6](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step6.svg)

程式實作很簡單，只要移除陣列 `dp` 的第一個維度：

```src
[file]{unbounded_knapsack}-[class]{}-[func]{unbounded_knapsack_dp_comp}
```

## 零錢兌換問題

背包問題代表一大類動態規劃問題，它有許多變形，零錢兌換就是其中之一。

!!! question

    給定 $n$ 種硬幣，第 $i$ 種的面額為 $coins[i - 1]$，目標金額為 $amt$。**每種硬幣都可以重複選取**。請問湊出目標金額最少需要幾枚硬幣？若無法湊出，則回傳 $-1$。範例如下圖所示。

![零錢兌換問題的範例資料](unbounded_knapsack_problem.assets/coin_change_example.svg)

### 動態規劃的思路

**零錢兌換可以看成完全背包問題的特例**。兩者的關係與差異如下。

- 兩道題可以相互轉換：「物品」對應「硬幣」，「物品重量」對應「硬幣面額」，「背包容量」對應「目標金額」。
- 兩者的最佳化方向相反：完全背包要求物品價值最大，零錢兌換則要求硬幣數量最少。
- 完全背包要求總重量「不超過」背包容量，零錢兌換則必須「剛好」湊出目標金額。

**第一步：思考每一步的決策，定義狀態，據此建立 $dp$ 表**

狀態 $[i, a]$ 對應的子問題為：**用前 $i$ 種硬幣湊出金額 $a$ 所需的最少硬幣數**，記為 $dp[i, a]$。

二維 $dp$ 表的大小為 $(n+1) \times (amt+1)$。

**第二步：找出最佳子結構，推導狀態轉移方程式**

本題的狀態轉移方程式與完全背包有兩點不同。

- 本題要求最小值，因此要將運算子 $\max()$ 改為 $\min()$。
- 本題要最佳化的是硬幣數量，而非物品價值，因此選取一枚硬幣時只需執行 $+1$。

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**第三步：確定邊界條件與狀態轉移順序**

目標金額為 $0$ 時，湊出它所需的最少硬幣數為 $0$，因此第一欄的所有 $dp[i, 0]$ 都等於 $0$。

沒有硬幣時，**無法湊出任何 $> 0$ 的目標金額**，這些都是無效解。為了讓狀態轉移方程式中的 $\min()$ 函式辨識並排除無效解，我們考慮用 $+ \infty$ 代表它們，也就是將第一列中所有 $dp[0, a]$ 都設為 $+ \infty$。

### 程式實作

大多數程式語言並未提供 $+ \infty$ 變數，只能以整數型別 `int` 的最大值代替。然而，這又可能造成數值超出範圍：狀態轉移方程式中的 $+ 1$ 操作可能發生溢位。

因此，我們以數值 $amt + 1$ 表示無效解，因為湊出 $amt$ 所需的硬幣數最多為 $amt$。最後回傳前，檢查 $dp[n, amt]$ 是否等於 $amt + 1$；若相等，就回傳 $-1$，表示無法湊出目標金額。程式如下：

```src
[file]{coin_change}-[class]{}-[func]{coin_change_dp}
```

下圖呈現用動態規劃求解零錢兌換的過程，與完全背包問題十分相似。

=== "<1>"
    ![用動態規劃求解零錢兌換問題](unbounded_knapsack_problem.assets/coin_change_dp_step1.svg)

=== "<2>"
    ![coin_change_dp_step2](unbounded_knapsack_problem.assets/coin_change_dp_step2.svg)

=== "<3>"
    ![coin_change_dp_step3](unbounded_knapsack_problem.assets/coin_change_dp_step3.svg)

=== "<4>"
    ![coin_change_dp_step4](unbounded_knapsack_problem.assets/coin_change_dp_step4.svg)

=== "<5>"
    ![coin_change_dp_step5](unbounded_knapsack_problem.assets/coin_change_dp_step5.svg)

=== "<6>"
    ![coin_change_dp_step6](unbounded_knapsack_problem.assets/coin_change_dp_step6.svg)

=== "<7>"
    ![coin_change_dp_step7](unbounded_knapsack_problem.assets/coin_change_dp_step7.svg)

=== "<8>"
    ![coin_change_dp_step8](unbounded_knapsack_problem.assets/coin_change_dp_step8.svg)

=== "<9>"
    ![coin_change_dp_step9](unbounded_knapsack_problem.assets/coin_change_dp_step9.svg)

=== "<10>"
    ![coin_change_dp_step10](unbounded_knapsack_problem.assets/coin_change_dp_step10.svg)

=== "<11>"
    ![coin_change_dp_step11](unbounded_knapsack_problem.assets/coin_change_dp_step11.svg)

=== "<12>"
    ![coin_change_dp_step12](unbounded_knapsack_problem.assets/coin_change_dp_step12.svg)

=== "<13>"
    ![coin_change_dp_step13](unbounded_knapsack_problem.assets/coin_change_dp_step13.svg)

=== "<14>"
    ![coin_change_dp_step14](unbounded_knapsack_problem.assets/coin_change_dp_step14.svg)

=== "<15>"
    ![coin_change_dp_step15](unbounded_knapsack_problem.assets/coin_change_dp_step15.svg)

### 空間最佳化

零錢兌換的空間最佳化方式與完全背包相同：

```src
[file]{coin_change}-[class]{}-[func]{coin_change_dp_comp}
```

## 零錢兌換問題 II

!!! question

    給定 $n$ 種硬幣，第 $i$ 種的面額為 $coins[i - 1]$，目標金額為 $amt$。每種硬幣都可以重複選取，**請問共有幾種硬幣組合可以湊出目標金額**？範例如下圖所示。

![零錢兌換問題 II 的範例資料](unbounded_knapsack_problem.assets/coin_change_ii_example.svg)

### 動態規劃的思路

上一題要求最少硬幣數，這一題要算組合數，因此子問題變成：**用前 $i$ 種硬幣湊出金額 $a$ 的組合數**。$dp$ 表仍是大小為 $(n+1) \times (amt + 1)$ 的二維矩陣。

目前狀態的組合數，等於不選這種硬幣與選取這種硬幣兩種情況的組合數之和。狀態轉移方程式為：

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

目標金額為 $0$ 時，不選任何硬幣就能湊出目標金額，因此第一欄的所有 $dp[i, 0]$ 都應初始化為 $1$。沒有硬幣時，無法湊出任何 $>0$ 的目標金額，因此第一列的所有 $dp[0, a]$ 都等於 $0$。

### 程式實作

```src
[file]{coin_change_ii}-[class]{}-[func]{coin_change_ii_dp}
```

### 空間最佳化

空間最佳化的方式相同，移除硬幣種類這個維度即可：

```src
[file]{coin_change_ii}-[class]{}-[func]{coin_change_ii_dp_comp}
```
