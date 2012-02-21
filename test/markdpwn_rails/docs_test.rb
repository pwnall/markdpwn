require File.expand_path('../helper', File.dirname(__FILE__))

describe Markdpwn::Docs do
  describe "#render return value" do
    describe "with a .textile document" do
      let :result do
        Markdpwn::Docs.gh_markup code_fixture('readme.textile'),
            :file_name => 'readme.textile' 
      end
      
      it 'includes a heading' do
        result.must_match '<h1>List</h1>'
      end
      
      it 'includes a list item' do
        result.must match '<li>Eggs</li>'
      end
      
      it 'is not wrapped in a <div>' do
        result.wont_match '<pre'
      end

      it 'does not contain a <pre>' do
        result.wont_match '<pre'
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
