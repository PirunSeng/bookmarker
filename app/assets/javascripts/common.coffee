FastFinder.Common =
  init: ->
    @hideNotification()
    @initDropdownMenu()

  hideNotification: ->
    notice = $('p#notice')
    if notice
      setTimeout (->
        $(notice).fadeOut()
      ), 5000

  initDropdownMenu: ->
    $(".dropdown-button").dropdown()
