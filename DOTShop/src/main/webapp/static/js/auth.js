// toggle form (JQuery)
$('.btn-toggle').click(function(){
    $('form').animate({
        height: 'toggle',
        opacity: 'toggle'
    }, 'slow');
});