/*модальное окно*/
$(document).ready(function(){
	$('.modal_form').click(function(){
		$('#exampleModal').arcticmodal();
	});
});
/*очистить input при клике*/
$(document).ready(function () {
	$('input,textarea').focus(function(){
		$(this).data('placeholder',$(this).attr('placeholder'))
		$(this).attr('placeholder','');
	});
	$('input,textarea').blur(function(){
		$(this).attr('placeholder',$(this).data('placeholder'));
	});
});
/*Проверка формы заказа звонка*/
$(document).ready(function(){
    $("#forma_zvon").validate({
       rules:{
            name:{
                required: false,
                minlength: 4,
                maxlength: 16,
            },
            phone:{
                required: true,
                minlength: 5,
                maxlength: 16,
            },
            pmail:{
                required: false,
                minlength: 5,
                maxlength: 25,
            },
       },
       messages:{
            name:{
                required: "Это поле обязательно для заполнения",
                minlength: "Имя должно быть минимум 4 символа",
                maxlength: "Максимальное число символо - 16",
            },
            phone:{
                required: "Это поле обязательно для заполнения",
                minlength: "Телефон должен быть минимум 5 символов",
                maxlength: "Телефон должен быть максимум 16 символов",
            },
            pmail:{
                required: "Это поле обязательно для заполнения",
                minlength: "E-mail должен быть минимум 5 символов",
                maxlength: "E-mail должен быть максимум 25 символов",
            },
       }
    });
});
/*Отправка формы*/
$(document).ready(function () {
	$("#forma_zvon .s_submit").click(function(){ AjaxFormRequest('messegeResult', 'forma_zvon', 'send.php'); return false; });
});

function AjaxFormRequest(result_id,form_id,url) {
		jQuery.ajax({
			url:     url, //Адрес подгружаемой страницы
			type:     "POST", //Тип запроса
			dataType: "html", //Тип данных
			data: jQuery("#"+form_id).serialize(), 
			success: function(response) { //Если все нормально
			document.getElementById(result_id).innerHTML = "Спасибо за обращение, мы вам перезвоним!";
			$("#"+form_id).hide();
			setTimeout("$('#exampleModal').arcticmodal('close');", 10000);
		},
		error: function(response) { //Если ошибка
		document.getElementById(result_id).innerHTML = "Ошибка при отправке формы";
		}
	});
}
/*меню*/
jQuery(document).ready(function($){

	/* Подготавливаем иконку меню */
	$('#nav-wrap').prepend('<div id="menu-icon"></div>');
	
	/* Переключаем навигацию */
	$("#menu-icon").on("click", function(){
		$("#nav").slideToggle();
		$(this).toggleClass("active");
	});

});
/*активная кнопка, если открыто подменю*/
$(document).ready(function(){
	$(".podmenu").mouseover(function(){
		var listel = $(this).parent().children('a');
		if (listel.hasClass("active")){
		}
		else{
			listel.addClass('active');
			$(".podmenu").mouseout(function(){
				$(this).parent().children('a').removeClass('active');
				}
			);
		}
	});
});

/*телефон в мобильной версии*/
jQuery(document).ready(function($){
	$("header .head_icon_phone").on("click", function(){
		$("header .contakt").slideToggle();
		$(this).toggleClass("active");
	});
});

/*Смена фона*/
$(document).ready(function(){
	$('.bl_first').bgStretcher({
	images: big_images_arr, //ссылки на изображения
	imageHeight: 1024,//высотра изображений
	nextSlideDelay:5000,//интервал между слайдами
	slideShowSpeed:1000,//скорость смены слайдов
	transitionEffect:"fade",/* Эффект смены слайдов. Варианты: simpleSlide, superSlide, fade*/
	preloadImg:true,//предварительная загрузка изображений
	anchoringImg: "center",//выравнивание изображений
	pagination: ".pagination"//возможность выбрать слайд
	});
});

/*
  images: ['assets/skel/img/bg/bg_1.jpg', 'assets/skel/img/bg/bg_2.jpg', 'assets/skel/img/bg/bg_3.jpg', 'assets/skel/img/bg/bg_4.jpg', 'assets/skel/img/bg/bg_5.jpg'], //ссылки на изображения

, 'assets/skel/img/bg/bg_6.jpg', 'assets/skel/img/bg/bg_7.jpg', 'assets/skel/img/bg/bg_8.jpg'
*/
