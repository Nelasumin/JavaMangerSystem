//CheckBox
function selectAll(formName, cbName) {
	var o = document.forms(formName).item(cbName);
	if (o.length) {//
		for (i=0; i<o.length; i++) {
			document.forms(formName).item(cbName)[i].checked = true;
		}
	} else {
		o.checked = true;
	}
}
//CheckBox
function unSelectAll(formName, cbName) {
	var o = document.forms(formName).item(cbName);
	if (o.length) {//
		for (i=0; i<o.length; i++) {
			document.forms(formName).item(cbName)[i].checked = false;
		}
	} else {
		o.checked = false;
	}
}


/* */
function getStringLength(str) {
	var endvalue=0;
	var sourcestr=new String(str);
	var tempstr;
	for (var strposition = 0; strposition < sourcestr.length; strposition ++) {
		tempstr=sourcestr.charAt(strposition);
		if (tempstr.charCodeAt(0)>255 || tempstr.charCodeAt(0)<0) {
			endvalue=endvalue+2;
		} else {
			endvalue=endvalue+1;
		}
	}
	return(endvalue);
}
function trim(str) {
	if(str==null) return "";
	if(str.length==0) return "";
	var i=0,j=str.length-1,c;
	for(;i<str.length;i++) {
		c=str.charAt(i);
		if(c!=' ') break;
	}
	for(;j>-1;j--) {
		c=str.charAt(j);
		if(c!=' ') break;
	}
	if(i>j) return "";
	return str.substring(i,j+1); 
}
function isNumber(input) {
	var isNumber = /^[\d]+$/;
	if(isNumber.test(input)){
		return true;
	}
	return false;
}
//
function isNotChinese(input) {
	var isNotChinese = /^\w*$/;
	if(isNotChinese.test(input)){
		return true;
	}
	return false;
}

function isNullOrNumber(input) {
	var isNumber = /^[\d]*$/;
	if(isNumber.test(input)){
		return true;
	}
	return false;
}

