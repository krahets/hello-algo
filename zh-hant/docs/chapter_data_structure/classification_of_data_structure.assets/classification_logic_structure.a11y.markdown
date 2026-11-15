<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 4d7094fa172547aff759481fad0468699856c335abfd7da6d03d3f4d0c7b0a91 -->

# 資料結構的邏輯關係

比較順序、父子層級、網路連線和鍵值對映四種邏輯關係。

<table><caption>各結構的示例與連線</caption><thead><tr><th scope="col">結構</th><th scope="col">圖中元素與關係</th></tr></thead><tbody><tr><th scope="row">陣列array</th><td>按1、3、2、5、4排列</td></tr><tr><th scope="row">鏈結串列linked list</th><td>1→3→2→5→4</td></tr><tr><th scope="row">堆疊stack</th><td>從開口端到封閉端為1、3、2、5、4；push入堆疊與pop出堆疊同在開口端</td></tr><tr><th scope="row">佇列queue</th><td>從出列端到入列端為1、3、2、5、4；push入列、pop出列在不同端</td></tr><tr><th scope="row">樹tree</th><td>根1左2右3；2左4右5；3左6右7；7節點三層</td></tr><tr><th scope="row">圖graph</th><td>5頂點1至5；無向邊1—2、1—3、2—3、2—4、2—5、3—5、4—5，共7條</td></tr><tr><th scope="row">堆積heap</th><td>根1左3右2；3左5右4；5節點三層</td></tr><tr><th scope="row">雜湊表hash table</th><td>鍵a、b、c分別對映值1、2、3</td></tr></tbody></table>

<a id="source-38"></a>

陣列、鏈結串列、堆疊、佇列都按1、3、2、5、4排成線性先後次序。其中堆疊在同一開口端入堆疊push和出堆疊pop；佇列在一端入列push、另一端出隊pop。樹與堆積按父子層級組織節點，圖則允許一個頂點連線多個鄰居。雜湊表表達鍵到值的對映，跨越線性與非線性兩欄單列，不簡單迴入單一型別。

## 結果

邏輯關係不等同於底層儲存：同類別關係可用不同儲存結構實現，雜湊表也可組合陣列、鏈結串列或樹來實現。
