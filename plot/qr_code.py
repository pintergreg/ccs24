import qrcode
import qrcode.image.svg
from qrcode.image.styledpil import StyledPilImage
from qrcode.image.styles.moduledrawers.pil import RoundedModuleDrawer
from qrcode.image.styles.colormasks import SolidFillColorMask


def create_qr_code(url: str):
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_M,
        box_size=20,
        border=2,
    )
    qr.add_data(url)
    qr.make(fit=True)

    img = qr.make_image(
        image_factory=StyledPilImage,
        module_drawer=RoundedModuleDrawer(),
        color_mask=SolidFillColorMask(
            back_color=(24, 29, 55),
            front_color=(255, 255, 255),
        ),
    )
    return img


img_arxiv = create_qr_code("https://arxiv.org/abs/2312.11343")
img_arxiv.save("../assets/arxiv_qr_code.png")


img_slides = create_qr_code("https://pintergreg.github.io/ccs24")
img_slides.save("../assets/slides_qr_code.png")
