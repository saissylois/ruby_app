require_relative 'lib/serverlog'

module WebPageAnalytics
  class << self

    #list of webpages with page views ordered from most pages views to less page views
    def page_per_total_views(file)
      ServerLog::Parser.new(file).total_views
    rescue => e
      { statusCode: 500, message: e }
    end

    #list of webpages with unique page views ordered from most pages views to less page views
    def page_per_unique_views(file)
      ServerLog::Parser.new(file).unique_views
    end
  end
end
