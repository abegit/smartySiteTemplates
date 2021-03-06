/*	table of le contents
 *	-iosslider
 *  -stackBlur
 *	-TV INITIATION
 *
 *
 * iosSlider - http://iosscripts.com/iosslider/
 * 
 * Touch Enabled, Responsive jQuery Horizontal Content Slider/Carousel/Image Gallery Plugin
 *
 * A jQuery plugin which allows you to integrate a customizable, cross-browser 
 * content slider into your web presence. Designed for use as a content slider, carousel, 
 * scrolling website banner, or image gallery.
 * 
 * Copyright (c) 2013 Marc Whitbread
 * 
 * Version: v1.3.5 (07/11/2013)
 * Minimum requirements: jQuery v1.4+
 *
 * Advanced requirements:
 * 1) jQuery bind() click event override on slide requires jQuery v1.6+
 *
 * Terms of use:
 *
 * 1) iosSlider is licensed under the Creative Commons – Attribution-NonCommercial 3.0 License.
 * 2) You may use iosSlider free for personal or non-profit purposes, without restriction.
 *	  Attribution is not required but always appreciated. For commercial projects, you
 *	  must purchase a license. You may download and play with the script before deciding to
 *	  fully implement it in your project. Making sure you are satisfied, and knowing iosSlider
 *	  is the right script for your project is paramount.
 * 3) You are not permitted to make the resources found on iosscripts.com available for
 *    distribution elsewhere "as is" without prior consent. If you would like to feature
 *    iosSlider on your site, please do not link directly to the resource zip files. Please
 *    link to the appropriate page on iosscripts.com where users can find the download.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 */
 
