# Why would you do something manually that takes 5 mins
# when you can spend 30 mins automating it???
require 'rqrcode'

file = 'codes.txt'
File.readlines(file).each do |line|
  name = line.split('/')[0]
  key = line.split('/')[1]
  puts name + key
  qrcode = RQRCode::QRCode.new("otpauth://totp/#{name}?secret=#{key}".strip)

  svg = qrcode.as_svg(
    offset: 0,
    color: '000',
    shape_rendering: 'crispEdges',
    module_size: 6,
    standalone: true
  )

  File.write("code#{key}.svg", svg)
end
