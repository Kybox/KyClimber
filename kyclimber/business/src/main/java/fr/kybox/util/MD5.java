package fr.kybox.util;

import org.apache.commons.codec.binary.Hex;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author Kybox
 * @version 1.0
 */
public class MD5 {

    public static String hash(String password){

        String result = "";

        try {

            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(password.getBytes(Charset.forName("UTF8")));

            byte[] bytes = messageDigest.digest();

            result = new String(Hex.encodeHex(bytes));
        }
        catch (NoSuchAlgorithmException e) { e.printStackTrace(); }
        catch (NullPointerException e) { e.printStackTrace(); }

        return result;
    }
}
