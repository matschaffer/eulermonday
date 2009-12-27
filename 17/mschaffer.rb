require 'rubygems'
require 'linguistics'

Linguistics.use :en

class Fixnum
  def english_length
    en.numwords.gsub(/[^a-z]/, '').length
  end
end

puts (1..1000).map(&:english_length).reduce(&:+)