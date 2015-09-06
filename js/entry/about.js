$('.card_reveal').each(function(){
  $(this).parent().on('mouseover', function(){
  	$(this).children('.card_reveal').css({left: 100 + "%"});
  });
  $(this).parent().on('mouseout', function(){
  	$(this).children('.card_reveal').css({left: 0});
  })
});