(function(b){var na=0,W=0,da=0,L=0,za="ontouchstart"in window,Ba="onorientationchange"in window,ea=!1,aa=!1,X=!1,oa=!1,ha=!1,ia="pointer",sa="pointer",ja=[],T=[],ta=[],$=[],B=[],ba=[],w=[],m=[],s=[],ua=[],fa=[],e={showScrollbar:function(a,e){a.scrollbarHide&&b("."+e).css({opacity:a.scrollbarOpacity,filter:"alpha(opacity:"+100*a.scrollbarOpacity+")"})},hideScrollbar:function(b,f,c,g,h,d,m,s,B,w){if(b.scrollbar&&b.scrollbarHide)for(var t=c;t<c+25;t++)f[f.length]=e.hideScrollbarIntervalTimer(10*t,g[c], (c+24-t)/24,h,d,m,s,B,w,b)},hideScrollbarInterval:function(a,f,c,g,h,d,m,B,w){L=-1*a/s[B]*(h-d-m-g);e.setSliderOffset("."+c,L);b("."+c).css({opacity:w.scrollbarOpacity*f,filter:"alpha(opacity:"+100*w.scrollbarOpacity*f+")"})},slowScrollHorizontalInterval:function(a,f,c,g,h,d,K,O,N,J,t,y,z,x,v,q,G,p,n){if(n.infiniteSlider){if(c<=-1*s[q]){var r=b(a).width();if(c<=-1*ua[q]){var u=-1*t[0];b(f).each(function(c){e.setSliderOffset(b(f)[c],u+G);c<y.length&&(y[c]=-1*u);u+=v[c]});c+=-1*y[0];m[q]=-1*y[0]+G; s[q]=m[q]+r-d;w[q]=0}else{var k=0,C=e.getSliderOffset(b(f[0]),"x");b(f).each(function(c){e.getSliderOffset(this,"x")<C&&(C=e.getSliderOffset(this,"x"),k=c)});z=m[q]+r;e.setSliderOffset(b(f)[k],z);m[q]=-1*y[1]+G;s[q]=m[q]+r-d;y.splice(0,1);y.splice(y.length,0,-1*z+G);w[q]++}}if(c>=-1*m[q]||0<=c){r=b(a).width();if(0<=c)for(u=-1*t[0],b(f).each(function(c){e.setSliderOffset(b(f)[c],u+G);c<y.length&&(y[c]=-1*u);u+=v[c]}),c-=-1*y[0],m[q]=-1*y[0]+G,s[q]=m[q]+r-d,w[q]=x;0<-1*y[0]-r+G;){var A=0,I=e.getSliderOffset(b(f[0]), "x");b(f).each(function(c){e.getSliderOffset(this,"x")>I&&(I=e.getSliderOffset(this,"x"),A=c)});z=m[q]-v[A];e.setSliderOffset(b(f)[A],z);y.splice(0,0,-1*z+G);y.splice(y.length-1,1);m[q]=-1*y[0]+G;s[q]=m[q]+r-d;w[q]--;B[q]++}0>c&&(A=0,I=e.getSliderOffset(b(f[0]),"x"),b(f).each(function(c){e.getSliderOffset(this,"x")>I&&(I=e.getSliderOffset(this,"x"),A=c)}),z=m[q]-v[A],e.setSliderOffset(b(f)[A],z),y.splice(0,0,-1*z+G),y.splice(y.length-1,1),m[q]=-1*y[0]+G,s[q]=m[q]+r-d,w[q]--)}}t=!1;d=e.calcActiveOffset(n, c,y,d,w[q],x,J,q);z=(d+w[q]+x)%x;n.infiniteSlider?z!=ba[q]&&(t=!0):d!=B[q]&&(t=!0);if(t&&(x=new e.args("change",n,a,b(a).children(":eq("+z+")"),z,p),b(a).parent().data("args",x),""!=n.onSlideChange))n.onSlideChange(x);B[q]=d;ba[q]=z;c=Math.floor(c);e.setSliderOffset(a,c);n.scrollbar&&(L=Math.floor((-1*c-m[q]+G)/(s[q]-m[q]+G)*(K-O-h)),a=h-N,c>=-1*m[q]+G?(a=h-N- -1*L,e.setSliderOffset(b("."+g),0)):(c<=-1*s[q]+1&&(a=K-O-N-L),e.setSliderOffset(b("."+g),L)),b("."+g).css({width:a+"px"}))},slowScrollHorizontal:function(a, f,c,g,h,d,K,O,N,J,t,y,z,x,v,q,G,p,n,r,u){var k=e.getSliderOffset(a,"x");d=[];var C=0,A=25/1024*O;frictionCoefficient=u.frictionCoefficient;elasticFrictionCoefficient=u.elasticFrictionCoefficient;snapFrictionCoefficient=u.snapFrictionCoefficient;h>u.snapVelocityThreshold&&u.snapToChildren&&!n?C=1:h<-1*u.snapVelocityThreshold&&(u.snapToChildren&&!n)&&(C=-1);h<-1*A?h=-1*A:h>A&&(h=A);b(a)[0]!==b(p)[0]&&(C*=-1,h*=-2);p=w[v];if(u.infiniteSlider)var I=m[v],l=s[v];n=[];for(var A=[],E=0;E<z.length;E++)n[E]= z[E],E<f.length&&(A[E]=e.getSliderOffset(b(f[E]),"x"));for(;1<h||-1>h;){h*=frictionCoefficient;k+=h;(k>-1*m[v]||k<-1*s[v])&&!u.infiniteSlider&&(h*=elasticFrictionCoefficient,k+=h);if(u.infiniteSlider){if(k<=-1*l){for(var l=b(a).width(),L=0,Q=A[0],E=0;E<A.length;E++)A[E]<Q&&(Q=A[E],L=E);E=I+l;A[L]=E;I=-1*n[1]+r;l=I+l-O;n.splice(0,1);n.splice(n.length,0,-1*E+r);p++}if(k>=-1*I){l=b(a).width();L=0;Q=A[0];for(E=0;E<A.length;E++)A[E]>Q&&(Q=A[E],L=E);E=I-x[L];A[L]=E;n.splice(0,0,-1*E+r);n.splice(n.length- 1,1);I=-1*n[0]+r;l=I+l-O;p--}}d[d.length]=k}A=!1;h=e.calcActiveOffset(u,k,n,O,p,G,B[v],v);I=(h+p+G)%G;u.snapToChildren&&(u.infiniteSlider?I!=ba[v]&&(A=!0):h!=B[v]&&(A=!0),0>C&&!A?(h++,h>=z.length&&!u.infinteSlider&&(h=z.length-1)):0<C&&!A&&(h--,0>h&&!u.infinteSlider&&(h=0)));if(u.snapToChildren||(k>-1*m[v]||k<-1*s[v])&&!u.infiniteSlider){(k>-1*m[v]||k<-1*s[v])&&!u.infiniteSlider?d.splice(0,d.length):(d.splice(0.1*d.length,d.length),k=0<d.length?d[d.length-1]:k);for(;k<n[h]-0.5||k>n[h]+0.5;)k=(k-n[h])* snapFrictionCoefficient+n[h],d[d.length]=k;d[d.length]=n[h]}C=1;0!=d.length%2&&(C=0);for(k=0;k<c.length;k++)clearTimeout(c[k]);p=(h+p+G)%G;I=0;for(k=C;k<d.length;k+=2)if(k==C||1<Math.abs(d[k]-I)||k>=d.length-2)I=d[k],c[c.length]=e.slowScrollHorizontalIntervalTimer(10*k,a,f,d[k],g,K,O,N,J,t,h,y,z,q,G,x,v,r,p,u);I=(h+w[v]+G)%G;""!=u.onSlideComplete&&1<d.length&&(c[c.length]=e.onSlideCompleteTimer(10*(k+1),u,a,b(a).children(":eq("+I+")"),p,v));$[v]=c;e.hideScrollbar(u,c,k,d,g,K,O,J,t,v)},onSlideComplete:function(a, f,c,g,h){c=new e.args("complete",a,b(f),c,g,g);b(f).parent().data("args",c);if(""!=a.onSlideComplete)a.onSlideComplete(c)},getSliderOffset:function(a,e){var c=0;e="x"==e?4:5;if(!ea||aa||X)c=parseInt(b(a).css("left"),10);else{for(var c=["-webkit-transform","-moz-transform","transform"],g,h=0;h<c.length;h++)if(void 0!=b(a).css(c[h])&&0<b(a).css(c[h]).length){g=b(a).css(c[h]).split(",");break}c=void 0==g[e]?0:parseInt(g[e],10)}return c},setSliderOffset:function(a,e){!ea||aa||X?b(a).css({left:e+"px"}): b(a).css({webkitTransform:"matrix(1,0,0,1,"+e+",0)",MozTransform:"matrix(1,0,0,1,"+e+",0)",transform:"matrix(1,0,0,1,"+e+",0)"})},setBrowserInfo:function(){null!=navigator.userAgent.match("WebKit")?(ia="-webkit-grab",sa="-webkit-grabbing"):null!=navigator.userAgent.match("Gecko")?(ha=!0,ia="move",sa="-moz-grabbing"):null!=navigator.userAgent.match("MSIE 7")?oa=aa=!0:null!=navigator.userAgent.match("MSIE 8")?oa=X=!0:null!=navigator.userAgent.match("MSIE 9")&&(oa=!0)},has3DTransform:function(){var a= !1,e=b("<div />").css({webkitTransform:"matrix(1,1,1,1,1,1)",MozTransform:"matrix(1,1,1,1,1,1)",transform:"matrix(1,1,1,1,1,1)"});""==e.attr("style")?a=!1:ha&&!za&&21<=parseInt(navigator.userAgent.split("/")[3],10)?a=!1:void 0!=e.attr("style")&&(a=!0);return a},getSlideNumber:function(b,e,c){return(b-w[e]+c)%c},calcActiveOffset:function(b,e,c,g,h,d,m,s){h=!1;b=[];var w;e>c[0]&&(w=0);e<c[c.length-1]&&(w=d-1);for(d=0;d<c.length;d++)c[d]<=e&&c[d]>e-g&&(h||c[d]==e||(b[b.length]=c[d-1]),b[b.length]=c[d], h=!0);0==b.length&&(b[0]=c[c.length-1]);for(d=h=0;d<b.length;d++)m=Math.abs(e-b[d]),m<g&&(h=b[d],g=m);for(d=0;d<c.length;d++)h==c[d]&&(w=d);return w},changeSlide:function(a,f,c,g,h,d,m,s,N,J,t,y,z,x,v,q,G,p){e.autoSlidePause(x);for(var n=0;n<g.length;n++)clearTimeout(g[n]);var r=Math.ceil(p.autoSlideTransTimer/10)+1,u=e.getSliderOffset(f,"x"),k=y[a],k=k-u,C=a-(B[x]+w[x]+q)%q;if(p.infiniteSlider){a=(a-w[x]+2*q)%q;n=!1;0==a&&2==q&&(a=q,y[a]=y[a-1]-b(c).eq(0).outerWidth(!0),n=!0);var k=y[a],k=k-u,A= [y[a]-b(f).width(),y[a]+b(f).width()];n&&y.splice(y.length-1,1);for(n=0;n<A.length;n++)Math.abs(A[n]-u)<Math.abs(k)&&(k=A[n]-u);0>k&&-1==C?k+=b(f).width():0<k&&1==C&&(k-=b(f).width())}C=[];e.showScrollbar(p,h);for(n=0;n<=r;n++)A=n,A/=r,A--,A=u+k*(Math.pow(A,5)+1),C[C.length]=A;r=(a+w[x]+q)%q;for(n=u=0;n<C.length;n++){if(0==n||1<Math.abs(C[n]-u)||n>=C.length-2)u=C[n],g[n]=e.slowScrollHorizontalIntervalTimer(10*(n+1),f,c,C[n],h,d,m,s,N,J,a,t,y,v,q,z,x,G,r,p);0==n&&""!=p.onSlideStart&&(k=(B[x]+w[x]+ q)%q,p.onSlideStart(new e.args("start",p,f,b(f).children(":eq("+k+")"),k,a)))}u=!1;p.infiniteSlider?r!=ba[x]&&(u=!0):a!=B[x]&&(u=!0);u&&""!=p.onSlideComplete&&(g[g.length]=e.onSlideCompleteTimer(10*(n+1),p,f,b(f).children(":eq("+r+")"),r,x));$[x]=g;e.hideScrollbar(p,g,n,C,h,d,m,N,J,x);e.autoSlide(f,c,g,h,d,m,s,N,J,t,y,z,x,v,q,G,p)},autoSlide:function(b,f,c,g,h,d,m,s,N,J,t,y,z,x,v,q,G){if(!T[z].autoSlide)return!1;e.autoSlidePause(z);ja[z]=setTimeout(function(){!G.infiniteSlider&&B[z]>t.length-1&&(B[z]-= v);e.changeSlide((B[z]+w[z]+t.length+1)%t.length,b,f,c,g,h,d,m,s,N,J,t,y,z,x,v,q,G);e.autoSlide(b,f,c,g,h,d,m,s,N,J,t,y,z,x,v,q,G)},G.autoSlideTimer+G.autoSlideTransTimer)},autoSlidePause:function(b){clearTimeout(ja[b])},isUnselectable:function(a,e){return""!=e.unselectableSelector&&1==b(a).closest(e.unselectableSelector).size()?!0:!1},slowScrollHorizontalIntervalTimer:function(b,f,c,g,h,d,m,s,w,B,t,y,z,x,v,q,G,p,n,r){return setTimeout(function(){e.slowScrollHorizontalInterval(f,c,g,h,d,m,s,w,B,t, y,z,x,v,q,G,p,n,r)},b)},onSlideCompleteTimer:function(b,f,c,g,h,d){return setTimeout(function(){e.onSlideComplete(f,c,g,h,d)},b)},hideScrollbarIntervalTimer:function(b,f,c,g,h,d,m,s,w,B){return setTimeout(function(){e.hideScrollbarInterval(f,c,g,h,d,m,s,w,B)},b)},args:function(a,f,c,g,h,d){this.prevSlideNumber=void 0==b(c).parent().data("args")?void 0:b(c).parent().data("args").prevSlideNumber;this.prevSlideObject=void 0==b(c).parent().data("args")?void 0:b(c).parent().data("args").prevSlideObject; this.targetSlideNumber=d+1;this.targetSlideObject=b(c).children(":eq("+d+")");this.slideChanged=!1;"load"==a?this.targetSlideObject=this.targetSlideNumber=void 0:"start"==a?this.targetSlideObject=this.targetSlideNumber=void 0:"change"==a?(this.slideChanged=!0,this.prevSlideNumber=void 0==b(c).parent().data("args")?f.startAtSlide:b(c).parent().data("args").currentSlideNumber,this.prevSlideObject=b(c).children(":eq("+this.prevSlideNumber+")")):"complete"==a&&(this.slideChanged=b(c).parent().data("args").slideChanged); this.settings=f;this.data=b(c).parent().data("iosslider");this.sliderObject=c;this.sliderContainerObject=b(c).parent();this.currentSlideObject=g;this.currentSlideNumber=h+1;this.currentSliderOffset=-1*e.getSliderOffset(c,"x")},preventDrag:function(b){b.preventDefault()},preventClick:function(b){b.stopImmediatePropagation();return!1},enableClick:function(){return!0}};e.setBrowserInfo();var V={init:function(a,f){ea=e.has3DTransform();var c=b.extend(!0,{elasticPullResistance:0.6,frictionCoefficient:0.92, elasticFrictionCoefficient:0.6,snapFrictionCoefficient:0.92,snapToChildren:!1,snapSlideCenter:!1,startAtSlide:1,scrollbar:!1,scrollbarDrag:!1,scrollbarHide:!0,scrollbarLocation:"top",scrollbarContainer:"",scrollbarOpacity:0.4,scrollbarHeight:"4px",scrollbarBorder:"0",scrollbarMargin:"5px",scrollbarBackground:"#000",scrollbarBorderRadius:"100px",scrollbarShadow:"0 0 0 #000",scrollbarElasticPullResistance:0.9,desktopClickDrag:!1,keyboardControls:!1,tabToAdvance:!1,responsiveSlideContainer:!0,responsiveSlides:!0, navSlideSelector:"",navPrevSelector:"",navNextSelector:"",autoSlideToggleSelector:"",autoSlide:!1,autoSlideTimer:5E3,autoSlideTransTimer:750,autoSlideHoverPause:!0,infiniteSlider:!1,snapVelocityThreshold:5,slideStartVelocityThreshold:0,horizontalSlideLockThreshold:5,verticalSlideLockThreshold:3,stageCSS:{position:"relative",top:"0",left:"0",overflow:"hidden",zIndex:1},unselectableSelector:"",onSliderLoaded:"",onSliderUpdate:"",onSliderResize:"",onSlideStart:"",onSlideChange:"",onSlideComplete:""}, a);void 0==f&&(f=this);return b(f).each(function(a){function f(){e.autoSlidePause(d);va=b(F).find("a");ja=b(F).find("[onclick]");pa=b(F).find("*");b(n).css("width","");b(n).css("height","");b(F).css("width","");D=b(F).children().not("script").get();ga=[];M=[];c.responsiveSlides&&b(D).css("width","");s[d]=0;l=[];q=b(n).parent().width();r=b(n).outerWidth(!0);c.responsiveSlideContainer&&(r=b(n).outerWidth(!0)>q?q:b(n).outerWidth(!0));b(n).css({position:c.stageCSS.position,top:c.stageCSS.top,left:c.stageCSS.left, overflow:c.stageCSS.overflow,zIndex:c.stageCSS.zIndex,webkitPerspective:1E3,webkitBackfaceVisibility:"hidden",msTouchAction:"pan-y",width:r});b(c.unselectableSelector).css({cursor:"default"});for(var a=0;a<D.length;a++){ga[a]=b(D[a]).width();M[a]=b(D[a]).outerWidth(!0);var h=M[a];c.responsiveSlides&&(M[a]>r?(h=r+-1*(M[a]-ga[a]),ga[a]=h,M[a]=r):h=ga[a],b(D[a]).css({width:h}));b(D[a]).css({webkitBackfaceVisibility:"hidden",overflow:"hidden",position:"absolute"});l[a]=-1*s[d];s[d]=s[d]+h+(M[a]-ga[a])}c.snapSlideCenter&& (p=0.5*(r-M[0]),c.responsiveSlides&&M[0]>r&&(p=0));ua[d]=2*s[d];for(a=0;a<D.length;a++)e.setSliderOffset(b(D[a]),-1*l[a]+s[d]+p),l[a]-=s[d];if(!c.infiniteSlider&&!c.snapSlideCenter){for(a=0;a<l.length&&!(l[a]<=-1*(2*s[d]-r));a++)ha=a;l.splice(ha+1,l.length);l[l.length]=-1*(2*s[d]-r)}for(a=0;a<l.length;a++)E[a]=l[a];I&&(c.startAtSlide=T[d].startAtSlide>l.length?l.length:T[d].startAtSlide,c.infiniteSlider?(c.startAtSlide=(T[d].startAtSlide-1+H)%H,B[d]=T[d].startAtSlide):(c.startAtSlide=0>T[d].startAtSlide- 1?l.length-1:T[d].startAtSlide,B[d]=T[d].startAtSlide-1),ba[d]=B[d]);m[d]=s[d]+p;b(F).css({position:"relative",cursor:ia,webkitPerspective:"0",webkitBackfaceVisibility:"hidden",width:s[d]+"px"});R=s[d];s[d]=2*s[d]-r+2*p;(Y=R<r||0==r?!0:!1)&&b(F).css({cursor:"default"});G=b(n).parent().outerHeight(!0);u=b(n).height();c.responsiveSlideContainer&&(u=u>G?G:u);b(n).css({height:u});e.setSliderOffset(F,l[B[d]]);if(c.infiniteSlider&&!Y){a=e.getSliderOffset(b(F),"x");for(h=-1*((w[d]+H)%H);0>h;){var g=0,A= e.getSliderOffset(b(D[0]),"x");b(D).each(function(b){e.getSliderOffset(this,"x")<A&&(A=e.getSliderOffset(this,"x"),g=b)});var L=m[d]+R;e.setSliderOffset(b(D)[g],L);m[d]=-1*l[1]+p;s[d]=m[d]+R-r;l.splice(0,1);l.splice(l.length,0,-1*L+p);h++}for(;0<-1*l[0]-R+p&&c.snapSlideCenter&&I;){var N=0,O=e.getSliderOffset(b(D[0]),"x");b(D).each(function(b){e.getSliderOffset(this,"x")>O&&(O=e.getSliderOffset(this,"x"),N=b)});L=m[d]-M[N];e.setSliderOffset(b(D)[N],L);l.splice(0,0,-1*L+p);l.splice(l.length-1,1);m[d]= -1*l[0]+p;s[d]=m[d]+R-r;w[d]--;B[d]++}for(;a<=-1*s[d];)g=0,A=e.getSliderOffset(b(D[0]),"x"),b(D).each(function(b){e.getSliderOffset(this,"x")<A&&(A=e.getSliderOffset(this,"x"),g=b)}),L=m[d]+R,e.setSliderOffset(b(D)[g],L),m[d]=-1*l[1]+p,s[d]=m[d]+R-r,l.splice(0,1),l.splice(l.length,0,-1*L+p),w[d]++,B[d]--}e.setSliderOffset(F,l[B[d]]);c.desktopClickDrag||b(F).css({cursor:"default"});c.scrollbar&&(b("."+J).css({margin:c.scrollbarMargin,overflow:"hidden",display:"none"}),b("."+J+" ."+t).css({border:c.scrollbarBorder}), k=parseInt(b("."+J).css("marginLeft"))+parseInt(b("."+J).css("marginRight")),C=parseInt(b("."+J+" ."+t).css("borderLeftWidth"),10)+parseInt(b("."+J+" ."+t).css("borderRightWidth"),10),x=""!=c.scrollbarContainer?b(c.scrollbarContainer).width():r,v=r/R*(x-k),c.scrollbarHide||(V=c.scrollbarOpacity),b("."+J).css({position:"absolute",left:0,width:x-k+"px",margin:c.scrollbarMargin}),"top"==c.scrollbarLocation?b("."+J).css("top","0"):b("."+J).css("bottom","0"),b("."+J+" ."+t).css({borderRadius:c.scrollbarBorderRadius, background:c.scrollbarBackground,height:c.scrollbarHeight,width:v-C+"px",minWidth:c.scrollbarHeight,border:c.scrollbarBorder,webkitPerspective:1E3,webkitBackfaceVisibility:"hidden",position:"relative",opacity:V,filter:"alpha(opacity:"+100*V+")",boxShadow:c.scrollbarShadow}),e.setSliderOffset(b("."+J+" ."+t),Math.floor((-1*l[B[d]]-m[d]+p)/(s[d]-m[d]+p)*(x-k-v))),b("."+J).css({display:"block"}),y=b("."+J+" ."+t),z=b("."+J));c.scrollbarDrag&&!Y&&b("."+J+" ."+t).css({cursor:ia});c.infiniteSlider&&(S= (s[d]+r)/3);""!=c.navSlideSelector&&b(c.navSlideSelector).each(function(a){b(this).css({cursor:"pointer"});b(this).unbind(P).bind(P,function(f){"touchstart"==f.type?b(this).unbind("click.iosSliderEvent"):b(this).unbind("touchstart.iosSliderEvent");P=f.type+".iosSliderEvent";e.changeSlide(a,F,D,K,t,v,r,x,k,C,E,l,M,d,S,H,p,c)})});""!=c.navPrevSelector&&(b(c.navPrevSelector).css({cursor:"pointer"}),b(c.navPrevSelector).unbind(P).bind(P,function(a){"touchstart"==a.type?b(this).unbind("click.iosSliderEvent"): b(this).unbind("touchstart.iosSliderEvent");P=a.type+".iosSliderEvent";a=(B[d]+w[d]+H)%H;(0<a||c.infiniteSlider)&&e.changeSlide(a-1,F,D,K,t,v,r,x,k,C,E,l,M,d,S,H,p,c)}));""!=c.navNextSelector&&(b(c.navNextSelector).css({cursor:"pointer"}),b(c.navNextSelector).unbind(P).bind(P,function(a){"touchstart"==a.type?b(this).unbind("click.iosSliderEvent"):b(this).unbind("touchstart.iosSliderEvent");P=a.type+".iosSliderEvent";a=(B[d]+w[d]+H)%H;(a<l.length-1||c.infiniteSlider)&&e.changeSlide(a+1,F,D,K,t,v,r, x,k,C,E,l,M,d,S,H,p,c)}));c.autoSlide&&!Y&&""!=c.autoSlideToggleSelector&&(b(c.autoSlideToggleSelector).css({cursor:"pointer"}),b(c.autoSlideToggleSelector).unbind(P).bind(P,function(a){"touchstart"==a.type?b(this).unbind("click.iosSliderEvent"):b(this).unbind("touchstart.iosSliderEvent");P=a.type+".iosSliderEvent";wa?(e.autoSlide(F,D,K,t,v,r,x,k,C,E,l,M,d,S,H,p,c),wa=!1,b(c.autoSlideToggleSelector).removeClass("on")):(e.autoSlidePause(d),wa=!0,b(c.autoSlideToggleSelector).addClass("on"))}));e.autoSlide(F, D,K,t,v,r,x,k,C,E,l,M,d,S,H,p,c);b(n).bind("mouseleave.iosSliderEvent",function(){e.autoSlide(F,D,K,t,v,r,x,k,C,E,l,M,d,S,H,p,c)});b(n).bind("touchend.iosSliderEvent",function(){e.autoSlide(F,D,K,t,v,r,x,k,C,E,l,M,d,S,H,p,c)});c.autoSlidePauseHover&&b(n).bind("mouseenter.iosSliderEvent",function(){e.autoSlidePause(d)});b(n).data("iosslider",{obj:Aa,settings:c,scrollerNode:F,slideNodes:D,numberOfSlides:H,centeredSlideOffset:p,sliderNumber:d,originalOffsets:E,childrenOffsets:l,sliderMax:s[d],scrollbarClass:t, scrollbarWidth:v,scrollbarStageWidth:x,stageWidth:r,scrollMargin:k,scrollBorder:C,infiniteSliderOffset:w[d],infiniteSliderWidth:S,slideNodeOuterWidths:M});I=!1;return!0}na++;var d=na,K=[];T[d]=c;m[d]=0;s[d]=0;var O=[0,0],N=[0,0],J="scrollbarBlock"+na,t="scrollbar"+na,y,z,x,v,q,G,p=0,n=b(this),r,u,k,C,A,I=!0;a=-1;var l,E=[],V=0,Q=0,ea=0,F=b(this).children(":first-child"),D,ga,M,H=b(F).children().not("script").size(),U=!1,ha=0,xa=!1,qa=void 0,S;w[d]=0;var Y=!1,wa=!1;ta[d]=!1;var Z,ra=!1,ka=!1,P="touchstart.iosSliderEvent click.iosSliderEvent", R,va,ja,pa;fa[d]=!1;$[d]=[];c.scrollbarDrag&&(c.scrollbar=!0,c.scrollbarHide=!1);var Aa=b(this);if(void 0!=Aa.data("iosslider"))return!0;b(this).find("img").bind("dragstart.iosSliderEvent",function(b){b.preventDefault()});c.infiniteSlider&&(c.scrollbar=!1);c.infiniteSlider&&1==H&&(c.infiniteSlider=!1);c.scrollbar&&(""!=c.scrollbarContainer?b(c.scrollbarContainer).append("<div class = '"+J+"'><div class = '"+t+"'></div></div>"):b(F).parent().append("<div class = '"+J+"'><div class = '"+t+"'></div></div>")); if(!f())return!0;b(this).find("a").bind("mousedown",e.preventDrag);b(this).find("[onclick]").bind("click",e.preventDrag).each(function(){b(this).data("onclick",this.onclick)});a=e.calcActiveOffset(c,e.getSliderOffset(b(F),"x"),l,r,w[d],H,void 0,d);a=(a+w[d]+H)%H;a=new e.args("load",c,F,b(F).children(":eq("+a+")"),a,a);b(n).data("args",a);if(""!=c.onSliderLoaded)c.onSliderLoaded(a);if(T[d].responsiveSlides||T[d].responsiveSlideContainer)a=Ba?"orientationchange":"resize",b(window).bind(a+".iosSliderEvent-"+ d,function(){if(!f())return!0;var a=b(n).data("args");if(""!=c.onSliderResize)c.onSliderResize(a)});!c.keyboardControls&&!c.tabToAdvance||Y||b(document).bind("keydown.iosSliderEvent",function(b){aa||X||(b=b.originalEvent);if(37==b.keyCode&&c.keyboardControls)b.preventDefault(),b=(B[d]+w[d]+H)%H,(0<b||c.infiniteSlider)&&e.changeSlide(b-1,F,D,K,t,v,r,x,k,C,E,l,M,d,S,H,p,c);else if(39==b.keyCode&&c.keyboardControls||9==b.keyCode&&c.tabToAdvance)b.preventDefault(),b=(B[d]+w[d]+H)%H,(b<l.length-1||c.infiniteSlider)&& e.changeSlide(b+1,F,D,K,t,v,r,x,k,C,E,l,M,d,S,H,p,c)});if(za||c.desktopClickDrag){var ca=!1,la=b(F),ma=b(F),ya=!1;c.scrollbarDrag&&(la=la.add(y),ma=ma.add(z));b(la).bind("mousedown.iosSliderEvent touchstart.iosSliderEvent",function(a){if(ca)return!0;ca=!0;"touchstart"==a.type?b(ma).unbind("mousedown.iosSliderEvent"):b(ma).unbind("touchstart.iosSliderEvent");if(fa[d]||Y||(ya=e.isUnselectable(a.target,c)))return U=ca=!1,!0;Z=b(this)[0]===b(y)[0]?y:F;aa||X||(a=a.originalEvent);e.autoSlidePause(d);pa.unbind(".disableClick"); if("touchstart"==a.type)eventX=a.touches[0].pageX,eventY=a.touches[0].pageY;else{if(window.getSelection)window.getSelection().empty?window.getSelection().empty():window.getSelection().removeAllRanges&&window.getSelection().removeAllRanges();else if(document.selection)if(X)try{document.selection.empty()}catch(f){}else document.selection.empty();eventX=a.pageX;eventY=a.pageY;xa=!0;qa=F;b(this).css({cursor:sa})}O=[0,0];N=[0,0];W=0;U=!1;for(a=0;a<K.length;a++)clearTimeout(K[a]);a=e.getSliderOffset(F, "x");a>-1*m[d]+p+R?(a=-1*m[d]+p+R,e.setSliderOffset(b("."+t),a),b("."+t).css({width:v-C+"px"})):a<-1*s[d]&&(e.setSliderOffset(b("."+t),x-k-v),b("."+t).css({width:v-C+"px"}));a=b(this)[0]===b(y)[0]?m[d]:0;Q=-1*(e.getSliderOffset(this,"x")-eventX-a);e.getSliderOffset(this,"y");O[1]=eventX;N[1]=eventY;ka=!1});b(ma).bind("touchmove.iosSliderEvent mousemove.iosSliderEvent",function(a){aa||X||(a=a.originalEvent);if(fa[d]||Y||ya)return!0;var f=0;if("touchmove"==a.type)eventX=a.touches[0].pageX,eventY=a.touches[0].pageY; else{if(window.getSelection)window.getSelection().empty||window.getSelection().removeAllRanges&&window.getSelection().removeAllRanges();else if(document.selection)if(X)try{document.selection.empty()}catch(h){}else document.selection.empty();eventX=a.pageX;eventY=a.pageY;if(!xa||!oa&&("undefined"!=typeof a.webkitMovementX||"undefined"!=typeof a.webkitMovementY)&&0===a.webkitMovementY&&0===a.webkitMovementX)return!0}O[0]=O[1];O[1]=eventX;W=(O[1]-O[0])/2;N[0]=N[1];N[1]=eventY;da=(N[1]-N[0])/2;if(!U){var g= (B[d]+w[d]+H)%H,g=new e.args("start",c,F,b(F).children(":eq("+g+")"),g,void 0);b(n).data("args",g);if(""!=c.onSlideStart)c.onSlideStart(g)}(da>c.verticalSlideLockThreshold||da<-1*c.verticalSlideLockThreshold)&&("touchmove"==a.type&&!U)&&(ra=!0);(W>c.horizontalSlideLockThreshold||W<-1*c.horizontalSlideLockThreshold)&&"touchmove"==a.type&&a.preventDefault();if(W>c.slideStartVelocityThreshold||W<-1*c.slideStartVelocityThreshold)U=!0;if(U&&!ra){var g=e.getSliderOffset(F,"x"),q=b(Z)[0]===b(y)[0]?m[d]: p,u=b(Z)[0]===b(y)[0]?(m[d]-s[d]-p)/(scrollbarStageHeight-k-scrollbarHeight):1,z=b(Z)[0]===b(y)[0]?c.scrollbarElasticPullResistance:c.elasticPullResistance,G=c.snapSlideCenter&&b(Z)[0]===b(y)[0]?0:p,J=c.snapSlideCenter&&b(Z)[0]===b(y)[0]?p:0;"touchmove"==a.type&&(ea!=a.touches.length&&(Q=-1*g+eventX),ea=a.touches.length);if(c.infiniteSlider){if(g<=-1*s[d]){var I=b(F).width();if(g<=-1*ua[d]){var K=-1*E[0];b(D).each(function(a){e.setSliderOffset(b(D)[a],K+p);a<l.length&&(l[a]=-1*K);K+=M[a]});Q-=-1* l[0];m[d]=-1*l[0]+p;s[d]=m[d]+I-r;w[d]=0}else{var S=0,T=e.getSliderOffset(b(D[0]),"x");b(D).each(function(b){e.getSliderOffset(this,"x")<T&&(T=e.getSliderOffset(this,"x"),S=b)});z=m[d]+I;e.setSliderOffset(b(D)[S],z);m[d]=-1*l[1]+p;s[d]=m[d]+I-r;l.splice(0,1);l.splice(l.length,0,-1*z+p);w[d]++}}if(g>=-1*m[d]||0<=g)if(I=b(F).width(),0<=g)for(K=-1*E[0],b(D).each(function(a){e.setSliderOffset(b(D)[a],K+p);a<l.length&&(l[a]=-1*K);K+=M[a]}),Q+=-1*l[0],m[d]=-1*l[0]+p,s[d]=m[d]+I-r,w[d]=H;0<-1*l[0]-I+p;){var P= 0,R=e.getSliderOffset(b(D[0]),"x");b(D).each(function(b){e.getSliderOffset(this,"x")>R&&(R=e.getSliderOffset(this,"x"),P=b)});z=m[d]-M[P];e.setSliderOffset(b(D)[P],z);l.splice(0,0,-1*z+p);l.splice(l.length-1,1);m[d]=-1*l[0]+p;s[d]=m[d]+I-r;w[d]--;B[d]++}else P=0,R=e.getSliderOffset(b(D[0]),"x"),b(D).each(function(b){e.getSliderOffset(this,"x")>R&&(R=e.getSliderOffset(this,"x"),P=b)}),z=m[d]-M[P],e.setSliderOffset(b(D)[P],z),l.splice(0,0,-1*z+p),l.splice(l.length-1,1),m[d]=-1*l[0]+p,s[d]=m[d]+I-r, w[d]--}else I=b(F).width(),g>-1*m[d]+p&&(f=-1*(m[d]+-1*(Q-q-eventX+G)*u-q)*z/u),g<-1*s[d]&&(f=-1*(s[d]+J+-1*(Q-q-eventX)*u-q)*z/u);e.setSliderOffset(F,-1*(Q-q-eventX-f)*u-q+J);c.scrollbar&&(e.showScrollbar(c,t),L=Math.floor((Q-eventX-f-m[d]+G)/(s[d]-m[d]+p)*(x-k-v)*u),g=v,0>=L?(g=v-C- -1*L,e.setSliderOffset(b("."+t),0),b("."+t).css({width:g+"px"})):L>=x-k-C-v?(g=x-k-C-L,e.setSliderOffset(b("."+t),L),b("."+t).css({width:g+"px"})):e.setSliderOffset(b("."+t),L));"touchmove"==a.type&&(A=a.touches[0].pageX); a=!1;f=e.calcActiveOffset(c,-1*(Q-eventX-f),l,r,w[d],H,void 0,d);g=(f+w[d]+H)%H;c.infiniteSlider?g!=ba[d]&&(a=!0):f!=B[d]&&(a=!0);if(a&&(B[d]=f,ba[d]=g,ka=!0,g=new e.args("change",c,F,b(F).children(":eq("+g+")"),g,g),b(n).data("args",g),""!=c.onSlideChange))c.onSlideChange(g)}ca=!1});a=b(window);if(X||aa)a=b(document);b(la).bind("touchend.iosSliderEvent",function(b){b=b.originalEvent;if(fa[d]||Y||ya)return!0;if(0!=b.touches.length)for(var a=0;a<b.touches.length;a++)b.touches[a].pageX==A&&e.slowScrollHorizontal(F, D,K,t,W,da,v,r,x,k,C,E,l,M,d,S,H,Z,ka,p,c);else e.slowScrollHorizontal(F,D,K,t,W,da,v,r,x,k,C,E,l,M,d,S,H,Z,ka,p,c);ca=ra=!1});b(a).bind("mouseup.iosSliderEvent-"+d,function(a){U?va.unbind("click.disableClick").bind("click.disableClick",e.preventClick):va.unbind("click.disableClick").bind("click.disableClick",e.enableClick);ja.each(function(){this.onclick=function(a){if(U)return!1;b(this).data("onclick").call(this,a||window.event)}});1.8<=parseFloat(b().jquery)?pa.each(function(){var a=b._data(this, "events");if(void 0!=a&&void 0!=a.click&&"iosSliderEvent"!=a.click[0].namespace){if(!U)return!1;b(this).one("click.disableClick",e.preventClick);var a=b._data(this,"events").click,c=a.pop();a.splice(0,0,c)}}):1.6<=parseFloat(b().jquery)&&pa.each(function(){var a=b(this).data("events");if(void 0!=a&&void 0!=a.click&&"iosSliderEvent"!=a.click[0].namespace){if(!U)return!1;b(this).one("click.disableClick",e.preventClick);var a=b(this).data("events").click,c=a.pop();a.splice(0,0,c)}});if(!ta[d]){if(Y)return!0; b(la).css({cursor:ia});xa=!1;if(void 0==qa)return!0;e.slowScrollHorizontal(qa,D,K,t,W,da,v,r,x,k,C,E,l,M,d,S,H,Z,ka,p,c);qa=void 0}ca=ra=!1})}})},destroy:function(a,f){void 0==f&&(f=this);return b(f).each(function(){var c=b(this),f=c.data("iosslider");if(void 0==f)return!1;void 0==a&&(a=!0);e.autoSlidePause(f.sliderNumber);ta[f.sliderNumber]=!0;b(window).unbind(".iosSliderEvent-"+f.sliderNumber);b(document).unbind(".iosSliderEvent-"+f.sliderNumber);b(document).unbind("keydown.iosSliderEvent");b(this).unbind(".iosSliderEvent"); b(this).children(":first-child").unbind(".iosSliderEvent");b(this).children(":first-child").children().unbind(".iosSliderEvent");a&&(b(this).attr("style",""),b(this).children(":first-child").attr("style",""),b(this).children(":first-child").children().attr("style",""),b(f.settings.navSlideSelector).attr("style",""),b(f.settings.navPrevSelector).attr("style",""),b(f.settings.navNextSelector).attr("style",""),b(f.settings.autoSlideToggleSelector).attr("style",""),b(f.settings.unselectableSelector).attr("style", ""));f.settings.scrollbar&&b(".scrollbarBlock"+f.sliderNumber).remove();for(var f=$[f.sliderNumber],h=0;h<f.length;h++)clearTimeout(f[h]);c.removeData("iosslider");c.removeData("args")})},update:function(a){void 0==a&&(a=this);return b(a).each(function(){var a=b(this),c=a.data("iosslider");if(void 0==c)return!1;c.settings.startAtSlide=a.data("args").currentSlideNumber;V.destroy(!1,this);1!=c.numberOfSlides&&c.settings.infiniteSlider&&(c.settings.startAtSlide=(B[c.sliderNumber]+1+w[c.sliderNumber]+ c.numberOfSlides)%c.numberOfSlides);V.init(c.settings,this);a=new e.args("update",c.settings,c.scrollerNode,b(c.scrollerNode).children(":eq("+(c.settings.startAtSlide-1)+")"),c.settings.startAtSlide-1,c.settings.startAtSlide-1);b(c.stageNode).data("args",a);if(""!=c.settings.onSliderUpdate)c.settings.onSliderUpdate(a)})},addSlide:function(a,e){return this.each(function(){var c=b(this),g=c.data("iosslider");if(void 0==g)return!1;0==b(g.scrollerNode).children().size()?(b(g.scrollerNode).append(a),c.data("args").currentSlideNumber= 1):g.settings.infiniteSlider?(1==e?b(g.scrollerNode).children(":eq(0)").before(a):b(g.scrollerNode).children(":eq("+(e-2)+")").after(a),-1>w[g.sliderNumber]&&B[g.sliderNumber]--,c.data("args").currentSlideNumber>=e&&B[g.sliderNumber]++):(e<=g.numberOfSlides?b(g.scrollerNode).children(":eq("+(e-1)+")").before(a):b(g.scrollerNode).children(":eq("+(e-2)+")").after(a),c.data("args").currentSlideNumber>=e&&c.data("args").currentSlideNumber++);c.data("iosslider").numberOfSlides++;V.update(this)})},removeSlide:function(a){return this.each(function(){var e= b(this).data("iosslider");if(void 0==e)return!1;b(e.scrollerNode).children(":eq("+(a-1)+")").remove();B[e.sliderNumber]>a-1&&B[e.sliderNumber]--;V.update(this)})},goToSlide:function(a,f){void 0==f&&(f=this);return b(f).each(function(){var c=b(this).data("iosslider");if(void 0==c)return!1;a=a>c.childrenOffsets.length?c.childrenOffsets.length-1:a-1;e.changeSlide(a,b(c.scrollerNode),b(c.slideNodes),$[c.sliderNumber],c.scrollbarClass,c.scrollbarWidth,c.stageWidth,c.scrollbarStageWidth,c.scrollMargin, c.scrollBorder,c.originalOffsets,c.childrenOffsets,c.slideNodeOuterWidths,c.sliderNumber,c.infiniteSliderWidth,c.numberOfSlides,c.centeredSlideOffset,c.settings);B[c.sliderNumber]=a})},prevSlide:function(){return this.each(function(){var a=b(this).data("iosslider");if(void 0==a)return!1;var f=(B[a.sliderNumber]+w[a.sliderNumber]+a.numberOfSlides)%a.numberOfSlides;(0<f||a.settings.infiniteSlider)&&e.changeSlide(f-1,b(a.scrollerNode),b(a.slideNodes),$[a.sliderNumber],a.scrollbarClass,a.scrollbarWidth, a.stageWidth,a.scrollbarStageWidth,a.scrollMargin,a.scrollBorder,a.originalOffsets,a.childrenOffsets,a.slideNodeOuterWidths,a.sliderNumber,a.infiniteSliderWidth,a.numberOfSlides,a.centeredSlideOffset,a.settings);B[a.sliderNumber]=f})},nextSlide:function(){return this.each(function(){var a=b(this).data("iosslider");if(void 0==a)return!1;var f=(B[a.sliderNumber]+w[a.sliderNumber]+a.numberOfSlides)%a.numberOfSlides;(f<a.childrenOffsets.length-1||a.settings.infiniteSlider)&&e.changeSlide(f+1,b(a.scrollerNode), b(a.slideNodes),$[a.sliderNumber],a.scrollbarClass,a.scrollbarWidth,a.stageWidth,a.scrollbarStageWidth,a.scrollMargin,a.scrollBorder,a.originalOffsets,a.childrenOffsets,a.slideNodeOuterWidths,a.sliderNumber,a.infiniteSliderWidth,a.numberOfSlides,a.centeredSlideOffset,a.settings);B[a.sliderNumber]=f})},lock:function(){return this.each(function(){var a=b(this).data("iosslider");if(void 0==a)return!1;fa[a.sliderNumber]=!0})},unlock:function(){return this.each(function(){var a=b(this).data("iosslider"); if(void 0==a)return!1;fa[a.sliderNumber]=!1})},getData:function(){return this.each(function(){var a=b(this).data("iosslider");return void 0==a?!1:a})},autoSlidePause:function(){return this.each(function(){var a=b(this).data("iosslider");if(void 0==a)return!1;T[a.sliderNumber].autoSlide=!1;e.autoSlidePause(a.sliderNumber);return a})},autoSlidePlay:function(){return this.each(function(){var a=b(this).data("iosslider");if(void 0==a)return!1;T[a.sliderNumber].autoSlide=!0;e.autoSlide(b(a.scrollerNode), b(a.slideNodes),$[a.sliderNumber],a.scrollbarClass,a.scrollbarWidth,a.stageWidth,a.scrollbarStageWidth,a.scrollMargin,a.scrollBorder,a.originalOffsets,a.childrenOffsets,a.slideNodeOuterWidths,a.sliderNumber,a.infiniteSliderWidth,a.numberOfSlides,a.centeredSlideOffset,a.settings);return a})}};b.fn.iosSlider=function(a){if(V[a])return V[a].apply(this,Array.prototype.slice.call(arguments,1));if("object"!==typeof a&&a)b.error("invalid method call!");else return V.init.apply(this,arguments)}})(jQuery);


