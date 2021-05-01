// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"

require("channels")
require("packs/main.js")



Rails.start()
Turbolinks.start()
ActiveStorage.start()

$('[data-toggle="collapse"]').on('click', function() {
    var $this = $(this),
            $parent = typeof $this.data('parent')!== 'undefined' ? $($this.data('parent')) : undefined;
    if($parent === undefined) { /* Just toggle my  */
        $this.find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus');
        return true;
    }

    /* Open element will be close if parent !== undefined */
    var currentIcon = $this.find('.glyphicon');
    currentIcon.toggleClass('glyphicon-plus glyphicon-minus');
    $parent.find('.glyphicon').not(currentIcon).removeClass('glyphicon-minus').addClass('glyphicon-plus');

});
