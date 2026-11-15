<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 259eb07bd64efc338588c9350a2972958249687a72699fb3ad10a2f9995e0540 -->

# 双层嵌套循环

每轮外循环都重新运行完整的内循环，决定任务总次数。

## 问题与输入

i控制外循环，j控制内循环；本图内外两层都完整遍历1至n。

<a id="source-20"></a>

外循环先令i=1并判断i≤n。若外层条件为真，则进入内循环并重置j=1，再判断j≤n：为真时执行任务、令j+=1，并回到内层判断j≤n；当j≤n为假时，内循环结束，流程令i+=1并回到外层判断i≤n。只要外层条件仍为真，就会再次重置j=1开启新一轮内循环；直到i≤n为假，整个流程才结束。

## 结果

外层每个i都完整对应内层j=1至n，任务共执行n×n=n²次。
