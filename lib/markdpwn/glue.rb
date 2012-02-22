module Markdpwn
  # Marks up a text document.
  #
  # @param [String] text the text to be formatted
  # @param [Hash] options text file properties that help choose the formatter
  # @option options [String] :mime_type the MIME type of the code file; e-mail
  #     attachments and git blobs have MIME types
  # @option options [String] :file_name the name of the file containing the
  #     piece of code; meaningful for files in version control repositories,
  #     e-mail attachments, and code fetched from links
  # @option options [String] :language the name of the text's language; GFM code
  #     blocks can include a language name
  # @return [String] a HTML fragment containing the formatted text
  def self.markup(text, options = {})
    if Markdpwn::Dpwn.accepts? options
      Markdpwn::Dpwn.render text, options
    elsif html = Markdpwn::Docs.gh_markup(text, options)
      html
    else
      Markdpwn::Code.render text, options
    end
  end
  
  # Marks up a markdpwn text document.
  #
  # The caller is responsible for ensuring that the text uses markdpwn, otherwise
  # extreme ugliness might ensue. Use Markdpwn.markup when unsure.
  def self.markdpwn(text, options = {})
    Markdpwn::Dpwn.render text, options
  end
end  # namespace MarkDpwn
