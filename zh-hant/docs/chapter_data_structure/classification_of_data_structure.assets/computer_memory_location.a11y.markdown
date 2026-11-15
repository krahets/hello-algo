<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: bba7f45e1465e1bcd03020118fbe21f62262da5c62251f938906a1ce27bfbdf4 -->

# 用位址訪問記憶體

由行起始位址加列偏移定位記憶體單元，讀取其中的資料。

## 結構與關係

圖例用淺色表示可用空間、深色表示已用空間；可用僅代表狀態空閒，不等於其中已經存有數值0。

<table><caption>圖中兩個已用記憶體單元</caption><thead><tr><th scope="col">完整位址</th><th scope="col">行起始位址</th><th scope="col">列偏移</th><th scope="col">儲存資料</th></tr></thead><tbody><tr><th scope="row">0x0012</th><td>0x0010</td><td>02</td><td>1</td></tr><tr><th scope="row">0x0024</th><td>0x0020</td><td>04</td><td>2</td></tr></tbody></table>

<a id="source-39"></a>

本圖以二維網格類比記憶體定址：行起始位址0x0010加列偏移02得到位址0x0012，從中讀出資料1；行起始位址0x0020加列偏移04得到位址0x0024，從中讀出資料2。位址用來標識單元位置，資料則是該單元存放的內容，二者不可混同。

## 結果

程式透過唯一位址定位目標記憶體單元。網格是定址類比，不是實際晶片電路或虛擬記憶體管理模型。
