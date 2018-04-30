package fr.kybox.util;

import org.apache.commons.codec.binary.Hex;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.nio.charset.Charset;
import java.security.MessageDigest;

/**
 * @author Kybox
 * @version 1.0
 */

/**
 * Provides an MD5 hash service
 */
public class MD5 {

    // Logger object
    private static final Logger log = LogManager.getLogger(MD5.class);

    /**
     * MD5 hash of the string provided as parameter
     * @param password The string to hash
     * @return The MD5 hash
     */
    public static String hash(String password){

        if(log.isDebugEnabled()) log.debug("METHOD : hash("+ password +")");

        String result = "";

        try {

            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(password.getBytes(Charset.forName("UTF8")));

            byte[] bytes = messageDigest.digest();

            result = new String(Hex.encodeHex(bytes));
        }
        catch (Exception e){
            log.error(e);
        }

        return result;
    }
}
