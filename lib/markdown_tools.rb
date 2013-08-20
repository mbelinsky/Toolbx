module MarkdownTools
  def markdownify(text, use_email_renderer = false, use_default_renderer = false)
    # if use_email_renderer
    #   rndr = MarkdownEmailRenderer.new(hard_wrap: true, gh_blockcode: true, filter_html: true, no_styles: true, safe_links_only: true, autolink: true, no_intraemphasis: true, fenced_code: true, gh_blockcode: true)
    # elsif use_default_renderer
      # rndr = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: false, no_styles: true, safe_links_only: true, autolink: true, no_intraemphasis: true, fenced_code: true, gh_blockcode: true)
    # else
    # end

    rndr = MarkdownEmailRenderer.new(hard_wrap: true, filter_html: true, no_styles: true, safe_links_only: true, autolink: true, no_intraemphasis: true, fenced_code: true, gh_blockcode: true)

    redcarpet = Redcarpet::Markdown.new(rndr, space_after_headers: true, fenced_code_blocks: true, autolink: true, no_intraemphasis: true, strikethrough: true, superscripts: true)

    redcarpet.render(text).html_safe
  end

  def self.included m
    m.helper_method :markdownify
  end

private
  class MarkdownRenderer < Redcarpet::Render::HTML
    # def link(link, title, content)
    #   "<a target=\"_blank\" href=\"#{link}\">#{content}</a>"
    # end
    # def autolink(link, link_type)
    #   "<a target=\"_blank\" href=\"#{link}\">#{link}</a>"
    # end
    def block_code(code, language)
      CodeRay.highlight(code, language)
    end
  end

  class MarkdownEmailRenderer < Redcarpet::Render::HTML
    def image(link, title, alt_text)
      "(Image: #{link})"
    end
  end
end