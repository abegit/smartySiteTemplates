<div style="position: relative; cursor: move; width: 23552px; left: -23552px;" class="slider">
<div class="item item1"></div>
<div class="item item2"></div>
<div class="item item3"></div>
<div class="item item4"></div>
<div class="item item5"></div>
<div class="item"></div>
<div class="item"></div>
<div class="item"></div>
<div class="item"></div>
<div class="item"></div>
<div class="item"></div>
<div class="item"></div>
<div class="item"></div>
<div class="item"></div>
<div class="item"></div>
<div class="item"></div>
</div>


<script>
{literal}
var index;
var picURLS = ["http://www.drsusanblock.tv/galleries/20111231_NewYear_1.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_2.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_3.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_4.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_5.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_6.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_7.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_8.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_9.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_10.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_11.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_12.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_13.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_14.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_15.jpg", "http://www.drsusanblock.tv/galleries/20111231_NewYear_16.jpg",
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
