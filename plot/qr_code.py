import qrcode
import qrcode.image.svg
from qrcode.image.styledpil import StyledPilImage
from qrcode.image.styles.moduledrawers.pil import RoundedModuleDrawer
from qrcode.image.styles.colormasks import SolidFillColorMask

url = "https://arxiv.org/abs/2312.11343"

qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_M,
    box_size=20,
    border=2,
)
qr.add_data(url)
qr.make(fit=True)

img_s = qr.make_image(
    image_factory=StyledPilImage,
    module_drawer=RoundedModuleDrawer(),
    color_mask=SolidFillColorMask(
        back_color=(24, 29, 55),
        front_color=(255, 255, 255),
    ),
)
img_s.save("../assets/arxiv_qr_code.png")
