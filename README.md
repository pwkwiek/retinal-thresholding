# retinal-thresholding
*Hue Knew? Thresholding Retinal Images Through the Spectrum of Color Space Channels*

This study explores the impact of color space channels and thresholding algorithms on the segmentation quality of retinal vessels using a semi-automated pipeline in ImageJ. The segmentation workflow involved four key steps: image inversion, application of the CLAHE (Contrast Limited Adaptive Histogram Equalization) algorithm to enhance local contrast (with parameters: block size = 127, histogram bins = 256, and max slope = 3), followed by a top-hat transformation (radius = 5) to extract fine structures, and finally, application of one of several thresholding algorithms.

Four widely used automatic thresholding methods—Otsu, Yen, IsoData and Moments, alongside Default thresholding method — were assessed in combination with various luminance-focused channels from different color space models. These included:

- CIELAB_L (perceptual luminance)

- RGB_G (green channel)

- YCrCb_Y (luminance from YCrCb)

- YUV_Y (luminance from YUV)

- GRAY (standard grayscale)

The study evaluated segmentation outcomes using multiple metrics, including Dice coefficient, Intersection over Union (IoU), accuracy, precision, and specificity, to gain a comprehensive understanding of algorithmic performance across different preprocessing strategies.

Results revealed that the RGB_G channel paired with the Moments thresholding algorithm consistently delivered the best performance (Dice: 0.7840, Accuracy: 0.9599), outperforming the grayscale baseline (Dice: 0.7783, Accuracy: 0.9575). The YCrCb_Y and YUV_Y channels also demonstrated strong results, confirming the value of leveraging color space transformations that emphasize luminance. Conversely, the Yen method underperformed across all channels, while IsoData and Moments offered robust and stable performance.

These findings highlight the critical role of both channel selection and thresholding method in optimizing retinal vessel segmentation. By moving beyond standard grayscale and applying perceptually-informed luminance channels with adaptive algorithms, this approach contributes to improved segmentation accuracy—an essential advancement for automated retinal image analysis in clinical and research settings.

**Files included:**
- channels.ipynb: image conversion
- retina.ijm.ijm: macro for image processing and segmentation in ImageJ
- metrics: calculations of Dice coefficient, Intersection over Union (IoU), accuracy, precision, and specificity
- analysis.ipynb: results analysis (best results, mean results and plots)
