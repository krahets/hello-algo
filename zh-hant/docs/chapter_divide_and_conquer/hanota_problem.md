# 河內塔問題

在合併排序和構建二元樹中，我們都是將原問題分解為兩個規模為原問題一半的子問題。然而對於河內塔問題，我們採用不同的分解策略。

!!! question

    給定三根柱子，記為 `A`、`B` 和 `C` 。起始狀態下，柱子 `A` 上套著 $n$ 個圓盤，它們從上到下按照從小到大的順序排列。我們的任務是要把這 $n$ 個圓盤移到柱子 `C` 上，並保持它們的原有順序不變（如下圖所示）。在移動圓盤的過程中，需要遵守以下規則。
    
    1. 圓盤只能從一根柱子頂部拿出，從另一根柱子頂部放入。
    2. 每次只能移動一個圓盤。
    3. 小圓盤必須時刻位於大圓盤之上。

![河內塔問題示例](hanota_problem.assets/hanota_example.svg)
<!-- figure-reading:start group:chapter_divide_and_conquer/hanota_problem.assets/hanota_example -->

[河內塔問題示例：將六張圓盤從 A 移至 C：完整圖解](hanota_problem.assets/hanota_example.a11y.markdown)

<!-- figure-reading:end -->

**我們將規模為 $i$ 的河內塔問題記作 $f(i)$** 。例如 $f(3)$ 代表將 $3$ 個圓盤從 `A` 移動至 `C` 的河內塔問題。

### 考慮基本情況

如下圖所示，對於問題 $f(1)$ ，即當只有一個圓盤時，我們將它直接從 `A` 移動至 `C` 即可。

=== "<1>"
    ![規模為 1 的問題的解](hanota_problem.assets/hanota_f1_step1.svg)

=== "<2>"
    ![一個圓盤的河內塔（f(1)），第 2 步，共 2 步：把圓盤從柱 A 直接移到柱 C](hanota_problem.assets/hanota_f1_step2.svg)
<!-- figure-reading:start group:chapter_divide_and_conquer/hanota_problem.assets/hanota_f1 -->

[一個圓盤的河內塔（f(1)）：完整圖解](hanota_problem.assets/hanota_f1.a11y.markdown)

<!-- figure-reading:end -->

如下圖所示，對於問題 $f(2)$ ，即當有兩個圓盤時，**由於要時刻滿足小圓盤在大圓盤之上，因此需要藉助 `B` 來完成移動**。

1. 先將上面的小圓盤從 `A` 移至 `B` 。
2. 再將大圓盤從 `A` 移至 `C` 。
3. 最後將小圓盤從 `B` 移至 `C` 。

=== "<1>"
    ![規模為 2 的問題的解](hanota_problem.assets/hanota_f2_step1.svg)

=== "<2>"
    ![兩個圓盤藉助緩衝柱 B 完成移動，第 2 步，共 4 步：先把小盤從柱 A 移到柱 B](hanota_problem.assets/hanota_f2_step2.svg)

=== "<3>"
    ![兩個圓盤藉助緩衝柱 B 完成移動，第 3 步，共 4 步：再把大盤從柱 A 移到柱 C](hanota_problem.assets/hanota_f2_step3.svg)

=== "<4>"
    ![兩個圓盤藉助緩衝柱 B 完成移動，第 4 步，共 4 步：最後把小盤從柱 B 移到柱 C](hanota_problem.assets/hanota_f2_step4.svg)
<!-- figure-reading:start group:chapter_divide_and_conquer/hanota_problem.assets/hanota_f2 -->

[兩個圓盤藉助緩衝柱 B 完成移動：完整圖解](hanota_problem.assets/hanota_f2.a11y.markdown)

<!-- figure-reading:end -->

解決問題 $f(2)$ 的過程可總結為：**將兩個圓盤藉助 `B` 從 `A` 移至 `C`** 。其中，`C` 稱為目標柱、`B` 稱為緩衝柱。

### 子問題分解

對於問題 $f(3)$ ，即當有三個圓盤時，情況變得稍微複雜了一些。

因為已知 $f(1)$ 和 $f(2)$ 的解，所以我們可從分治角度思考，**將 `A` 頂部的兩個圓盤看作一個整體**，執行下圖所示的步驟。這樣三個圓盤就被順利地從 `A` 移至 `C` 了。

