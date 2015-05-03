require 'rubygems'
require 'nokogiri'
require "eric_tools/version"

require File.dirname(__FILE__) + '/restclient/business_exception.rb'

module EricTools
  def self.uuid
    UUIDTools::UUID.timestamp_create.to_s
  end

  #type＝1表示只包含数字，type＝2表示只包含字母，type＝3表示都包含
  def self.generate_random_string length, type=1
    case type
      when 1
        rand(10 ** length).to_s(10)
      when 2
        rand(26 ** length).to_s(26)
      when 3
        rand(36 ** length).to_s(36)
    end
  end
end
