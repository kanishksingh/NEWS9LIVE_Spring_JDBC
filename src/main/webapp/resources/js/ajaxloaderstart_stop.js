/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function defaultajaxindicatorstart(text)
{
if(jQuery('body').find('#resultLoading').attr('id') != 'resultLoading'){
jQuery('body').append('<div id="resultLoading" style="display:none"><div><img src="resources/images/ajax-loader.gif"><div>'+text+'</div></div><div class="bg"></div></div>');
}

jQuery('#resultLoading').css({
'width':'100%',
'height':'100%',
'position':'fixed',
'z-index':'10000000',
'top':'0',
'left':'0',
'right':'0',
'bottom':'0',
'margin':'auto'
});

jQuery('#resultLoading .bg').css({
'background':'#000000',
'opacity':'1.7',
'width':'100%',
'height':'100%',
'position':'absolute',
'top':'0'
});

jQuery('#resultLoading>div:first').css({
'width': '250px',
'height':'75px',
'text-align': 'center',
'position': 'fixed',
'top':'0',
'left':'0',
'right':'0',
'bottom':'0',
'margin':'auto',
'font-size':'16px',
'z-index':'10',
'color':'#ffffff'

});

jQuery('#resultLoading .bg').height('100%');
jQuery('#resultLoading').fadeIn(300);
jQuery('body').css('cursor', 'wait');
}

function ajaxindicatorstart(text)
{
if(jQuery('body').find('#resultLoading').attr('id') != 'resultLoading'){
jQuery('body').append('<div id="resultLoading" style="display:none"><div><img src="resources/images/ajax-loader.gif"><div>'+text+'</div></div><div class="bg"></div></div>');
}

jQuery('#resultLoading').css({
'width':'100%',
'height':'100%',
'position':'fixed',
'z-index':'10000000',
'top':'0',
'left':'0',
'right':'0',
'bottom':'0',
'margin':'auto'
});

jQuery('#resultLoading .bg').css({
'background':'#000000',
'opacity':'0.7',
'width':'100%',
'height':'100%',
'position':'absolute',
'top':'0'
});

jQuery('#resultLoading>div:first').css({
'width': '250px',
'height':'75px',
'text-align': 'center',
'position': 'fixed',
'top':'0',
'left':'0',
'right':'0',
'bottom':'0',
'margin':'auto',
'font-size':'16px',
'z-index':'10',
'color':'#ffffff'

});

jQuery('#resultLoading .bg').height('100%');
jQuery('#resultLoading').fadeIn(300);
jQuery('body').css('cursor', 'wait');
}


function ajaxindicatorstop()
{
jQuery('#resultLoading .bg').height('100%');
jQuery('#resultLoading').fadeOut(300);
jQuery('body').css('cursor', 'default');
}