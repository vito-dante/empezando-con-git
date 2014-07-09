package metodos_numericos;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author vito-dante
 */
import java.io.PrintStream;
import java.util.Scanner;

public class matrices {

    static void muestramatriz(float[][] matriz, int var) {
        for (int x = 0; x < var; x++) {
            for (int y = 0; y < var + 1; y++) {
                System.out.print(" " + matriz[x][y] + " |");
            }
            System.out.println("");
        }
    }

    static void pivote(float[][] matriz, int piv, int var) {
        float temp = 0.0F;
        temp = matriz[piv][piv];
        for (int y = 0; y < var + 1; y++) {
            matriz[piv][y] /= temp;
        }
    }

    static void hacerceros(float[][] matriz, int piv, int var) {
        for (int x = 0; x < var; x++) {
            if (x != piv) {
                float c = matriz[x][piv];
                for (int z = 0; z < var + 1; z++) {
                    matriz[x][z] = (-1.0F * c * matriz[piv][z] + matriz[x][z]);
                }
            }
        }
    }
}
