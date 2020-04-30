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

<body id="page-top" onload="controlloGenerale()">

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Filmando</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>


<header class="card text-white bg-danger mb-3">
    <div class="container text-center">
        <h1>Filmando</h1>
    </div>
</header>

<section id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <h1 align="center">Mi servirebbero alcune info...</h1>
                <p class="lead"></p>

                <form action="../infoUtente" method="get">

                    <table cellpadding="15" width="500" align="center">

                        <tr>

                            <td>

                                <h4 style="color: #c62828;">Età</h4>
                             <div class="form-group">
                                    <select class="custom-select", name="eta" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="1"><18</option>
                                        <option value="2">18-25</option>
                                        <option value="3">26-35</option>
                                        <option value="4">36-50</option>
                                        <option value="5">>50</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                                <br/>

                                <h4 style="color: #c62828;">Genere</h4>
                                <div class="form-group">
                                    <select class="custom-select", name="genere" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="uomo">Uomo</option>
                                        <option value="donna">Donna</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>

                                <br/>

                                <h4 style="color: #c62828;">Titolo di studio</h4>
                                <div class="form-group">
                                    <select class="custom-select", name="titoloStudio" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="6">Diploma</option>
                                        <option value="7">Laurea Triennale</option>
                                        <option value="8">Laurea Magistrale</option>
                                        <option value="9">Dottorato di ricerca</option>
                                        <option value="10">Altro</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                                <br/>

                                <h4 style="color: #c62828;">Quante volte guardi film in settimana?</h4>

                                <div class="form-group">
                                    <select class="custom-select", name="frequenza" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="11">Nessuna o 1 volta a settimana</option>
                                        <option value="12">Da 2 a 4 volte a settimana</option>
                                        <option value="13">Da 5 a 7 volte a settimana</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                                <br/>

                                <h4 style="color: #c62828;">Hai mai usato recommender system (come Amazon, YouTube, Netflix)?</h4>
                                <div class="form-group">
                                    <select class="custom-select", name="recSys" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="14">Si</option>
                                        <option value="15">No</option>

                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>



                                <div  align="center">
                                    <input type="submit" id="infoUtente" value="Prosegui"
                                           class="btn btn-danger">
                                </div>

                            </td>
                        </tr>

                    </table>





                </form>


            </div>
        </div>
    </div>
</section>


<!-- Footer -->
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
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom JavaScript for this theme -->
<script src="js/scrolling-nav.js"></script>

</body>

</html>
