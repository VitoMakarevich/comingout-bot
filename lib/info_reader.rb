require_relative 'parser'
require_relative 'store'
# class for read info and if not exists parse and add to db
class InfoReader
  def initialize
    @store = Store.new
    @parser = Parser.new
  end

  def is?(name)
    result = @store.is?(name)
    @store.add(name, true) if result.nil? && @parser.parse(name)
    @store.is?(name)
  end
end
