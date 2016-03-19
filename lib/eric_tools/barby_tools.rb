module BarbyTools

  #生成的图片都比较小,官方的对png控制似乎无效


  # 生成条码, 不支持utf-8, 比如中文
  # 支持参数:
  #   content, 要转换的字符串
  #   file_path, 要保存的文件路径(png)
  def self.create_barcode options
    barcode = Barby::Code128B.new(options[:content])
    blob = Barby::PngOutputter.new(barcode).to_png(:height => 20, :margin => 5)
    File.open(options[:file_path], 'wb'){|f|
      f.write blob.force_encoding("ISO-8859-1")   #在rails环境中,如果不encode,也会报错
    }
  end

  # 生成二维码. 支持中文
  # 支持参数:
  #   content, 要转换的字符串
  #   file_path, 要保存的文件路径(png)
  def self.create_qrcode options
    qrcode = Barby::QrCode.new(options[:content])
    blob = Barby::PngOutputter.new(qrcode).to_png(:height => 20, :margin => 5)
    File.open(options[:file_path], 'w'){|f|
      f.write blob.force_encoding("ISO-8859-1")
    }
  end

end