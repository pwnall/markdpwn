module Markdpwn

# Unified interface for formatting a file.
module Glue
  # Marks up text using markdpwn.
  #
  # The caller is responsible for making sure that the text can be rendered
  # using markdpwn.
  #
  # @param [String] text the text to be formatted
  # @param [String]
  # @return [String] the formatted text
  def self.render(text, options = {})
    renderer = CodeRenderer.new :filter_html => true,
        :no_styles => true, :safe_links_only => true 
    mdpwn = Redcarpet::Markdown.new renderer, :autolink => true,
        :no_intra_emphasis => true, :tables => true,
        :fenced_code_blocks => true, :strikethrough => true,
        :space_after_headers => true
    mdpwn.render blob.data
  end
end  # namespace MarkDpwn::Glue

end  # namespace MarkDpwn
