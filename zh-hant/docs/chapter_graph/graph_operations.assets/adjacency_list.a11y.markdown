<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 60a4d8fa90ddf37d557500515b73d641cd2078c98f45589bf3fc98a222a6ce26 -->

# 鄰接表的增刪操作

增刪無向邊需同步更新兩個端點的鄰接鏈結串列；刪除頂點則需移除該頂點的整條鏈結串列，並從其餘鏈結串列中清理所有指向它的節點。

## 問題與輸入

初始圖包含五個頂點，鄰接表左列按 \[1, 3, 2, 5, 4\] 排列頭節點，初始共有六條無向邊 1—3、1—5、3—2、2—5、2—4、5—4。每行向右延伸的箭頭僅代表鏈結串列節點引用，不表示有向邊。

## 結構與關係

無向邊連線兩個頂點，增刪一條邊時須在兩個端點的鄰接鏈結串列中同步增刪對方。每幀狀態表列出該步操作完成後的完整鄰居串列。

新增孤立頂點時建立一條空鏈結串列；刪除頂點時移除該頂點的整行鏈結串列，並從其餘頂點的鏈結串列中刪去指向它的節點。鏈結串列內先後次序按畫面記錄，不影響無向連線關係；行位置前移不改變頂點身份。 本圖新增邊時把新鄰居放在鏈結串列頭部；正文程式碼使用動態陣列並在末尾追加，兩者表示的無向連線相同。

<a id="source-184"></a>

## 第 1 步：初始化五頂點圖

每個頂點對應一行鄰接鏈結串列，列出與它直接相連的全部鄰居；初始 6 條無向邊分別在各自兩個端點的鏈結串列中成對出現。

<details><summary>本步完整狀態</summary><p>初始狀態：當前頂點依次為 [1, 3, 2, 5, 4]，共有 6 條無向邊（1—3、1—5、3—2、2—5、2—4、5—4，尚未連線 1—2）。完整鄰居表列於當前狀態表；鏈結串列箭頭僅表示節點引用，不表示有向邊。</p><table><caption>初始化頂點串列與六條邊</caption><thead><tr><th scope="col">頂點</th><th scope="col">鄰居，按畫面順序</th></tr></thead><tbody><tr><th scope="row">1</th><td>3、5</td></tr><tr><th scope="row">3</th><td>1、2</td></tr><tr><th scope="row">2</th><td>3、5、4</td></tr><tr><th scope="row">5</th><td>1、2、4</td></tr><tr><th scope="row">4</th><td>2、5</td></tr></tbody></table></details>

<a id="source-185"></a>

## 第 2 步：新增邊 1—2

新增無向邊 1—2：在頂點 1 的鄰接鏈結串列頭部加入 2，同時在頂點 2 的鄰接鏈結串列頭部加入 1。

<details><summary>本步完整狀態</summary><p>已新增無向邊 1—2：當前頂點依次為 [1, 3, 2, 5, 4]，頂點 1 的鄰居變為 2、3、5，頂點 2 的鄰居變為 1、3、5、4，共有 7 條無向邊。完整鄰居表見當前狀態表。</p><table><caption>新增無向邊 1—2</caption><thead><tr><th scope="col">頂點</th><th scope="col">鄰居，按畫面順序</th></tr></thead><tbody><tr><th scope="row">1</th><td>2、3、5</td></tr><tr><th scope="row">3</th><td>1、2</td></tr><tr><th scope="row">2</th><td>1、3、5、4</td></tr><tr><th scope="row">5</th><td>1、2、4</td></tr><tr><th scope="row">4</th><td>2、5</td></tr></tbody></table></details>

<a id="source-186"></a>

## 第 3 步：刪除邊 1—3

刪除無向邊 1—3：從頂點 1 的鄰接鏈結串列中刪除 3，同時從頂點 3 的鄰接鏈結串列中刪除 1。

<details><summary>本步完整狀態</summary><p>已刪除無向邊 1—3：當前頂點依次為 [1, 3, 2, 5, 4]，頂點 1 的鄰居縮為 2、5，頂點 3 的鄰居僅剩 2，共有 6 條無向邊。完整鄰居表見當前狀態表。</p><table><caption>刪除無向邊 1—3</caption><thead><tr><th scope="col">頂點</th><th scope="col">鄰居，按畫面順序</th></tr></thead><tbody><tr><th scope="row">1</th><td>2、5</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">2</th><td>1、3、5、4</td></tr><tr><th scope="row">5</th><td>1、2、4</td></tr><tr><th scope="row">4</th><td>2、5</td></tr></tbody></table></details>

<a id="source-187"></a>

## 第 4 步：新增孤立頂點 6

在鄰接表末尾新增頂點 6 的一行，其鄰接鏈結串列為空；其餘五個頂點的鏈結串列保持不變。

<details><summary>本步完整狀態</summary><p>已新增孤立頂點 6：當前頂點依次為 [1, 3, 2, 5, 4, 6]，共有 6 條無向邊；新增的頂點 6 鄰居表為空，其餘頂點鄰居不變。</p><table><caption>新增孤立頂點 6</caption><thead><tr><th scope="col">頂點</th><th scope="col">鄰居，按畫面順序</th></tr></thead><tbody><tr><th scope="row">1</th><td>2、5</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">2</th><td>1、3、5、4</td></tr><tr><th scope="row">5</th><td>1、2、4</td></tr><tr><th scope="row">4</th><td>2、5</td></tr><tr><th scope="row">6</th><td>空</td></tr></tbody></table></details>

<a id="source-188"></a>

## 第 5 步：刪除頂點 3

移除頂點 3 的整行鏈結串列，並從頂點 2 的鄰接鏈結串列中刪除節點 3。其餘頂點 1、2、5、4、6 保持各自原有身份，不會因行位置上移而改名。

<details><summary>本步完整狀態</summary><p>已刪除頂點 3 及關聯鄰接項：當前頂點依次為 [1, 2, 5, 4, 6]（頂點不改名），頂點 2 的鄰居更新為 1、5、4，頂點 6 仍為無鄰居的孤立頂點，全圖共有 5 條無向邊。完整鄰居表見當前狀態表。</p><table><caption>刪除頂點 3 及全部關聯鄰接項</caption><thead><tr><th scope="col">頂點</th><th scope="col">鄰居，按畫面順序</th></tr></thead><tbody><tr><th scope="row">1</th><td>2、5</td></tr><tr><th scope="row">2</th><td>1、5、4</td></tr><tr><th scope="row">5</th><td>1、2、4</td></tr><tr><th scope="row">4</th><td>2、5</td></tr><tr><th scope="row">6</th><td>空</td></tr></tbody></table></details>

## 結果

五步操作完成後，鄰接表左列保留頂點 \[1, 2, 5, 4, 6\]，圖中共有五條無向邊 1—5、2—5、2—4、5—4、1—2；頂點 6 的鄰接串列為空，頂點 3 的整行及其在其餘鏈結串列中的鄰接項已全部清除。
