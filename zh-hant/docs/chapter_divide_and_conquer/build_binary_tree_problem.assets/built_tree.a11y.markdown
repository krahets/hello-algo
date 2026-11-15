<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 761cf69704ff39d04b6a8146aeaef54c88a5f44b43b31b726f2d6418cc1d9e11 -->

# 遞迴構樹：向下建立節點，返回時連線子樹

向下遞進時依次建立節點 3、9、2、1、7，向上回溯返回時才將子樹連線到父節點，最終建成五節點樹。

## 問題與輸入

輸入為前序走訪 preorder = \[3, 9, 2, 1, 7\] 與中序走訪 inorder = \[9, 3, 1, 2, 7\]，節點值互不重複。

每個遞迴子問題先從前序有效段首元素初始化當前根節點（向下“遞”時建立節點），再按中序位置劃分並遞迴構建左、右子樹；當子呼叫返回子樹根節點後，父呼叫才將其賦給當前根的 left 或 right 引用（向上“迴”時建立連邊）。空區間呼叫直接返回 None。

## 結構與關係

向下遞迴時建立節點，子呼叫返回時才把它連線到父節點。已經建立的子節點若尚未返回，圖中就沒有相應父子邊。

每幀說明本次建立或連線動作，表格列出此時已建立的全部節點和已建立的引用。空區間返回 None 的呼叫未單獨拆幀。

<table><caption>固定走訪輸入</caption><thead><tr><th scope="col">索引</th><th scope="col">前序值</th><th scope="col">中序值</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td><td>9</td></tr><tr><th scope="row">1</th><td>9</td><td>3</td></tr><tr><th scope="row">2</th><td>2</td><td>1</td></tr><tr><th scope="row">3</th><td>1</td><td>2</td></tr><tr><th scope="row">4</th><td>7</td><td>7</td></tr></tbody></table>

<a id="source-317"></a>

## 第 1 步：建立根節點 3

進入頂層呼叫 i = 0、中序區間 \[0, 4\]：由前序首元素 3 建立根節點 3；在中序索引 1 處找到 3，將左子樹劃分為 \[9\]，將右子樹劃分為中序 \[1, 2, 7\]、前序 \[2, 1, 7\]。接下來優先遞迴構建左子樹。

<details><summary>本步完整狀態</summary><p>當前由前序首項建立根節點 3，尚無父子邊。當前表中“未連線”表示相應子樹尚待構建或返回連線；“無”表示確實沒有該子節點。</p><table><caption>當前已建立節點及引用</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>未連線</td><td>未連線</td></tr></tbody></table></details>

<a id="source-318"></a>

## 第 2 步：建立葉節點 9

進入左子問題 i = 1、中序區間 \[0, 0\]：由根值 9 建立節點 9。由於其左右兩側的中序子區間均為空（返回 None），節點 9 成為葉節點；但本幀子呼叫尚未返回，因此節點 9 與根節點 3 之間還未建立連邊。

<details><summary>本步完整狀態</summary><p>當前已建立左葉節點 9，但尚未接到根 3。已建立節點及引用見表；未連線的子樹尚待構建或返回連線。</p><table><caption>當前已建立節點及引用</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>未連線</td><td>未連線</td></tr><tr><th scope="row">9</th><td>無</td><td>無</td></tr></tbody></table></details>

<a id="source-319"></a>

## 第 3 步：連線左子樹 9

左子問題構建完畢並將節點 9 返回給頂層根 3 的呼叫，執行 3.left = 9 建立左子邊。至此根 3 的左子樹連線完成，接下來轉向構建根 3 的右子樹。

<details><summary>本步完整狀態</summary><p>左葉節點 9 已返回並接到根 3，右子樹尚待構建。當前表列出兩節點的引用。</p><table><caption>當前已建立節點及引用</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未連線</td></tr><tr><th scope="row">9</th><td>無</td><td>無</td></tr></tbody></table></details>

<a id="source-320"></a>

## 第 4 步：建立右子樹根 2

進入 i = 2、中序區間 \[2, 4\] 的右子問題：取有效前序段 \[2, 1, 7\] 的首元素 2 建立節點 2，並根據中序索引 3 將其左子問題劃分為 \[1\]、右子問題劃分為 \[7\]。由於以 2 為根的子樹尚未構建完畢返回，此時 3 與 2 之間還沒有連邊。

<details><summary>本步完整狀態</summary><p>當前已建立右子樹根 2，其左右子樹尚待構建；2 尚未返回連線到根 3。已有的 3→9 保持連線，完整節點狀態見表。</p><table><caption>當前已建立節點及引用</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未連線</td></tr><tr><th scope="row">9</th><td>無</td><td>無</td></tr><tr><th scope="row">2</th><td>未連線</td><td>未連線</td></tr></tbody></table></details>

