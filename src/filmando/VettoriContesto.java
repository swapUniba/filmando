package filmando;

import java.io.*;
import java.util.HashMap;
import java.util.HashSet;
import java.util.TreeMap;

public class VettoriContesto {


    public static TreeMap<Integer, TreeMap<String, Double>> vettoriContesto = new TreeMap<>();
    public static HashMap<Integer, String> contesti = Configurazione.contesti;

    public static String configurazioneLemmi = Configurazione.TipoLemmi;
    public static String path = Configurazione.path;
    public static Integer numeroContesti = Configurazione.numeroContesti;




    public static void scriviVettoriContesto() throws Exception {

        ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(new File(path+"filesFilmando\\" + configurazioneLemmi + "\\strutture\\vettori contesto.dat")));
        oos.writeObject(vettoriContesto);
        oos.flush();
        oos.close();

    }

    public static void leggiVettoriContesto() throws Exception {

        ObjectInputStream oin = new ObjectInputStream(new FileInputStream(new File(path+"filesFilmando\\" + configurazioneLemmi + "\\strutture\\vettori contesto.dat")));
        vettoriContesto = (TreeMap<Integer, TreeMap<String, Double>>) oin.readObject();
        oin.close();

    }

    public static void generaVettoriContesto() throws Exception {

        for (int idContesto = 1; idContesto <= numeroContesti; idContesto++) {


            TreeMap<String, Double> contestoCorrente = new TreeMap<>();

            for (String lemma : MatriceLC.matriceLemmaContesto.keySet()) {

                contestoCorrente.put(lemma, MatriceLC.matriceLemmaContesto.get(lemma).get(idContesto));

            }

            vettoriContesto.put(idContesto, contestoCorrente);

        }
    }


    public static void stampaSimilaritaContesti() throws Exception {

        HashMap<HashSet<Integer>, SimilaritaCoseno> similarita = new HashMap<>();

        for (int contesto1 : vettoriContesto.keySet()){

            for (int contesto2 : vettoriContesto.keySet()){

                HashSet<Integer> listaContesti = new HashSet<>();
                listaContesti.add(contesto1);
                listaContesti.add(contesto2);

                if (!similarita.containsKey(listaContesti)){

                    SimilaritaCoseno sc = new SimilaritaCoseno(vettoriContesto.get(contesto1), vettoriContesto.get(contesto2));
                    similarita.put(listaContesti, sc);

                    if  (contesto1 == contesto2) System.out.println(sc.getScoreSimilarita());

                }


            }

        }

        PrintWriter out = new PrintWriter(new File(path+"filesFilmando\\" + configurazioneLemmi +"\\matrice similarita contesti.txt"));

        out.println("\t1\t2\t3\t5\t5\t6\t7");

        for (int i=1; i<=numeroContesti; i++){

            out.print(i+"\t");

            for (int j=1; j<=numeroContesti; j++){

                HashSet<Integer> listaContesti = new HashSet<>();
                listaContesti.add(i);
                listaContesti.add(j);

                if (similarita.containsKey(listaContesti)) {

                    out.printf("%.2f\t", similarita.get(listaContesti).getScoreSimilarita());

                }



            }

            out.println();
        }

        out.flush();
        out.close();


    }

}
