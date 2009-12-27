puts File.read('problem.txt').split("\n").select{ |l| l=~/^\d/ }.map(&:to_i).reduce(&:+).to_s[0...10]