<a id="source-321"></a>

## 第 5 步：建立葉節點 1

進入節點 2 的左子問題 i = 3、中序區間 \[2, 2\]：建立節點 1。該區間僅含單個元素，其左右子區間均為空；本幀子呼叫尚未返回，因此節點 1 還未連線到節點 2。

<details><summary>本步完整狀態</summary><p>當前已建立葉節點 1，但尚未接到節點 2；以 2 為根的子樹也尚未接回根 3。當前表列出已建立的四個節點。</p><table><caption>當前已建立節點及引用</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未連線</td></tr><tr><th scope="row">9</th><td>無</td><td>無</td></tr><tr><th scope="row">2</th><td>未連線</td><td>未連線</td></tr><tr><th scope="row">1</th><td>無</td><td>無</td></tr></tbody></table></details>

<a id="source-322"></a>

## 第 6 步：連線節點 2 的左子樹

節點 1 的子呼叫返回給節點 2，執行 2.left = 1 建立左子邊。此時節點 2 的左子樹已連線完畢，但其右子問題 \[7\] 尚待構建，因此節點 2 仍未返回並連線到根 3。

<details><summary>本步完整狀態</summary><p>葉節點 1 已返回並接為節點 2 的左子節點，右子問題尚待構建；2 尚未接回根 3。全部引用見當前表。</p><table><caption>當前已建立節點及引用</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未連線</td></tr><tr><th scope="row">9</th><td>無</td><td>無</td></tr><tr><th scope="row">2</th><td>1</td><td>未連線</td></tr><tr><th scope="row">1</th><td>無</td><td>無</td></tr></tbody></table></details>

<a id="source-323"></a>

## 第 7 步：建立葉節點 7

進入節點 2 的右子問題 i = 4、中序區間 \[4, 4\]：建立最後一個節點 7。其左右子區間均為空，即將作為葉節點返回給節點 2；本幀尚未建立 2 到 7 的右子邊。

<details><summary>本步完整狀態</summary><p>最後一個葉節點 7 已建立，尚未接到節點 2；當前已建立全部五個節點，2→7 和 3→2 仍未連線。已建立的引用見表。</p><table><caption>當前已建立節點及引用</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未連線</td></tr><tr><th scope="row">9</th><td>無</td><td>無</td></tr><tr><th scope="row">2</th><td>1</td><td>未連線</td></tr><tr><th scope="row">1</th><td>無</td><td>無</td></tr><tr><th scope="row">7</th><td>無</td><td>無</td></tr></tbody></table></details>

<a id="source-324"></a>

## 第 8 步：連線節點 2 的右子樹

葉節點 7 返回給節點 2，執行 2.right = 7 建立右子邊，完整合成以 2 為根、1 和 7 為左右子節點的子樹。此時該子樹準備向上返回給頂層根 3，畫面中 3 與 2 之間的連邊尚未建立。

<details><summary>本步完整狀態</summary><p>葉節點 7 已接到節點 2，以 2 為根的右子樹已完成，尚未返回連線到根 3。當前表列出全部五個節點及已建立的三條邊。</p><table><caption>當前已建立節點及引用</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>未連線</td></tr><tr><th scope="row">9</th><td>無</td><td>無</td></tr><tr><th scope="row">2</th><td>1</td><td>7</td></tr><tr><th scope="row">1</th><td>無</td><td>無</td></tr><tr><th scope="row">7</th><td>無</td><td>無</td></tr></tbody></table></details>

<a id="source-325"></a>

## 第 9 步：連線完整右子樹

右子樹呼叫將子樹根節點 2 返回給頂層根 3，執行 3.right = 2 建立最後一條連邊。至此根 3 的左右子樹全部就緒，頂層函式返回根節點 3，整棵五節點二元樹構建完成。

<details><summary>本步完整狀態</summary><p>完整右子樹已接回根 3，五節點樹的四條父子邊全部建立。頂層返回根 3，完整連線見當前表。</p><table><caption>當前已建立節點及引用</caption><thead><tr><th scope="col">節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">3</th><td>9</td><td>2</td></tr><tr><th scope="row">9</th><td>無</td><td>無</td></tr><tr><th scope="row">2</th><td>1</td><td>7</td></tr><tr><th scope="row">1</th><td>無</td><td>無</td></tr><tr><th scope="row">7</th><td>無</td><td>無</td></tr></tbody></table></details>

## 結果

最終建成的二元樹以 3 為根節點，左子節點為 9，右子節點為 2；節點 2 的左右子節點分別為 1 和 7；節點 9、1、7 均為葉節點。頂層呼叫返回根節點 3，所得二元樹的前序走訪為 \[3, 9, 2, 1, 7\]，中序走訪為 \[9, 3, 1, 2, 7\]。
