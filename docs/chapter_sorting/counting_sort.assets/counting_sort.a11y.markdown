<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: a11ac2e134f06024b2a8a66cb3325836e6232a2edf183c0eec803cf370e945c1 -->

# 前缀和计数排序的稳定写入

将频数累加为前缀和以定位写入下标，倒序遍历原数组填入 res 并递减计数，最后覆盖 nums。

## 问题与输入

原数组为 nums = \[1, 0, 1, 2, 0, 4, 0, 2, 2, 4\]（索引 0 至 9），数值范围为 0 至 4，频数数组为 counter = \[3, 2, 3, 0, 2\]。

对 counter 计算前缀和得到初始 prefix = \[3, 5, 8, 8, 10\]。初始 prefix\[num\] 表示小于或等于 num 的元素总数，对于确实出现的数值 num，prefix\[num\] - 1 正好是它在结果数组 res 中最后一次出现的目标索引。

结果数组 res 共有十个槽位。图中尚未写入元素的槽位留白，用于区分“尚未放置元素”与“已写入数值 0”（尽管代码中用 0 初始化 res，画面仍以空白格表示未写入状态）。

## 结构与关系

算法从右向左倒序遍历原数组 nums：每读取一个元素 num，先将其填入 res 的索引 prefix\[num\] - 1 处，随后立即令 prefix\[num\] 自减 1，为下一个相同数值指向前一个可用位置。递减后的 prefix 保存的是各数值剩余分区的右边界计数，不再是固定不变的初始前缀和。

倒序遍历与从右向左填充相配合，使得原数组中靠右的相等元素先填入结果区段的靠右位置、靠左的相等元素后填入靠左位置，从而保证排序的稳定性。本图组逐帧演示最右侧四个元素（原索引 9、8、7、6）的写入过程，随后省略中间六次写入直接展示遍历完成状态，最后用 res 覆盖 nums。

<table><caption>固定原始输入</caption><thead><tr><th scope="col">索引</th><th scope="col">值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table>

<a id="source-300"></a>

## 第 1 步：统计频数

遍历原数组 nums，统计数字 0、1、2、3、4 各自出现的次数，生成长度为 5 的计数数组 counter = \[3, 2, 3, 0, 2\]。

<details><summary>本步完整状态</summary><p>计数排序已统计完十个输入，尚未求前缀和，也未开始写入结果。当前表列出 nums 和数字频数 counter。</p><table><caption>当前 nums</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td></tr><tr><th scope="row">1</th><td>0</td></tr><tr><th scope="row">2</th><td>1</td></tr><tr><th scope="row">3</th><td>2</td></tr><tr><th scope="row">4</th><td>0</td></tr><tr><th scope="row">5</th><td>4</td></tr><tr><th scope="row">6</th><td>0</td></tr><tr><th scope="row">7</th><td>2</td></tr><tr><th scope="row">8</th><td>2</td></tr><tr><th scope="row">9</th><td>4</td></tr></tbody></table><table><caption>当前频数 counter</caption><thead><tr><th scope="col">数字 num</th><th scope="col">出现次数</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>2</td></tr><tr><th scope="row">2</th><td>3</td></tr><tr><th scope="row">3</th><td>0</td></tr><tr><th scope="row">4</th><td>2</td></tr></tbody></table></details>

<a id="source-301"></a>

## 第 2 步：累加频数，准备结果数组

对 counter 依次累加计算前缀和，得到 prefix = \[3, 5, 8, 8, 10\]，同时准备好十格空白的结果数组 res。根据 prefix\[num\] - 1 可知：数字 0 的最后一个目标位置是 3 - 1 = 2，数字 2 的最后位置是 8 - 1 = 7，数字 4 的最后位置是 10 - 1 = 9；数字 3 未出现，不会触发写入。

<details><summary>本步完整状态</summary><p>计数排序已将频数累加为初始 prefix，res 的十个槽位均未写入。当前表列出 nums、写入状态及各数字的前缀和。</p><table><caption>当前 nums 与 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或写入状态</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>未写入</td><td>无</td></tr><tr><th scope="row">1</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">2</th><td>1</td><td>未写入</td><td>无</td></tr><tr><th scope="row">3</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">4</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">5</th><td>4</td><td>未写入</td><td>无</td></tr><tr><th scope="row">6</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">7</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">8</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">9</th><td>4</td><td>未写入</td><td>无</td></tr></tbody></table><table><caption>初始前缀和 prefix</caption><thead><tr><th scope="col">数字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>8</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>10</td></tr></tbody></table></details>

