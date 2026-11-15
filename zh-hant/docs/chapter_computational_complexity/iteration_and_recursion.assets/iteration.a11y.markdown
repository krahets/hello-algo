<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 42bc41d060636baa86ba098722ecec5751198cf937b5fa8b5f3f4db041450365 -->

# 單層迴圈

透過初始化、條件判斷和更新，控制任務重複執行。

## 問題與輸入

正文用此流程求1至n的和（n為正整數）：累計和初值為0，每輪“任務”把當前i加入累計和。

<a id="source-19"></a>

進入流程先初始化i=1，再判斷i≤n：條件為真則執行任務，隨後令i增加1，直接回到條件判斷；條件為假則退出迴圈。初始化只在進入迴圈前執行一次，每輪更新後回到判斷，不會重新把i置為1。

## 結果

i從1依次取到n，任務共執行n次；更新到i=n+1後，判斷i≤n為假，迴圈退出。
