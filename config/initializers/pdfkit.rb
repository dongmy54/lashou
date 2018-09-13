PDFKit.configure do |config|
  #config.wkhtmltopdf = '/path/to/wkhtmltopdf'
  config.default_options = {
    #'quiet': true,                # 静默输出
    'margin-top': '0.75in',
    'margin-right': '0.75in',
    'margin-bottom': '0.75in',
    'margin-left': '0.75in',
     page_size: 'A4',
     print_media_type: true,
     dpi: 400                      # 必须设置 不然显示会很小
  }
  # Use only if your external hostname is unavailable on the server.
  # config.root_url = "http://localhost"
  config.verbose = false
end
