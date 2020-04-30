package filmando;

import java.util.HashMap;
import java.util.Random;

public class Configurazione {


    public static String TipoLemmi = "unigrammi";
    public static String path = ""; //inserire indirizzo della cartella "filmando"
    public static Integer numeroContesti = 7;
    public static Integer numeroLocali = 240;
    public static HashMap<Integer, String> contesti = new HashMap<>();


    static {
        contesti.put(1, "Alta Attenzione");
        contesti.put(2, "Bassa Attenzione");
        contesti.put(3, "Coppia");
        contesti.put(4, "Bambini");
        contesti.put(5, "Amici");
        contesti.put(6, "Buon Umore");
        contesti.put(7, "Cattivo Umore");
    }


    //public static String TipoLemmi = "bigrammi";
   // public static String TipoLemmi = "unibigrammi";

    public static void tipoRandom(){


        Random n = new Random();
        int p = n.nextInt(3);

        if (p == 0){
            TipoLemmi = "unigrammi";
        } else if (p == 1){
            TipoLemmi = "bigrammi";
        } else {
            TipoLemmi = "unibigrammi";
        }


    }

}
