require 'pygments.rb'

module Markdpwn

# Code formatting.
module Code
  # Marks up code.
  #
  # @param [String] code the code to be formatted
  # @param [Hash] options code properties that help choose the formatter
  # @option options [String] :mime_type the MIME type of the code file; e-mail
  #     attachments and git blobs have MIME types
  # @option options [String] :file_name the name of the file containing the
  #     piece of code; meaningful for files in version control repositories,
  #     e-mail attachments, and code fetched from links
  # @option options [String] :language the name of the code's language; GFM code
  #     blocks can include a language name
  # @return [String] a HTML fragment containing the formatted code
  def self.render(code, options = {})
    [
      %Q|<div class="markdpwn-parsed-code">|,
      pygment(code, options),
      "</div>"
    ].join ''
  end
  
  # The raw Pygments output for parsing some code.
  #
  def self.pygment(code, options = {})
    lexer = pygments_lexer options
    Pygments.highlight code, :lexer => lexer, :formatter => 'html',
        :options => { :encoding => 'utf-8', :nowrap => true }
  end
  
  # The name of the Python lexer that is most suitable for some code.
  #
  # @param [Hash] options code properties that help choose the formatter
  # @option options [String] :code the code to be parsed, or a sample of the
  #     code; if code is provided, a language will always be returned
  # @see Markdpwn::Code#render for other available options
  # @return [String] the name of a Pygments lexer that can parse the code
  def self.pygments_lexer(options = {})
    if language = options[:language]
      lexer = begin
        Pygments.lexer_name_for :lexer => language
      rescue RubyPython::PythonError
        nil
      end
      return lexer if lexer
    end
    
    if mime_type = options[:mime_type]
      lexer = begin
        Pygments.lexer_name_for :mimetype => mime_type
      rescue RubyPython::PythonError
        nil
      end
      return lexer if lexer
    end
    
    if file_name = options[:file_name]
      lexer = begin
        Pygments.lexer_name_for :filename => file_name
      rescue RubyPython::PythonError
        nil
      end
      return lexer if lexer
    end
    
    if code = options[:code]
      lexer = begin
        Pygments.lexer_name_for code
      rescue RubyPython::PythonError
        nil
      end
      return lexer if lexer
    end
    
    nil
  end
end  # namespace Markdpwn::Code

end  # namespace Markdpwn
