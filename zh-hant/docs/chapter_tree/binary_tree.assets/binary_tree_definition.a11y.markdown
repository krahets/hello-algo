<!-- Generated from adjacent .a11y.json; edit the author record, not this file. -->
<!-- figure-reading-content-sha256: b4de4faa5e7990f084e3ef6816cf9a7bf5d8e218fdcdf775d3ca2bdc2bb3242a -->

# 二元樹的節點與子樹

以根節點與左右分支為例，區分直接相連的單個子節點與包含其全部後代的子樹。

<table><caption>圖中全部非葉節點的左右子節點</caption><thead><tr><th scope="col">父節點</th><th scope="col">左子節點</th><th scope="col">右子節點</th></tr></thead><tbody><tr><th scope="row">1</th><td>2</td><td>3</td></tr><tr><th scope="row">2</th><td>4</td><td>5</td></tr><tr><th scope="row">3</th><td>6</td><td>7</td></tr><tr><th scope="row">4</th><td>8</td><td>9</td></tr><tr><th scope="row">5</th><td>10</td><td>11</td></tr><tr><th scope="row">6</th><td>12</td><td>13</td></tr><tr><th scope="row">7</th><td>14</td><td>15</td></tr></tbody></table>

<a id="source-89"></a>

以根節點 1 為參照，直接相連的左子節點是單個節點 2，右子節點是單個節點 3；而左子樹是以 2 為根的整棵樹，包含 2、4、5、8、9、10、11 共 7 個節點，右子樹以 3 為根，包含 3、6、7、12、13、14、15 共 7 個節點。子樹包含其根及全部後代，範圍大於單個子節點。

## 結果

父子與子樹關係均相對所選參考節點而言：1 是 2、3 的父節點，2 又是 4、5 的父節點。圖中把根 1 標作“父節點”僅表示它是 2、3 的父節點，根節點自身沒有父節點。