<a id="source-302"></a>

## 第 3 步：将末尾的 4 写入索引 9

指针 num 指向原数组最右端索引 9，元素值为 4。先根据递减前的 prefix\[4\] = 10 计算出目标索引 10 - 1 = 9，将 4 填入 res\[9\]；再将 prefix\[4\] 自减 1 变为 9。画面中展示的是已完成自减后的 prefix。

<details><summary>本步完整状态</summary><p>倒序处理已开始：原索引 9 的 4 已写入 res[9]，prefix[4] 已递减为 9，其余九格未写入。</p><table><caption>当前 nums 与 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或写入状态</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>未写入</td><td>无</td></tr><tr><th scope="row">1</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">2</th><td>1</td><td>未写入</td><td>无</td></tr><tr><th scope="row">3</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">4</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">5</th><td>4</td><td>未写入</td><td>无</td></tr><tr><th scope="row">6</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">7</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">8</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>当前 prefix（写入后已递减）</caption><thead><tr><th scope="col">数字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>8</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>9</td></tr></tbody></table></details>

<a id="source-303"></a>

## 第 4 步：将原索引 8 的 2 写入索引 7

指针 num 左移至原数组索引 8，元素值为 2。先根据递减前的 prefix\[2\] = 8 计算出目标索引 8 - 1 = 7，将 2 填入 res\[7\]；再将 prefix\[2\] 自减 1 变为 7。画面中展示的是已完成自减后的 prefix。

<details><summary>本步完整状态</summary><p>已处理原索引 9、8；原索引 8 的 2 已写入 res[7]，prefix[2] 已递减为 7。完整当前数组见表。</p><table><caption>当前 nums 与 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或写入状态</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>未写入</td><td>无</td></tr><tr><th scope="row">1</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">2</th><td>1</td><td>未写入</td><td>无</td></tr><tr><th scope="row">3</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">4</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">5</th><td>4</td><td>未写入</td><td>无</td></tr><tr><th scope="row">6</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">7</th><td>2</td><td>2</td><td>8</td></tr><tr><th scope="row">8</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>当前 prefix（写入后已递减）</caption><thead><tr><th scope="col">数字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>7</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>9</td></tr></tbody></table></details>

<a id="source-304"></a>

## 第 5 步：将原索引 7 的 2 写入索引 6

指针 num 左移至原数组索引 7，遇到第二个值为 2 的元素。根据上一轮递减后的 prefix\[2\] = 7 计算出目标索引 7 - 1 = 6，将该 2 填入 res\[6\]（排在刚才那个 2 的左侧，保持原有相对次序）；随后将 prefix\[2\] 自减 1 变为 6。

<details><summary>本步完整状态</summary><p>已处理原索引 9 至 7；原索引 7 的 2 已写入 res[6]，位于原索引 8 的 2 左侧，prefix[2] 已递减为 6。</p><table><caption>当前 nums 与 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或写入状态</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>未写入</td><td>无</td></tr><tr><th scope="row">1</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">2</th><td>1</td><td>未写入</td><td>无</td></tr><tr><th scope="row">3</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">4</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">5</th><td>4</td><td>未写入</td><td>无</td></tr><tr><th scope="row">6</th><td>0</td><td>2</td><td>7</td></tr><tr><th scope="row">7</th><td>2</td><td>2</td><td>8</td></tr><tr><th scope="row">8</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>当前 prefix（写入后已递减）</caption><thead><tr><th scope="col">数字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>3</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>9</td></tr></tbody></table></details>

<a id="source-305"></a>

## 第 6 步：将原索引 6 的 0 写入索引 2

指针 num 左移至原数组索引 6，元素值为 0。先根据递减前的 prefix\[0\] = 3 计算出目标索引 3 - 1 = 2，将 0 填入 res\[2\]；再将 prefix\[0\] 自减 1 变为 2。画面中展示的是已完成自减后的 prefix。

