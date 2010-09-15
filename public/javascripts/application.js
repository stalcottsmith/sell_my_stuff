// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function(){
	
	$(".bidder_name").focusin(function() {
		$(this).parents('.row').animate({
		    height: '153'
		  }, 500);
		$(this).parent().children('.hidden-elements').show(500);
	});
	
	$(".item_offer").focusin(function() {
		$(this).parents('.row').animate({
		    height: '50'
		  }, 500);
		$(this).parents('.row').find('.hidden-elements').each(function() {
			$(this).hide(500);
		});
	});
	
	$("form.edit_item").submit(function() {
		return confirm("Are you sure?");
	});
	
	$(".accept-reject input").change(function() {
		$(this).siblings("input:checkbox:checked").val(0);
		$(this).parents('form').submit();
	});
	
	
	$("#description .text").click(function() {
		$('#description .form').show(250, function() {
			$('#description .text').hide(250);
		});
	});
	
});