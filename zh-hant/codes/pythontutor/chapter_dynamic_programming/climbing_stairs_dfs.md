<!--
    File: climbing_stairs_dfs.md
    Created Time: 2024-01-05
    Author: krahets (krahets@163.com)
--->

<!-- [file]{climbing_stairs_dfs}-[class]{}-[func]{climbing_stairs_dfs} -->
https://pythontutor.com/render.html#code=def%20dfs%28i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20%E5%B7%B2%E7%9F%A5%20dp%5B1%5D%20%E5%92%8C%20dp%5B2%5D%EF%BC%8C%E7%9B%B4%E6%8E%A5%E5%9B%9E%E5%82%B3%E5%B0%8D%E6%87%89%E7%9A%84%E5%80%BC%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%29%20%2B%20dfs%28i%20-%202%29%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20return%20dfs%28n%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E8%B5%B0%E6%B3%95%22%29&cumulative=false&curInstr=5&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