/*

StackBlur - a fast almost Gaussian Blur For Canvas

Version: 	0.5
Author:		Mario Klingemann
Contact: 	mario@quasimondo.com
Website:	http://www.quasimondo.com/StackBlurForCanvas
Twitter:	@quasimondo

In case you find this class useful - especially in commercial projects -
I am not totally unhappy for a small donation to my PayPal account
mario@quasimondo.de

Or support me on flattr: 
https://flattr.com/thing/72791/StackBlur-a-fast-almost-Gaussian-Blur-Effect-for-CanvasJavascript

Copyright (c) 2010 Mario Klingemann

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/

var mul_table = [
        512,512,456,512,328,456,335,512,405,328,271,456,388,335,292,512,
        454,405,364,328,298,271,496,456,420,388,360,335,312,292,273,512,
        482,454,428,405,383,364,345,328,312,298,284,271,259,496,475,456,
        437,420,404,388,374,360,347,335,323,312,302,292,282,273,265,512,
        497,482,468,454,441,428,417,405,394,383,373,364,354,345,337,328,
        320,312,305,298,291,284,278,271,265,259,507,496,485,475,465,456,
        446,437,428,420,412,404,396,388,381,374,367,360,354,347,341,335,
        329,323,318,312,307,302,297,292,287,282,278,273,269,265,261,512,
        505,497,489,482,475,468,461,454,447,441,435,428,422,417,411,405,
        399,394,389,383,378,373,368,364,359,354,350,345,341,337,332,328,
        324,320,316,312,309,305,301,298,294,291,287,284,281,278,274,271,
        268,265,262,259,257,507,501,496,491,485,480,475,470,465,460,456,
        451,446,442,437,433,428,424,420,416,412,408,404,400,396,392,388,
        385,381,377,374,370,367,363,360,357,354,350,347,344,341,338,335,
        332,329,326,323,320,318,315,312,310,307,304,302,299,297,294,292,
        289,287,285,282,280,278,275,273,271,269,267,265,263,261,259];
        
   
var shg_table = [
	     9, 11, 12, 13, 13, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 
		17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 19, 
		19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20,
		20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 
		22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22,
		22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 
		23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23,
		23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23,
		23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 
		23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 
		24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24,
		24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24,
		24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24,
		24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24 ];

function stackBlurImage( imageID, canvasID, radius, blurAlphaChannel )
{
			
 	var img = document.getElementById( imageID );
	var w = img.naturalWidth;
    var h = img.naturalHeight;
       
	var canvas = document.getElementById( canvasID );
      
    canvas.style.width  = w + "px";
    canvas.style.height = h + "px";
    canvas.width = w;
    canvas.height = h;
    
    var context = canvas.getContext("2d");
    context.clearRect( 0, 0, w, h );
    context.drawImage( img, 0, 0 );

	if ( isNaN(radius) || radius < 1 ) return;
	
	if ( blurAlphaChannel )
		stackBlurCanvasRGBA( canvasID, 0, 0, w, h, radius );
	else 
		stackBlurCanvasRGB( canvasID, 0, 0, w, h, radius );
}


function stackBlurCanvasRGBA( id, top_x, top_y, width, height, radius )
{
	if ( isNaN(radius) || radius < 1 ) return;
	radius |= 0;
	
	var canvas  = document.getElementById( id );
	var context = canvas.getContext("2d");
	var imageData;
	
	try {
	  try {
		imageData = context.getImageData( top_x, top_y, width, height );
	  } catch(e) {
	  
		// NOTE: this part is supposedly only needed if you want to work with local files
		// so it might be okay to remove the whole try/catch block and just use
		// imageData = context.getImageData( top_x, top_y, width, height );
		try {
			netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead");
			imageData = context.getImageData( top_x, top_y, width, height );
		} catch(e) {
			alert("Cannot access local image");
			throw new Error("unable to access local image data: " + e);
			return;
		}
	  }
	} catch(e) {
	  alert("Cannot access image");
	  throw new Error("unable to access image data: " + e);
	}
			
	var pixels = imageData.data;
			
	var x, y, i, p, yp, yi, yw, r_sum, g_sum, b_sum, a_sum, 
	r_out_sum, g_out_sum, b_out_sum, a_out_sum,
	r_in_sum, g_in_sum, b_in_sum, a_in_sum, 
	pr, pg, pb, pa, rbs;
			
	var div = radius + radius + 1;
	var w4 = width << 2;
	var widthMinus1  = width - 1;
	var heightMinus1 = height - 1;
	var radiusPlus1  = radius + 1;
	var sumFactor = radiusPlus1 * ( radiusPlus1 + 1 ) / 2;
	
	var stackStart = new BlurStack();
	var stack = stackStart;
	for ( i = 1; i < div; i++ )
	{
		stack = stack.next = new BlurStack();
		if ( i == radiusPlus1 ) var stackEnd = stack;
	}
	stack.next = stackStart;
	var stackIn = null;
	var stackOut = null;
	
	yw = yi = 0;
	
	var mul_sum = mul_table[radius];
	var shg_sum = shg_table[radius];
	
	for ( y = 0; y < height; y++ )
	{
		r_in_sum = g_in_sum = b_in_sum = a_in_sum = r_sum = g_sum = b_sum = a_sum = 0;
		
		r_out_sum = radiusPlus1 * ( pr = pixels[yi] );
		g_out_sum = radiusPlus1 * ( pg = pixels[yi+1] );
		b_out_sum = radiusPlus1 * ( pb = pixels[yi+2] );
		a_out_sum = radiusPlus1 * ( pa = pixels[yi+3] );
		
		r_sum += sumFactor * pr;
		g_sum += sumFactor * pg;
		b_sum += sumFactor * pb;
		a_sum += sumFactor * pa;
		
		stack = stackStart;
		
		for( i = 0; i < radiusPlus1; i++ )
		{
			stack.r = pr;
			stack.g = pg;
			stack.b = pb;
			stack.a = pa;
			stack = stack.next;
		}
		
		for( i = 1; i < radiusPlus1; i++ )
		{
			p = yi + (( widthMinus1 < i ? widthMinus1 : i ) << 2 );
			r_sum += ( stack.r = ( pr = pixels[p])) * ( rbs = radiusPlus1 - i );
			g_sum += ( stack.g = ( pg = pixels[p+1])) * rbs;
			b_sum += ( stack.b = ( pb = pixels[p+2])) * rbs;
			a_sum += ( stack.a = ( pa = pixels[p+3])) * rbs;
			
			r_in_sum += pr;
			g_in_sum += pg;
			b_in_sum += pb;
			a_in_sum += pa;
			
			stack = stack.next;
		}
		
		
		stackIn = stackStart;
		stackOut = stackEnd;
		for ( x = 0; x < width; x++ )
		{
			pixels[yi+3] = pa = (a_sum * mul_sum) >> shg_sum;
			if ( pa != 0 )
			{
				pa = 255 / pa;
				pixels[yi]   = ((r_sum * mul_sum) >> shg_sum) * pa;
				pixels[yi+1] = ((g_sum * mul_sum) >> shg_sum) * pa;
				pixels[yi+2] = ((b_sum * mul_sum) >> shg_sum) * pa;
			} else {
				pixels[yi] = pixels[yi+1] = pixels[yi+2] = 0;
			}
			
			r_sum -= r_out_sum;
			g_sum -= g_out_sum;
			b_sum -= b_out_sum;
			a_sum -= a_out_sum;
			
			r_out_sum -= stackIn.r;
			g_out_sum -= stackIn.g;
			b_out_sum -= stackIn.b;
			a_out_sum -= stackIn.a;
			
			p =  ( yw + ( ( p = x + radius + 1 ) < widthMinus1 ? p : widthMinus1 ) ) << 2;
			
			r_in_sum += ( stackIn.r = pixels[p]);
			g_in_sum += ( stackIn.g = pixels[p+1]);
			b_in_sum += ( stackIn.b = pixels[p+2]);
			a_in_sum += ( stackIn.a = pixels[p+3]);
			
			r_sum += r_in_sum;
			g_sum += g_in_sum;
			b_sum += b_in_sum;
			a_sum += a_in_sum;
			
			stackIn = stackIn.next;
			
			r_out_sum += ( pr = stackOut.r );
			g_out_sum += ( pg = stackOut.g );
			b_out_sum += ( pb = stackOut.b );
			a_out_sum += ( pa = stackOut.a );
			
			r_in_sum -= pr;
			g_in_sum -= pg;
			b_in_sum -= pb;
			a_in_sum -= pa;
			
			stackOut = stackOut.next;

			yi += 4;
		}
		yw += width;
	}

	
	for ( x = 0; x < width; x++ )
	{
		g_in_sum = b_in_sum = a_in_sum = r_in_sum = g_sum = b_sum = a_sum = r_sum = 0;
		
		yi = x << 2;
		r_out_sum = radiusPlus1 * ( pr = pixels[yi]);
		g_out_sum = radiusPlus1 * ( pg = pixels[yi+1]);
		b_out_sum = radiusPlus1 * ( pb = pixels[yi+2]);
		a_out_sum = radiusPlus1 * ( pa = pixels[yi+3]);
		
		r_sum += sumFactor * pr;
		g_sum += sumFactor * pg;
		b_sum += sumFactor * pb;
		a_sum += sumFactor * pa;
		
		stack = stackStart;
		
		for( i = 0; i < radiusPlus1; i++ )
		{
			stack.r = pr;
			stack.g = pg;
			stack.b = pb;
			stack.a = pa;
			stack = stack.next;
		}
		
		yp = width;
		
		for( i = 1; i <= radius; i++ )
		{
			yi = ( yp + x ) << 2;
			
			r_sum += ( stack.r = ( pr = pixels[yi])) * ( rbs = radiusPlus1 - i );
			g_sum += ( stack.g = ( pg = pixels[yi+1])) * rbs;
			b_sum += ( stack.b = ( pb = pixels[yi+2])) * rbs;
			a_sum += ( stack.a = ( pa = pixels[yi+3])) * rbs;
		   
			r_in_sum += pr;
			g_in_sum += pg;
			b_in_sum += pb;
			a_in_sum += pa;
			
			stack = stack.next;
		
			if( i < heightMinus1 )
			{
				yp += width;
			}
		}
		
		yi = x;
		stackIn = stackStart;
		stackOut = stackEnd;
		for ( y = 0; y < height; y++ )
		{
			p = yi << 2;
			pixels[p+3] = pa = (a_sum * mul_sum) >> shg_sum;
			if ( pa > 0 )
			{
				pa = 255 / pa;
				pixels[p]   = ((r_sum * mul_sum) >> shg_sum ) * pa;
				pixels[p+1] = ((g_sum * mul_sum) >> shg_sum ) * pa;
				pixels[p+2] = ((b_sum * mul_sum) >> shg_sum ) * pa;
			} else {
				pixels[p] = pixels[p+1] = pixels[p+2] = 0;
			}
			
			r_sum -= r_out_sum;
			g_sum -= g_out_sum;
			b_sum -= b_out_sum;
			a_sum -= a_out_sum;
		   
			r_out_sum -= stackIn.r;
			g_out_sum -= stackIn.g;
			b_out_sum -= stackIn.b;
			a_out_sum -= stackIn.a;
			
			p = ( x + (( ( p = y + radiusPlus1) < heightMinus1 ? p : heightMinus1 ) * width )) << 2;
			
			r_sum += ( r_in_sum += ( stackIn.r = pixels[p]));
			g_sum += ( g_in_sum += ( stackIn.g = pixels[p+1]));
			b_sum += ( b_in_sum += ( stackIn.b = pixels[p+2]));
			a_sum += ( a_in_sum += ( stackIn.a = pixels[p+3]));
		   
			stackIn = stackIn.next;
			
			r_out_sum += ( pr = stackOut.r );
			g_out_sum += ( pg = stackOut.g );
			b_out_sum += ( pb = stackOut.b );
			a_out_sum += ( pa = stackOut.a );
			
			r_in_sum -= pr;
			g_in_sum -= pg;
			b_in_sum -= pb;
			a_in_sum -= pa;
			
			stackOut = stackOut.next;
			
			yi += width;
		}
	}
	
	context.putImageData( imageData, top_x, top_y );
	
}


function stackBlurCanvasRGB( id, top_x, top_y, width, height, radius )
{
	if ( isNaN(radius) || radius < 1 ) return;
	radius |= 0;
	
	var canvas  = document.getElementById( id );
	var context = canvas.getContext("2d");
	var imageData;
	
	try {
	  try {
		imageData = context.getImageData( top_x, top_y, width, height );
	  } catch(e) {
	  
		// NOTE: this part is supposedly only needed if you want to work with local files
		// so it might be okay to remove the whole try/catch block and just use
		// imageData = context.getImageData( top_x, top_y, width, height );
		try {
			netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead");
			imageData = context.getImageData( top_x, top_y, width, height );
		} catch(e) {
			alert("Cannot access local image");
			throw new Error("unable to access local image data: " + e);
			return;
		}
	  }
	} catch(e) {
	  alert("Cannot access image");
	  throw new Error("unable to access image data: " + e);
	}
			
	var pixels = imageData.data;
			
	var x, y, i, p, yp, yi, yw, r_sum, g_sum, b_sum,
	r_out_sum, g_out_sum, b_out_sum,
	r_in_sum, g_in_sum, b_in_sum,
	pr, pg, pb, rbs;
			
	var div = radius + radius + 1;
	var w4 = width << 2;
	var widthMinus1  = width - 1;
	var heightMinus1 = height - 1;
	var radiusPlus1  = radius + 1;
	var sumFactor = radiusPlus1 * ( radiusPlus1 + 1 ) / 2;
	
	var stackStart = new BlurStack();
	var stack = stackStart;
	for ( i = 1; i < div; i++ )
	{
		stack = stack.next = new BlurStack();
		if ( i == radiusPlus1 ) var stackEnd = stack;
	}
	stack.next = stackStart;
	var stackIn = null;
	var stackOut = null;
	
	yw = yi = 0;
	
	var mul_sum = mul_table[radius];
	var shg_sum = shg_table[radius];
	
	for ( y = 0; y < height; y++ )
	{
		r_in_sum = g_in_sum = b_in_sum = r_sum = g_sum = b_sum = 0;
		
		r_out_sum = radiusPlus1 * ( pr = pixels[yi] );
		g_out_sum = radiusPlus1 * ( pg = pixels[yi+1] );
		b_out_sum = radiusPlus1 * ( pb = pixels[yi+2] );
		
		r_sum += sumFactor * pr;
		g_sum += sumFactor * pg;
		b_sum += sumFactor * pb;
		
		stack = stackStart;
		
		for( i = 0; i < radiusPlus1; i++ )
		{
			stack.r = pr;
			stack.g = pg;
			stack.b = pb;
			stack = stack.next;
		}
		
		for( i = 1; i < radiusPlus1; i++ )
		{
			p = yi + (( widthMinus1 < i ? widthMinus1 : i ) << 2 );
			r_sum += ( stack.r = ( pr = pixels[p])) * ( rbs = radiusPlus1 - i );
			g_sum += ( stack.g = ( pg = pixels[p+1])) * rbs;
			b_sum += ( stack.b = ( pb = pixels[p+2])) * rbs;
			
			r_in_sum += pr;
			g_in_sum += pg;
			b_in_sum += pb;
			
			stack = stack.next;
		}
		
		
		stackIn = stackStart;
		stackOut = stackEnd;
		for ( x = 0; x < width; x++ )
		{
			pixels[yi]   = (r_sum * mul_sum) >> shg_sum;
			pixels[yi+1] = (g_sum * mul_sum) >> shg_sum;
			pixels[yi+2] = (b_sum * mul_sum) >> shg_sum;
			
			r_sum -= r_out_sum;
			g_sum -= g_out_sum;
			b_sum -= b_out_sum;
			
			r_out_sum -= stackIn.r;
			g_out_sum -= stackIn.g;
			b_out_sum -= stackIn.b;
			
			p =  ( yw + ( ( p = x + radius + 1 ) < widthMinus1 ? p : widthMinus1 ) ) << 2;
			
			r_in_sum += ( stackIn.r = pixels[p]);
			g_in_sum += ( stackIn.g = pixels[p+1]);
			b_in_sum += ( stackIn.b = pixels[p+2]);
			
			r_sum += r_in_sum;
			g_sum += g_in_sum;
			b_sum += b_in_sum;
			
			stackIn = stackIn.next;
			
			r_out_sum += ( pr = stackOut.r );
			g_out_sum += ( pg = stackOut.g );
			b_out_sum += ( pb = stackOut.b );
			
			r_in_sum -= pr;
			g_in_sum -= pg;
			b_in_sum -= pb;
			
			stackOut = stackOut.next;

			yi += 4;
		}
		yw += width;
	}

	
	for ( x = 0; x < width; x++ )
	{
		g_in_sum = b_in_sum = r_in_sum = g_sum = b_sum = r_sum = 0;
		
		yi = x << 2;
		r_out_sum = radiusPlus1 * ( pr = pixels[yi]);
		g_out_sum = radiusPlus1 * ( pg = pixels[yi+1]);
		b_out_sum = radiusPlus1 * ( pb = pixels[yi+2]);
		
		r_sum += sumFactor * pr;
		g_sum += sumFactor * pg;
		b_sum += sumFactor * pb;
		
		stack = stackStart;
		
		for( i = 0; i < radiusPlus1; i++ )
		{
			stack.r = pr;
			stack.g = pg;
			stack.b = pb;
			stack = stack.next;
		}
		
		yp = width;
		
		for( i = 1; i <= radius; i++ )
		{
			yi = ( yp + x ) << 2;
			
			r_sum += ( stack.r = ( pr = pixels[yi])) * ( rbs = radiusPlus1 - i );
			g_sum += ( stack.g = ( pg = pixels[yi+1])) * rbs;
			b_sum += ( stack.b = ( pb = pixels[yi+2])) * rbs;
			
			r_in_sum += pr;
			g_in_sum += pg;
			b_in_sum += pb;
			
			stack = stack.next;
		
			if( i < heightMinus1 )
			{
				yp += width;
			}
		}
		
		yi = x;
		stackIn = stackStart;
		stackOut = stackEnd;
		for ( y = 0; y < height; y++ )
		{
			p = yi << 2;
			pixels[p]   = (r_sum * mul_sum) >> shg_sum;
			pixels[p+1] = (g_sum * mul_sum) >> shg_sum;
			pixels[p+2] = (b_sum * mul_sum) >> shg_sum;
			
			r_sum -= r_out_sum;
			g_sum -= g_out_sum;
			b_sum -= b_out_sum;
			
			r_out_sum -= stackIn.r;
			g_out_sum -= stackIn.g;
			b_out_sum -= stackIn.b;
			
			p = ( x + (( ( p = y + radiusPlus1) < heightMinus1 ? p : heightMinus1 ) * width )) << 2;
			
			r_sum += ( r_in_sum += ( stackIn.r = pixels[p]));
			g_sum += ( g_in_sum += ( stackIn.g = pixels[p+1]));
			b_sum += ( b_in_sum += ( stackIn.b = pixels[p+2]));
			
			stackIn = stackIn.next;
			
			r_out_sum += ( pr = stackOut.r );
			g_out_sum += ( pg = stackOut.g );
			b_out_sum += ( pb = stackOut.b );
			
			r_in_sum -= pr;
			g_in_sum -= pg;
			b_in_sum -= pb;
			
			stackOut = stackOut.next;
			
			yi += width;
		}
	}
	
	context.putImageData( imageData, top_x, top_y );
	
}

function BlurStack()
{
	this.r = 0;
	this.g = 0;
	this.b = 0;
	this.a = 0;
	this.next = null;
}







// ABEDIT - TV INITIATION


// iosSlider
var braek = jQuery.noConflict();
braek(document).ready(function() {
				
	var arrayOfImages = new Array();
	var bufferDistance = 4;

	braek('.iosSlider').iosSlider({
		snapToChildren: true,
		desktopClickDrag: true,
		autoSlide: true,
		autoSlideTimer: 4000,
		autoSlideTransTimer: 2000,
		autoSlideHoverPause: false,
		infiniteSlider: true,
		navNextSelector: "span.prev",
		navPrevSelector: "span.next",
		onSlideChange: function(args) {
			
			braek('.item:eq(' + (args.currentSlideNumber + bufferDistance - 2) + ')').addClass('item' + (args.currentSlideNumber + bufferDistance - 1));
			
		}
	});
}); 
		

// search popup
var braekon = jQuery.noConflict();
braekon(document).ready(function() {

		// When clicking on the button close or the mask layer the popup closed
		braekon('a#searchbtn').click(function() { 
			var X=braekon(this).attr('closed');
		      if(X==1){
		        braekon('#advsearch').fadeOut('100');
		        braekon(this).attr('closed', '0');
		      } else {
		        braekon('#advsearch').fadeIn('100');
		        braekon(this).attr('closed', '1');
		      }
			return false;
		});


		braekon('a#close').click(function() { 
		        braekon('#advsearch').fadeOut('100');
	            braekon("a#searchbtn").attr('closed', '0');
		});
		braekon(window).load(function() {
			braekon('#mask').fadeOut();
		});
});



	






