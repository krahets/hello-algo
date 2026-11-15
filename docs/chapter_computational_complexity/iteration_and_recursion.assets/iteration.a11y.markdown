<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 00f234691d4d39b1b0c8c606bceb92df869cc0e686bf4bd6070a6692011d36fd -->

# 单层循环

通过初始化、条件判断和更新，控制任务重复执行。

## 问题与输入

正文用此流程求1至n的和（n为正整数）：累计和初值为0，每轮“任务”把当前i加入累计和。

<a id="source-19"></a>

进入流程先初始化i=1，再判断i≤n：条件为真则执行任务，随后令i增加1，直接回到条件判断；条件为假则退出循环。初始化只在进入循环前执行一次，每轮更新后回到判断，不会重新把i置为1。

## 结果

i从1依次取到n，任务共执行n次；更新到i=n+1后，判断i≤n为假，循环退出。
