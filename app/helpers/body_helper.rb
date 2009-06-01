module BodyHelper
  def div_tag(id, content_or_options = nil, options = {}, &block)
    content = nil
    
    if block_given?
      options = content_or_options if content_or_options.is_a? Hash
      content = capture(&block)
    else
      content = content_or_options
    end
    
    options[:id] = id
    concat %(#{content_tag(:div, content, options)}<!-- end ##{id} -->)
  end
  
  def container(id = nil, options = {}, &block)
    classes = options.delete(:class).to_s.split(' ')
    classes.unshift('container')
    
    options[:id] = id
    options[:class] = classes.join(' ')
    content = capture(&block) if block_given?
    
    concat %(#{content_tag(:div, content, options)}<!-- end #{id.nil? ? '.container' : "##{id}"} -->)
  end
  
  def copyright_tag(type, year, name, url = nil, &block)
    type = type.to_s
    year = "#{year.first}-#{year.last}" if year.is_a? Range
    year = "#{year.join(', ')}" if year.is_a? Array
    name = link_to(name, url) unless url.nil?
    
    if block_given?
      div_tag "#{type}_copyright", %(#{type.titleize} &copy; #{year} #{name}. #{capture(&block)}), :class => 'copyright'
    else
      div_tag "#{type}_copyright", %(#{type.titleize} &copy; #{year} #{name}), :class => 'copyright'
    end
  end
end
