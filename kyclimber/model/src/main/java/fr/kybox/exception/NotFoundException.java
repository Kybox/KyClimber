package fr.kybox.exception;

/**
 * @author Kybox
 * @version 1.0
 */
public class NotFoundException extends Exception {

    public NotFoundException() {}

    public NotFoundException(String msg){ super(msg); }

    public NotFoundException(String msg, Throwable cause){ super(msg, cause); }
}
