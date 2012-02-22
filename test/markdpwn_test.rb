require File.expand_path('./helper', File.dirname(__FILE__))

describe Markdpwn do
  describe "#markup" do
    describe "with the readme.md fixture" do
      let :result do
        Markdpwn.markup code_fixture("readme.md"), :file_name => 'readme.md'
      end
      
      it 'includes a parsed <h1> tag' do
        result.must_match '<span class="nt">&lt;h1&gt;</span>'
      end

      it 'includes a parsed :partial symbol' do
        result.must_match '<span class="ss">:partial</span>'
      end
    end
    
    describe "with the readme.textile fixture" do
      let :result do
        Markdpwn.markup code_fixture("readme.textile"),
                        :file_name => 'readme.textile'
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
    end

    describe "with the view.html.erb fixture" do
      let :result do
        Markdpwn.markup code_fixture("view.html.erb"),
                        :file_name => 'view.html.erb'
      end
      
      it 'is wrapped in a <div> with the markdpwn-parsed-code class' do
        result.must_match /\A<div class="markdpwn-parsed-code">.*<\/div>\Z/m
      end
      
      it 'includes a parsed <h1> tag' do
        result.must_match '<span class="nt">&lt;h1&gt;</span>'
      end
      
      it 'includes a parsed :partial symbol' do
        result.must_match '<span class="ss">:partial</span>'
      end
    end
  end

  describe "#markdpwn" do
    describe "with the readme.md fixture" do
      let :result do
        Markdpwn.markdpwn code_fixture("readme.md")
      end
      
      it 'includes a parsed <h1> tag' do
        result.must_match '<span class="nt">&lt;h1&gt;</span>'
      end

      it 'includes a parsed :partial symbol' do
        result.must_match '<span class="ss">:partial</span>'
      end
    end
  end
end
