module BarbyTools

  #生成的图片都比较小,官方的对png控制似乎无效
  # ------会生成png文件, 一般每个大小不超过1kb, 但是文件需要自己去清除--------

  # 生成条码, 不支持utf-8, 比如中文.
  # 支持参数:
  #   content, 要转换的字符串
  #   file_path, 要保存的文件路径(png)
  def self.create_barcode options
    barcode = Barby::Code128.new(options[:content])
    blob = Barby::PngOutputter.new(barcode)
    blob.xdim = 2 # 设置宽度只能通过配置xdim参数, 且只可为正整数
    unless File.exist? options[:file_path]
      File.open(options[:file_path], 'wb'){|f|
        f.write blob.to_png(:height => 65, :margin => 5).force_encoding("ISO-8859-1")   #在rails环境中,如果不encode,会报错
      }
    end
  end

  # 生成二维码. 支持中文
  # 支持参数:
  #   content, 要转换的字符串
  #   file_path, 要保存的文件路径(png)
  def self.create_qrcode options
    qrcode = Barby::QrCode.new(options[:content])
    blob = Barby::PngOutputter.new(qrcode).to_png(:height => 20, :margin => 5)
    unless File.exist? options[:file_path]
      File.open(options[:file_path], 'wb'){|f|
        f.write blob.force_encoding("ISO-8859-1")
      }
    end
  end

end