<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 9d53f07f8b7dca7f906e630082f62c4dc3d4e326e9f6a8c8d0eeb340869baa6c -->

# 统计每个整数的次数，再按次数写回

统计输入中 0 至 4 的出现次数为 3、2、3、0、2，再按数值递增顺序写回十个元素。

## 问题与输入

待排序数组为 nums = \[1, 0, 1, 2, 0, 4, 0, 2, 2, 4\]，元素均为非负整数且最大值为 4，因此创建包含索引 0 至 4 共五个位置的计数数组 counter。counter\[num\] 记录数字 num 的出现次数，其索引直接对应数值本身，而非原数组下标。

## 结构与关系

用数字本身作为 counter 的索引，记录它在输入中出现的次数。计数表中索引 3 对应的次数为 0，表示输入没有数字 3。

按索引从 0 到 4 读取计数，依次写出三个 0、两个 1、三个 2 和两个 4。这里直接根据频数重建整数序列，不跟踪相等数值各自的输入身份。

<table><caption>原始输入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table>

<table><caption>数字频数</caption><thead><tr><th scope="col">数字</th><th scope="col">出现次数</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>0</td></tr><tr><th scope="row">4</th><td>2</td></tr></tbody></table>

<table><caption>写回结果</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>0</td></tr><tr><th scope="row">3</th><td>1</td></tr><tr><th scope="row">4</th><td>1</td></tr><tr><th scope="row">5</th><td>2</td></tr><tr><th scope="row">6</th><td>2</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>4</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table>

<a id="source-299"></a>

counter 的索引代表要写出的整数本身，对应的计数值决定该整数连续写回多少次。

## 结果

原数组被重写为升序序列 \[0, 0, 0, 1, 1, 2, 2, 2, 4, 4\]。这种简单实现直接根据频数重建整数序列，若输入元素是携带附加属性的复合对象，则需进一步借助前缀和来保持原对象身份与稳定性。

## 统计每个整数的次数，再按次数写回：动画

统计输入中 0 至 4 的出现次数为 3、2、3、0、2，再按数值递增顺序写回十个元素。

待排序数组为 nums = \[1, 0, 1, 2, 0, 4, 0, 2, 2, 4\]，元素均为非负整数且最大值为 4，因此创建包含索引 0 至 4 共五个位置的计数数组 counter。counter\[num\] 记录数字 num 的出现次数，其索引直接对应数值本身，而非原数组下标。

用数字本身作为 counter 的索引，记录它在输入中出现的次数。计数表中索引 3 对应的次数为 0，表示输入没有数字 3。

按索引从 0 到 4 读取计数，依次写出三个 0、两个 1、三个 2 和两个 4。这里直接根据频数重建整数序列，不跟踪相等数值各自的输入身份。

### 第 1 步：读取十个非负整数

读取长度为 10 的输入数组 nums，其中最大值为 4，因此准备包含索引 0 至 4 的计数数组 counter。

<details><summary>本步完整状态</summary><p>十个非负整数准备做计数排序，最大值为 4；当前只有输入，尚未统计频数。逐项数据见原始输入表。</p><table><caption>原始输入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table></details>

### 第 2 步：统计数字频数

遍历输入数组，将每个数字的出现次数记入对应索引，得到 0 至 4 的频数依次为 3、2、3、0、2。

<details><summary>本步完整状态</summary><p>十个输入的频数统计已完成，数字 3 的次数为 0，尚未写回结果。原始输入与各数字次数见当前表。</p><table><caption>原始输入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table><table><caption>数字频数</caption><thead><tr><th scope="col">数字</th><th scope="col">出现次数</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>0</td></tr><tr><th scope="row">4</th><td>2</td></tr></tbody></table></details>

### 第 3 步：按次数写回结果

按索引 0 到 4 依次读取 counter，连续写出三个 0、两个 1、三个 2 和两个 4，次数为 0 的数字 3 直接跳过。

<details><summary>本步完整状态</summary><p>已按数字从小到大依频数写回十个元素，排序完成。原始输入表保留的是旧快照，当前排序结果见写回结果表。</p><table><caption>原始输入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table><table><caption>数字频数</caption><thead><tr><th scope="col">数字</th><th scope="col">出现次数</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>0</td></tr><tr><th scope="row">4</th><td>2</td></tr></tbody></table><table><caption>写回结果</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>0</td></tr><tr><th scope="row">3</th><td>1</td></tr><tr><th scope="row">4</th><td>1</td></tr><tr><th scope="row">5</th><td>2</td></tr><tr><th scope="row">6</th><td>2</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>4</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table></details>

### 结果

原数组被重写为升序序列 \[0, 0, 0, 1, 1, 2, 2, 2, 4, 4\]。这种简单实现直接根据频数重建整数序列，若输入元素是携带附加属性的复合对象，则需进一步借助前缀和来保持原对象身份与稳定性。
