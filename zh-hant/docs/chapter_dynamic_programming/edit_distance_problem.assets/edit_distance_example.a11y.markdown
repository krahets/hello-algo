<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: 38c23ba9952aa86dc0063d22a8d2ad39612d50292b4ed15380e7006d17b8faba -->

# 編輯距離：兩個三步轉換示例

展示將 kitten 轉為 sitting（2 次替換、1 次新增）以及將 hello 轉為 algo（1 次刪除、2 次替換）的字元對應關係，兩組示例的最少編輯步數均為 3。

## 問題與輸入

編輯距離（Levenshtein 距離）衡量兩個字串之間互相轉換所需的最少單字元編輯次數。每次允許執行三種操作之一：插入（新增）一個字元、刪除一個字元，或將一個字元替換為任意字元。

## 結構與關係

畫面左右並列展示兩組字串轉換的字元逐位對齊圖：

左圖將源字串 s = kitten 轉換為目標字串 t = sitting：首字母 k 替換為 s（藍色），第 5 個字母 e 替換為 i（藍色），並在末尾新增字母 g（紫色）；其餘未修改的 4 個字母 i、t、t、n 原樣保留，中間行與目標行以豎直虛線對齊。

右圖將源字串 s = hello 轉換為目標字串 t = algo：首字母 h 被刪除（在中間過渡行以淡橙色虛化顯示 h，不再向下進入目標串），第 2 個字母 e 替換為 a（藍色），兩個連續 l 中的後一個 l 替換為 g（藍色），而前一個 l 與末尾 o 原樣保留，中間行與目標行以豎直虛線對齊。圖中箭頭用於標示各字元位置的編輯型別與對應關係，並不強行規定這三次編輯的唯一先後執行順序。

<table><caption>兩組編輯操作</caption><thead><tr><th scope="col">起點</th><th scope="col">終點</th><th scope="col">替換</th><th scope="col">插入或刪除</th><th scope="col">步數</th></tr></thead><tbody><tr><td>kitten</td><td>sitting</td><td>k→s；e→i</td><td>末尾插入g</td><td>3</td></tr><tr><td>hello</td><td>algo</td><td>e→a；後一個l→g</td><td>刪除開頭h</td><td>3</td></tr></tbody></table>

<a id="source-441"></a>

## 字元逐位對齊展示兩組三步編輯過程

左側對 s = kitten 執行 k → s、e → i 兩次替換並在末尾新增 g，長度由 6 變為 7 得到 t = sitting；右側對 s = hello 刪除開頭 h（中間行淡色 h 標示刪除），並將 e → a、後一個 l → g，長度由 5 變為 4 得到 t = algo。兩例均透過 3 次基本編輯操作完成轉換。

## 結果

左圖 kitten → sitting 透過 2 次替換加 1 次新增完成，右圖 hello → algo 透過 1 次刪除加 2 次替換完成，兩組示例的編輯距離均為 3。
