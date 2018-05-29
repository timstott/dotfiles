Pry.editor = 'neovim'

# Shows the ruby version
Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

# awesome_print gem: great syntax colorized printing
# look at ~/.aprc for more settings for awesome_print
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => err
  puts "gem install awesome_print  # <-- highly recommended"
end
