<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 92bb86304fbac325153abf5c623c7a8492779be7ecebd4d5b2c6f8e0204e5805 -->

# 用地址访问内存

由行起始地址加列偏移定位内存单元，读取其中的数据。

## 结构与关系

图例用浅色表示可用空间、深色表示已用空间；可用仅代表状态空闲，不等于其中已经存有数值0。

<table><caption>图中两个已用内存单元</caption><thead><tr><th scope="col">完整地址</th><th scope="col">行起始地址</th><th scope="col">列偏移</th><th scope="col">存储数据</th></tr></thead><tbody><tr><th scope="row">0x0012</th><td>0x0010</td><td>02</td><td>1</td></tr><tr><th scope="row">0x0024</th><td>0x0020</td><td>04</td><td>2</td></tr></tbody></table>

<a id="source-39"></a>

本图以二维网格类比内存寻址：行起始地址0x0010加列偏移02得到地址0x0012，从中读出数据1；行起始地址0x0020加列偏移04得到地址0x0024，从中读出数据2。地址用来标识单元位置，数据则是该单元存放的内容，二者不可混同。

## 结果

程序通过唯一地址定位目标内存单元。网格是寻址类比，不是实际芯片电路或虚拟内存管理模型。
