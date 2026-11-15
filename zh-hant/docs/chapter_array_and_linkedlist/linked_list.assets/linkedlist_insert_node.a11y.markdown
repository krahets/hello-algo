<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 79b3d3bd2ace1915c47e1fdb3904a0312fdd084e6b8e186d60e0c94561868638 -->

# 在鏈結串列中插入節點

在相鄰節點 n0 與 n1 之間插入新節點 P，只需依次修改 P.next 與 n0.next 兩次引用。

## 問題與輸入

前驅節點 n0 的值為 1，後繼節點 n1 的值為 3，初始時 n0.next 指向 n1，n1 右側的省略號表示後續鏈結串列；待插入節點 P 的值為 0，初始尚未接入鏈結串列。next 表示節點的後繼指標（引用）。

<table><caption>插入過程的連線</caption><thead><tr><th scope="col">階段</th><th scope="col">n0.next</th><th scope="col">P.next</th><th scope="col">從n0出發依次經過</th></tr></thead><tbody><tr><th scope="row">初始</th><td>n1</td><td>未畫出指向</td><td>n0 → n1 → …</td></tr><tr><th scope="row">連線P的後繼</th><td>n1</td><td>n1</td><td>n0 → n1 → …</td></tr><tr><th scope="row">完成插入</th><td>P</td><td>n1</td><td>n0 → P → n1 → …</td></tr></tbody></table>

<a id="source-51"></a>

第一步先執行 P.next = n1，讓新節點 P 指向原後繼節點 n1；此時 n0.next 與 P.next 都指向 n1，從 n0 出發沿 next 仍直接到達 n1，尚未經過 P。第二步再執行 n0.next = P，將前驅 n0 的後繼改為 P，才把 P 正式接入鏈結串列。圖示先接後繼再改前驅，是為了在僅靠 n0 引用原鏈結串列時不丟失 n1 的位址；配套程式碼則先用區域性變數 n1 儲存 n0.next，兩種寫法都能保證後續鏈結串列不斷鏈。

## 結果

插入完成後鏈結串列連線為 n0（1）→ P（0）→ n1（3）→ …。各節點的數值及 n1 之後的連線保持不變；在已知前驅節點位置的前提下，兩次引用修改的時間複雜度為 O(1)，無須移動後續節點。

## 在鏈結串列中插入節點：動畫

在相鄰節點 n0 與 n1 之間插入新節點 P，只需依次修改 P.next 與 n0.next 兩次引用。

前驅節點 n0 的值為 1，後繼節點 n1 的值為 3，初始時 n0.next 指向 n1，n1 右側的省略號表示後續鏈結串列；待插入節點 P 的值為 0，初始尚未接入鏈結串列。next 表示節點的後繼指標（引用）。

分兩步依次修改 P.next 和 n0.next 的指向；整個過程中各節點的數值以及 n1 之後的鏈結串列連線均保持不變。

### 第 1 步：初始連線

初始時 n0.next = n1，待插入節點 P 獨立於鏈結串列之外，圖中未畫出 P.next 的初始指向。

<details><summary>本步完整狀態</summary><p>n0（值 1）的 n0.next 指向 n1（值 3），n1 後續連線省略；待插入節點 P（值 0）尚未接入鏈結串列，未畫出其 next 指向。</p></details>

### 第 2 步：連線 P 的後繼

執行 P.next = n1，使新節點 P 先連上後繼節點 n1。此時 n0.next 仍指向 n1，從 n0 出發沿 next 仍直接到達 n1，還不會經過 P。

<details><summary>本步完整狀態</summary><p>n0（值 1）的 n0.next 與 P（值 0）的 P.next 均指向 n1（值 3），n1 後續連線不變；此時從 n0 出發仍直接到 n1，尚未經過 P。</p></details>

### 第 3 步：把 P 接入鏈結串列

執行 n0.next = P，同時保留 P.next = n1。現在從 n0 出發會先經過 P，再到達 n1 及後續節點，插入完成。

<details><summary>本步完整狀態</summary><p>n0.next 指向 P，P.next 指向 n1；鏈結串列連線變為 n0（1）→ P（0）→ n1（3）→ …，最終節點值順序為 1 → 0 → 3 → 後續，插入完成。</p></details>

### 結果

插入完成後鏈結串列連線為 n0（1）→ P（0）→ n1（3）→ …。各節點的數值及 n1 之後的連線保持不變；在已知前驅節點位置的前提下，兩次引用修改的時間複雜度為 O(1)，無須移動後續節點。
