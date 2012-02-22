require 'redcarpet'

module Markdpwn

# markdpwn is a clone of gfm (Git-Flavored Markdown).
module Dpwn
  # Marks up text using markdpwn.
  #
  # The caller is responsible for making sure that the text can be rendered
  # using markdpwn.
  #
  # @param [String] text the text to be formatted using Markdpwn
  # @return [String] a HTML fragment containing the formatted text
  def self.render(text)
    renderer = Markdpwn::RedCarpetRenderer.new 
    md = Redcarpet::Markdown.new renderer,
      :autolink => true,
      :no_intra_emphasis => true,
      :tables => true,
      :fenced_code_blocks => true,
      :strikethrough => true,
      :space_after_headers => true
    md.render text
  end
  
  # Checks if some file should be formatted using Markdpwn.
  # @option options [String] :mime_type the MIME type of the code file; e-mail
  #     attachments and git blobs have MIME types
  # @option options [String] :file_name the name of the file containing the
  #     piece of code; meaningful for files in version control repositories,
  #     e-mail attachments, and code fetched from links
  # @return [Boolean] true if the given file is suitable for Markdpwn, false
  #     otherwise
  def self.accepts?(options)
    return unless file_name = options[:file_name]
    ext = File.extname file_name
    ['.markdown', '.md'].include? ext
  end
end  # namespace MarkDpwn::Dpwn

end  # namespace MarkDpwn
