package filmando;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Map;
import java.util.Scanner;

@WebServlet("/salvaValutzione1")
public class ServletSalvataggioValutazione1 extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {


        Map<String, String[]> param = request.getParameterMap();

        for (String s : param.keySet()){

            System.out.println("Parametro: " + s + " --> " + param.get(s));


        }


        String tempo = request.getParameter("tempo").trim();

        Scanner report = new Scanner(new File(Configurazione.path+"filesFilmando/temp/report"+tempo+".txt"), "UTF-8");
        String reportValutazione = report.nextLine();
        report.close();

        String pref1 = request.getParameter("pref1");
        String pref2 = request.getParameter("pref2");
        String pref3 = request.getParameter("pref3");
        String pref4 = request.getParameter("pref4");

        String output = "\n"+reportValutazione+";"+pref1+";"+pref2+";"+pref3+";"+pref4;

        Files.write(Paths.get(Configurazione.path+"filesFilmando/valutazione1.txt"), output.getBytes(), StandardOpenOption.APPEND);

        String url = "pagine/results2.jsp?tempo="+tempo;

        System.out.println("Valutazione 1:\n"+output);
        System.out.println("Salvati dati valutazione 1");

        response.sendRedirect(url);

    }

}
