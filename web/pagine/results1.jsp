<%@ page import="filmando.VettoriContesto" %>
<%@ page import="filmando.Locale" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.security.Timestamp" %>
<%@ page import="filmando.Configurazione" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico" />
    <title>Filmando</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/scrolling-nav.css" rel="stylesheet">
    <link href="../css/radio.css" rel="stylesheet">
    <link href="../css/button_style.css" rel="stylesheet">
    <link href="../css/slider.css" rel="stylesheet">


    <script type="text/javascript" src="../js/script.js"></script>

    <script>
        function coloreRange(id) {

            var fine = document.getElementById(id).value;
            p = "valore"+id;

            document.getElementById(p).innerHTML = fine;

        }
    </script>


</head>

<body id="page-top">
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Filmando</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>


<%




    // Strutture parametri
    ArrayList<Integer> frasiCentroide = new ArrayList<Integer>();
    HashMap<Integer, Integer> frasiSingole = new HashMap<Integer, Integer>();
    int locale = 0;
    String stringaLocale = "";
    String configurazione = "";

    String spiegazioneCentroide = "";
    String spiegazioneSingole = "";
    String spiegazioneBaseline = "";

    int numeroContesti = 0;
    String listaContesti = "";


    HashMap<String, ArrayList<Integer>> fraseContesti = new HashMap<String, ArrayList<Integer>>();


    try{

        // Parametri metodo get
        Map<String, String[]> mappaParametri = request.getParameterMap();

        for (String parametro : mappaParametri.keySet()) {

            if (parametro.equals("centroide")){

                for (String frase : mappaParametri.get(parametro)){
                    frasiCentroide.add(Integer.parseInt(frase));

                }

            } else if (parametro.equals("frasiSingole")){

                for (String contestoFrase : mappaParametri.get(parametro)){
                    int contesto = Integer.parseInt(contestoFrase.split(":")[0]);

                    int frase = Integer.parseInt(contestoFrase.split(":")[1]);

                    frasiSingole.put(contesto, frase);

                }

            } else if (parametro.equals("locale")){


                locale = Integer.parseInt(mappaParametri.get(parametro)[0]);
                stringaLocale = mappaParametri.get(parametro)[0];

            } else if (parametro.equals("configurazione")){

                configurazione = mappaParametri.get(parametro)[0];

            }
        }

        numeroContesti = frasiSingole.size();

        boolean pC = true;
        for (int c : frasiSingole.keySet()){
            if(pC){
                pC=false;
            } else {
                listaContesti += ",";
            }
            listaContesti += c+"";
        }


        if (numeroContesti == 1){
            spiegazioneCentroide += "Ti consiglio questo film, per il contesto che hai selezionato, ";
        } else {
            spiegazioneCentroide += "Ti consiglio questo film, per i contesti che hai selezionato, ";
        }

        spiegazioneCentroide += "perchè le persone che l'hanno visto hanno detto che: <b>";
        spiegazioneSingole = "Ti consiglio questo film perchè le persone che l'hanno visto hanno detto che";


        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File(Configurazione.path+"filesFilmando/frasi singoli items/intere dat/"+locale+".dat")));
        TreeMap<Integer, String> mappaFrasi = (TreeMap<Integer, String>) ois.readObject();
        ois.close();




        for (int frase : frasiCentroide){

            String f = mappaFrasi.get(frase).trim().replace("\"","");

            if (f.charAt(f.length()-1) != '.' &&
                    f.charAt(f.length()-1) != '?' &&
                    f.charAt(f.length()-1) != '!'){
                f += ".";
            }

            spiegazioneCentroide +=  "\""+f + "\""+ " ";



        }

        spiegazioneCentroide += "</b>";

        boolean primo = true;
        int cont = 0;

        for (int c : frasiSingole.keySet()){

            if (fraseContesti.containsKey(mappaFrasi.get(frasiSingole.get(c)))){

                fraseContesti.get(mappaFrasi.get(frasiSingole.get(c))).add(c);

            } else {

                ArrayList<Integer> temp = new ArrayList<Integer>();
                fraseContesti.put(mappaFrasi.get(frasiSingole.get(c)), temp);
                fraseContesti.get(mappaFrasi.get(frasiSingole.get(c))).add(c);

            }

        }


        for (String f : fraseContesti.keySet()){

            cont++;

            if (cont == 2 || cont == 4){
                spiegazioneSingole += ", e che";
            } else if (cont == 3){
                spiegazioneSingole += "; inoltre, ";
            } else if (cont == 5){
                spiegazioneSingole += "; infine, hanno detto che ";
            }

            if (fraseContesti.get(f).size() != 1){

                String parteFraseContesti = "";

                for (int i=0; i<fraseContesti.get(f).size(); i++){

                    if (i > 0) cont++;

                    int c = fraseContesti.get(f).get(i);

                    switch (c){

                        case 1:
                            parteFraseContesti += " è un film adatto se si cerca qualcosa di impegnativo perchè:  ";
                            break;
                        case 2:
                            parteFraseContesti += " è un film adatto se si cerca qualcosa di poco impegnativo perchè: ";
                            break;
                        case 3:
                            parteFraseContesti += " è un film perfetto per passare una serata in dolce compagnia perchè: ";
                            break;
                        case 4:
                            parteFraseContesti += " è un film perfetto da vedere in famiglia, magari con i bambini perchè: ";
                            break;
                        case 5:
                            parteFraseContesti += " è un film perfetto da vedere con gli amici perchè: ";
                            break;
                        case 6:
                            parteFraseContesti += " è un film da vedere quando si è di buon umore perchè: ";
                            break;
                        case 7:
                            parteFraseContesti += " è un film da vedere quando si è di cattivo umore perchè: ";
                            break;

                    }

                    //toglire perchè a tutti quelli che non sono ultimi
                    if (i <= fraseContesti.get(f).size()-1){

                        parteFraseContesti = parteFraseContesti.split("perchè: ")[0];


                    }

                    if (i != fraseContesti.get(f).size()-1){
                        if (i < fraseContesti.get(f).size()-2){
                            parteFraseContesti += ", ";
                        } else {
                            parteFraseContesti += " ed ";
                        }
                    } else {
                        parteFraseContesti += " perchè: ";
                    }


                }

                spiegazioneSingole += parteFraseContesti + "<b>" + f +"</b>";

            } else {

                int c = fraseContesti.get(f).get(0);

                switch (c){

                    case 1:
                        spiegazioneSingole += " è un film adatto se si cerca qualcosa di impegnativo perchè:  ";
                        break;
                    case 2:
                        spiegazioneSingole += " è un film adatto se si cerca qualcosa di poco impegnativo perchè: ";
                        break;
                    case 3:
                        spiegazioneSingole += " è un film perfetto per passare una serata in dolce compagnia perchè: ";
                        break;
                    case 4:
                        spiegazioneSingole += " è un film perfetto da vedere in famiglia, magari con i bambini perchè: ";
                        break;
                    case 5:
                        spiegazioneSingole += " è un film perfetto da vedere con gli amici perchè: ";
                        break;
                    case 6:
                        spiegazioneSingole += " è un film da vedere quando si è di buon umore perchè: ";
                        break;
                    case 7:
                        spiegazioneSingole += " è un film da vedere quando si è di cattivo umore perchè: ";
                        break;

                }

                spiegazioneSingole += "<b>" + "\""+ mappaFrasi.get(frasiSingole.get(c)).replace("\"","") +"\""+"</b>";



            }

        }

        spiegazioneSingole += ".";


    } catch (Exception e){

        e.printStackTrace();

    }


