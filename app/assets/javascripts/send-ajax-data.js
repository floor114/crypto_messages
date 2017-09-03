var SendAjaxData = {
  send: function (action, successCallback, errorCallback, method, data, type) {
    $.ajax({
      type: method || 'post',
      url: action,
      data: data,
      dataType: type || 'json',
      error: errorCallback || SendAjaxData.defaultErrorCallback,
      success: successCallback || SendAjaxData.defaultSuccessCallback
    });
  },

  defaultErrorCallback: function (result) {
    var alert = JSON.parse(result.responseText);

    parseAlerts(alert);
  },

  defaultSuccessCallback: function (result) {
    if (result.url) {
      location.assign(result.url);
    } else {
      parseAlerts(result);
    }
  }
};
