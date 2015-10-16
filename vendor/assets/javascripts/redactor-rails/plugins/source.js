if (!RedactorPlugins) var RedactorPlugins = {};

(function($)
{
  var toggle = true;
  RedactorPlugins.source = function()
  {
    return {
      init: function()
      {
        var button = this.button.addFirst('html', 'HTML');
        this.button.addCallback(button, this.source.toggle);
      },
      toggle: function()
      {
        if (toggle == true) {
          this.code.showCode();
          toggle = false;
        }
        else {
          this.code.showVisual();
          toggle = true;
        }
        return ;
      }
    };
  };
})(jQuery);
