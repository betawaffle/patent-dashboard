class XmlParser
  NAME_FORMAT = /((?:([a-z]+):)?([a-z]+))/
  TAG_FORMAT = /<#{NAME_FORMAT}(?:\s+#{NAME_FORMAT}\s*=\s*(["'])(.+?)\7)*\s*(?:\/|>(.+?)<\/\1)>/
end
