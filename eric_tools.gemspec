# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eric_tools/version'

Gem::Specification.new do |spec|
  spec.name          = "eric_tools"
  spec.version       = EricTools::VERSION
  spec.authors       = ["刘晓琦"]
  spec.email         = ["ericliu@ikidstv.com"]
  spec.summary       = %q{在Rails框架基础上，对一些类增加一些工具方法。同时封装了一些平时比较常用的函数，如uuid, 随字数，根据ip获得城市名称等}
  spec.description   = %q{1.在Rails框架基础上，对一些类增加一些工具方法。 2.增加了一些工具类，如uuid,生成随机字符串，根据Ip获取城市名称等  3.一些有用的正则表达式}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]




  spec.add_dependency "nokogiri", '~> 1.6'
  spec.add_dependency 'rest-client', '~> 1.8'



end
