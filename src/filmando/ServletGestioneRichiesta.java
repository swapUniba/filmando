package filmando;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.*;

@WebServlet("/gestioneRichiesta")
public class ServletGestioneRichiesta extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {


        double inizio, fine, durata;
        inizio = System.currentTimeMillis();

        Configurazione.tipoRandom();
        String configurazione = Configurazione.TipoLemmi;
        int contatoreVuoti=0;
        HashSet<Integer> contesti = new HashSet<>();

        Map<String, String[]> parametri = request.getParameterMap();

        for (String p : parametri.keySet()){

            if (!p.equals("citta") && !p.equals("tempo")&& !p.equals("form")&& !p.equals("tasto")){
                if(Integer.parseInt(parametri.get(p)[0])==0){
                    contatoreVuoti++;
                }else
                contesti.add(Integer.parseInt(parametri.get(p)[0]));
            }
        }

        if(contatoreVuoti>2){
            response.sendRedirect("pagine/sceltaContesti.jsp");
        }



        try {

            HashMap<Integer, Integer> frasiSingole = new HashMap<>();
            ArrayList<Integer> frasiCentroide = new ArrayList<>();
            int locale = 0;


            if (parametri.get("citta") == null) {

                MatriceContestiItemFrasi.leggiMatrice();
                System.out.println("Matrice centroide letta.");

                int dimensione = MatriceContestiItemFrasi.matriceContestiItemFrasi.get(contesti).size();
                Random n = new Random();
                locale = (int) MatriceContestiItemFrasi.matriceContestiItemFrasi.get(contesti).keySet().toArray()[n.nextInt(dimensione)];
                System.out.println("Locale: " + locale);
                System.out.println("Contesti: " + contesti);
                System.out.println(MatriceContestiItemFrasi.matriceContestiItemFrasi.get(contesti));

                frasiCentroide = MatriceContestiItemFrasi.matriceContestiItemFrasi.get(contesti).get(locale);
                System.out.println("ID frasi: " + frasiCentroide);


                MatriceLocaliContestiFrasi.leggiMatrice();
                System.out.println("dimensione locali contesti frasi: " + MatriceLocaliContestiFrasi.localiContestiFrasi.size());
                System.out.println("Matrice frasi singole letta.");
                System.out.println(MatriceLocaliContestiFrasi.localiContestiFrasi.get(locale).size());


                // stampa frasi centroide

                ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File(Configurazione.path+"filesFilmando/frasi singoli items/intere dat/" + locale + ".dat")));
                TreeMap<Integer, String> mappaFrasi = (TreeMap<Integer, String>) ois.readObject();

                ois.close();

                ArrayList<String> frasiIntere = new ArrayList<>();

                for (int id : frasiCentroide) {

                    frasiIntere.add(mappaFrasi.get(id));
                }

                System.out.println("------------------\nFRASI CENTROIDE:");

                int contatore = 0;

                for (String frase : frasiIntere) {

                    contatore++;
                    System.out.println(contatore + " -> " + frase);
                }

                System.out.println("------------------\nFRASI SINGOLE CONTESTI:");


                // stampa frasi singole


                for (int c : contesti) {


                    frasiSingole.put(c, MatriceLocaliContestiFrasi.localiContestiFrasi.get(locale).get(c));
                }

                System.out.println(frasiSingole);
                System.out.println("Frasi singole: " + frasiSingole);


