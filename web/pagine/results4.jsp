<%@ page import="filmando.VettoriContesto" %>
<%@ page import="java.io.ObjectInputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="filmando.Locale" %>
<%@ page import="java.util.*" %>
<%@ page import="filmando.Configurazione" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

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

    <script type="text/javascript" src="../js/script.js"></script>


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
    String tempo = request.getParameter("tempo").trim();
    String pref = request.getParameter("pref").trim();
%>


<header class="card text-white bg-danger mb-3">
    <div class="container text-center">
        <h1>Filmando</h1>
    </div>
</header>


<section id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mx-auto" align="center">
                <%
                    Scanner in = new Scanner(new File(Configurazione.path+"filesFilmando/temp/spiegazioni"+tempo+".txt"), "UTF-8");

                    String spiegazione = "";
                    if (pref.equals("1")){
                        spiegazione = in.nextLine();
                        in.nextLine();
                    } else if (pref.equals("2")) {
                        in.nextLine();
                        spiegazione = in.nextLine();
                    } else {
                        if (new Random().nextInt(2) == 0){
                            spiegazione = in.nextLine();
                            in.nextLine();
                            pref="1";
                        } else {
                            in.nextLine();
                            spiegazione = in.nextLine();
                            pref="2";
                        }
                    }

                    String baseline = in.nextLine();

                    in.close();

                %>

                <h3>Spiegazione 1</h3>
                <% out.println(spiegazione); %>
                <br><br>
                <h3>Spiegazione 2</h3>
                <% out.println(baseline); %>
                <br><br>
</section>
<section class="bg-light">
                <form action="../salvaValutzione4">

                    <table width="400" align="center">

                        <tr>
                            <td align="center">
                                <h5 style="color: #c62828;">Ricordando che l'obiettivo del sistema è di produrre una spiegazione adeguata ai diversi
                                    contesti di utilizzo, quale spiegazione preferisci?</h5>
                                <div class="form-group">
                                    <select class="custom-select", name="pref0" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="0">Indifferente</option>
                                        <option value="1">Spiegazione 1</option>
                                        <option value="2">Spiegazione 2</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td align="center">
                                <br>
                                <h5 style="color: #c62828;">Indica quale delle due spiegazioni ritieni sia più appropiata alle frasi proposte.</h5>
                                <br>
                            </td>
                        </tr>

                        <tr>
                            <td align="center">
                                <h6>Ho compreso perchè il film mi è stato suggerito</h6>
                                <div class="form-group">
                                    <select class="custom-select", name="pref1" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="0">Indifferente</option>
                                        <option value="1">Spiegazione 1</option>
                                        <option value="2">Spiegazione 2</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                                <br><br>
                            </td>
                        </tr>

                        <tr>
                            <td align="center">
                                <h6>La spiegazione ha reso il suggerimento più convincente.</h6>
                                <div class="form-group">
                                    <select class="custom-select", name="pref2" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="0">Indifferente</option>
                                        <option value="1">Spiegazione 1</option>
                                        <option value="2">Spiegazione 2</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                                <br><br>
                            </td>
                        </tr>

                        <tr>
                            <td align="center">
                                <h6>La spiegazione mi ha permesso di scoprire nuove informazioni circa il film suggerito</h6>
                                <div class="form-group">
                                    <select class="custom-select", name="pref3" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="0">Indifferente</option>
                                        <option value="1">Spiegazione 1</option>
                                        <option value="2">Spiegazione 2</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                                <br><br>
                            </td>
                        </tr>

                        <tr>
                            <td align="center">
                                <h6>La spiegazione ha incrementato il mio livello di fiducia nei recommender system</h6>
                                <div class="form-group">
                                    <select class="custom-select", name="pref4" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="0">Indifferente</option>
                                        <option value="1">Spiegazione 1</option>
                                        <option value="2">Spiegazione 2</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                                <br><br>
                            </td>

                        </tr>

                        <tr>
                            <td align="center">
                                <input type="submit" id="valutazione3" value="Invia valutazione"
                                       class="btn btn-danger">
                            </td>
                        </tr>

                    </table>



                    <input type="hidden" id="precedente" name="precedente" value="<%out.println(pref);%>">
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

