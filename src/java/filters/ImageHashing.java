/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.net.URL;
import javax.imageio.ImageIO;

/**
 *
 * @author Admin
 */
public class ImageHashing {
     
    public static String decodeHex(String hex) {
        // Remove the "0x" prefix if present
        if (hex.startsWith("0x")) {
            hex = hex.substring(2);
        }
        
        StringBuilder output = new StringBuilder();
        for (int i = 0; i < hex.length(); i += 2) {
            String str = hex.substring(i, i + 2);
            output.append((char) Integer.parseInt(str, 16));
        }
        return output.toString();
    }
    public static String encodeToHex(String input) {
        StringBuilder hexString = new StringBuilder();
        for (char ch : input.toCharArray()) {
            hexString.append(String.format("", (int) ch));
        }
        return hexString.toString();
    }
    
    public byte[] imageToByteArray(String imageUrl) throws Exception {
    URL url = new URL(imageUrl);
    BufferedImage image = ImageIO.read(url);
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    ImageIO.write(image, "jpg", baos); 
    baos.flush();
    byte[] imageInByte = baos.toByteArray();
    baos.close();
    return imageInByte;
}

    
}
