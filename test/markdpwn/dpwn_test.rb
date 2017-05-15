require File.expand_path('../helper', File.dirname(__FILE__))

describe Markdpwn::Dpwn do
  describe "#render return value" do
    describe "with the readme.md fixture" do
      let :result do
        Markdpwn::Dpwn.render code_fixture("readme.md")
      end

      it 'includes a heading' do
        result.must_match(/<h2[^>]*>.*List.*<\/h2>/m)
      end

      it 'includes a list item' do
        result.must_match(/<li>.*Eggs.*<\/li>/m)
      end

      it 'includes a parsed symbol' do
        result.must_match '<span class="ss">:symbol</span>'
      end

      it 'includes a parsed <h1> tag' do
        result.must_match '<span class="nt">&lt;h1&gt;</span>'
      end

      it 'includes a parsed :partial symbol' do
        result.must_match '<span class="ss">:partial</span>'
      end
    end
  end

  describe "#accepts?" do
    ['readme.markdown', 'README.md'].each do |file|
      it "is true for #{file}" do
        Markdpwn::Dpwn.accepts?(:file_name => file).must_equal true
      end
    end

    ['readme.textile', 'readme.txt', 'readme.rb'].each do |file|
      it "is false for #{file}" do
        Markdpwn::Dpwn.accepts?(:file_name => file).must_equal false
      end
    end
  end
end
