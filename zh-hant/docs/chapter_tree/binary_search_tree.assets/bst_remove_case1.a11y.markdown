<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: e8a5fa9f9e41752e5fa2afc6e635060961d5b163d94c35a2058fd34008d598a1 -->

# 二元搜尋樹刪除葉節點

刪除度為 0 的葉節點時，沒有需要接回的子樹，直接清空父節點指向它的引用。

<table><caption>刪除葉節點前的連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table>

<a id="source-122"></a>

刪除值 1 時，從根沿 8 → 4 → 2 → 1 查詢到目標，cur 指向 1，pre 指向父節點 2。因目標 1 沒有子節點，度為 0，沒有需要接回的子樹，直接執行 pre.left = None 清空父節點 2 的左引用即可。

## 結果

刪除後剩餘值 2 至 15，二元搜尋樹大小關係保持不變。圖中 2 左側的空位置表示 None 引用，並非新的節點。

## 二元搜尋樹刪除葉節點：動畫

刪除度為 0 的葉節點時，沒有需要接回的子樹，直接清空父節點指向它的引用。

目標是刪除根為 8、含值 1 至 15 的二元搜尋樹中的葉節點 1。cur 表示待刪除目標，pre 表示其父節點；各狀態的完整連線見當前樹表。

### 第 1 步：定位待刪除的葉節點

目標 1 依次小於 8、4、2，沿左分支向下查詢到節點 1，並由 pre 儲存其父節點 2。

<details><summary>本步完整狀態</summary><p>刪除目標為 1：根為 8，查詢路徑為 8 → 4 → 2 → 1。當前 cur 指向 1，pre 指向 2，節點 1 仍在樹中。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 第 2 步：確認目標沒有子節點

檢查 cur（節點 1）的左右引用均為空，確認目標沒有子節點、度為 0，沒有需要接回的子樹。

<details><summary>本步完整狀態</summary><p>刪除目標 1 的條件判定狀態：節點 1 的左右子節點都為空，度為 0；pre 指向父節點 2，2 的左右子節點仍為 1、3。判定狀態尚未刪除節點 1，連線尚未改變。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 第 3 步：清空父節點的左連線

執行 pre.left = None，把父節點 2 的左引用設為空，將葉節點 1 從樹中摘除。

<details><summary>本步完整狀態</summary><p>刪除葉節點 1 已完成：根為 8，父節點 2 的左子節點變為 None（空）、右子節點仍為葉節點 3；當前樹表中不再有節點 1，樹保留值 2 至 15。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">2</th><td>空</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 結果

刪除後剩餘值 2 至 15，二元搜尋樹大小關係保持不變。圖中 2 左側的空位置表示 None 引用，並非新的節點。
