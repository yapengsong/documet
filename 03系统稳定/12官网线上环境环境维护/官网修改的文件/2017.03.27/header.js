
$(document).ready(function(e) {
    $(".level_menu").hover(function(e) {
        $(this).children(".child_menu").show();
		$(this).children(".leveltwo").addClass("childopen_hover");
	},function(){
        $(this).children(".child_menu").hide();
		$(this).children(".leveltwo").removeClass("childopen_hover");
	});
	$(".main>ul>li").hover(function(e) {
        $(this).children(".childopen").show();
    },function(){
        $(this).children(".childopen").hide();
	});

    //在线客服js
    $(".customer-service").hover(function(){
        $(".customer-phone").show();
    },function(){
        $(".customer-phone").hide();
    });
});