require 'mechanize'
require 'pry'
# require "pairing_with_nick/version"
require 'sinatra'
module PairingWithNick
  class Reddit
    def reddit
      browser = Mechanize.new
      a = browser.get('http://www.reddit.com/').links
      title_links = a.map { |link|
        process_link(link) if link.dom_class == 'title may-blank '
      }.compact!
      title_links.map { |link| check_reddit_links link }
    end

    def process_link link
      [link.text, link.uri.to_s]
    end

    def check_reddit_links link
      if link[1][0..2] == '/r/'
        link[1] = 'http://www.reddit.com' + link[1]
        link
      else
        link
      end
    end

    def print_links links
      links.each do |link|
        puts link[0]
      end
    end
  end

end

def create_reddit_frontpage
  reddit = PairingWithNick::Reddit.new.reddit
  tags = []
  reddit.each do |vals|
    title = vals[0]
    href = vals[1]
    tags << "<a href='#{href}'>#{title}</a><br>"
  end
  output = ""
  tags.each_with_index do |thang, index|
    output += (index + 1).to_s + ". " + thang 
  end
  output
end


get '/reddit' do
  create_reddit_frontpage
end
