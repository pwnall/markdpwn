require 'redcarpet'
require 'RedCloth'
require 'rdoc'
require 'creole'
require 'wikicloth'

require 'github/markup'

module Markdpwn

# Document (e.g. textile, markdown) formatting.
module Docs
  # The raw GitHub::Markup output for parsing a text document.
  #
  # @option options [String] :mime_type the MIME type of the code file; e-mail
  #     attachments and git blobs have MIME types
  # @option options [String] :file_name the name of the file containing the
  #     piece of code; meaningful for files in version control repositories,
  #     e-mail attachments, and code fetched from links
  # @return [String] the GitHub::Markup output, or nil if the file cannot be
  #     rendered by GitHub::Markup
  def self.gh_markup(text, options = {})
    # NOTE: the MIME type is specified in the API so clients won't need to 
    #       change if/when MIME-based detection is added
    file_name = options[:file_name]
    if file_name && GitHub::Markup.can_render?(file_name)
      GitHub::Markup.render file_name, text
    else
      nil
    end
  end
end  # namespace Markdpwn::Docs

end  # namespace Markdpwn
