class TagBuilder
  NAME_FORMAT = /((?:([a-z]+):)?([a-z]+))/
  TAG_FORMAT = /<#{NAME_FORMAT}(?:\s+#{NAME_FORMAT}\s*=\s*(["'])(.+?)\7)*\s*>(.+?)<\/\1>/
  
  /<((?:([a-z]+):)?([a-z]+))(?:\s+((?:([a-z]+):)?([a-z]+))\s*=\s*(["'])(.+?)\7)*\s*>(.+?)<\/\1>/
  
  def initialize
    @builder = Builder::XmlMarkup.new(:indent => 2, :margin => margin, :target => )
  end
  
  def namespace(name, uri)
    @namespaces[name] = uri
  end
  
  def to_s(env = {})
    namespaces = Hash.new { |h, uri| env[uri] }
    namespace = @namespace.nil? ? '' : "#{namespaces[@namespace]}:"
    
    
  end
  
private
  def full_name(name, uri = nil, env = {})
    
  end
  
  
  def namespace_attribute(name, uri)
    name.nil? ? %( xmlns="#{uri}") : %( xmlns:#{name}="#{uri}")
  end
  
  def namespace_attributes
    %( xmlns="#{@namespaces.delete(nil)}")
  end
  
  @doc = Builder::XmlMarkup.new(:indent => 2)
  
  def body(&block)
    
  end
end
