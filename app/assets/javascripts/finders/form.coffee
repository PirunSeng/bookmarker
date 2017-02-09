FastFinder.FindersNew = FastFinder.FindersCreate = FastFinder.FindersEdit = FastFinder.FindersUpdate =
  init: ->
    $('.materialize-textarea').trigger('autoresize')
    $('select').material_select();
