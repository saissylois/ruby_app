#!/usr/bin/env ruby

require_relative '../web_page_analytics'

puts "\r\n"
puts "Pages with total number of views..."
page_per_total_views = WebPageAnalytics.page_per_total_views(ARGV[0])

puts "#{page_per_total_views}"
puts "End..."

puts "\r\n"
puts "Pages with total number of unique views..."
page_per_total_views = WebPageAnalytics.page_per_unique_views(ARGV[0])

puts "#{page_per_total_views}"
puts "End..."
