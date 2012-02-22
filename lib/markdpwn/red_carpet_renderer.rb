module Markdpwn
  
# RedCarpet HTML renderer, augmented to parse code blocks.
# @private
class RedCarpetRenderer < Redcarpet::Render::HTML
  DEFAULT_OPTIONS = { 
    :filter_html => true,
    :no_styles => true,
    :safe_links_only => true
  }.freeze 
  
  def initialize(options = {})
    super DEFAULT_OPTIONS.merge options
  end
  
  def block_code(code, language)
    code_html = Markdpwn::Code.pygment code, :language => language
    [%Q|<pre class="markdpwn-highlight">\n|, code_html, "\n</pre>"].join ''
  end
end  # class MarkdDpwn::RedCarpetRenderer

end  # namespace MarkDpwn
