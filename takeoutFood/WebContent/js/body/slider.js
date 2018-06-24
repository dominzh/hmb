window.onload = function(){
	function $(id){return document.getElementById(id);}
	//获取元素
	var js_slider = $("js_slider");
	var slider_main_block = $("slider_main_block");
	var imgs = slider_main_block.children; // 获取轮播图片数组
	var slider_ctrl = $("slider_ctrl");
	
	//操作元素
	for(var i = 0; i < imgs.length; i++){
		var span = document.createElement("span");
		span.className = "slider-ctrl-con";
		span.innerHTML = imgs.length-i;
		// 指定的已有子节点之前插入新的子节点,insertBefore(newItem,existingItem);
		slider_ctrl.insertBefore(span, slider_ctrl.children[1]);
	}
	
	var spans = slider_ctrl.children;
	spans[1].setAttribute("class","slider-ctrl-con current");
	
	var scrollWidth = js_slider.offsetWidth;
//	console.log(scrollWidth);
	for(var i = 1; i < imgs.length; i++){ // 第一张图片 留下   其余的人走到 1000的位置上  
		imgs[i].style.left = scrollWidth+"px";
	}
	
	//遍历三个按钮
	var icu = 0;
	for(var k in spans){  //k  是索引号  spans[k]    spans[0]  第一个span 
		spans[k].onclick = function(){
			if(this.className == "slider-ctrl-prev"){
				//alert("prev"); 当我们左侧点击时候， 当前的这张图片 先慢慢的走到右边  上一张 一定先快速走到左侧 （-310）的位置，然后慢慢的走到舞台中  
				animate(imgs[icu], {left: scrollWidth}); // json数值对,动画对象的运动属性
				--icu<0 ? icu = imgs.length-1 : icu; // 如果是第一张图片且点击prev按钮的话，即显示第四张图片
				imgs[icu].style.left =  -scrollWidth +"px";
//				console.log(scrollWidth);
				animate(imgs[icu], {left: 0});
			}else if(this.className == "slider-ctrl-next"){				
				autoplay();
			}else{
				// 我们首先要知道我们点击是第几张图片  --- 获得当前的索引号  
				var that = this.innerHTML - 1;
				if(that > icu){
					animate(imgs[icu], {left: -scrollWidth}); // 当前的这张慢慢的走出去 左侧  
					// console.log(scrollWidth);
					imgs[that].style.left = scrollWidth + "px";	 // 点击的那个索引号 快速走到右侧  1000				
				}else if(that < icu){
					animate(imgs[icu], {left: scrollWidth});
					imgs[that].style.left = -scrollWidth + "px";
				}
				icu = that;
				animate(imgs[icu], {left: 0});
//				setSquare();
			}
			setSquare();
		}
	}
	 //  一个可以控制 播放span 的 函数   当前
	function setSquare(){
		for(var i = 1; i < spans.length-1; i++){
			spans[i].className = "slider-ctrl-con";
		}
		spans[icu+1].className = "slider-ctrl-con current";
	}
	 // 定时器开始  其实， 定时器就是  右侧按钮
	var timer = null;
	timer = setInterval(autoplay,2000);
	function autoplay(){
		 //  当我们点击时候， 当前的这张图片 先慢慢的走到左边  下一张 一定先快速走到右侧 （1000）的位置，然后慢慢的走到舞台中  
		animate(imgs[icu], {left: -scrollWidth});
				++icu > imgs.length-1 ? icu = 0:icu;
				imgs[icu].style.left = scrollWidth +"px";
				animate(imgs[icu], {left: 0});
				setSquare();
	}
	 //鼠标经过清除定时器
	js_slider.onmouseover = function(){
		clearInterval(timer);
	}
	js_slider.onmouseout = function(){
		clearInterval(timer);
		timer = setInterval(autoplay,2000);
	}
}
