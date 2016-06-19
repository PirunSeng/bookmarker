FastFinder.Common =
  init: ->
    @toast()

  toast: ->
    alert       = $('#alert').text()
    deviseAlert = $('#devise-alert').text()
    notice      = $('#notice').text()
    Materialize.toast(alert, 4000, 'error')
    Materialize.toast(deviseAlert, 4000, 'error')
    Materialize.toast(notice, 4000, 'success')
