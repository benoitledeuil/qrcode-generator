class QrcodesController < ApplicationController
  def new
  end

  def create
    url = params[:url]
    qr_code = RQRCode::QRCode.new(url)

    # Convertir le QR code en image PNG
    png = qr_code.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 300,
      border_modules: 4,
      module_px_size: 6,
      file: nil
    )

    # Convertir l'image PNG en Base64 et stocker dans la session
    session[:qr_code_svg] = Base64.encode64(png.to_s)

    # Rediriger vers l'action show sans ID
    redirect_to qrcode_path
  end

  def show
    @qr_code_svg = session.delete(:qr_code_svg)
  end
end
