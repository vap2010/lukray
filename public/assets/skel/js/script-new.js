var color1 = '#E9E9E9';
var color1active = '#F4F4F4';  /* Статус не указан	#E9E9E9	#F4F4F4 */

var color2 = '#8B8B8B';
var color2active = '#B7B7B7';  /* Участок не продается	#8B8B8B	#B7B7B7 */

var color3 = '#9DCBA7';
var color3active = '#AADCB5';  /* Свободен для приобретения	#9DCBA7	#AADCB5 */

var color4 = '#EFE8AA';
var color4active = '#FAF3B2';  /* Добавлен к сравнению	#EFE8AA	#FAF3B2 */

var color5 = '#FFEA38';
var color5active = '#DEFF78';  /* Записан на просмотр	#FFEA38	#DEFF78 */

var color6 = '#FFBBCF';
var color6active = '#FFD9D9';  /* Заявка на аукцион	#FFBBCF	#FFD9D9 */

var color7 = '#CC99FE';
var color7active = '#E1CAFE';  /* Участок зарезервирован	#CC99FE	#E1CAFE */

var color8 = '#FF90F6';
var color8active = '#FFC3F7';  /* Участок забронирован	#FF90F6	#FFC3F7 */

var color9 = '#6063FF';
var color9active = '#9B9FFF';  /* Участок продан	#6063FF	#9B9FFF */

var color10 = '#F47474';
var color10active = '#F4A5A0';  /* Это ваш дачный участок	#F47474	#F4A5A0 */



var mapWidth,mapHeight;

$(document).ready(function(){
	
	$('.map area').each(function(index){
		
		var $this = $(this);
		var color,colorActive;
		
		var x = [];
		var y = [];
		var coord = $this.attr('coords').split(',');
		var length = coord.length;
		for (var i = 0; i < length; i++) {
			x.push(coord[i++]);
			y.push(coord[i]);
		}
		var minX = Math.min.apply(null, x),
		maxX = Math.max.apply(null, x);
		var minY = Math.min.apply(null, y),
		maxY = Math.max.apply(null, y);
		var width = maxX - minX;
		var height = maxY - minY;
		
		for (var i = 0; i < length; i++) {
			if (i % 2 == 0){
				coord[i] = coord[i] - minX;
			} else {
				coord[i] = coord[i] - minY;
			}
		}
		
		$this.attr('data-id',index+1);
		/*   $this.attr('data-type',Math.floor((Math.random() * 10) + 1));   */ 
		switch ($this.data('type')){
			case 1:
				color = color1;
				colorActive = color1active;
			break;
			case 2:
				color = color2;
				colorActive = color2active;
			break;
			case 3:
				color = color3;
				colorActive = color3active;
			break;
			case 4:
				color = color4;
				colorActive = color4active;
			break;
			case 5:
				color = color5;
				colorActive = color5active;
			break;
			case 6:
				color = color6;
				colorActive = color6active;
			break;
			case 7:
				color = color7;
				colorActive = color7active;
			break;
			case 8:
				color = color8;
				colorActive = color8active;
			break;
			case 9:
				color = color9;
				colorActive = color9active;
			break;
			case 10:
				color = color10;
				colorActive = color10active;
			break;
		}
		$this.data('color',color);
		$this.data('color-active',colorActive);
		$this.attr('href','/main/modal/' + $this.attr('alt'));
		$this.data('width',width);
		$this.data('height',height);
		$this.data('coord',coord);

		draw($this.data('id'), $this.data('color'), $this.data('color-active'), $this.data('coord'), $this.data('width'), $this.data('height'), minX, minY, false);
		
		$this.qtip({
			content: {
				text: function(event,api){
					$.ajax({url: $this.attr('href')})
						.done(function(html){
							api.set('content.text',html)
						})
						.fail(function(xhr, status, error){
							api.set('content.text',status + ': ' + error)
						})
					return 'Loading...';
				}
			},
			show: {
				event: 'click'
			},
			hide: {
				event: 'unfocus'
			},
			position: {
				viewport: $('.map'),
				effect: false,
				adjust: {
					method: 'none shift',
					x: 20
				}
			}
		});
	});
	
	$('.map area').hover(function(){
		var $this = $(this);
		draw($this.data('id'), $this.data('color'), $this.data('color-active'), $this.data('coord'), $this.data('width'), $this.data('height'), 0, 0, true);
	},function(){
		if(!$(this).hasClass('active')){
			var $this = $(this);
			draw($this.data('id'), $this.data('color'), $this.data('color-active'), $this.data('coord'), $this.data('width'), $this.data('height'), 0, 0, false);
		}
	});
	
	$('.navigation, header ,section ,footer').click(function(){
		$('.map area.active').each(function(){
			var $this = $(this);
			draw($this.data('id'), $this.data('color'), $this.data('color-active'), $this.data('coord'), $this.data('width'), $this.data('height'), 0, 0, false);
			$(this).removeClass('active');
		});
	});
	
	$('.map area').click(function(){
		$('.map area.active').each(function(){
			var $this = $(this);
			draw($this.data('id'), $this.data('color'), $this.data('color-active'), $this.data('coord'), $this.data('width'), $this.data('height'), 0, 0, false);
			$(this).removeClass('active');
		});
		$(this).addClass('active');
		return false;
	});
	
	$('.compare').livequery(function(){
		$(this).click(function(){
			var $this = $('.map area.active');
			$this.data('type',4);
			$this.data('color',color4);
			$this.data('color-active',color4active);
			draw($this.data('id'), $this.data('color'), $this.data('color-active'), $this.data('coord'), $this.data('width'), $this.data('height'), 0, 0, true);
			return false;
		});
	});
	
});

function draw(id,color,colorActive,poly,width,height,left,top,active){

	if(active){
		colorFill = colorActive;
	} else {
		colorFill = color;
	}
	var id = 'area-' + id;
	if(!$('#' + id).length){
		$('.map-canvas').append('<canvas id="' + id + '"></canvas>');
		$('#' + id).css('left',left);
		$('#' + id).css('top',top);
	}
	var element = $('#' + id).get(0);
	element.width  = width;
	element.height = height;
	var context = element.getContext('2d');
	context.beginPath();
	context.moveTo(poly[0], poly[1]);
	for(i=2; i < poly.length; i+=2) {
		context.lineTo(poly[i], poly[i+1]);
	}
	context.closePath();
	context.strokeStyle = '#6B5D1C';
	context.stroke();
	context.fillStyle = colorFill;
	context.fill();
	
}