module GoogleHelper
  def jquery_include_tag(version = '1.3.2', compressed = true)
    javascript_include_tag "http://ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery#{compressed ? '.min' : ''}.js"
  end
  
  def jqueryui_include_tag(version = '1.7.1', compressed = true)
    javascript_include_tag "http://ajax.googleapis.com/ajax/libs/jqueryui/#{version}/jquery-ui#{compressed ? '.min' : ''}.js"
  end
  
  def prototype_include_tag(version = '1.6.0.3')
    javascript_include_tag "http://ajax.googleapis.com/ajax/libs/prototype/#{version}/prototype.js"
  end
  
  def scriptaculous_include_tag(version = '1.8.2')
    javascript_include_tag "http://ajax.googleapis.com/ajax/libs/scriptaculous/#{version}/scriptaculous.js"
  end
  
  def mootools_include_tag(version = '1.2.1', compressed = true)
    javascript_include_tag "http://ajax.googleapis.com/ajax/libs/mootools/#{version}/mootools#{compressed ? '-yui-compressed' : ''}.js"
  end
  
  def dojo_include_tag(version = '1.3.0', compressed = true)
    javascript_include_tag "http://ajax.googleapis.com/ajax/libs/dojo/#{version}/dojo.xd#{compressed ? '' : '.js.uncompressed'}.js"
  end
  
  def swfobject_include_tag(version = '2.1', compressed = true)
    javascript_include_tag "http://ajax.googleapis.com/ajax/libs/swfobject/#{version}/swfobject#{compressed ? '' : '_src'}.js"
  end
  
  def yui_include_tag(version = '2.7.0', compressed = true)
    javascript_include_tag "http://ajax.googleapis.com/ajax/libs/yui/#{version}/build/yuiloader/yuiloader#{compressed ? '-min' : ''}.js"
  end
  
  def google_analytics_include_tag
    javascript_include_tag "http#{ssl? ? 's://ssl' : '://www'}.google-analytics.com/ga.js"
  end
end
