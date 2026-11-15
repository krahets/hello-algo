<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: bd41abca5631debb4dd1d36e9254cc60597d99a57c4aa60ce8413c730660ce56 -->

# 鄰接矩陣的增刪操作

從五頂點六條邊出發，依次新增邊 1—2、刪除邊 1—3、新增孤立頂點 6，最後刪除頂點 3 及其對應行列。

## 問題與輸入

初始圖包含五個頂點，頂點串列 V = \[1, 3, 2, 5, 4\] 對應索引 0 至 4；初始僅有六條無向邊 1—3、1—5、3—2、2—5、2—4、5—4（尚未連線 1—2）。鄰接矩陣元素 M\[i,j\] 表示索引 i 與索引 j 對應的兩個頂點是否相連：1 表示有邊，0 表示無邊。

## 結構與關係

無向邊連線兩個頂點，增刪一條邊時須同步更新矩陣中對稱的兩個位置 M\[i,j\] 與 M\[j,i\]。每幀狀態表列出該步操作完成後的完整矩陣。

新增頂點時在矩陣末尾增加全為 0 的一行一列；刪除頂點時移除其對應的整行整列，後續頂點的矩陣索引隨之遞減，但頂點自身身份不變、不會改名。

<a id="source-179"></a>

## 第 1 步：初始化五頂點圖

用頂點串列 \[1, 3, 2, 5, 4\] 對應矩陣行列索引 0 至 4，將初始 6 條無向邊對應的對稱位置記為 1。

<details><summary>本步完整狀態</summary><p>初始狀態：當前頂點串列依次為 [1, 3, 2, 5, 4]（索引 0 至 4），共有 6 條無向邊（1—3、1—5、3—2、2—5、2—4、5—4，尚未連線 1—2）。矩陣為 5×5，1 表示相連，0 表示不相連。</p><table><caption>初始化頂點串列與六條邊</caption><thead><tr><th scope="col">行：索引／頂點</th><th scope="col">列 0／頂點 1</th><th scope="col">列 1／頂點 3</th><th scope="col">列 2／頂點 2</th><th scope="col">列 3／頂點 5</th><th scope="col">列 4／頂點 4</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>1</td><td>0</td><td>1</td><td>0</td></tr><tr><th scope="row">1／3</th><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">2／2</th><td>0</td><td>1</td><td>0</td><td>1</td><td>1</td></tr><tr><th scope="row">3／5</th><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><th scope="row">4／4</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td></tr></tbody></table></details>

<a id="source-180"></a>

## 第 2 步：新增邊 1—2

頂點 1、2 的矩陣索引分別為 0、2；新增無向邊 1—2 時，將對稱位置 M\[0,2\] 和 M\[2,0\] 同步從 0 改為 1。

<details><summary>本步完整狀態</summary><p>已新增無向邊 1—2：當前頂點串列仍為 [1, 3, 2, 5, 4]（索引 0 至 4），M[0,2] 與 M[2,0] 均已置 1，無向邊增至 7 條。5×5 矩陣完整取值見當前狀態表。</p><table><caption>新增無向邊 1—2</caption><thead><tr><th scope="col">行：索引／頂點</th><th scope="col">列 0／頂點 1</th><th scope="col">列 1／頂點 3</th><th scope="col">列 2／頂點 2</th><th scope="col">列 3／頂點 5</th><th scope="col">列 4／頂點 4</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>1</td><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">1／3</th><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">2／2</th><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td></tr><tr><th scope="row">3／5</th><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><th scope="row">4／4</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td></tr></tbody></table></details>

<a id="source-181"></a>

## 第 3 步：刪除邊 1—3

頂點 1、3 的矩陣索引分別為 0、1；刪除無向邊 1—3 時，將對稱位置 M\[0,1\] 和 M\[1,0\] 同步從 1 改為 0。

<details><summary>本步完整狀態</summary><p>已刪除無向邊 1—3：當前頂點串列仍為 [1, 3, 2, 5, 4]（索引 0 至 4），M[0,1] 與 M[1,0] 均已清零，保留 1—2 等 6 條無向邊。5×5 矩陣完整取值見當前狀態表。</p><table><caption>刪除無向邊 1—3</caption><thead><tr><th scope="col">行：索引／頂點</th><th scope="col">列 0／頂點 1</th><th scope="col">列 1／頂點 3</th><th scope="col">列 2／頂點 2</th><th scope="col">列 3／頂點 5</th><th scope="col">列 4／頂點 4</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">1／3</th><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">2／2</th><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td></tr><tr><th scope="row">3／5</th><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td></tr><tr><th scope="row">4／4</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td></tr></tbody></table></details>

<a id="source-182"></a>

## 第 4 步：新增孤立頂點 6

在頂點串列末尾追加孤立頂點 6（索引 5），矩陣擴展為 6×6，新增的索引為 5 的行與列全部填 0。

<details><summary>本步完整狀態</summary><p>已新增孤立頂點 6：當前頂點串列擴為 [1, 3, 2, 5, 4, 6]（索引 0 至 5），共有 6 條無向邊。矩陣擴為 6×6，索引 5 對應的頂點 6 行列全為 0。</p><table><caption>新增孤立頂點 6</caption><thead><tr><th scope="col">行：索引／頂點</th><th scope="col">列 0／頂點 1</th><th scope="col">列 1／頂點 3</th><th scope="col">列 2／頂點 2</th><th scope="col">列 3／頂點 5</th><th scope="col">列 4／頂點 4</th><th scope="col">列 5／頂點 6</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">1／3</th><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td></tr><tr><th scope="row">2／2</th><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">3／5</th><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td><td>0</td></tr><tr><th scope="row">4／4</th><td>0</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">5／6</th><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr></tbody></table></details>

<a id="source-183"></a>

## 第 5 步：刪除頂點 3

刪除索引 1 的頂點 3 及其對應行列，原先與 3 相連的邊 2—3 隨之移除。剩餘頂點 2、5、4、6 的矩陣索引各前移一位（如頂點 2 的索引從 2 變為 1），但各頂點保持原有身份、不會改名。

<details><summary>本步完整狀態</summary><p>已刪除頂點 3 及關聯邊 2—3：當前頂點串列更新為 [1, 2, 5, 4, 6]（對應索引 0 至 4，各頂點不改名），共有 5 條無向邊，頂點 6 仍為無鄰居的孤立頂點。矩陣恢復為 5×5，完整取值見當前狀態表。</p><table><caption>刪除頂點 3 及對應行列</caption><thead><tr><th scope="col">行：索引／頂點</th><th scope="col">列 0／頂點 1</th><th scope="col">列 1／頂點 2</th><th scope="col">列 2／頂點 5</th><th scope="col">列 3／頂點 4</th><th scope="col">列 4／頂點 6</th></tr></thead><tbody><tr><th scope="row">0／1</th><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">1／2</th><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">2／5</th><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td></tr><tr><th scope="row">3／4</th><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td></tr><tr><th scope="row">4／6</th><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr></tbody></table></details>

## 結果

五步操作結束後，頂點串列更新為 \[1, 2, 5, 4, 6\]（索引 0 至 4），圖中保留五條無向邊 1—5、2—5、2—4、5—4、1—2；新增頂點 6 為無邊相連的孤立頂點，原頂點 3 及其關聯邊已從圖和 5×5 矩陣中徹底移除。