function validateDate(date,format,alt) {
	var time=trim(date.value);
	if(time=="") return;
	var reg=format;
	var reg=reg.replace(/yyyy/,"[0-9]{4}");
	var reg=reg.replace(/yy/,"[0-9]{2}");
	var reg=reg.replace(/MM/,"((0[1-9])|1[0-2])");
	var reg=reg.replace(/M/,"(([1-9])|1[0-2])");
	var reg=reg.replace(/dd/,"((0[1-9])|([1-2][0-9])|30|31)");
	var reg=reg.replace(/d/,"([1-9]|[1-2][0-9]|30|31))");
	var reg=reg.replace(/HH/,"(([0-1][0-9])|20|21|22|23)");
	var reg=reg.replace(/H/,"([0-9]|1[0-9]|20|21|22|23)");
	var reg=reg.replace(/mm/,"([0-5][0-9])");
	var reg=reg.replace(/m/,"([0-9]|([1-5][0-9]))");
	var reg=reg.replace(/ss/,"([0-5][0-9])");
	var reg=reg.replace(/s/,"([0-9]|([1-5][0-9]))");
	reg=new RegExp("^"+reg+"$");
	if(reg.test(time)==false) {//
		alert(alt);
		date.focus();
		return false;
	}
	return true;
}
function validateDateGroup(year,month,day,alt) {
	var array=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	var y=parseInt(year.value,10);
	var m=parseInt(month.value,10);
	var d=parseInt(day.value,10);
	var maxday=array[m-1];
	if(m==2) {
		if((y%4==0&&y%100!=0)||y%400==0) {
			maxday=29;
		}
	}
	if(d>maxday) {
		alert(alt);
		return false;
	}
	return true;
}
function validateCheckbox(obj,alt) {
	var rs=false;
	if(obj!=null) {
		if(obj.length==null) {
			return obj.checked;
		}
		for(i=0;i<obj.length;i++) {
			if(obj[i].checked==true) {
				return true;
			}
		}
	}
	alert(alt);
	return rs;
}
function validateRadio(obj,alt) {
	var rs=false;
	if(obj!=null) {
		if(obj.length==null) {
			return obj.checked;
		}
		for(i=0;i<obj.length;i++) {
			if(obj[i].checked==true) {
				return true;
			}
		}
	}
	alert(alt);
	return rs;
}
function validateSelect(obj,alt) {
	var rs=false;
	if(obj!=null) {
		for(i=0;i<obj.options.length;i++) {
			if(obj.options[i].selected==true) {
				return true;
			}
		}
	}
	alert(alt);
	return rs;
}
function validateEmail(email,alt,separator) {
	var mail=trim(email.value);
	if(mail=="") return;
	var em;
	var myReg = /^[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$/;
	if(separator==null) {
		if(myReg.test(email.value)==false) {
			alert(alt);
			email.focus();
			return false;
		}
	} else {
		em=email.value.split(separator);
		for(i=0;i<em.length;i++) {
			em[i]=em[i].trim();
			if(em[i].length>0&&myReg.test(em[i])==false) {
				alert(alt);
				email.focus();
				return false;
			}
		}
	}
	return true;
}
/* true */
function validateForm(theForm) { 
	var disableList=new Array();
	var field = theForm.elements;//
	for(var i = 0; i < field.length; i++) {

		//
		var vali=theForm.getAttribute("validate");
		if(vali!=null) {
			if(vali.value=="0") {
				var fun=vali.getAttribute("functionName");
				if(fun!=null) {
					return eval(fun+"()");
				} else {
					return true;
				}
			}
		}

		var empty=false;
		var value=trim(field[i].value);
		if(value.length==0) {
			empty=true;
		}
		var notFocus=field[i].getAttribute("notFocus");//
		if (notFocus!=null) {
			notFocus = true;
		}
		
		var emptyInfo=field[i].getAttribute("emptyInfo");//alert(field[i].getAttribute("emptyInfo"));//
		if(emptyInfo!=null&&empty==true) {
			alert(emptyInfo);
			if (!notFocus){
				field[i].focus();
			}
			return false;
		}
		var nfEmptyInfo=field[i].getAttribute("emptyInfo");//focus
		if(nfEmptyInfo!=null&&empty==true) {
			alert(nfEmptyInfo);
			return false;
		}
		var lengthInfo=field[i].getAttribute("lengthInfo");//
		if(lengthInfo!=null&&getStringLength(value)>field[i].getAttribute("maxLen")) {
			alert(lengthInfo);
			field[i].focus();
			return false;
		}
		var lengthMinInfo=field[i].getAttribute("lengthMinInfo");//
		if(lengthMinInfo!=null&&getStringLength(value)<field[i].getAttribute("minLen")) {
			alert(lengthMinInfo);
			field[i].focus();
			return false;
		}
		var numberInfo=field[i].getAttribute("numberInfo");//
		if (numberInfo!=null) {
			if (!isNumber(value)) {
				alert(numberInfo);
				field[i].select();
				return false;
			}
		}
		
		var noChineseInfo=field[i].getAttribute("noChineseInfo");//
		if (noChineseInfo!=null) {
			if (!isNotChinese(value)) {
				alert(noChineseInfo);
				field[i].focus();
				return false;
			}
		}
		
		var numberOrNullInfo=field[i].getAttribute("numberOrNullInfo");//
		if (numberOrNullInfo!=null) {
			if (!isNullOrNumber(value)) {
				alert(numberOrNullInfo);
				field[i].select();
				return false;
			}
		}
		
		var NoChineseInfo=field[i].getAttribute("NoChineseInfo");//
		if (NoChineseInfo!=null) {
			if (!isNotChinese(value)&&value.length!=0) {
				alert(NoChineseInfo);
				field[i].focus();
				return false;
			}
		}
		

		var validatorType=field[i].getAttribute("validatorType");
		if(validatorType!=null) {//javascript
			var rs=true;
			if(validatorType=="javascript") {
				eval("rs="+field[i].getAttribute("functionName")+"()");
				if(rs==false) {
					return false;
				} else {
					continue;
				}
			} else if (validatorType=="disable") {//disable
				disableList.length++;
				disableList[disableList.length-1]=field[i];
				continue;
			} else if (validatorType=="date") {
				rs=validateDate(theForm.elements(field[i].getAttribute("fieldName")),field[i].getAttribute("format"),field[i].getAttribute("errorInfo"));
			} else if (validatorType=="dateGroup") {
				rs=validateDateGroup(theForm.elements(field[i].getAttribute("year")),theForm.elements(field[i].getAttribute("month")),theForm.elements(field[i].getAttribute("day")),field[i].getAttribute("errorInfo"));
			} else if(validatorType=="timeCmp") {
			    rs=comparetime(theForm.elements(field[i].getAttribute("startdate")).value,theForm.elements(field[i].getAttribute("enddate")).value,field[i].getAttribute("errorInfo"));
		    } else if (validatorType=="checkbox") {
				rs=validateCheckbox(theForm.elements(field[i].getAttribute("fieldName")),field[i].getAttribute("errorInfo"));
			} else if (validatorType=="radio") {
				rs=validateRadio(theForm.elements(field[i].getAttribute("fieldName")),field[i].getAttribute("errorInfo"));
			} else if (validatorType=="select") {
				rs=validateSelect(theForm.elements(field[i].getAttribute("fieldName")),field[i].getAttribute("errorInfo"));
			} else if (validatorType=="email") {
				rs=validateEmail(theForm.elements(field[i].getAttribute("fieldName")),field[i].getAttribute("errorInfo"));
			} 
			else if(validatorType=="unequal"){
				rs=unequal(theForm,theForm.elements(field[i].getAttribute("fieldName1")),theForm.elements(field[i].getAttribute("fieldName2")),field[i].getAttribute("errorInfo"));
			}

else {
				alert(", fieldName: "+field[i].name);
				return false;
			}

			if(rs==false) {
				return false;
			}
		} else {//
			if(empty==false) {
				var v = field[i].getAttribute("validator"); //validator
				if(!v) continue;            //,
				var reg=new RegExp(v);
				if(reg.test(field[i].value)==false) {
					alert(field[i].getAttribute("errorInfo"));
					field[i].focus();
					return false;
				}
			}
		}
	}
	for(i=0;i<disableList.length;i++) {
		disableList[i].disabled=true;
	}
	return true;
}
/* iframe */
var getFFVersion=navigator.userAgent.substring(navigator.userAgent.indexOf("Firefox")).split("/")[1]
var FFextraHeight=getFFVersion>=0.1? 16 : 0 

function dyniframesize(iframename) {
  var pTar = null;
  if (document.getElementById){
    pTar = document.getElementById(iframename);
  }
  else{
    eval('pTar = ' + iframename + ';');
  }
  if (pTar && !window.opera){
    //begin resizing iframe
    pTar.style.display="block"
    
    if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){
      //ns6 syntax
      pTar.height = pTar.contentDocument.body.offsetHeight+FFextraHeight; 
    }
    else if (pTar.Document && pTar.Document.body.scrollHeight){
      //ie5+ syntax
      pTar.height = pTar.Document.body.scrollHeight;
    }
  }
}
//CheckBox
function del(formname,cbname){
	
	var a = document.getElementsByName(cbname);
	var sum=0;
	var c=false;
	for(i=0;i< a.length; i++)
	{
		if(a[i].checked){
		sum++;
		}
	}
	if(sum>0)
	{
	c=window.confirm('')
		if(c)
		{
		document.forms(formname).submit();
		}
	}
	else
	{
	alert('');
	}	
}
//CheckBox
function docheck(formname,cbname){
	
	var a = document.getElementsByName(cbname);
	var c=false;
	for(i=0;i< a.length; i++)
	{
		if(a[i].checked){
		sum++;
		}
	}
	if(sum>0)
	{
	document.forms(formname).submit();
	}
	else
	{
	alert('');
	}	
}
//,,
function unequal(form,inputname0,inputname2,errorInfo)
{
	var a = trim(inputname0.value);
	var b = trim(inputname2.value);
	if(a!=b)
	{
		alert(errorInfo);
		return false;	
	}
	else
	{
		//form.submit();
	//document.forms(formname).submit();
		return true;
	}
}
//,a,b,
function comparetime(a,b,alt)
{
	var time1 = a.substring(0,4).concat(a.substring(5,7)).concat(a.substring(8,10));
	var time2 = b.substring(0,4).concat(b.substring(5,7)).concat(b.substring(8,10));
	if((time1)>time2)
	{
		alert(alt);
		return false;
	}
	else
	{	
		return true;
	}
}


