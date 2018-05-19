require './lib/text'

t = Text.new

loop do
  puts t.intro
  t.decision(t.input)
end
