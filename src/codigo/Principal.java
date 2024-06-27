/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author camilaailen
 */
public class Principal {
    public static void main(String[] args) throws Exception {
        String ruta1 = "/home/camilaailen/Documents/FACULTAD/TC_2024/integrador/AnalizadorLexico-Sintactico/src/codigo/Lexer.flex";
        String ruta2 = "/home/camilaailen/Documents/FACULTAD/TC_2024/integrador/AnalizadorLexico-Sintactico/src/codigo/LexerCup.flex";
        String[] rutaS = {"-parser", "Sintax", "/home/camilaailen/Documents/FACULTAD/TC_2024/integrador/AnalizadorLexico-Sintactico/src/codigo/Sintax.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
            File archivo;
            archivo = new File(ruta1);
            JFlex.Main.generate(archivo);
            archivo = new File(ruta2);
            JFlex.Main.generate(archivo);
            java_cup.Main.main(rutaS);
            
            Path rutaSym = Paths.get("/home/camilaailen/Documents/FACULTAD/TC_2024/integrador/AnalizadorLexico-Sintactico/src/codigo/sym.java");
            if (Files.exists(rutaSym)) {
                Files.delete(rutaSym);
            }
            
            Files.move(
                    Paths.get("/home/camilaailen/Documents/FACULTAD/TC_2024/integrador/AnalizadorLexico-Sintactico/sym.java"), 
                    Paths.get("/home/camilaailen/Documents/FACULTAD/TC_2024/integrador/AnalizadorLexico-Sintactico/src/codigo/sym.java")
            );
            
            Path rutaSin = Paths.get("/home/camilaailen/Documents/FACULTAD/TC_2024/integrador/AnalizadorLexico-Sintactico/src/codigo/Sintax.java");
            if (Files.exists(rutaSin)) {
                Files.delete(rutaSin);
            }
            Files.move(
                    Paths.get("/home/camilaailen/Documents/FACULTAD/TC_2024/integrador/AnalizadorLexico-Sintactico/Sintax.java"), 
                    Paths.get("/home/camilaailen/Documents/FACULTAD/TC_2024/integrador/AnalizadorLexico-Sintactico/src/codigo/Sintax.java")
            );
    }
}
