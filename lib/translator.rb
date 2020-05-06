# require modules here
require "yaml"

def load_library(fileName)
  emoticons = YAML.load_file(fileName)
  
  struct_emoticons = {}

  emoticons.map do |emoName, emoArr|
    if !struct_emoticons[emoName] 
      struct_emoticons[emoName] = {}
    end
    if struct_emoticons[emoName]
      struct_emoticons[emoName][:english] = emoArr[0]
      struct_emoticons[emoName][:japanese] = emoArr[1]
    end
  end
  return struct_emoticons
end

def get_english_meaning(filePath, emoStr)
  emoticons = load_library(filePath)
  
  emoticons.map do |dataKey, dataValue|
    if dataValue[:japanese] == emoStr
      return dataKey
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(filePath, emoStr)
  emoticons = load_library(filePath)

  emoticons.map do |dataKey, dataValue|
    if dataValue[:english] == emoStr
      return dataValue[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

p get_english_meaning("lib/emoticons.yml", "(＾ｖ＾)")
p get_english_meaning("lib/emoticons.yml", "(Ｔ▽Ｔ)")
p get_english_meaning("lib/emoticons.yml", "(＾ｖ＾)")

p get_japanese_emoticon("lib/emoticons.yml", "=D")
p get_japanese_emoticon("lib/emoticons.yml", "O:)")
p get_japanese_emoticon("lib/emoticons.yml", ":o")
p get_japanese_emoticon("lib/emoticons.yml", ";)")
p get_japanese_emoticon("lib/emoticons.yml", "8D")
