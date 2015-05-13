require 'nokogiri'
require 'rest_client'
require "eric_tools/version"
require 'json'

require File.dirname(__FILE__) + '/eric_tools/array.rb'
require File.dirname(__FILE__) + '/eric_tools/business_exception.rb'
require File.dirname(__FILE__) + '/eric_tools/date.rb'
require File.dirname(__FILE__) + '/eric_tools/date_time.rb'
require File.dirname(__FILE__) + '/eric_tools/hash.rb'
require File.dirname(__FILE__) + '/eric_tools/nil_class.rb'
require File.dirname(__FILE__) + '/eric_tools/string.rb'
require File.dirname(__FILE__) + '/eric_tools/symbol.rb'
require File.dirname(__FILE__) + '/eric_tools/time.rb'
require File.dirname(__FILE__) + '/eric_tools/version.rb'

module EricTools

  ##
  # ===功能描述
  # 根据ip获取城市名称。
  # ===参数说明
  # ak：需要从百度申请每个应用的ak，用于根据ip查找城市名称，每个ak每天限制调用100万次。
  # ip: 需要获取城市名称的ip
  # ===返回值
  # 返回一个hash , 其中，通地
  # :city 获取城市名称
  # :province 获以省份名称
  # :address 地址详细信息：如 CN|上海|上海|None|CHINANET|0|0
  # ===示例
  # EricTools.uuid
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

  ##
  # ===功能描述
  # 根据ip获取城市名称。
  # ===参数说明
  # ak：需要从百度申请每个应用的ak，用于根据ip查找城市名称，每个ak每天限制调用100万次。
  # ip: 需要获取城市名称的ip
  # ===返回值
  # 返回一个hash , 其中，通地
  # :city 获取城市名称
  # :province 获以省份名称
  # :address 地址详细信息：如 CN|上海|上海|None|CHINANET|0|0
  # ===示例
  # EricTools.get_city_name_from_ip {:ak=> 'HS8ViRxQT0xMu8d3uARISMif', :ip => '101.231.116.38', :default_province => '上海', :default_city => '上海'}

  def self.get_city_name_from_ip options
    response = RestClient.get("http://api.map.baidu.com/location/ip?ak=#{options[:ak]}&ip=#{options[:ip]}")
    response = JSON.parse(response.body)
    {:address => response["address"], :province => response["content"]["address_detail"]["province"], :city => response["content"]["address_detail"]["city"]} rescue {}
  end

  module RegularConstants
    EmailRegular = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
    UserNameRegular = /\A[a-zA-Z_\d\s-]*\z/
    BirthdayRegular = /\A[0-9]{4}-[0-9]{2}-[0-9]{2}\z/
    MobilePhone = /\A[0-9]{11}\z/
    QuHao = /\A[0-9]{3,4}\z/
    FixedPhone=/\A[0-9]{7,8}\z/
  end


end
