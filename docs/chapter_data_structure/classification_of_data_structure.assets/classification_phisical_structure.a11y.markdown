<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b48575e69712fa68d8e29ea2fcd7cd36c6f8317eb0752748ed43721865f91184 -->

# 数组与链表的存储布局

相同的逻辑序列，既可连续存储，也可由分散节点的指针连接。

<table><caption>链表节点的示意位置与后继；行列从1起</caption><thead><tr><th scope="col">节点值</th><th scope="col">值格位置</th><th scope="col">指针格位置</th><th scope="col">后继</th></tr></thead><tbody><tr><th scope="row">1</th><td>第2行第2列</td><td>第2行第3列</td><td>3</td></tr><tr><th scope="row">3</th><td>第3行第3列</td><td>第3行第4列</td><td>2</td></tr><tr><th scope="row">2</th><td>第5行第2列</td><td>第5行第3列</td><td>5</td></tr><tr><th scope="row">5</th><td>第5行第5列</td><td>第5行第6列</td><td>4</td></tr><tr><th scope="row">4</th><td>第1行第5列</td><td>第1行第6列</td><td>未画后续箭头</td></tr></tbody></table>

<a id="source-40"></a>

数组与链表都表示序列1、3、2、5、4。数组的5个元素在内存中相邻存放，直接靠物理位置表达先后次序；链表的节点分散在网格各处，每个节点同时保存值和后继指针，靠指针串联次序。因此，即使节点4画在网格最上方，沿1→3→2→5→4的指针访问，它依然排在最后。

## 结果

连续存储无须为每个元素另存后继指针；分散节点可利用零散空间，但要额外保存指针。末节点4没有后续箭头，图未注明其具体指针值。
