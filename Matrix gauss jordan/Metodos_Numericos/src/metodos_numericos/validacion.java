/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package metodos_numericos;

/**
 *
 * @author vito-dante
 */
public class validacion {
    
        public  boolean isNumeric(String cadena){
               try {
                       Integer.parseInt(cadena);
                       return true;
               } catch (NumberFormatException nfe){
                       return false;
               }
       }
}
