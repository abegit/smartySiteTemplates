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
<a href="pages.php?id=join" class="item"></a>
<a href="pages.php?id=join" class="item"></a>
<a href="pages.php?id=join" class="item"></a>
</div>


<script>
{literal}
var index;
var picURLS = ["http://drsusanblock.tv/galleries/features-1.png", "http://drsusanblock.tv/galleries/features-2.png", "http://drsusanblock.tv/galleries/features-3.png", "http://drsusanblock.tv/galleries/20111231_NewYear_4.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_5.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_6.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_7.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_8.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_9.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_10.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_11.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_12.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_13.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_14.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_15.jpg", "http://drsusanblock.tv/galleries/20111231_NewYear_16.jpg",
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
