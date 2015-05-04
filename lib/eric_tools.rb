require 'nokogiri'
require "eric_tools/version"

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

  module RegularConstants
    EmailRegular = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
    UserNameRegular = /\A[a-zA-Z_\d\s-]*\z/
    BirthdayRegular = /\A[0-9]{4}-[0-9]{2}-[0-9]{2}\z/
    MobilePhone = /\A[0-9]{11}\z/
    QuHao = /\A[0-9]{3,4}\z/
    FixedPhone=/\A[0-9]{7,8}\z/
  end


end
