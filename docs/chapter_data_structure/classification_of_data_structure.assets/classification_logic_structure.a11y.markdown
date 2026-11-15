<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: a1d6db0c5fdca95e57fe8d2fd9c39fd7cc49a39a7c3b567cacdf8a8276760eb4 -->

# 数据结构的逻辑关系

比较顺序、父子层级、网络连接和键值映射四种逻辑关系。

<table><caption>各结构的示例与连接</caption><thead><tr><th scope="col">结构</th><th scope="col">图中元素与关系</th></tr></thead><tbody><tr><th scope="row">数组array</th><td>按1、3、2、5、4排列</td></tr><tr><th scope="row">链表linked list</th><td>1→3→2→5→4</td></tr><tr><th scope="row">栈stack</th><td>从开口端到封闭端为1、3、2、5、4；push入栈与pop出栈同在开口端</td></tr><tr><th scope="row">队列queue</th><td>从出队端到入队端为1、3、2、5、4；push入队、pop出队在不同端</td></tr><tr><th scope="row">树tree</th><td>根1左2右3；2左4右5；3左6右7；7节点三层</td></tr><tr><th scope="row">图graph</th><td>5顶点1至5；无向边1—2、1—3、2—3、2—4、2—5、3—5、4—5，共7条</td></tr><tr><th scope="row">堆heap</th><td>根1左3右2；3左5右4；5节点三层</td></tr><tr><th scope="row">哈希表hash table</th><td>键a、b、c分别映射值1、2、3</td></tr></tbody></table>

<a id="source-38"></a>

数组、链表、栈、队列都按1、3、2、5、4排成线性先后次序。其中栈在同一开口端入栈push和出栈pop；队列在一端入队push、另一端出队pop。树与堆按父子层级组织节点，图则允许一个顶点连接多个邻居。哈希表表达键到值的映射，跨越线性与非线性两栏单列，不简单归入单一类别。

## 结果

逻辑关系不等同于底层存储：同类关系可用不同存储结构实现，哈希表也可组合数组、链表或树来实现。