<details><summary>本步完整状态</summary><p>已处理原索引 9 至 6；原索引 6 的 0 已写入 res[2]，prefix[0] 已递减为 2。该格是实际写入的 0，其余未写入格在表中另作标记。</p><table><caption>当前 nums 与 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或写入状态</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>未写入</td><td>无</td></tr><tr><th scope="row">1</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">2</th><td>1</td><td>0</td><td>6</td></tr><tr><th scope="row">3</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">4</th><td>0</td><td>未写入</td><td>无</td></tr><tr><th scope="row">5</th><td>4</td><td>未写入</td><td>无</td></tr><tr><th scope="row">6</th><td>0</td><td>2</td><td>7</td></tr><tr><th scope="row">7</th><td>2</td><td>2</td><td>8</td></tr><tr><th scope="row">8</th><td>2</td><td>未写入</td><td>无</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>当前 prefix（写入后已递减）</caption><thead><tr><th scope="col">数字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>2</td></tr><tr><th scope="row">1</th><td>5</td></tr><tr><th scope="row">2</th><td>6</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>9</td></tr></tbody></table></details>

<a id="source-306"></a>

## 第 7 步：完成其余六次写入

继续倒序处理原数组索引 5 至 0 的其余六个元素（依次为 4、0、2、1、0、1），分别填入 res 的索引 8、1、5、4、0、3。图中省略了这六步中间画面，直接跳到遍历结束状态：此时 res 已全部填满为有序序列，而上方原数组 nums 尚未被覆盖。

<details><summary>本步完整状态</summary><p>十个元素已全部写入 res，结果升序；nums 仍保持原始顺序，尚未覆盖。当前表列出各结果的原始身份和递减后的 prefix。</p><table><caption>当前 nums 与 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或写入状态</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>1</td><td>0</td><td>1</td></tr><tr><th scope="row">1</th><td>0</td><td>0</td><td>4</td></tr><tr><th scope="row">2</th><td>1</td><td>0</td><td>6</td></tr><tr><th scope="row">3</th><td>2</td><td>1</td><td>0</td></tr><tr><th scope="row">4</th><td>0</td><td>1</td><td>2</td></tr><tr><th scope="row">5</th><td>4</td><td>2</td><td>3</td></tr><tr><th scope="row">6</th><td>0</td><td>2</td><td>7</td></tr><tr><th scope="row">7</th><td>2</td><td>2</td><td>8</td></tr><tr><th scope="row">8</th><td>2</td><td>4</td><td>5</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>当前 prefix（写入后已递减）</caption><thead><tr><th scope="col">数字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>5</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>8</td></tr></tbody></table></details>

<a id="source-307"></a>

## 第 8 步：把结果复制回 nums

最后将有序结果数组 res 中的十个元素按索引复制回原数组 nums，上方 nums 随即更新为 \[0, 0, 0, 1, 1, 2, 2, 2, 4, 4\]，计数排序全部完成。

<details><summary>本步完整状态</summary><p>res 已复制回 nums，两数组均已升序，计数排序完成。prefix 保留各分区的左边界计数，不是全零；完整值见当前表。</p><table><caption>当前 nums 与 res</caption><thead><tr><th scope="col">索引</th><th scope="col">nums 值</th><th scope="col">res 值或写入状态</th><th scope="col">res 元素的原始索引</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td><td>0</td><td>1</td></tr><tr><th scope="row">1</th><td>0</td><td>0</td><td>4</td></tr><tr><th scope="row">2</th><td>0</td><td>0</td><td>6</td></tr><tr><th scope="row">3</th><td>1</td><td>1</td><td>0</td></tr><tr><th scope="row">4</th><td>1</td><td>1</td><td>2</td></tr><tr><th scope="row">5</th><td>2</td><td>2</td><td>3</td></tr><tr><th scope="row">6</th><td>2</td><td>2</td><td>7</td></tr><tr><th scope="row">7</th><td>2</td><td>2</td><td>8</td></tr><tr><th scope="row">8</th><td>4</td><td>4</td><td>5</td></tr><tr><th scope="row">9</th><td>4</td><td>4</td><td>9</td></tr></tbody></table><table><caption>当前 prefix（写入后已递减）</caption><thead><tr><th scope="col">数字 num</th><th scope="col">prefix[num]</th></tr></thead><tbody><tr><th scope="row">0</th><td>0</td></tr><tr><th scope="row">1</th><td>3</td></tr><tr><th scope="row">2</th><td>5</td></tr><tr><th scope="row">3</th><td>8</td></tr><tr><th scope="row">4</th><td>8</td></tr></tbody></table></details>

## 结果

遍历结束后得到完整有序的结果数组 res = \[0, 0, 0, 1, 1, 2, 2, 2, 4, 4\]，再将其复制回原数组 nums。此时递减后的 prefix 变为 \[0, 3, 5, 8, 8\]，代表各数值槽位全部消耗完毕后的左边界（并非全零，也不是排序输出）。
