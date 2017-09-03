//= require inspinia/summernote/summernote.min
//= require inspinia/iCheck/icheck.min
//= require bootstrap-duration-picker

var MessageForm = {
    init: function () {
        this.$summernote = $('.js-summernote');
        this.$duration = $('.js-duration');
        this.$ichecks = $('.i-checks');
        this.$radioHours = $('.js-hours-radio');
        this.$radioVisits = $('.js-visits-radio');
        this.$blockHours = $('.js-hours-block');
        this.$blockVisits = $('.js-visits-block');
        this.$password = $('.js-password');
        this.$showPassword = $('.js-show-password');
        

        this.initSummernote();
        this.initDuration();
        this.initIchecks();
        this.initRadiosAndBlocks();
        this.togglePassword();
    },

    initSummernote: function () {
        MessageForm.$summernote.summernote({
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
        MessageForm.$duration.durationPicker({
            showSeconds: true
        });
    },

    initIchecks: function () {
        MessageForm.$ichecks.iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green'
        });
    },

    initRadiosAndBlocks: function () {
        MessageForm.$blockHours.hide();
        
        MessageForm.$radioVisits.on('ifChecked', function () {
            
            MessageForm.$blockVisits.show();
            MessageForm.$blockHours.hide();
        });
        MessageForm.$radioHours.on('ifChecked', function () {
            MessageForm.$blockVisits.hide();
            MessageForm.$blockHours.show();
        });
    },

    togglePassword: function () {
        MessageForm.$showPassword.change(function() {
            if ($(this).prop('checked')) {
                MessageForm.$password.attr('type', 'text');
            } else {
                MessageForm.$password.attr('type', 'password');
            }
        });
    }
};

$(function () {
    MessageForm.init();
});
