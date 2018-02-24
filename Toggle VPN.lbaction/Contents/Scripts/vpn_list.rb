#!/usr/bin/env ruby
#
# LaunchBar Action Script
#
require 'json'

vpnlist = `osascript vpn_list.scpt`.lines.sort

items = []

vpnlist.each do |entry|
    (name, kind) = entry.chomp.split('|')
    if kind == '0' || kind == '10' || kind == '11' || kind == '13' || kind == '16'
        description = "Connect to #{name}"
        icon = "connect.png"
        status = !system("scutil --nc show \"#{name}\" | grep Disconnected > /dev/null")
        if status
            description = "Disconnect from #{name}"
            icon = "disconnect.png"
        end
        item = {}
        item['title'] = name
        item['subtitle'] = description
        item['icon'] = icon
        items.push(item)
    end
end

puts items.to_json
