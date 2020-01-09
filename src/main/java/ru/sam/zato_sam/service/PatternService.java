package ru.sam.zato_sam.service;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import ru.sam.zato_sam.domain.Pattern;

import java.util.Map;

@Service
public class PatternService {
    public String getHtmlPattern(String name, String author, Integer icons, String color, String icon, Pattern pattern, Map<String, String> form) {
        String finalIcon = "";

        if (icon != ""){
            finalIcon = "<i class=\"fas fa-";
            finalIcon += icon;
            finalIcon += "\"></i>";
        } else
            finalIcon = "<i class=\"fas fa-angry\"></i>";

        if (author != ""){
            author = "Автор: " + author;
        }


        String str =  "<html lang=\"en\">\n" +
                "    <head>\n" +
                "        <meta charset=\"UTF-8\">\n" +
                "        <title>Зато сам</title>\n" +
                "\n" +
                "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n" +
                "        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.3.1/css/all.css\" integrity=\"sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU\" crossorigin=\"anonymous\">\n" +
                "        <!-- Bootstrap CSS -->\n" +
                "        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\n";
        if (color != ""){
            str += " <style>\n" +
                    "   body{\n" +
                    "    background-color:";
            str += color;
            str += ";\n"+
                    "   } \n" +
                    "  </style>";
        }
        str +=  "    </head>\n" +
                "    <body>\n" +
                "        <div class=\"container mt-5\">";
        if (name != "") {
            str += "<h1>" + name + "</h1>";
        }

        if(pattern.getType().equals("nDays")) {
            str += "<table class=\"table table-borderless\">\n" +
                    "                <tbody>";
            for (Integer i = 1; i < 16; i++) {
                Integer o = i + 15;
                str += "<tr>\n" +
                        "<th scope=\"row\">" + i.toString() + ". &ensp;";
                for (int k = 0; k < icons; k++) {
                    str += finalIcon + "&nbsp;";
                }
                str += "</th>\n" +
                        "<th scope=\"row\">" + o.toString() + ". &ensp;";
                for (int k = 0; k < icons; k++) {
                    str += finalIcon + "&nbsp;";
                }
                str += "</th>\n" +
                        "</tr>";
            }

            str += "</tbody>\n" +
                    "            </table>\n";
        }

        if(pattern.getType().equals("list")){
            str += "<ul>";
            for (int i=0; i<25; i++){
                if(!StringUtils.isEmpty(form.get("deal"+i))) {
                    str += "<li>" + form.get("deal" + i) + "</li>";
                }
            }
            str += "</ul>";
        }
        str += "<div>";
        str += author;
        str += "</div>\n" +
                "        </div>\n" +
                "    </body>\n" +
                "</html>";
        return str;
    }
}
