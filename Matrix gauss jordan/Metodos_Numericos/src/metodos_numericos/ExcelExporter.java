/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package metodos_numericos;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import javax.swing.JTable;
import javax.swing.table.TableModel;

/**
 *
 * @author vito-dante
 */
public class ExcelExporter {
    
                //CONTRUCTOR
		public ExcelExporter() { }
             
                //metodo exportar
		public void exportTable(JTable table, File file) throws IOException {
			
                  TableModel model = table.getModel();
                  FileWriter out = new FileWriter(file);
                  BufferedWriter bw=new BufferedWriter(out);
                  
			for(int i=0; i < model.getColumnCount(); i++) {
                            bw.write(model.getColumnName(i) + "\t");
			}
			bw.write("\n");

			for(int i=0; i< model.getRowCount(); i++) {
                            
                            for(int j=0; j < model.getColumnCount(); j++) {
                            
                                bw.write(model.getValueAt(i,j).toString()+"\t");
                            
                            }
                        bw.write("\n");
                        }

		bw.close();
		System.out.println("write out to: " + file);
	}
}