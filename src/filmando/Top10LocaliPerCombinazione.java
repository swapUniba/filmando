package filmando;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.TreeMap;

public class Top10LocaliPerCombinazione {

    // contesti -> top 5 item con quel contesto
    public static HashMap<HashSet<Integer>, HashSet<Integer>> contestiItem = new HashMap<>();
    public static HashMap<HashSet<Integer>, HashSet<Integer>> contestiItemBari = new HashMap<>();
    public static HashMap<HashSet<Integer>, HashSet<Integer>> contestiItemTorino = new HashMap<>();
    public static String path = Configurazione.path;


    public static void leggi() throws Exception{

        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File(path+"filesFilmando\\" + Configurazione.TipoLemmi + "\\top5combinazioni-items-bari.dat")));
        contestiItem = (HashMap<HashSet<Integer>, HashSet<Integer>>)ois.readObject();
        ois.close();

    }

    public static void generaTop10Film() throws Exception {

        try {



            MatriceLocaleContesto.leggiMatriceLocaleContesto();

            System.out.println("Matrici locale contesto lette.");

            HashSet<HashSet<Integer>> combinazioni = new HashSet<>();

            //  3 contesti
            for (int a = 0; a <= 2; a++) {
                for (int b = 2; b <= 5; b++) {
                    if (b == 2) b = 0;
                    for (int c = 5; c <= 7; c++) {
                        if (c == 5) c = 0;


                                HashSet<Integer> ins = new HashSet<>();

                                ins.add(a);
                                ins.add(b);
                                ins.add(c);


                                if (ins.contains(0)) ins.remove(0);

                                combinazioni.add(ins);


                        if (c == 0) c = 5;
                    }
                    if (b == 0) b = 2;
                }

            }

            System.out.println("Insiemi creati " + combinazioni.size());



            // per ogni insieme di contesti
            for (HashSet<Integer> combinazione : combinazioni) {

                TreeMap<Integer, Double> top10ItemScore = new TreeMap<Integer, Double>();

                // per ogni item
                for (int idLocale : MatriceLocaleContesto.matriceLocaleContesto.keySet()) {

                    // media score contesti
                    double mediaScore = 0;

                    for (int contesto : combinazione) {

                        //System.out.println("Locale: " + idLocale + ", contesto: " + contesto + " --> " +
                        //      MatriceLocaleContesto.matriceLocaleContestoBari.get(idLocale).get(contesto));

                        mediaScore += MatriceLocaleContesto.matriceLocaleContesto.get(idLocale).get(contesto);

                    }

                    mediaScore /= combinazione.size();

                    top10ItemScore.put(idLocale, mediaScore);

                }

                // eliminazione altri item

                HashSet<Integer> top10 = new HashSet<>();

                if (top10ItemScore.size() > 7) {

                    ArrayList<Integer> keys = new ArrayList<>();
                    ArrayList<Double> values = new ArrayList<>();

                    for (Integer l : top10ItemScore.keySet()) {

                        keys.add(l);
                        values.add(top10ItemScore.get(l));

                    }

                    for (int i = 0; i < values.size() - 1; i++) {
                        for (int j = i + 1; j < values.size(); j++) {

                            if (values.get(i) < values.get(j)) {

                                double td = values.get(i);
                                values.set(i, values.get(j));
                                values.set(j, td);

                                int ti = keys.get(i);
                                keys.set(i, keys.get(j));
                                keys.set(j, ti);

                            }

                        }
                    }



                    top10ItemScore.clear();
                    for (int i = 0; i < 7; i++) {
                        top10ItemScore.put(keys.get(i), values.get(i));
                        top10.add(keys.get(i));
                    }
                }

                contestiItem.put(combinazione, top10);

            }

            System.out.println("Combinazioni trovate");

            PrintWriter pw = new PrintWriter(new File(path+"filesFilmando\\" + Configurazione.TipoLemmi + "\\top5combinazioni-items.txt"));

            for (HashSet<Integer> comb : contestiItem.keySet()) {

                System.out.println(comb + " --> " + contestiItem.get(comb));
                pw.println(comb + " --> " + contestiItem.get(comb));
            }

            pw.flush();
            pw.close();

            System.out.println("Srittura su file di testo completata - Bari");

            ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(new File(path+"filesFilmando\\" + Configurazione.TipoLemmi + "\\top5combinazioni-items.dat")));
            oos.writeObject(contestiItemBari);
            oos.flush();
            oos.close();

            System.out.println("Srittura su file di oggetti completata - Bari");


        } catch (Exception e){

            e.printStackTrace();
        }

    }

}
