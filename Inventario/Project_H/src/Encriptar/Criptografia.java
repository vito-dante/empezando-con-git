/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Encriptar;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 *
 * @author Vito
 */
public class Criptografia {

  public String MD5(String cadena) {
    String sMd5 = "";
    try {
      MessageDigest digest = MessageDigest.getInstance("MD5");
      sMd5 = new BigInteger(1, digest.digest((cadena).getBytes())).toString(16);
    } catch (Exception e) {
      System.out.println("Error al llamar a MD5");
    }
    if (sMd5.length() == 31)
      sMd5 = "0" + sMd5;
    return sMd5;
  }

}