<div style="position: relative; cursor: move; width: 23552px; left: -23552px;" class="slider">
<a href="pages.php?id=join" class="item item1"></a>
<a href="pages.php?id=join" class="item item2"></a>
<a href="pages.php?id=join" class="item item3"></a>
<a href="pages.php?id=join" class="item item4"></a>
<a href="pages.php?id=join" class="item item5"></a>
<a href="pages.php?id=join" class="item"></a>
<a href="pages.php?id=join" class="item"></a>
<a href="pages.php?id=join" class="item"></a>
<a href="pages.php?id=join" class="item"></a>
<a href="pages.php?id=join" class="item"></a>
<a href="pages.php?id=join" class="item"></a>
<a href="pages.php?id=join" class="item"></a>
<a href="pages.php?id=join" class="item"></a>
</div>


<script>
{literal}
var index;
var picURLS = ["http://drsusanblock.tv/galleries/features-1.png", "http://drsusanblock.tv/galleries/features-2.png", "http://drsusanblock.tv/galleries/features-3.png", "http://www.drsusanblock.tv/galleries/gallery-pop-1.jpg", "http://www.drsusanblock.tv/galleries/gallery-pop-2.jpg", "http://www.drsusanblock.tv/galleries/gallery-pop-3.jpg", "http://www.drsusanblock.tv/galleries/gallery-pop-4.jpg", "http://www.drsusanblock.tv/galleries/gallery-pop-5.jpg", "http://www.drsusanblock.tv/galleries/gallery-pop-6.jpg", "http://www.drsusanblock.tv/galleries/gallery-pop-7.jpg", "http://www.drsusanblock.tv/galleries/gallery-1.jpg", "http://www.drsusanblock.tv/galleries/gallery-2.jpg", "http://www.drsusanblock.tv/galleries/gallery-3.jpg",
];
document.write('<style>');
for (index = 0; index < picURLS.length; ++index) {
    var currentIndex = index + 1;
    console.log(picURLS[index]);
    document.write('.iosSlider .slider .item'+ currentIndex +' {background: url("'+picURLS[index]+'") no-repeat 0 0; }')
}
document.write('</style>');
{/literal}
</script>
