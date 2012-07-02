package com.erp.utils;

import net.sourceforge.stripes.validation.TypeConverter;
import net.sourceforge.stripes.validation.ValidationError;
import net.sourceforge.stripes.util.Base64;

import java.util.Collection;
import java.util.Locale;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by IntelliJ IDEA.
 * User: Admin
 * Date: Mar 22, 2012
 * Time: 2:33:05 PM
 * To change this template use File | Settings | File Templates.
 */

public class PasswordEncryptor implements TypeConverter<String> {
    public String convert(String input, Class<? extends String> cls,
                          Collection<ValidationError> errors)
    {
        //password-superadmin iJo6eRs4dc+uQTV0tT2ku4qQ1T4=
        return hash(input);
    }
    public String hash(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1" );
            byte[] bytes = md.digest(password.getBytes());
            return Base64.encodeBytes(bytes);
        }
        catch (NoSuchAlgorithmException exc) {
            throw new IllegalArgumentException(exc);
        }
    }
    public void setLocale(Locale locale) { }
}