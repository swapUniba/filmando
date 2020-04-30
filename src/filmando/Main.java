package filmando;

public class Main {

    public static void main(String[] args) {

        try {

            double inizio = System.currentTimeMillis();

                System.out.println(Configurazione.TipoLemmi);

                // Calcolo matrice frase contesto
                MatriceFC.inizializzaMatriceFraseContesto();
                System.out.println("FC inizializzata.");
                // Lettura strutture utili all'esecuzione
                MatriceLF.generaLemmi();
                MatriceLF.generaIDF();
                System.out.println("Lemmi e IDF calcolati.");
                MatriceLF.generaMatriceLemmaFrase();
                System.out.println("LF inizializzata.");
                // Lettura matrice generata
                MatriceLC.generaMatriceLemmaContesto();
                System.out.println("LC inizializzata.");
                MatriceLC.annullamentoScoreStopWords();
                System.out.println("StopWords Azzerate");
                // Lettura vettori contesto
                VettoriContesto.generaVettoriContesto();
                VettoriContesto.scriviVettoriContesto();
                System.out.println("Vettori contesto inizializzati");
                VettoriContesto.stampaSimilaritaContesti();
                System.out.println("Stampe");
                MatriceLC.stampaMatriceLemmaContestoFile();
                MatriceLocaleContesto.calcolaMatrice();
                MatriceLocaleContesto.stampaFileMatriceLocaleContesto();
                MatriceLocaliContestiFrasi.inizializzaMatrice();
                MatriceLocaliContestiFrasi.scriviMatrice();
                Top10LocaliPerCombinazione.generaTop10Film();
                System.out.println("Top5 locali trovati per Bari e Torino");
                MatriceContestiItemFrasi.inizializzaMatriceFilm();
                MatriceContestiItemFrasi.scriviMatrice();


            double durata = System.currentTimeMillis() - inizio;
            System.out.println(durata);

        } catch (Exception e) {

            e.printStackTrace();
        }

    }
}
