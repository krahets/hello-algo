<!--
    File: selection_sort.md
    Created Time: 2024-01-05
    Author: krahets (krahets@163.com)
--->

<!-- [file]{selection_sort}-[class]{}-[func]{selection_sort} -->
https://pythontutor.com/render.html#code=def%20selection_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Selection%20sort%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20unsorted%20range%20is%20%5Bi,%20n-1%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20find%20the%20smallest%20element%20in%20the%20unsorted%20range%0A%20%20%20%20%20%20%20%20k%20%3D%20i%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%20%2B%201,%20n%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3C%20nums%5Bk%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20k%20%3D%20j%20%20%23%20Record%20the%20index%20of%20the%20smallest%20element%0A%20%20%20%20%20%20%20%20%23%20Swap%20the%20smallest%20element%20with%20the%20first%20element%20of%20the%20unsorted%20range%0A%20%20%20%20%20%20%20%20nums%5Bi%5D,%20nums%5Bk%5D%20%3D%20nums%5Bk%5D,%20nums%5Bi%5D%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20selection_sort%28nums%29%0A%20%20%20%20print%28%22After%20selection%20sort,%20nums%20%3D%22,%20nums%29&cumulative=false&curInstr=4&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
