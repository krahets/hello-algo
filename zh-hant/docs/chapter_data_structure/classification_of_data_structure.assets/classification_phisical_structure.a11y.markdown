<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 27655155679d52014a65620907beb20000b6fee86d290f021e4b238d0a1855a6 -->

# 陣列與鏈結串列的儲存佈局

相同的邏輯序列，既可連續儲存，也可由分散節點的指標連線。

<table><caption>鏈結串列節點的示意位置與後繼；行列從1起</caption><thead><tr><th scope="col">節點值</th><th scope="col">值格位置</th><th scope="col">指標格位置</th><th scope="col">後繼</th></tr></thead><tbody><tr><th scope="row">1</th><td>第2行第2列</td><td>第2行第3列</td><td>3</td></tr><tr><th scope="row">3</th><td>第3行第3列</td><td>第3行第4列</td><td>2</td></tr><tr><th scope="row">2</th><td>第5行第2列</td><td>第5行第3列</td><td>5</td></tr><tr><th scope="row">5</th><td>第5行第5列</td><td>第5行第6列</td><td>4</td></tr><tr><th scope="row">4</th><td>第1行第5列</td><td>第1行第6列</td><td>未畫後續箭頭</td></tr></tbody></table>

<a id="source-40"></a>

陣列與鏈結串列都表示序列1、3、2、5、4。陣列的5個元素在記憶體中相鄰存放，直接靠物理位置表達先後次序；鏈結串列的節點分散在網格各處，每個節點同時儲存值和後繼指標，靠指標串聯次序。因此，即使節點4畫在網格最上方，沿1→3→2→5→4的指標訪問，它依然排在最後。

## 結果

連續儲存無須為每個元素另存後繼指標；分散節點可利用零散空間，但要額外儲存指標。末節點4沒有後續箭頭，圖未註明其具體指標值。