%>


<header class="card text-white bg-danger mb-3">
    <div class="container text-center">
        <h1>Ecco il film che ti suggeriamo</h1>
        <p class="lead">
            <%

                try {


                    Scanner infoLocale = new Scanner(new File(Configurazione.path +"filesFilmando/info utili/" + locale + ".txt"));
                    Locale l = new Locale();

                    l.setId(Integer.parseInt(infoLocale.nextLine()));
                    l.setUrl(infoLocale.nextLine());
                    l.setNome(infoLocale.nextLine().replaceAll("'", ""));


                    out.println("<h4>" + l.getNome() +
                            "<br/><br/><img src="+l.getUrl()+"/>");



                    boolean trovato = false;
                    Scanner baseline = new Scanner(new File(Configurazione.path+"filesFilmando/baseline.txt"), "UTF-8");
                    spiegazioneBaseline = "Le persone che l'hanno visto hanno detto che:";
                  

                    while (baseline.hasNextLine()){
                        String rigaBaseline;
                      
                        rigaBaseline=baseline.nextLine();
                      

                        int localeRigaBaseline = Integer.parseInt(rigaBaseline.split(";")[0]);

                        if (locale == localeRigaBaseline){
                            int contestoBaseline = Integer.parseInt(rigaBaseline.split(";")[1]);

                            for (int contesto : frasiSingole.keySet()){
                                if (contesto == contestoBaseline){

                                    trovato = true;
                                    spiegazioneBaseline += "<br>"  + VettoriContesto.contesti.get(contesto) + ": " + "<b>" + "\"" + rigaBaseline.split(";")[2] + "\""+ "</b>";

                                }
                            }

                        }

                    }

                    baseline.close();

                    if (!trovato){
                        spiegazioneBaseline = "Il sistema non ha potuto generare alcuna spiegazione.";
                    }

                    spiegazioneBaseline.replaceAll("\"", " ");
                } catch (Exception e){
                    e.printStackTrace();
                }

            %>
        </p>
    </div>
