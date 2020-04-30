package filmando;

import java.io.*;
import java.util.HashMap;

public class MatriceLocaliContestiFrasi {

    // Per le frasi singole
    // locale -> { contesto -> frase }
    public static HashMap<Integer, HashMap<Integer, Integer>> localiContestiFrasi = new HashMap<>();
    public static HashMap<Integer, HashMap<Integer, Integer>> localiContestiFrasiBari = new HashMap<>();
    public static HashMap<Integer, HashMap<Integer, Integer>> localiContestiFrasiTorino = new HashMap<>();

    public static String configurazioneLemmi = Configurazione.TipoLemmi;
    public static String path = Configurazione.path;
    public static Integer numeroContesti = Configurazione.numeroContesti;

    public static void inizializzaMatrice() throws Exception {

        PrintWriter out = new PrintWriter(new File(path + "filesFilmando\\" + configurazioneLemmi + "\\locale-contesto-frase.txt"));


        // Per ogni film
        for (int locale : MatriceLocaleContesto.matriceLocaleContesto.keySet()){

            // Mappa contesto -> frase
            HashMap<Integer, Integer> contestoFrase = new HashMap<>();

            // Per ogni contesto singolo
            for (int contesto=1; contesto <= numeroContesti; contesto++){

                // Lettura frasi item
                FileTestoItems.leggiFrasiLocale(locale);

                // Scelta frasi adatte al locale
                SceltaFrasiItemFiles.scegliFraseSingoloContesto(contesto);
                int idFrase = SceltaFrasiItemFiles.idFraseSingoloContesto(contesto);

                // Inserimento nella mappa contesto -> frase
                contestoFrase.put(contesto, idFrase);
                System.out.println("\t" + contesto + " --> " + idFrase);

                SceltaFrasiItemFiles.ordinamentiSingoli.clear();
                FileTestoItems.frasiLemmi.clear();
                FileTestoItems.frasiIntere.clear();

            }


            System.out.println(locale + " --> " + contestoFrase);
            out.println(locale + " --> " + contestoFrase);

            // Inserimento nella matrice locale -> contesto -> frase
            localiContestiFrasi.put(locale, contestoFrase);


        }

        System.out.println("Dimensione LCF: " + localiContestiFrasi.size());

        out.flush();
        out.close();

    }

    public static void scriviMatrice() throws Exception {

        ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(new File(path+"filesFilmando\\"+configurazioneLemmi+"\\locali-contesto-frase.dat")));

        oos.writeObject(localiContestiFrasi);

        oos.flush();
        oos.close();


    }

    public static void leggiMatriceBari() throws Exception {

        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File(path+"filesFilmando\\"+configurazioneLemmi+"\\locali-contesto-frase bari.dat")));
        localiContestiFrasiBari = (HashMap<Integer, HashMap<Integer, Integer>>) ois.readObject();
        ois.close();


    }

    public static void leggiMatrice() throws Exception {

        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File(path+"filesFilmando/"+configurazioneLemmi+"/locali-contesto-frase.dat")));
        localiContestiFrasi = (HashMap<Integer, HashMap<Integer, Integer>>) ois.readObject();
        ois.close();


    }

    public static void leggiMatriceTorino() throws Exception {

        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File(path+"filesFilmando\\"+configurazioneLemmi+"\\locali-contesto-frase torino.dat")));
        localiContestiFrasiTorino = (HashMap<Integer, HashMap<Integer, Integer>>) ois.readObject();
        ois.close();


    }


}