1. 令 `B` 為目標柱、`C` 為緩衝柱，將兩個圓盤從 `A` 移至 `B` 。
2. 將 `A` 中剩餘的一個圓盤從 `A` 直接移動至 `C` 。
3. 令 `C` 為目標柱、`A` 為緩衝柱，將兩個圓盤從 `B` 移至 `C` 。

=== "<1>"
    ![規模為 3 的問題的解](hanota_problem.assets/hanota_f3_step1.svg)

=== "<2>"
    ![三盤河內塔的分治，第 2 步，共 4 步：完成兩盤子問題：A 到 B](hanota_problem.assets/hanota_f3_step2.svg)

=== "<3>"
    ![三盤河內塔的分治，第 3 步，共 4 步：將最大盤從 A 移至 C](hanota_problem.assets/hanota_f3_step3.svg)

=== "<4>"
    ![三盤河內塔的分治，第 4 步，共 4 步：完成兩盤子問題：B 到 C](hanota_problem.assets/hanota_f3_step4.svg)
<!-- figure-reading:start group:chapter_divide_and_conquer/hanota_problem.assets/hanota_f3 -->

[三盤河內塔的分治：完整圖解](hanota_problem.assets/hanota_f3.a11y.markdown)

<!-- figure-reading:end -->

從本質上看，**我們將問題 $f(3)$ 劃分為兩個子問題 $f(2)$ 和一個子問題 $f(1)$** 。按順序解決這三個子問題之後，原問題隨之得到解決。這說明子問題是獨立的，而且解可以合併。

至此，我們可總結出下圖所示的解決河內塔問題的分治策略：將原問題 $f(n)$ 劃分為兩個子問題 $f(n-1)$ 和一個子問題 $f(1)$ ，並按照以下順序解決這三個子問題。

1. 將 $n-1$ 個圓盤藉助 `C` 從 `A` 移至 `B` 。
2. 將剩餘 $1$ 個圓盤從 `A` 直接移至 `C` 。
3. 將 $n-1$ 個圓盤藉助 `A` 從 `B` 移至 `C` 。

對於這兩個子問題 $f(n-1)$ ，**可以透過相同的方式進行遞迴劃分**，直至達到最小子問題 $f(1)$ 。而 $f(1)$ 的解是已知的，只需一次移動操作即可。

![解決河內塔問題的分治策略](hanota_problem.assets/hanota_divide_and_conquer.svg)
<!-- figure-reading:start group:chapter_divide_and_conquer/hanota_problem.assets/hanota_divide_and_conquer -->

[河內塔的三階段分解：完整圖解](hanota_problem.assets/hanota_divide_and_conquer.a11y.markdown)

<!-- figure-reading:end -->

### 程式碼實現

在程式碼中，我們宣告一個遞迴函式 `dfs(i, src, buf, tar)` ，它的作用是將柱 `src` 頂部的 $i$ 個圓盤藉助緩衝柱 `buf` 移動至目標柱 `tar` ：

```src
[file]{hanota}-[class]{}-[func]{solve_hanota}
```

如下圖所示，河內塔問題形成一棵高度為 $n$ 的遞迴樹，每個節點代表一個子問題，對應一個開啟的 `dfs()` 函式，**因此時間複雜度為 $O(2^n)$ ，空間複雜度為 $O(n)$** 。

![河內塔問題的遞迴樹](hanota_problem.assets/hanota_recursive_tree.svg)
<!-- figure-reading:start group:chapter_divide_and_conquer/hanota_problem.assets/hanota_recursive_tree -->

[河內塔遞迴樹：兩個較小任務加一次單盤移動：完整圖解](hanota_problem.assets/hanota_recursive_tree.a11y.markdown)

<!-- figure-reading:end -->

!!! quote

    河內塔問題源自一個古老的傳說。在古印度的一個寺廟裡，僧侶們有三根高大的鑽石柱子，以及 $64$ 個大小不一的金圓盤。僧侶們不斷地移動圓盤，他們相信在最後一個圓盤被正確放置的那一刻，這個世界就會結束。

    然而，即使僧侶們每秒鐘移動一次，總共需要大約 $2^{64} \approx 1.84×10^{19}$ 秒，合約 $5850$ 億年，遠遠超過了現在對宇宙年齡的估計。所以，倘若這個傳說是真的，我們應該不需要擔心世界末日的到來。
