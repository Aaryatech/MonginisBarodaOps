!function(c){var a=function(e,d,f){this.element=c(e);this.format=b.parseFormat(d.format||this.element.data("date-format")||"dd-mm-yyyy");this.autoClose=d.autoClose||this.element.data("date-autoClose")||true;this.closeCallback=f||function(){};this.picker=c(b.template).appendTo("body").on({click:c.proxy(this.click,this),});this.isInput=this.element.is("input");this.component=this.element.is(".date")?this.element.find(".input-group-addon"):false;if(this.isInput){this.element.on({focus:c.proxy(this.show,this),keyup:c.proxy(this.update,this)})}else{if(this.component){this.component.on("click",c.proxy(this.show,this))}else{this.element.on("click",c.proxy(this.show,this))}}this.minViewMode=d.minViewMode||this.element.data("date-minviewmode")||0;if(typeof this.minViewMode==="string"){switch(this.minViewMode){case"months":this.minViewMode=1;break;case"years":this.minViewMode=2;break;default:this.minViewMode=0;break}}this.viewMode=d.viewMode||this.element.data("date-viewmode")||0;if(typeof this.viewMode==="string"){switch(this.viewMode){case"months":this.viewMode=1;break;case"years":this.viewMode=2;break;default:this.viewMode=0;break}}this.startViewMode=this.viewMode;this.weekStart=d.weekStart||this.element.data("date-weekstart")||0;this.weekEnd=this.weekStart===0?6:this.weekStart-1;this.fillDow();this.fillMonths();this.update();this.showMode()};a.prototype={constructor:a,show:function(f){this.picker.show();this.height=this.component?this.component.outerHeight():this.element.outerHeight();this.place();c(window).on("resize",c.proxy(this.place,this));if(f){f.stopPropagation();f.preventDefault()}if(!this.isInput){}var d=this;c(document).on("mousedown",function(e){if(c(e.target).closest(".datepicker").length==0){d.hide()}});this.element.trigger({type:"show",date:this.date})},hide:function(){this.picker.hide();c(window).off("resize",this.place);this.viewMode=this.startViewMode;this.showMode();if(!this.isInput){c(document).off("mousedown",this.hide)}this.element.trigger({type:"hide",date:this.date})},set:function(){var d=b.formatDate(this.date,this.format);if(!this.isInput){if(this.component){this.element.find("input").prop("value",d)}this.element.data("date",d)}else{this.element.prop("value",d)}},setValue:function(d){if(typeof d==="string"){this.date=b.parseDate(d,this.format)}else{this.date=new Date(d)}this.set();this.viewDate=new Date(this.date.getFullYear(),this.date.getMonth(),1,0,0,0,0);this.fill()},place:function(){var d=this.component?this.component.offset():this.element.offset();this.picker.css({top:d.top+this.height,left:d.left})},update:function(d){this.date=b.parseDate(typeof d==="string"?d:(this.isInput?this.element.prop("value"):this.element.data("date")),this.format);this.viewDate=new Date(this.date.getFullYear(),this.date.getMonth(),1,0,0,0,0);this.fill()},fillDow:function(){var d=this.weekStart;var e="<tr>";while(d<this.weekStart+7){e+='<th class="dow">'+b.dates.daysMin[(d++)%7]+"</th>"}e+="</tr>";this.picker.find(".datepicker-days thead").append(e)},fillMonths:function(){var e="";var d=0;while(d<12){e+='<span class="month">'+b.dates.monthsShort[d++]+"</span>"}this.picker.find(".datepicker-months td").append(e)},fill:function(){var o=new Date(this.viewDate),p=o.getFullYear(),n=o.getMonth(),f=this.date.valueOf();this.picker.find(".datepicker-days th:eq(1)").text(b.dates.months[n]+" "+p);var j=new Date(p,n-1,28,0,0,0,0),q=b.getDaysInMonth(j.getFullYear(),j.getMonth());j.setDate(q);j.setDate(q-(j.getDay()-this.weekStart+7)%7);var l=new Date(j);l.setDate(l.getDate()+42);l=l.valueOf();html=[];var h;while(j.valueOf()<l){if(j.getDay()===this.weekStart){html.push("<tr>")}h="";if(j.getMonth()<n){h+=" old"}else{if(j.getMonth()>n){h+=" new"}}if(j.valueOf()===f){h+=" active"}html.push('<td class="day'+h+'">'+j.getDate()+"</td>");if(j.getDay()===this.weekEnd){html.push("</tr>")}j.setDate(j.getDate()+1)}this.picker.find(".datepicker-days tbody").empty().append(html.join(""));var m=this.date.getFullYear();var e=this.picker.find(".datepicker-months").find("th:eq(1)").text(p).end().find("span").removeClass("active");if(m===p){e.eq(this.date.getMonth()).addClass("active")}html="";p=parseInt(p/10,10)*10;var g=this.picker.find(".datepicker-years").find("th:eq(1)").text(p+"-"+(p+9)).end().find("td");p-=1;for(var k=-1;k<11;k++){html+='<span class="year'+(k===-1||k===10?" old":"")+(m===p?" active":"")+'">'+p+"</span>";p+=1}g.html(html)},click:function(i){i.stopPropagation();i.preventDefault();var h=c(i.target).closest("span, td, th");if(h.length===1){switch(h[0].nodeName.toLowerCase()){case"th":switch(h[0].className){case"switch":this.showMode(1);break;case"prev":case"next":this.viewDate["set"+b.modes[this.viewMode].navFnc].call(this.viewDate,this.viewDate["get"+b.modes[this.viewMode].navFnc].call(this.viewDate)+b.modes[this.viewMode].navStep*(h[0].className==="prev"?-1:1));this.fill();this.set();break}break;case"span":if(h.is(".month")){var g=h.parent().find("span").index(h);this.viewDate.setMonth(g)}else{var f=parseInt(h.text(),10)||0;this.viewDate.setFullYear(f)}if(this.viewMode!==0){this.date=new Date(this.viewDate);this.element.trigger({type:"changeDate",date:this.date,viewMode:b.modes[this.viewMode].clsName})}this.showMode(-1);this.fill();this.set();break;case"td":if(h.is(".day")){var d=parseInt(h.text(),10)||1;var g=this.viewDate.getMonth();if(h.is(".old")){g-=1}else{if(h.is(".new")){g+=1}}var f=this.viewDate.getFullYear();this.date=new Date(f,g,d,0,0,0,0);this.viewDate=new Date(f,g,Math.min(28,d),0,0,0,0);this.fill();this.set();this.element.trigger({type:"changeDate",date:this.date,viewMode:b.modes[this.viewMode].clsName});if(this.autoClose===true){this.hide();this.closeCallback()}}break}}},mousedown:function(d){d.stopPropagation();d.preventDefault()},showMode:function(d){if(d){this.viewMode=Math.max(this.minViewMode,Math.min(2,this.viewMode+d))}this.picker.find(">div").hide().filter(".datepicker-"+b.modes[this.viewMode].clsName).show()}};c.fn.datepicker=function(d,e){return this.each(function(){var h=c(this),g=h.data("datepicker"),f=typeof d==="object"&&d;if(!g){h.data("datepicker",(g=new a(this,c.extend({},c.fn.datepicker.defaults,f))))}if(typeof d==="string"){g[d](e)}})};c.fn.datepicker.defaults={};c.fn.datepicker.Constructor=a;var b={modes:[{clsName:"days",navFnc:"Month",navStep:1},{clsName:"months",navFnc:"FullYear",navStep:1},{clsName:"years",navFnc:"FullYear",navStep:10}],dates:{days:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],daysShort:["Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun"],daysMin:["Su","Mo","Tu","We","Th","Fr","Sa","Su"],months:["January","February","March","April","May","June","July","August","September","October","November","December"],monthsShort:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]},isLeapYear:function(d){return(((d%4===0)&&(d%100!==0))||(d%400===0))},getDaysInMonth:function(d,e){return[31,(b.isLeapYear(d)?29:28),31,30,31,30,31,31,30,31,30,31][e]},parseFormat:function(f){var e=f.match(/[.\/\-\s].*?/),d=f.split(/\W+/);if(!e||!d||d.length===0){throw new Error("Invalid date format.")}return{separator:e,parts:d}},parseDate:function(d,h){var g=d.split(h.separator),d=new Date(),j;d.setHours(0);d.setMinutes(0);d.setSeconds(0);d.setMilliseconds(0);if(g.length===h.parts.length){for(var f=0,e=h.parts.length;f<e;f++){j=parseInt(g[f],10)||1;switch(h.parts[f]){case"dd":case"d":d.setDate(j);break;case"mm":case"m":d.setMonth(j-1);break;case"yy":d.setFullYear(2000+j);break;case"yyyy":d.setFullYear(j);break}}}return d},formatDate:function(d,g){var h={d:d.getDate(),m:d.getMonth()+1,yy:d.getFullYear().toString().substring(2),yyyy:d.getFullYear()};h.dd=(h.d<10?"0":"")+h.d;h.mm=(h.m<10?"0":"")+h.m;var d=[];for(var f=0,e=g.parts.length;f<e;f++){d.push(h[g.parts[f]])}return d.join(g.separator)},headTemplate:'<thead><tr><th class="prev">&lsaquo;</th><th colspan="5" class="switch"></th><th class="next">&rsaquo;</th></tr></thead>',contTemplate:'<tbody><tr><td colspan="7"></td></tr></tbody>'};b.template='<div class="datepicker dropdown-menu"><div class="datepicker-days"><table class=" table-condensed">'+b.headTemplate+'<tbody></tbody></table></div><div class="datepicker-months"><table class="table-condensed">'+b.headTemplate+b.contTemplate+'</table></div><div class="datepicker-years"><table class="table-condensed">'+b.headTemplate+b.contTemplate+"</table></div></div>"}(window.jQuery);