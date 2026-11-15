<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: e95beb479f405e21cf21e4a42c20e1064863fcd09b4817dfeb6b155d516c4a36 -->

# 二元搜尋樹刪除雙子節點

刪除度為 2 的節點時，先在右子樹中定位並摘除中序後繼節點，再將後繼值寫入目標節點 cur。

## 問題與輸入

待刪除目標值為 4；初始樹包含值 3 至 15，根為 8，目標節點 cur 是 8 的左子節點，其左右子節點為 3、6，6 的左右子節點為 5、7；根 8 的右子樹根為 12，左右為 10（左 9、右 11）和 14（左 13、右 15）。

cur 始終指向最初存放值 4 的那個節點物件；nex（對應原始碼中的 tmp）指向它的中序後繼，即右子樹的最小節點 5。本組嚴格按圖示與原始碼時序：第 3 步先摘除原後繼節點，第 4 步再改寫 cur 的值。

<a id="source-124"></a>

## 第 1 步：定位具有兩個子節點的目標

目標值 4 小於根 8，向左查詢到 cur。因 cur 同時擁有左子節點 3 與右子節點 6，度為 2，不能直接斷開父邊或單側接替，本例選擇用中序後繼的值替換它。

<details><summary>本步完整狀態</summary><p>刪除雙子節點 4 的第 1 步（定位目標）：根為 8，cur 為 8 的左子節點，當前值為 4；cur 的左子節點為 3、右子節點為 6，6 的左右子節點為 5、7，樹結構尚未改變。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">cur（值 4）</th><td>3</td><td>6</td></tr><tr><th scope="row">後繼節點（值 5）</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>後繼節點（值 5）</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>cur（值 4）</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

<a id="source-125"></a>

## 第 2 步：找到中序後繼 5

從 cur 進入右子樹根 6，再一路向左到達葉節點 5，記為 nex。5 是右子樹最小值，也是中序後繼，替換後仍大於左子樹全部值（3）且小於剩餘右子樹全部值（6、7），從而保持二元搜尋樹性質。

<details><summary>本步完整狀態</summary><p>刪除雙子節點 4 的第 2 步（定位後繼）：根為 8，cur 值為 4，左右子節點為 3、6；nex 指向 6 的左葉節點 5（查詢路徑為 4 → 6 → 5），樹連線與節點值尚未改動。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">cur（值 4）</th><td>3</td><td>6</td></tr><tr><th scope="row">後繼節點（值 5）</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>後繼節點（值 5）</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>cur（值 4）</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

<a id="source-126"></a>

## 第 3 步：摘除原後繼節點

按圖示與原始碼順序，先遞迴刪除後繼節點 nex（5）：因它是葉節點，直接把 6.left 設為空即可摘除。此時仍保留對後繼值 5 的訪問供下一步賦值，而 cur 的值尚未改寫。

<details><summary>本步完整狀態</summary><p>刪除雙子節點 4 的第 3 步（原後繼已摘除而 cur 尚未改值）：根為 8，cur 仍位於 8 左側，cur 仍為 4，左右子節點仍為 3、6；原後繼 5 已從 6 左側摘除，6.left 為空，6.right 為 7。下一狀態才把 5 寫入 cur。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">cur（值 4）</th><td>3</td><td>6</td></tr><tr><th scope="row">6</th><td>空</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>cur（值 4）</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

<a id="source-127"></a>

## 第 4 步：把後繼值寫入 cur

在原後繼節點摘除後，下一狀態把後繼值 5 寫入 cur，覆蓋原值 4。此處改寫的僅是 cur 節點中的值，cur 與父節點 8 及左右子節點 3、6 的引用關係保持不變。

<details><summary>本步完整狀態</summary><p>刪除雙子節點 4 的第 4 步（改寫 cur 的值）：根為 8，其左子節點 cur 的值已改為 5，左右子節點仍為 3、6；6.left 為空、6.right 為 7。原後繼節點已摘除，樹中只剩一份值 5。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">cur（值 5）</th><td>3</td><td>6</td></tr><tr><th scope="row">6</th><td>空</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>cur（值 5）</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

## 結果

最終 cur 節點的值由 4 改為 5，其父節點 8 和左右子節點 3、6 的引用關係保持不變；原先位於 6 左側的後繼節點已摘除，6.left 為空。樹中只保留一份值 5，不再包含值 4。
