/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package metodos_numericos;

import com.csvreader.CsvReader;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 *
 * @author Vito
 */
public class Leer_importar {

    private String ruta;
    private int tamano;

    public Leer_importar(String ruta, int tamano) {
        this.ruta = ruta;
        this.tamano = tamano;
    }

    public String[][] Cargar_excel() throws FileNotFoundException {
        CsvReader reader = new CsvReader(this.ruta);
        int a = this.tamano, d = 0;
        String h[][] = new String[102][102];
        try {
            while (reader.readRecord()) {
                for (int i = 0; i < a+1; i++) {
                    h[d][i] = reader.get(i);
                    //System.out.print(h[d][i] + " ");
                }
                //System.out.println();
                d++;
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("ERROR");
        }
        reader.close();
        return h;
    }

}
