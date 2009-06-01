module HeadHelper
  def author(name = nil, year = nil)
    @_authors ||= []
  end
  
  def keywords(*words)
    @_keywords ||= []
    @_keywords |= words
    @_keywords
  end
  
  def meta_tag(name, content, one_per_tag = false)
    if header
      %(<meta http-equiv="#{name}" content="#{content}" />\n)
    else
      %(<meta name="#{name}" content="#{content}" />)
    end
  end
end
