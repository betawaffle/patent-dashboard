module ApplicationHelper
  def sidebar_list(id, *items)
    options = items.extract_options!
    options[:id] ||= id
    content_tag :div, %(<h3>#{t("sidebar.#{id}")}</h3><ul><li>#{items.join('</li><li>')}</li></ul>), options
  end
  
  def tab(*args)
    link = args[1].nil? ? %(<span>#{args.first}</span>) : link_to(*args) 
    content_for :tabs, link
  end
end
