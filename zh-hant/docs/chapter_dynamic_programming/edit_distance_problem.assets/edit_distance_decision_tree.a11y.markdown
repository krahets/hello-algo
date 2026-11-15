<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: de3d828951454b07c0d16dd2094444e115cf9d9ea449b92256aacf9403c307b8 -->

# 編輯距離的決策樹

將字串作為節點、單次編輯作為有向邊，在決策樹中尋找從 hello 到 algo 的最短路徑；圖中展示一條三步轉換路徑，其他分支未展開。

## 問題與輸入

在決策樹模型下，每個節點代表一個字串狀態，從節點發出的每條有向邊代表一輪決策（一次插入、刪除或替換操作）。求解字串 s = hello 到 t = algo 的編輯距離，等價於在這棵決策樹中尋找從根節點 hello 到目標節點 algo 的最短路徑。

## 結構與關係

畫面自上而下展開左側一條包含 4 個字串節點、3 條有向邊的具體路徑：頂層根節點 s = hello 經“將 l 替換為 g”（把兩個 l 中的後一個替換為 g）到達第 2 層節點 helgo；再經“將 e 替換為 a”到達第 3 層節點 halgo；最後經“刪除 h”（刪除首字母 h）到達底層目標節點 t = algo。

在前三層的每個展開節點（hello、helgo、halgo）右側，還各畫出 3 條指向省略號“…”的分支箭頭，表示在不限制操作的情況下每個字串都可以派生出許多其他編輯選擇；這些省略分支並未寫出具體字串，本圖旨在直觀說明決策樹最短路徑視角，而非窮舉整棵搜尋樹。

<table><caption>展開路徑上的編輯</caption><thead><tr><th scope="col">邊</th><th scope="col">操作</th><th scope="col">得到的字串</th></tr></thead><tbody><tr><td>hello→helgo</td><td>後一個l替換為g</td><td>helgo</td></tr><tr><td>helgo→halgo</td><td>e替換為a</td><td>halgo</td></tr><tr><td>halgo→algo</td><td>刪除開頭h</td><td>algo</td></tr></tbody></table>

<a id="source-442"></a>

## hello 到 algo 的三步編輯路徑

從根節點 s = hello 出發，沿左側展開路徑依次執行三步決策：第 1 步將後一個 l 替換為 g 得到 helgo，第 2 步將 e 替換為 a 得到 halgo，第 3 步刪除首字母 h 得到目標串 t = algo；各節點右側通向省略號的分支代表其餘未展開的編輯選擇。

## 結果

圖中展開的決策樹路徑透過 3 條邊（3 次編輯操作）從根節點 hello 抵達目標節點 algo，對應正文給出的最少編輯步數 3。
