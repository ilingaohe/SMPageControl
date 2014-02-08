# SMPageControl自定义修改

SMPageControl的官方Github库地址为 [https://github.com/Spaceman-Labs/SMPageControl](https://github.com/Spaceman-Labs/SMPageControl)

这个只是根据应用的需要对SMPageControl点击区域的一个小修改。

SMPageControl点击使用的pageRct区域为page image的大小，点击page image的上下左右空白区域的话，默认是没有点中的行为的。
这个修改为调整pageRect的区域大小，垂直部分占满整个SMPageControl的高度，水平部分根据page数进行均分。这样即使点击一个page image旁边的空白区域，也会产生点中的行为。
