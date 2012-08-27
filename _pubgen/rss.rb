#!/usr/bin/env ruby

require 'rss/maker'
require 'yaml'

version = "2.0"

content = RSS::Maker.make(version) do |m|
  m.channel.title = "Emilio G. Cota | Publications by date"
  m.channel.link = "http://cs.columbia.edu/~cota"
  m.channel.description = "Publications of Emilio G. Cota"
  # sort items by date
  m.items.do_sort = true

  input = YAML::load(STDIN)

  input['publications'].each do |l|
    year = l['level_1'].to_s

    l['papers'].each do |pub|
      i = m.items.new_item
      i.title = pub['title'].to_s
      i.link = m.channel.link + "/pubs/" + pub['pdf'].to_s
      if (pub['mon'] == 0)
        pub['mon'] = 1
      end
      i.date = year + "/" + pub['mon'].to_s + "/1"
    end
  end

end

puts(content)
