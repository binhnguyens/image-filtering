# image-filtering
Use of average, median, Sobel, Laplace filter to enhance an image


# Abstract
A common method to extract information from an image is by filtering the image. Filtering methods include weighted averaging, median filter, Laplacien gradient masking, and Sobel gradient masking. These methods can be applied to an image for various results. Filtering requires the use of a mask to be applied to an image. Medical images such as CT brain and X-Ray mammography are analyzed by applying the previously mentioned filters. Weighted average filtering contains a mask that gives more importance to certain sections of the mask [1]. Median averaging is a similar method, but the result of the filtering is the median of the mask. Sobel gradient is a mask that emphasizes the edges, and the mask includes weights at the edges and zero at the centre. While the Sobel gradient emphasizes the edges, the Laplacian gradient mask detects the changes in the image intensity using the second derivative property [1].


# Code