</header>


<section id="about">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 mx-auto">
        <h2></h2>
        <p class="lead">
          <h3>Spiegazione</h3>
          <%
                out.println(spiegazioneCentroide);

            %>
        </p>
      </div>
    </div>
  </div>
</section>


<section id="services" class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <h2 align="center">Ricordando che l'obiettivo del sistema è di produrre una spiegazione adeguata ai diversi
                contesti di utilizzo,</h2>
                <p class="lead" align="center">rispondi a queste semplici domande, dove:<br>
                    - 1 indica che sei in totale disaccordo<br>
                    - 5 indica che sei in totale accordo</p>


                <form action="../salvaValutzione1" method="post">

                    <%


                        String tempo = request.getParameter("tempo").trim();

                        PrintWriter spiegazioni = new PrintWriter(Configurazione.path+"filesFilmando/temp/spiegazioni"+tempo+".txt","UTF-8");
                        spiegazioni.println(spiegazioneCentroide);
                        spiegazioni.println(spiegazioneSingole);
                        spiegazioni.println(spiegazioneBaseline);
                        spiegazioni.flush();
                        spiegazioni.close();

                        PrintWriter report = new PrintWriter(Configurazione.path+"filesFilmando/temp/report"+tempo+".txt","UTF-8");
                        report.println(tempo+";"+configurazione+";"+";"+locale+";"+numeroContesti+";"+listaContesti);
                        report.flush();
                        report.close();


                    %>

                    <div class="slidecontainer">
                        <div>Ho compreso perchè il film mi è stato suggerito:</div><div align="center" class="font-weight-bold"  id="valorepref1">3</div><br>
                        <input type="range" id="pref1" name="pref1" min="1" max="5" value="3" step="1" class="custom-range" onfocus="coloreRange(this.id)" onclick="coloreRange(this.id)" onchange="coloreRange(this.id)">
                    </div>

                    <br><br>

                    <div class="slidecontainer">
                        <div>La spiegazione ha reso il suggerimento più convincente:</div><div align="center" class="font-weight-bold" id="valorepref2">3</div><br>
                        <input type="range" id="pref2" name="pref2" min="1" max="5" value="3" step="1" class="custom-range" onfocus="coloreRange(this.id)" onclick="coloreRange(this.id)" onchange="coloreRange(this.id)">
                    </div>

                    <br><br>

                    <div class="slidecontainer">
                        <div>La spiegazione mi ha permesso di scoprire nuove informazioni relative al film:</div><div align="center" class="font-weight-bold" id="valorepref3">3</div><br>
                        <input type="range" id="pref3" name="pref3" min="1" max="5" value="3" step="1" class="custom-range" onfocus="coloreRange(this.id)" onclick="coloreRange(this.id)" onchange="coloreRange(this.id)">
                    </div>

                    <br><br>

                    <div class="slidecontainer">
                        <div>La spiegazione ha incrementato il mio livello di fiducia nel recommender system:</div><div align="center" class="font-weight-bold" id="valorepref4">3</div><br>
                        <input type="range" id="pref4" name="pref4" min="1" max="5" value="3" step="1" class="custom-range" onfocus="coloreRange(this.id)" onclick="coloreRange(this.id)" onchange="coloreRange(this.id)">
                    </div>

                <br/>
                    <div  align="center">
                        <input type="submit" id="valutazione1" value="Invia valutazione"
                               class="btn btn-danger">
                    </div>

                    <input type="hidden" id="tempo" name="tempo" value="<%out.println(tempo);%>">

                </form>
            </div>
        </div>
    </div>
</section>

<footer class="card bg-danger text-white">
    <div class="container">
        <br>
        <br>
        <h1 class="display-7", align="center">Progetto di Tesi di Laurea in Informatica e TPS</h1>
        <p class="lead", align="center">Laureando: Mirko Maselli </p>
        <p class="lead", align="center"> Relatore: dott. Cataldo Musto</p>

        <div style="padding-left:250px; padding-right:230px;">
            <a href="https://www.uniba.it/"><img align="right" src="../Logo_Uniba.png"></a>
            <a href="http://www.di.uniba.it/~swap/"><img height="60" align="center" src="../swap.PNG"></a>
        </div>

    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom JavaScript for this theme -->
<script src="../js/scrolling-nav.js"></script>

</body>

</html>
