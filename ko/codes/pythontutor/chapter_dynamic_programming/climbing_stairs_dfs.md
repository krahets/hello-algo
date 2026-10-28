<!--
    File: climbing_stairs_dfs.md
    Created Time: 2024-01-05
    Author: krahets (krahets@163.com)
--->

<!-- [file]{climbing_stairs_dfs}-[class]{}-[func]{climbing_stairs_dfs} -->
https://pythontutor.com/render.html#code=def%20dfs%28i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20dp%5B1%5D%EA%B3%BC%20dp%5B2%5D%EB%8A%94%20%EC%9D%B4%EB%AF%B8%20%EC%95%8C%EA%B3%A0%20%EC%9E%88%EC%9C%BC%EB%AF%80%EB%A1%9C%20%ED%95%B4%EB%8B%B9%20%EA%B0%92%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%29%20%2B%20dfs%28i%20-%202%29%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B3%84%EB%8B%A8%20%EC%98%A4%EB%A5%B4%EA%B8%B0%3A%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20return%20dfs%28n%29%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%EA%B0%9C%EC%9D%98%20%EA%B3%84%EB%8B%A8%EC%9D%84%20%EC%98%A4%EB%A5%B4%EB%8A%94%20%EB%B0%A9%EB%B2%95%EC%9D%80%20%EC%B4%9D%20%7Bres%7D%EA%B0%80%EC%A7%80%EC%9D%B4%EB%8B%A4%22%29&cumulative=false&curInstr=5&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
