<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 1ca382be05c473c88a44168d3dea4a1d9672f2ff8853492c827ed364621542c2 -->

# 河內塔的三階段分解

將 n 盤從 A 移至 C，按序拆為 n−1 盤 A→B、最大盤 A→C、n−1 盤 B→C 三個子問題。

## 問題與輸入

原問題記為 f(n)，表示將 n 個按上小下大疊放的圓盤從起始柱 A 移至目標柱 C；本圖以五張圓盤為例圖解一般分治策略（不同於上一張概覽圖的六張圓盤）。移動過程同樣要求每次只從柱頂移動一張盤，且小盤時刻位於大盤之上。

在頂層問題中，A 為起始柱、B 為緩衝柱、C 為目標柱；當遞迴進入子問題時，三根柱子所承擔的起始、緩衝、目標角色會相應輪換。

## 結構與關係

先把上方 n−1 張小盤藉助 C 從 A 移到 B，騰出最大盤。再把最大盤從 A 移到 C。最後藉助 A，把 B 上的 n−1 張小盤移到 C 的最大盤之上。

首尾兩個子問題都還要遞迴拆成合法的單盤移動，不能一次搬動整疊小盤。圖中虛線是移動前的位置，實色是階段完成後的位置，始終只有同一組五張盤。

<table><caption>五盤示例的三個階段</caption><thead><tr><th scope="col">階段</th><th scope="col">移動任務</th><th scope="col">緩衝柱</th><th scope="col">完成後 A</th><th scope="col">完成後 B</th><th scope="col">完成後 C</th></tr></thead><tbody><tr><th scope="row">移開小盤</th><td>四小盤 A→B</td><td>C</td><td>最大盤</td><td>四小盤</td><td>空</td></tr><tr><th scope="row">移動最大盤</th><td>最大盤 A→C</td><td>不需要</td><td>空</td><td>四小盤</td><td>最大盤</td></tr><tr><th scope="row">移回小盤</th><td>四小盤 B→C</td><td>A</td><td>空</td><td>空</td><td>五盤按上小下大疊放</td></tr></tbody></table>

<a id="source-327"></a>

將五盤從 A 移至 C 拆為按序執行的三個階段：先以 C 為緩衝將上方四小盤從 A 移到 B，再將最大盤從 A 直接移到 C，最後以 A 為緩衝將四小盤從 B 移到 C。兩次四盤子問題的起始柱、緩衝柱與目標柱角色互不相同。

## 結果

三個子問題必須嚴格按自上而下的先後順序執行，由此得到單盤移動次數的遞推關係 T(n) = 2T(n−1) + 1；首尾兩個 f(n−1) 子問題雖然規模相同，但起始柱、緩衝柱與目標柱的角色不同。