//Cookie

function Setcookie (name, value) { //name,valueCookie 
	document.cookie = name + "=" + value + "";
} 

function Deletecookie (name) { //nameCookie 
	var exp = new Date(); 
	exp.setTime (exp.getTime() - 1); 
	var cval = GetCookie (name); 
	document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString(); 
} 

function getCookieVal (offset) { //offsetcookie 
	var endstr = document.cookie.indexOf (";", offset); 
	if (endstr == -1) 
	endstr = document.cookie.length; 
	return unescape(document.cookie.substring(offset, endstr)); 
} 

function GetCookie (name) { //namecookie 
	var arg = name + "="; 
	var alen = arg.length; 
	var clen = document.cookie.length; 
	var i = 0; 
	while (i < clen) { 
		var j = i + alen; 
		if (document.cookie.substring(i, j) == arg) 
		return getCookieVal (j); 
		i = document.cookie.indexOf(" ", i) + 1; 
		if (i == 0) break; 
	} 
	return null; 
} 

function comparetime2(a,a2,a3,b,b2,b3){ // 
	var time1 = a.substring(0,4).concat(a.substring(5,7)).concat(a.substring(8,10)).concat(a2).concat(a3);
	var time2 = b.substring(0,4).concat(b.substring(5,7)).concat(b.substring(8,10)).concat(b2).concat(b3);

	if((time1)>time2)
	{
		alert('');
		return false;
	}
	else
	{	
		return true;
	}
}

/* */
function checkOptionSame(formSrc, optNum, optPre) {
	var z=0;
	var a=new Array(optNum);
	for (var i=0; i<optNum; i++) {
		var index = i+1;
		a[i] = formSrc[optPre + index].value;
		if (a[i]=="") {
			z = i;
			break;
		}
	}
	for(var i=0; i<z; i++) {
		for (var j=i+1; j<=z; j++) {
			if(a[i]==a[j]) {
				alert("");
				return false;
			}
		}
	}
	return true;
}

/* div  */
function changediv(divid) {
	clearalldiv();
	showdiv(divid);
}
function cleardiv(divid) {
	document.getElementById(divid).style.display="none";
}
function showdiv(divid) {
	document.getElementById(divid).style.display="";
}