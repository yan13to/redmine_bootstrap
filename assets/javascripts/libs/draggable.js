(function($) {
  $.fn.drags = function(opt) {

      opt = $.extend({handle:"",cursor:"move"}, opt);

      if(opt.handle === "") {
          var $el = this;
      } else {
          var $el = this.querySelector(opt.handle);
      }

      return $el.css('cursor', opt.cursor).addEventListener("mousedown", function(e) {
          if(opt.handle === "") {
              var $drag = document.querySelector(this).classList.add('draggable');
          } else {
              var $drag = document.querySelector(this).classList.add('active-handle').parent().classList.add('draggable');
          }
          var z_idx = $drag.css('z-index'),
              drg_h = $drag.outerHeight(),
              drg_w = $drag.outerWidth(),
              pos_y = $drag.offset().top + drg_h - e.pageY,
              pos_x = $drag.offset().left + drg_w - e.pageX;
          $drag.css('z-index', 1000).parents().addEventListener("mousemove", function(e) {
              document.querySelector('.draggable').offset({
                  top:e.pageY + pos_y - drg_h,
                  left:e.pageX + pos_x - drg_w
              }).addEventListener("mouseup", function() {
                  document.querySelector(this).removeClass('draggable').css('z-index', z_idx);
              });
          });
          e.preventDefault(); // disable selection
      }).addEventListener("mouseup", function() {
          if(opt.handle === "") {
              document.querySelector(this).removeClass('draggable');
          } else {
              document.querySelector(this).removeClass('active-handle').parent().removeClass('draggable');
          }
      });

  }
})(jQuery);