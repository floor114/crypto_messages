//= require inspinia/summernote/summernote.min
//= require inspinia/iCheck/icheck.min
//= require bootstrap-duration-picker
//= require send-ajax-data
//= require toggle-password
//= require aes
//= require aes-ctr

var MessageNew = {
  init: function () {
    this.$summernote = $('.js-summernote');
    this.$duration = $('.js-duration');
    this.$ichecks = $('.i-checks');
    this.$radioHours = $('.js-hours-radio');
    this.$radioVisits = $('.js-visits-radio');
    this.$blockHours = $('.js-hours-block');
    this.$blockVisits = $('.js-visits-block');
    this.$password = $('.js-password');
    this.$submitButton = $('.js-submit-button');
    this.$form = $('.js-create-form');
    this.$encryptedBody = $('.js-ecnrypted-body');

    this.initSummernote();
    this.initDuration();
    this.initIchecks();
    this.initRadiosAndBlocks();
    this.initFormSubmit();
    this.togglePassword();
  },

  initFormSubmit: function () {
    MessageNew.$submitButton.click(function (event) {
      var action = MessageNew.$form[0].action;

      event.stopPropagation();
      event.preventDefault();

      MessageNew.encrypt();
      SendAjaxData.send(action, null, null, null, MessageNew.$form.serialize());
    });
  },

  encrypt: function () {
    if (MessageNew.bodyWithoutTags().length > 0) {
      MessageNew.$encryptedBody.val(
        Aes.Ctr.encrypt(MessageNew.$summernote.code(), MessageNew.$password.val(), 256)
      );
    } else {
      MessageNew.$encryptedBody.val('');
    }
  },

  bodyWithoutTags: function () {
    var html = MessageNew.$summernote.code(),
      div = document.createElement('div');
    div.innerHTML = html;

    return div.textContent || '';
  },

  initSummernote: function () {
    MessageNew.$summernote.summernote({
      height: 100,
      toolbar: [
        ['style', ['bold', 'italic', 'underline', 'clear']],
        ['fontsize', ['fontsize']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['misc', ['undo', 'redo', 'codeview', 'help']],
        ['height', ['height']]
      ],
      focus: true
    });
    $('.note-statusbar').hide();
  },

  initDuration: function () {
    MessageNew.$duration.durationPicker({
      showSeconds: true
    });
  },

  initIchecks: function () {
    MessageNew.$ichecks.iCheck({
      checkboxClass: 'icheckbox_square-green',
      radioClass: 'iradio_square-green'
    });
  },

  initRadiosAndBlocks: function () {
    MessageNew.$blockHours.hide();
    MessageNew.$radioVisits.on('ifChecked', function () {
      MessageNew.$blockHours.hide();
      MessageNew.$blockVisits.show();
    });
    MessageNew.$radioHours.on('ifChecked', function () {
      MessageNew.$blockVisits.hide();
      MessageNew.$blockHours.show();
    });
  }
};

$(function () {
  MessageNew.init();
});
