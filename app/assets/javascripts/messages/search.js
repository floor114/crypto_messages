//= require send-ajax-data

var MessageSearch = {
  init: function () {
    this.$token = $('.js-token');
    this.$submitButton = $('.js-submit-button');
    this.$form = $('.js-find-form');

    this.initSearch();
  },

  initSearch: function () {
    MessageSearch.$submitButton.click(function (event) {
      var action = MessageSearch.$form[0].action;

      event.stopPropagation();
      event.preventDefault();
      SendAjaxData.send(action, null, null, null, MessageSearch.$form.serialize());
    });
  }
};

$(function () {
  MessageSearch.init();
});
