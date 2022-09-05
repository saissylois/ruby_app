require_relative 'spec_helper'
require_relative '../web_page_analytics'

RSpec.describe WebPageAnalytics do

  describe '.page_per_total_views' do
    it 'returns list of webpages per total number of view count order by views desc' do

      response = described_class.page_per_total_views("webserver.log")

      expect(response).to eq "about -> 171 views, contact -> 89 views, index -> 82 views, help_page -> 80 views, home -> 78 views"
    end
  end

  describe '.page_per_unique_views' do
    it 'returns list of webpages per unique number of view count order by views desc' do

      response = described_class.page_per_unique_views("webserver.log")

      expect(response).to eq "/about -> 43 views, /index -> 23 views, /home -> 23 views, /contact -> 23 views, /help_page/1 -> 23 views, /about/2 -> 22 views"
    end
  end
end
