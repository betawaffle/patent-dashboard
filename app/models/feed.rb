class Feed < ActiveRecord::Base
  def data
    @data = RSS::Parser.parse(open(url) { |io| io.read }, false)
  end
end
