var TogglePassword = {
  init: function () {
    this.$password = $('.js-password');
    this.$showPassword = $('.js-show-password');

    this.togglePassword();
  },

  togglePassword: function () {
    TogglePassword.$showPassword.change(function() {
      if ($(this).prop('checked')) {
        TogglePassword.$password.attr('type', 'text');
      } else {
        TogglePassword.$password.attr('type', 'password');
      }
    });
  }
};

$(function () {
  TogglePassword.init();
});
