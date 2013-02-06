if $('html').is('.admin.articles.edit, .admin.articles.update, .admin.articles.new, .admin.articles.create')
	$(document).ready ->
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