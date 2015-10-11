// デバイス判別用ユーザエージェントグローバル変数の初期化
// 2015バージョン
var _ua = (function(u){
    return {
        Tablet:(u.indexOf("windows") != -1 && u.indexOf("touch") != -1)
            || u.indexOf("ipad") != -1
            || (u.indexOf("android") != -1 && u.indexOf("mobile") == -1)
            || (u.indexOf("firefox") != -1 && u.indexOf("tablet") != -1)
            || u.indexOf("kindle") != -1
            || u.indexOf("silk") != -1
            || u.indexOf("playbook") != -1,
        Mobile:(u.indexOf("windows") != -1 && u.indexOf("phone") != -1)
            || u.indexOf("iphone") != -1
            || u.indexOf("ipod") != -1
            || (u.indexOf("android") != -1 && u.indexOf("mobile") != -1)
            || (u.indexOf("firefox") != -1 && u.indexOf("mobile") != -1)
            || u.indexOf("blackberry") != -1
    }
})(window.navigator.userAgent.toLowerCase());


/*
 * ヘッダアイコン表示制御
 */
function update_header_icon() {
    // モバイルデバイスの場合ヘッダアイコンを隠す
    if(_ua.Mobile){
        var element = document.getElementById("headericon");
        element.style.display = 'none';
    };    
}

/*
 * 記事の画像にfancyboxスタイルを適用する
 */
function update_article_img() {
    $('article img').each(function( index ) {
        var wrap_tag = "<a class=\"fancybox\" href=\"" + this.src + "\" data-fancybox-group=\"gallery\"></a>";
        $(this).wrap(wrap_tag);
    });
    $('.fancybox').fancybox();
}


/*
 * gist埋め込み要素のスタイル調整
 */
function fix_gist_style() {
    $(".gist-data").find("tr").css("border", "none");
}

$(document).ready(function() {
    update_header_icon();
    update_article_img();
    fix_gist_style();
});
