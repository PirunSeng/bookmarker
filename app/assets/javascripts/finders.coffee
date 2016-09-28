FastFinder.FindersIndex =
  init: ->
    $('.materialize-textarea').trigger('autoresize')
    # @fixedHeaderTableColumns()

  fixedHeaderTableColumns: ->
    if !$('table.finders tbody tr td').hasClass('noresults')
      $('table.finders').DataTable(
        'sScrollY': '500px'
        'sScrollX': true
        'sScrollXInner': '100%'
        'bPaginate': false
        'bFilter': false
        'bInfo': false
        'ordering': false)