module ServerLog
  class Parser
    attr_reader :lines, :page_views

    def initialize(file)
      @lines = File.readlines file
    end

    def total_views
      pages = lines.map do |line|
        arr = line.split('/')
        arr.count < 3 ? arr[1].split(" ").first : arr[1]
      end

      webpages = pages.uniq

      @page_views = webpages.map do |webpage|
        views = lines.select { |n| n.include? webpage }

        {
          page_name: webpage,
          views: views.count
        }
      end

      flattened_response
    end

    def unique_views
      page_path = lines.map do |line|
        arr = line.split(' ')
        arr.first
      end

      paths = page_path.uniq

      @page_views = paths.map do |path|
        views = lines.select { |n| n.include? path }

        {
          page_name: path,
          views: views.uniq.count
        }
      end

      flattened_response
    end

    private

    def flattened_response
      str = ""
      sort_desc.each do |page_view|
        str += ", " unless str.empty?
        str += "#{page_view[:page_name]} -> #{page_view[:views]} views"
      end

      str
    end

    def sort_desc
      page_views.sort_by { |k| k[:views] }.reverse!
    end
  end
end
