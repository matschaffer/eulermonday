#!/usr/bin/env ruby
# This is embarassing... 
require "mathn"

p = Prime.new()
10000.times do p.next() end
print(p.next())
