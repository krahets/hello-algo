<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: ca4c8c1901c9695b2577ed3ed22eb4f8d6dbc9badccc5439fa95e8c9f1d904bc -->

# 开放寻址的删除问题

在开放寻址哈希表中直接把被删桶置为 None，会截断线性探测链，使后方的冲突元素被误判为不存在。

<table><caption>删除后的可见存放位置</caption><thead><tr><th scope="col">桶或位置</th><th scope="col">删除后的内容</th></tr></thead><tbody><tr><th scope="row">00</th><td>(200,A)</td></tr><tr><th scope="row">01</th><td>(500,D)</td></tr><tr><th scope="row">02</th><td>(300,Y)</td></tr><tr><th scope="row">76</th><td>(076,H)</td></tr><tr><th scope="row">77</th><td>None，原为 (876,I)</td></tr><tr><th scope="row">78</th><td>(276,E)，仍在桶中</td></tr><tr><th scope="row">78 之后，具体索引未标</th><td>(676,T)，仍在后方</td></tr><tr><th scope="row">更后方，具体索引未标</th><td>(776,X)，仍在后方</td></tr></tbody></table>

<a id="source-87"></a>

本例按键末两位确定起始桶，冲突时向后逐桶探测，遇 None 停止。键 076、876、276、676、776 都从桶 76 起探。将索引 77 的 (876, I) 直接删为 None 后，查找 276 会在比对 76 后于 77 遇 None 提前停止，到不了 78 的 (276, E)；查 676、776 同样在此中断。

## 结果

在遇真正空槽 None 即停止的规则下，删除不能直接置空。正文用懒删除标记 TOMBSTONE，使查找经过已删桶时继续向后探测；本图展示尚未引入该标记时的断链状态。
