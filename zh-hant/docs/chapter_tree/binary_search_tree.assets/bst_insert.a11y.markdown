<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b817d9a3524df66939147183f3471f9d54f572b1224316897bf66bf48c5160e7 -->

# 二元搜尋樹插入節點

沿大小比較向下查詢到空引用位置，再由父節點指標 pre 將新葉節點接入樹中。

## 問題與輸入

本書二元搜尋樹不存重複值；每個節點的左子樹所有值小於該節點值，右子樹所有值大於該節點值。

<table><caption>插入前的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table>

<a id="source-117"></a>

插入 16 時，它依次大於 8、12、14、15，沿這四節點向右查詢，直到 cur 到達空位置 None，pre 儲存最後一個非空節點 15。建立新節點 16 後執行 pre.right = 新節點，將它接為 15 的右子節點。

## 結果

插入後樹含值 1 至 16，仍滿足搜尋樹大小關係。pre 儲存最後一個非空節點 15，才能在 cur 為 None 後把它的右指標接到新節點 16。

## 二元搜尋樹插入節點：動畫

沿大小比較向下查詢到空引用位置，再由父節點指標 pre 將新葉節點接入樹中。

本書二元搜尋樹不存重複值；每個節點的左子樹所有值小於該節點值，右子樹所有值大於該節點值。

目標是向根為 8、包含值 1 至 15 的二元搜尋樹插入 16；每個狀態的完整節點連線可查閱當前樹表。

### 第 1 步：找到空的右子位置

待插入值 16 依次大於路徑上的 8、12、14、15，每次比較均向右前進。當 cur 變成 None 時，pre 仍儲存最後一個非空節點 15，用來接入新節點。

<details><summary>本步完整狀態</summary><p>向根為 8、含值 1 至 15 的樹插入 16：查詢路徑為 8 → 12 → 14 → 15 → None。當前 pre 指向 15，cur 為 None，新節點 16 尚未加入；各節點連線見當前樹表。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>空</td></tr></tbody></table></details>

### 第 2 步：接入新葉節點 16

建立值為 16 的新節點，令 pre.right 指向它；因 16 大於沿途所有祖先節點值，接在 15 右側後全樹繼續滿足二元搜尋樹大小關係。

<details><summary>本步完整狀態</summary><p>向根為 8 的樹插入 16 已完成：pre 指向 15，14 的左右子節點為 13、15，15 的左子節點為空、右子節點為新葉節點 16；其餘原連線保持不變，完整連線見當前樹表。</p><table><caption>當前樹的節點連線</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">1</th><td>空</td><td>空</td></tr><tr><th scope="row">2</th><td>1</td><td>3</td></tr><tr><th scope="row">3</th><td>空</td><td>空</td></tr><tr><th scope="row">4</th><td>2</td><td>6</td></tr><tr><th scope="row">5</th><td>空</td><td>空</td></tr><tr><th scope="row">6</th><td>5</td><td>7</td></tr><tr><th scope="row">7</th><td>空</td><td>空</td></tr><tr><th scope="row">8</th><td>4</td><td>12</td></tr><tr><th scope="row">9</th><td>空</td><td>空</td></tr><tr><th scope="row">10</th><td>9</td><td>11</td></tr><tr><th scope="row">11</th><td>空</td><td>空</td></tr><tr><th scope="row">12</th><td>10</td><td>14</td></tr><tr><th scope="row">13</th><td>空</td><td>空</td></tr><tr><th scope="row">14</th><td>13</td><td>15</td></tr><tr><th scope="row">15</th><td>空</td><td>16</td></tr><tr><th scope="row">16</th><td>空</td><td>空</td></tr></tbody></table></details>

### 結果

插入後樹含值 1 至 16，仍滿足搜尋樹大小關係。pre 儲存最後一個非空節點 15，才能在 cur 為 None 後把它的右指標接到新節點 16。
