if $('html').is('.admin.articles.edit, .admin.articles.update, .admin.articles.new, .admin.articles.create')
  $(document).ready ->
    $('#article-search-tag-ids').select2
      initSelection: (el, cb) ->
        tags = $.parseJSON(el.val())

        return el.val('') unless tags

        actualVal = []
        for tag in tags
          actualVal.push tag.id
        el.val(actualVal.join(','))

        cb(tags)
      multiple: true
      minimumInputLength: 1
      createSearchChoice: (term) ->
        return {id: term, text: term}
      ajax:
        url: '/admin/search-tags'
        dataType: 'json'
        data: (term, page) ->
          return {q: term}
        results: (term, page) ->
          return {results: term, more: false}

    $('#article_body').redactor
      buttons: ['formatting', '|', 'bold', 'italic', 'deleted', '|', 'unorderedlist', 'orderedlist', 'outdent', 'indent', '|', 'image', 'video', 'file', 'link', '|', 'alignment', '|', 'horizontalrule']
      imageGetJson: '/admin/article_images'
      imageUpload: "/admin/article_images?#{$('meta[name=csrf-param]').attr('content')}=#{encodeURIComponent($('meta[name=csrf-token]').attr('content'))}"
      imageUploadErrorCallback: (obj, json) ->
        alert json.error
      minHeight: 500
      autoResize: false

    # Changing the featured image
    fiTrigger = $('.featured-image').find('button')

    fiTrigger.on 'click', (e) ->
      e.preventDefault()
      $('#article_featured_image').trigger('click')

    $('#article_featured_image').on 'change', (e) ->
      val = $(this).val()

      fiTrigger.find('span').text(val.substr(val.lastIndexOf('\\') + 1))
      fiTrigger.siblings('img').remove()

    # Character counter for article titles
    charCounter = $('.char-counter')

    charCounter.find('.count').text($('#article_title').val().length)
    # Update on KeyPress
    $("#article_title").keyup ->
      charCounter.find('.count').text(0 + $(this).val().length)
      # Bold the span if we reach the limit
      if parseInt($('.count').text()) > 50
        charCounter.addClass('warning')
      else
        charCounter.removeClass('warning')