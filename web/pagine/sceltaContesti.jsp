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
                <h2 align="center">Seleziona qualcosa per permettermi di consigliarti meglio il film da vedere...</h2>
                <p class="lead"></p>

                <form action="../gestioneRichiesta" method="get" name="form">

                    <%
                        String tempo = request.getParameter("tempo").trim();
                        System.out.println("tempo: " + tempo);
                    %>


                    <input type="hidden" id="tempo" name="tempo" value="<%out.println(tempo);%>">

                    <script type="text/javascript">
                        function checkButton() {
                            console.log("entra")
                            attenzione = document.form.attenzione.value;
                            umore = document.form.umore.value;
                            compagnia = document.form.compagnia.value;
                            tasto=document.getElementById('infoUtente');
                            console.log(tasto.disabled);

                            if(compagnia==0&&umore==0&&attenzione==0){
                                tasto.disabled=true;
                            }else{
                                tasto.disabled=false;
                            }
                        }

                    </script>

                    <table cellpadding="15" width="500" align="center">

                        <tr>

                            <td>

                                <h3 style="color: #c62828;">Cerco qualcosa di...</h3>
                                <div class="form-group">
                                    <select class="custom-select", name="attenzione" onchange="checkButton()" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="0">Indifferente</option>
                                        <option value="1">Impegnativo</option>
                                        <option value="2">Rilassante</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                                <br/>

                                <h3 style="color: #c62828;">Vedrò il film...</h3>
                                <div class="form-group">
                                    <select class="custom-select", name="compagnia" onchange="checkButton()" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="0">Non lo so</option>
                                        <option value="3">In coppia</option>
                                        <option value="4">In famiglia</option>
                                        <option value="5">Con amici</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                                <br/>


                                <h3 style="color: #c62828;">Oggi mi sento...</h3>
                                <div class="form-group">
                                    <select class="custom-select", name="umore" onchange="checkButton()" required>
                                        <option value="">Apri questo menù di selezione</option>
                                        <option value="0">Neutro</option>
                                        <option value="6">Felice!</option>
                                        <option value="7">Triste...</option>
                                    </select>
                                    <div class="invalid-feedback">Example invalid custom select feedback</div>
                                </div>
                            </td>
                            <td>
                                <br>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                            </td>
                            <td>
                                <br>
                            </td>
                            <td align="center">
                            </td>
                        </tr>
                        <tr >
                            <td align="center" colspan="3">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div  align="center">
                                    <input type="submit" id="infoUtente" value="Prosegui" name="tasto"
                                           class="btn btn-danger" disabled="true">
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
