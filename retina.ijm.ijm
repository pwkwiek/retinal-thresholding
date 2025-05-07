// Set input and output directories
inputDir = getDirectory("Choose a Directory with Images");
outputDir = "C:/Users/User/Desktop/Mirkwood/segmentations/"; // Change this to your actual output path

// List all image files in input directory
list = getFileList(inputDir);

// Loop through each file
for (f = 0; f < list.length; f++) {
    if (endsWith(list[f], ".tif") || endsWith(list[f], ".tiff") || endsWith(list[f], ".jpg") || endsWith(list[f], ".png")) {
        
        // Open image
        open(inputDir + list[f]);
        originalTitle = getTitle();

        // Extract name without extension
        parts = split(originalTitle, "\\."); // Use escaped dot to handle file names correctly
        nameNoExt = parts[0];

        // Step 1: Invert the image
        run("Invert");

        // Step 2: CLAHE
        run("Enhance Local Contrast (CLAHE)", "blocksize=127 histogram=256 maximum=3 mask=*None*");

        // Step 3: Top Hat
        run("Top Hat...", "radius=5");

        // Step 4: Apply thresholding methods
        thresholds = newArray("Default", "Otsu", "Yen", "IsoData", "Moments");
        for (i = 0; i < thresholds.length; i++) {
            run("Duplicate...", "title=Thresh_" + thresholds[i]);

            setAutoThreshold(thresholds[i] + " dark");
            run("Convert to Mask");

            // Save with unique name: originalName_threshold.tif
            saveAs("PNG", outputDir + nameNoExt + "_" + thresholds[i] + ".png");

            close(); // Close thresholded image
        }

        close(); // Close the Top Hat processed image
    }
}
