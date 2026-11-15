<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 5d9b8a2325fbf5edff1d3fd61da67a1880419b4e19160468e4d0c68e3b118ee8 -->

# 二元搜尋樹刪除單子節點

刪除度為 1 的節點時，將父節點指向目標的引用直接改指目標的唯一子節點。

<table><caption>刪除單子節點前的連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">2</th><td>空</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table>

<a id="source-123"></a>

刪除值 2 時，沿 8 → 4 → 2 找到 cur = 2，父節點 pre = 4。節點 2 左為空、還有右子節點 3，度為 1。不能像刪葉節點一樣直接把 4.left 設為空，否則會從根斷開本應保留的節點 3；應執行 pre.left = cur.right，將 4.left 指向 3。

## 結果

刪除後剩餘值 3 至 15 保持搜尋樹順序。此操作替換的是父子引用，節點 3 保留自身身份並接到節點 4 的左側，並非改寫節點 2 的值。

## 二元搜尋樹刪除單子節點：動畫

刪除度為 1 的節點時，將父節點指向目標的引用直接改指目標的唯一子節點。

目標是刪除根為 8、初始包含值 2 至 15 的二元搜尋樹中的單子節點 2；各狀態的完整連線見當前樹表。

### 第 1 步：定位目標 2 與父節點 4

目標 2 小於根 8 且小於 4，連續兩次向左查詢到 cur = 2，pre 儲存父節點 4。

<details><summary>本步完整狀態</summary><p>刪除目標為 2：根為 8，查詢路徑為 8 → 4 → 2。cur 指向 2，pre 指向 4；2 的左子節點為空、右子節點為葉節點 3，目標尚未刪除。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">2</th><td>空</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 第 2 步：確認唯一子節點為 3

檢查確認目標 2 的度為 1，只有右子節點 3；刪除時需把唯一子節點 3 接回父節點 4，才能避免丟失該子樹。

<details><summary>本步完整狀態</summary><p>刪除目標 2 的條件判定狀態：待刪除節點 2 的度為 1，唯一子節點為 3；pre 指向父節點 4，4.left 仍指向 2，所有連線尚未改變。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">2</th><td>空</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 第 3 步：將節點 3 接回父節點

執行 pre.left = cur.right，讓父節點 4 的左引用直接指向節點 3，繞過並移除目標 2。

<details><summary>本步完整狀態</summary><p>刪除單子節點 2 已完成：根為 8，節點 4 的左子節點為葉節點 3、右子節點為 6，其餘連線保持不變；樹包含值 3 至 15，完整連線見當前樹表。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>3</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 結果

刪除後剩餘值 3 至 15 保持搜尋樹順序。此操作替換的是父子引用，節點 3 保留自身身份並接到節點 4 的左側，並非改寫節點 2 的值。
