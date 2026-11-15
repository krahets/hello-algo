<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: ad8d42610fab69ca01bffe5e452e638813ac85f28595170f00781226c4d069ae -->

# 递归调用的栈空间

空间取决于同时未返回的调用数，逐层递归会积累栈帧。

## 结构与关系

图中用return 0示意逐层返回；现版Python代码使用裸return（实际返回None，而非数值0）。此处分析的是调用栈帧占用，返回值写法的差异不影响空间复杂度结论。

<a id="source-35"></a>

递入阶段，linear\_recur(n)调用linear\_recur(n−1)，一路深入到基本情况linear\_recur(1)。由于外层调用必须等待内层返回才能结束，到达最深处时，调用栈中会同时保留linear\_recur(n)至linear\_recur(1)共n个未返回的栈帧。回传阶段从最深处逐层返回，每返回一层才释放该层栈帧。

## 结果

空间复杂度按运行过程中的峰值内存计算：每层占固定局部空间，最深处n个同时驻留的栈帧使栈空间达到O(n)，后续逐层释放不改变这一峰值。
