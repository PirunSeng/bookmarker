FastFinder.Initializer =
  exec: (pageName) ->
    if pageName && FastFinder[pageName]
      FastFinder[pageName]['init']()

  currentPage: ->
    return '' unless $('body').attr('id')

    bodyId      = $('body').attr('id').split('-')
    action      = FastFinder.Util.capitalize(bodyId[1])
    controller  = FastFinder.Util.capitalize(bodyId[0])
    controller + action

  init: ->
    FastFinder.Initializer.exec('Common')
    if @currentPage()
      FastFinder.Initializer.exec(@currentPage())

$(document).on 'ready page:load', ->
  FastFinder.Initializer.init()
