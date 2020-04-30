package filmando;

import java.io.File;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.Scanner;
import java.util.TreeMap;

public class FileTestoItems {

    public static TreeMap<Integer, String> frasiLemmi = new TreeMap<>();
    public static TreeMap<Integer, String> frasiIntere = new TreeMap<>();
    public static TreeMap<Integer, String> locali = new TreeMap<>();

    public static String configurazioneLemmi = Configurazione.TipoLemmi;
    public static String path = Configurazione.path;
    public static Integer numeroContesti = Configurazione.numeroContesti;
    public static Integer numeroLocali = Configurazione.numeroLocali;

    public static void leggiFrasiLocale(int locale) throws Exception {

        Scanner inIntere = new Scanner(new File(path+"filesFilmando\\frasi singoli items\\intere\\"+locale+".txt"), "UTF-8");
        Scanner inLemmi = new Scanner(new File(path+"filesFilmando\\frasi singoli items\\" + configurazioneLemmi + "\\" + locale + ".txt"), "UTF-8");
        ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream((new File(path+"filesFilmando/frasi singoli items/intere dat/"+locale+".dat"))));

        while(inIntere.hasNextLine()){


            String[] riga = inIntere.nextLine().split(";");

            String loc = riga[0];
            int idFrase = Integer.parseInt(riga[1]);
            String lemmi = riga[2];

            frasiIntere.put(idFrase, lemmi);


        }
        oos.writeObject(frasiIntere);
        oos.close();


        while (inLemmi.hasNextLine()){


            String[] riga = inLemmi.nextLine().split(";");

            int idFrase = Integer.parseInt(riga[1]);
            String lemmi = riga[2];

            frasiLemmi.put(idFrase, lemmi);

        }

        inIntere.close();
        inLemmi.close();


    }

}
