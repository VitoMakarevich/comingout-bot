require 'mechanize'
require 'pry'
# class for parse info
class Parser
  RESOURCES = ['http://www.imdb.com/list/ls072706884/'].freeze
  def initialize
    @agent = Mechanize.new
  end

  def parse(name)
    name = @agent.get(RESOURCES.first).links_with(text: name)
    !name.length.zero?
  end
end
