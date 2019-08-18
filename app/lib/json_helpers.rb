class JsonHelpers
  
  def self.json_nest(parentObj, nestedObj, attrName)
    parentObj.to_json.slice(0..-2) + ',"' + attrName + '":' + nestedObj.to_json + "}"
  end
end