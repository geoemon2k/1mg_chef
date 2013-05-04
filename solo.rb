file_cache_path.expand_path("../cache", __FILE__)

cookbook_path [
  File.expand_path('../site-cookbooks',__FILE__),
  File.expand_path('../cookbooks',__FILE)
]

role_path File.expand_path("../roles",__FILE__)
