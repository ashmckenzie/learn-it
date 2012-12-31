jQuery ->
  $('a#add-new-answer').on 'click', (e) ->
    # time = new Date().getTime()
    # regexp = new RegExp($(this).data('id'), 'g')
    # $('#answers').append('<p>' + $(this).data('fields').replace(regexp, time) + '</p>')
    $('#answers').append('<p>' + $(this).data('fields') + '</p>')
    e.preventDefault()