                for (int c : frasiSingole.keySet()) {

                    System.out.print(VettoriContesto.contesti.get(c) + " --> ");
                    System.out.println(mappaFrasi.get(frasiSingole.get(c)));

                }


            } else if (parametri.get("citta")[0].equals("bari")) {

                MatriceContestiItemFrasi.leggiMatriceBari();
                System.out.println("Matrice centroide Bari letta.");

                int dimensione = MatriceContestiItemFrasi.matriceContestiItemFrasiBari.get(contesti).size();
                Random n = new Random();
                locale = (int) MatriceContestiItemFrasi.matriceContestiItemFrasiBari.get(contesti).keySet().toArray()[n.nextInt(dimensione)];
                System.out.println("Locale: " + locale);
                System.out.println("Contesti: " + contesti);
                System.out.println(MatriceContestiItemFrasi.matriceContestiItemFrasiBari.get(contesti));

                frasiCentroide = MatriceContestiItemFrasi.matriceContestiItemFrasiBari.get(contesti).get(locale);
                System.out.println("ID frasi: " + frasiCentroide);


                MatriceLocaliContestiFrasi.leggiMatriceBari();
                System.out.println("dimensione locali contesti frasi bari: " + MatriceLocaliContestiFrasi.localiContestiFrasiBari.size());
                System.out.println("Matrice frasi singole Bari letta.");
                System.out.println(MatriceLocaliContestiFrasi.localiContestiFrasiBari.get(locale).size());


                // stampa frasi centroide

                ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File("filesFilmando/frasi singoli items/intere dat/" + locale + ".dat")));
                HashMap<Integer, String> mappaFrasi = (HashMap<Integer, String>) ois.readObject();

                ois.close();

                ArrayList<String> frasiIntere = new ArrayList<>();

                for (int id : frasiCentroide) {

                    frasiIntere.add(mappaFrasi.get(id));
                }

                System.out.println("------------------\nFRASI CENTROIDE:");

                int contatore = 0;

                for (String frase : frasiIntere) {

                    contatore++;
                    System.out.println(contatore + " -> " + frase);
                }

                System.out.println("------------------\nFRASI SINGOLE CONTESTI:");


                // stampa frasi singole


                for (int c : contesti) {


                    frasiSingole.put(c, MatriceLocaliContestiFrasi.localiContestiFrasiBari.get(locale).get(c));
                }

                System.out.println(frasiSingole);
                System.out.println("Frasi singole: " + frasiSingole);


                for (int c : frasiSingole.keySet()) {

                    System.out.print(VettoriContesto.contesti.get(c) + " --> ");
                    System.out.println(mappaFrasi.get(frasiSingole.get(c)));

                }


            } else {

                MatriceContestiItemFrasi.leggiMatriceTorino();
                System.out.println("Matrice Torino letta.");

                int dimensione = MatriceContestiItemFrasi.matriceContestiItemFrasiTorino.get(contesti).size();
                Random n = new Random();
                locale = (int) MatriceContestiItemFrasi.matriceContestiItemFrasiTorino.get(contesti).keySet().toArray()[n.nextInt(dimensione)];
                System.out.println("Locale: " + locale);

                frasiCentroide = MatriceContestiItemFrasi.matriceContestiItemFrasiTorino.get(contesti).get(locale);
                System.out.println("ID frasi: " + frasiCentroide);

                MatriceLocaliContestiFrasi.leggiMatriceTorino();
                System.out.println("dimensione locali contesti frasi torino: " + MatriceLocaliContestiFrasi.localiContestiFrasiTorino.size());
                System.out.println("Matrice frasi singole Torino letta.");
                System.out.println(MatriceLocaliContestiFrasi.localiContestiFrasiTorino.get(locale).size());

                // stampa frasi centroide

                ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File("filesFilmando/frasi singoli items/intere dat/" + locale + ".dat")));

                HashMap<Integer, String> mappaFrasi = (HashMap<Integer, String>) ois.readObject();

                ois.close();

                ArrayList<String> frasiIntere = new ArrayList<>();

                for (int id : frasiCentroide) {

                    frasiIntere.add(mappaFrasi.get(id));
                }

                System.out.println("------------------\nFRASI CENTROIDE:");

                int contatore = 0;

                for (String frase : frasiIntere) {

                    contatore++;
                    System.out.println(contatore + " -> " + frase);
                }

                System.out.println("------------------\nFRASI SINGOLE CONTESTI:");


                // stampa frasi singole

                for (int c : contesti) {


                    frasiSingole.put(c, MatriceLocaliContestiFrasi.localiContestiFrasiTorino.get(locale).get(c));
                }

                System.out.println(frasiSingole);
                System.out.println("Frasi singole: " + frasiSingole);


                for (int c : frasiSingole.keySet()) {

                    System.out.print(VettoriContesto.contesti.get(c) + " --> ");
                    System.out.println(mappaFrasi.get(frasiSingole.get(c)));

                }

            }





            String tempo = request.getParameter("tempo").trim();

            // invio dati servlet
            String url = "pagine/results1.jsp?tempo="+tempo+"&configurazione="+configurazione +
                    "&locale="+locale;

            String idFrasiCentroide = "";
            String idContesti = "";
            String idFrasiSingole = "";

            boolean primo = true;

            for (int s : frasiCentroide){

                idFrasiCentroide += "&centroide=" +s;

            }

            primo = true;

            url += idFrasiCentroide + "&";

            for (int contesto : frasiSingole.keySet()){

                //idContesti += "contesti=" + contesto;
                idFrasiSingole += "&frasiSingole=" + contesto + ":" + frasiSingole.get(contesto);

            }

            url += idFrasiSingole;


            System.out.println(url);

            response.sendRedirect(url);



        } catch (Exception e){

            e.printStackTrace();
            System.out.println(e.getMessage());
            String s = "\n"+e.toString();

            for (StackTraceElement st : e.getStackTrace()){
                s += "\n"+st;
            }

            s += "--------------";

            Files.write(Paths.get("logwherexp.txt"), s.getBytes(), StandardOpenOption.APPEND);
        }

        fine = System.currentTimeMillis();

        durata = fine - inizio;
        System.out.println("Durata totale: " + durata);







    }
}
