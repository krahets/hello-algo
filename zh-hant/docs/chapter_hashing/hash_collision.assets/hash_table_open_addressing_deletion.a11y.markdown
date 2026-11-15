<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: d6b92c1a14ab1e48ec3f2dab08c34ff2244443017300dc8bfb55bc883790ac0f -->

# 開放定址的刪除問題

在開放定址雜湊表中直接把被刪桶置為 None，會截斷線性探查鏈，使後方的衝突元素被誤判為不存在。

<table><caption>刪除後的可見存放位置</caption><thead><tr><th scope="col">桶或位置</th><th scope="col">刪除後的內容</th></tr></thead><tbody><tr><th scope="row">00</th><td>(200,A)</td></tr><tr><th scope="row">01</th><td>(500,D)</td></tr><tr><th scope="row">02</th><td>(300,Y)</td></tr><tr><th scope="row">76</th><td>(076,H)</td></tr><tr><th scope="row">77</th><td>None，原為 (876,I)</td></tr><tr><th scope="row">78</th><td>(276,E)，仍在桶中</td></tr><tr><th scope="row">78 之後，具體索引未標</th><td>(676,T)，仍在後方</td></tr><tr><th scope="row">更後方，具體索引未標</th><td>(776,X)，仍在後方</td></tr></tbody></table>

<a id="source-87"></a>

本例按鍵末兩位確定起始桶，衝突時向後逐桶探測，遇 None 停止。鍵 076、876、276、676、776 都從桶 76 起探。將索引 77 的 (876, I) 直接刪為 None 後，查詢 276 會在比對 76 後於 77 遇 None 提前停止，到不了 78 的 (276, E)；查 676、776 同樣在此中斷。

## 結果

在遇真正空槽 None 即停止的規則下，刪除不能直接置空。正文用懶刪除標記 TOMBSTONE，使查詢經過已刪桶時繼續向後探測；本圖展示尚未引入該標記時的斷鏈狀態。
