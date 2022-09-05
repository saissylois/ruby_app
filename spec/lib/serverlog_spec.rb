require_relative '../spec_helper'
require_relative '../../lib/serverlog'

RSpec.describe ServerLog do

  describe '.sort_desc' do
    it "should return the list og pages with total view count sorted by descending order" do
      parser = ServerLog::Parser.new("webserver.log")
      parser.total_views
      page_list = parser.send(:sort_desc)

      expect(page_list.count).to eq 5
      expect(page_list[0][:page_name]).to eq "about"
      expect(page_list[0][:views]).to eq 171
      expect(page_list[4][:page_name]).to eq "home"
      expect(page_list[4][:views]).to eq 78
    end

    it "should return the list of pages with unique view count sorted by descending order" do
      parser = ServerLog::Parser.new("webserver.log")
      parser.unique_views
      page_list = parser.send(:sort_desc)

      expect(page_list.count).to eq 6
      expect(page_list[0][:page_name]).to eq "/about"
      expect(page_list[0][:views]).to eq 43
      expect(page_list[5][:page_name]).to eq "/about/2"
      expect(page_list[5][:views]).to eq 22
    end
  end

  describe '.flattened_response' do
    it "should return a string with total view count sorted by descending order" do
      parser = ServerLog::Parser.new("webserver.log")
      parser.total_views
      response = parser.send(:flattened_response)

      expect(response).to eq "about -> 171 views, contact -> 89 views, index -> 82 views, help_page -> 80 views, home -> 78 views"
    end

    it "should return a string with unique view count sorted by descending order" do
      parser = ServerLog::Parser.new("webserver.log")
      parser.unique_views
      response = parser.send(:flattened_response)

      expect(response).to eq "/about -> 43 views, /index -> 23 views, /home -> 23 views, /contact -> 23 views, /help_page/1 -> 23 views, /about/2 -> 22 views"
    end
  end
end
