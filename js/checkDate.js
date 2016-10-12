/**
 * Created by Liang Cui on 2016-10-12.
 */
function addLoadEvent(func){
    var oldonload = window.onload;
    if(typeof window.onload != 'function'){
        window.onload = func;
    }
    else{
        window.onload = function(){
            oldonload();
            func();
        }
    }
}
function g(o_id){
    return document.getElementById(o_id);
}

function IsDate(obj) {
    var reg = /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/;
    var str = obj.value;
    if (str=="") return true;
    var tempArr = str.split('-');
    var yearR = parseInt(tempArr[0]),
        monthR = parseInt(tempArr[1]),
        dayR = parseInt(tempArr[2]);

    /*判断闰年*/
    var for4year;
    if(((yearR%100!=0) && (yearR%4==0))|| (yearR%400==0)){
        for4year = true;
    }
    else{
        for4year = false;
    }
    console.log(for4year);


    /*判断大小月*/
    if(((",1,3,5,7,8,10,12,").indexOf(","+monthR+",") != -1) && dayR<=31){
        console.log(("1,3,5,7,8,10,12").indexOf(monthR))
        clearWarning(obj);
    }
    else if((("4,6,9,11").indexOf(monthR) != -1) && dayR<=30){
        clearWarning(obj);
    }
    else if(dayR<29){
        clearWarning(obj);
    }
    else if(for4year && dayR<30){
        clearWarning(obj);
    }
    else if (!reg.test(str) || (monthR<1)){
        createWarning(obj);
    }
    else{
        createWarning(obj);
    }
    return true;
}

function clearWarning(obj){
    if(g('para_week')){
        var parent = obj.parentNode;
        //console.log(obj.nextSibling)
        parent.removeChild(obj.nextSibling);
    }
    return true;
}

function createWarning(obj){
    if(g('para_week')) return false;
    var para = document.createElement('p');
    para.setAttribute('id','para_week');
    var text = document.createTextNode('请保证输入的日期格式为yyyy-mm-dd或正确的日期!');
    para.appendChild(text);
    insertAfter(para,obj);
}

function insertAfter(newElement,targetElement){
    var parent = targetElement.parentNode;
    if(parent.lastChild == targetElement){
        parent.appendChild(newElement);
    }
    else{
        parent.insertBefore(newElement,targetElement.nextSibling);
    }
}
