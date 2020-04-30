# Filmando
## Prima di iniziare
Per avviare il framework è necessario inserire nella cartella "filesFilmando/**-tipoConfigurazione-**" i seguenti file:

    idFraseContesti.txt
    idFraseLemmi.txt

Il file *idFraseContesti.txt*  contiene l'id della frase annotata, e i contesti ai quali questa è associata, stringa di esempio:
    
    1;2,4 
    Frase 1 collegata ai contesti 2 e 4
Il file *idFraseLemmi.txt* contiene l'id della frase annotata e i lemmi di quella frase, per esempio:

    1;bello,film,divertente
    Frase 1 collegata ai lemmi "bello", "film", "divertente"

## Configurazione
Per configurare il sistema accedere al file Configurazione.java e inserire:
    
    1- Il path della cartella
    2- Il numero di film
    3- Il numero dei contesti
    4- I contesti
    
N.B. se si cambia il numero dei contesti vanno riviste:
    
     top10LocaliPerCombinazione.java 
     matriceContestoItemFile.java
 
## Generazione files necessari per avviare la web-app

1-  Selezionare una configurazione tra "unigrammi", "bigrammi" e "unibigrammi" nel file **Configurazione.java**.

2-  Avviare il file **main.java**

## Avvio web-app
Avviare la web app su **Tomcat**. Controllare che la versione di java utilizzata sia compatibile con la versione di tomcat.

## Salvataggi
Tutti i dati inseriti durante l'utilizzo della webapp vengono salvati nella stessa cartella che contiene i vari files (filesFilmando).

## Breve spiegazione delle classi
### MatriceFC
Modella la matrice frase-contesto, la prima matrice che è necessaria per creare i vettori contesto.
### MatriceLF
Modella la matrice lemma-frase, la seconda matrice utile per la generazione dei vettori contesto.
### MatriceLC
Modella la matrice lemma-contesto, l'ultma matrice necessaria per la creazione dei vettori contesto.
### VettoriContesto
Modella i vettori contesto.
### FileTestoItems
Conserva le frasi delle recensioni sia nella forma lemmatizzata che nella forma intera.
### VettoreFrase
Modellare una frase relativa ad un item come vettore.
### SimilaritaCoseno
Calcola lo score di similarità tra la frase e il vettore contesto.
### MatriceLocaleContesto
Modella la matrice locale-contesto, assegnando per ogni item, il suo score in ogni contesto.
### SceltaFrasiItemFiles
Assegna ad uno o più contesti, le similarità delle frasi in ordine decrescente (dal punteggio maggiore).
### MatriceLocaliContestiFrasi
Modella una matrice in cui ad ogni combinazione film-contesto associa la frase con lo score più alto
### Top10LocaliPerCombinazione
Calcola per ogni combinazione di contesti, i primi 10 film con punteggio maggiore.
### MatriceContestiItemFrasi
Seleziona le frasi da suggerire per quanto riguarda l'approccio "centroide".




