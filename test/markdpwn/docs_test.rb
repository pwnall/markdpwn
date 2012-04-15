require File.expand_path('../helper', File.dirname(__FILE__))

describe Markdpwn::Docs do
  describe "#render return value" do
    [
      '.asciidoc', '.md', '.org', '.pod', '.rdoc', '.rst', '.textile', '.wiki'
    ].each do |ext|
      describe "with a #{ext} document" do
        let :result do
          Markdpwn::Docs.gh_markup code_fixture("readme#{ext}"),
              :file_name => "readme#{ext}"
        end
        
        it 'includes a heading' do
          result.must_match /<h2[^>]*>.*List.*<\/h2>/m
        end
        
        it 'includes a list item' do
          result.must_match /<li>.*Eggs.*<\/li>/m
        end
        
        it 'is not wrapped in a <div>' do
          result.wont_match '<pre'
        end
  
        it 'does not contain a <pre>' do
          result.wont_match '<pre'
        end
      end
    end      
    
    describe 'with view.html.erb' do
      let :result do
        Markdpwn::Docs.gh_markup code_fixture('view.html.erb'),
                                 :file_name => 'view.html.erb' 
      end
      
      it 'is nil' do
        result.must_equal nil
      end
    end
  end
end
