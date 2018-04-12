![alt text](https://github.com/cameronutoronto/image_buddy/blob/master/smiling_animals.jpeg "Image Buddy")

# Image Buddy

By Cameron Buttazzoni, Shuyi Wu, Shuran Xu

Image buddy is a voice-controlled FPGA project that displays images. The user presses a button on the FPGA and then says one of three words: “alligator”, “baboon”, or “cow”. The FPGA’s built-in microphone records approximately one second of audio data, and then processes it in hardware to extract features using the Mel Frequency Cepstral Coefficients (MFCC) algorithm. The MicroBlaze processor then sends the extracted features to a server over Ethernet. The server uses a pre-trained neural network to classify the speech sample into one of the three animals. An image of the predicted animal is then sent back to the FPGA over Ethernet, where the image is displayed on a PMOD LED screen.

## Repository Structure

The design tree contains two main subdirectories: `server`, which contains the server Python script and a saved TensorFlow model, and `vivado`, which contains source files and Tcl scripts for building the Vivado project. A third subdirectory, `doc`, contains a detailed report describing the entire project and a PowerPoint presentation.

## How to Use

To recreate the Vivado project:

1. Open Vivado and open the Tcl Console.
2. Navigate to the `vivado` subdirectory of main directory `image_buddy`.
3. Run `source build.tcl` to generate the project.
4. Click `Generate Block Design`.
5. Click `Generate Bitstream`.
6. Export the hardware (include bitstream) and launch the SDK.
7. Under `File -> Import...`, select `General -> Projects from Folder or Archive`. Select the `vivado/sdk` directory and import `screen_proj` and `screen_proj_bsp`.

Refer to `doc/Report.pdf` for details on how to set up the project.

