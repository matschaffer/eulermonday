require "mathn"
infinity = 1.0/0.0
module Enumerable
  def lazy_select
    Enumerator.new do |yielder|
      each do |obj|
        yielder.yield(obj) if yield(obj)
      end
    end
  end
end

p (1..infinity).lazy_select { |v| v.prime? }.take(10001).last

