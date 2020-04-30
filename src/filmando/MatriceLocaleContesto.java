package filmando;

import java.io.*;
import java.util.Scanner;
import java.util.TreeMap;

public class MatriceLocaleContesto {

    // id locale -> (id contesto -> punteggio contesto)
    public static TreeMap<Integer, TreeMap<Integer, Double>> matriceLocaleContesto = new TreeMap<>();
    public static TreeMap<Integer, TreeMap<Integer, Double>> matriceLocaleContestoBari = new TreeMap<>();
    public static TreeMap<Integer, TreeMap<Integer, Double>> matriceLocaleContestoTorino = new TreeMap<>();

    public static String configurazioneLemmi = Configurazione.TipoLemmi;
    public static String path = Configurazione.path;
    public static Integer numeroContesti = Configurazione.numeroContesti;
    public static Integer numeroLocali = Configurazione.numeroLocali;

    public static void calcolaMatrice() throws Exception {

        PrintWriter out = new PrintWriter(new File(path+"filesFilmando/" + configurazioneLemmi +"/matrice locale contesto.txt"));
        // Per ogni locale
        for (int idLocale = 1; idLocale <= numeroLocali; idLocale++){

            TreeMap<Integer, Double> contestoScore = new TreeMap<>();

            // Per ogni contesto
            for (int contesto = 1; contesto <= numeroContesti; contesto++){

                // Per ogni frase
                Scanner in = new Scanner(new File(path+"filesFilmando/frasi singoli items/" + configurazioneLemmi + "/" + idLocale+".txt"), "UTF-8");

                int contatoreFrasi = 0;
                double sommatoriaSimilarita = 0;

                //Per ogni frase
                while(in.hasNextLine()){

                    // Acquisizione frase, calolo vettore frase e similarità
                    String frase = in.nextLine().split(";")[2];
                    VettoreFrase vettoreFrase = new VettoreFrase(frase);


                    SimilaritaCoseno sc = new SimilaritaCoseno(vettoreFrase.getVettoreFrase(), VettoriContesto.vettoriContesto.get(contesto));

                    sommatoriaSimilarita += sc.getScoreSimilarita();
                    contatoreFrasi++;

                }

                System.out.println("Locale " + idLocale + ", contesto " + contesto + " --> " + sommatoriaSimilarita + "/" + contatoreFrasi);

                double similarita = sommatoriaSimilarita / (contatoreFrasi/Math.log(contatoreFrasi));

                contestoScore.put(contesto, similarita);

                in.close();

                out.println(idLocale + "\t" + contesto + "\t" + similarita);

            }
            matriceLocaleContesto.put(idLocale, contestoScore);

        }
        out.close();


    }

    public static void stampaFileMatriceLocaleContesto() throws Exception {

        ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(new File(path+"filesFilmando/"+configurazioneLemmi+"/locali-contesto.dat")));

        oos.writeObject(matriceLocaleContesto);

        oos.flush();
        oos.close();


    }

    public static void leggiMatriceLocaleContesto() throws Exception {

        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File(path+"filesFilmando/"+configurazioneLemmi+"/locali-contesto.dat")));

        matriceLocaleContesto = (TreeMap<Integer, TreeMap<Integer, Double>>) ois.readObject();

        ois.close();

    }


}


