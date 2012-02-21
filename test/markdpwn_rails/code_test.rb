require File.expand_path('../helper', File.dirname(__FILE__))

describe Markdpwn::Code do
  describe '#pygment return value' do
    describe 'with ruby code' do
      let :result do
        Markdpwn::Code.pygment ":symbol => 'string'", :language => 'ruby' 
      end
      
      it 'includes a parsed symbol' do
        result.must_match '<span class="ss">:symbol</span>'
      end
      
      it 'does not contain a <div>' do
        result.wont_match '<div'
      end
      
      it 'does not contain a <pre>' do
        result.wont_match '<pre'
      end
    end
    
    describe 'with view.html.erb' do
      let :result do
        Markdpwn::Code.pygment code_fixture('view.html.erb'),
            :file_name => 'view.html.erb' 
      end
      
      it 'includes a parsed <h1> tag' do
        result.must_match '<span class="nt">&lt;h1&gt;</span>'
      end
    end
  end
  
  describe '#pygments_lexer' do
    describe 'with :mime_type' do
      it 'returns rb for text/x-ruby' do
        Markdpwn::Code.pygments_lexer(:mime_type => 'text/x-ruby').
            must_equal 'rb'
      end

      it 'returns nil for application/random-mime' do
        Markdpwn::Code.pygments_lexer(:mime_type => 'application/random-mime').
            must_equal nil
      end
    end
    
    describe 'with :file_name' do
      it 'returns rb for x.rb' do
        Markdpwn::Code.pygments_lexer(:file_name => 'x.rb').
            must_equal 'rb'
      end

      it 'returns nil for x.random-ext' do
        Markdpwn::Code.pygments_lexer(:file_name => 'x.random-ext').
            must_equal nil
      end
    end
    
    describe 'with :language' do
      it 'returns rb for ruby' do
        Markdpwn::Code.pygments_lexer(:language => 'ruby').
            must_equal 'rb'
      end

      it 'returns nil for random-lang' do
        Markdpwn::Code.pygments_lexer(:language => 'random-lang').
            must_equal nil
      end
    end
    
    describe 'with :code' do
      it 'returns html+erb or xml+erb for view.html.erb' do
        Markdpwn::Code.pygments_lexer(:code => code_fixture('view.html.erb')).
            must_match /^(ht|x)ml\+erb$/
      end
    end
  end
end
