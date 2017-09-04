//= require toggle-password
//= require aes
//= require aes-ctr

var MessageShow = {
  init: function () {
    this.$body = $('.js-body');
    this.$password = $('.js-password');
    this.$decryptButton = $('.js-decrypt-button');
    this.$decryptBlock = $('.js-decrypt-block');

    this.initDecrypt();
  },

  initDecrypt: function () {
    MessageShow.$decryptButton.click(function (event) {
      event.stopPropagation();
      event.preventDefault();

      MessageShow.decrypt();
      MessageShow.$decryptBlock.remove();
    });
  },

  decrypt: function () {
    var body = MessageShow.$body[0].innerHTML;

    MessageShow.$body.html(
      Aes.Ctr.decrypt(body, MessageShow.$password.val(), 256)
    );
  }
};

$(function () {
  MessageShow.init();
});
