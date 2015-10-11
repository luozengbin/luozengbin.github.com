$(document).ready(function() {
    $('article img').each(function( index ) {
        var wrap_tag = "<a class=\"fancybox\" href=\"" + this.src + "\" data-fancybox-group=\"gallery\"></a>";
        $(this).wrap(wrap_tag);
    });

    //.css('border', '3px solid gray');
	$('.fancybox').fancybox();
});
