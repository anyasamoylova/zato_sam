package ru.sam.zato_sam.controller;

import com.itextpdf.html2pdf.HtmlConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.sam.zato_sam.domain.Pattern;
import ru.sam.zato_sam.repos.PatternRepo;
import ru.sam.zato_sam.service.PatternService;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class PatternController {
    @Autowired
    PatternService patternService;

    @Autowired
    PatternRepo patternRepo;

    @Value("src/uploads/pattern/pdf/")
    private String target;

    @GetMapping("/pattern")
    public String patterns(Model model){
        List<Pattern> allPatterns = patternRepo.findAll();
        model.addAttribute("patterns", allPatterns);
        return "pattern";
    }

    @GetMapping("/pattern/{pattern}")
    public String pattern(
            @PathVariable Pattern pattern,
            Model model){
        if(pattern.getType().equals("list")){
            List<String> deals = new ArrayList<>();
            for(int i = 0; i<25; i++ ){
                deals.add("deal" + i);
            }
            model.addAttribute("deals", deals);
        }
        model.addAttribute("type", pattern.getType());
        model.addAttribute("patternName", pattern.getName());
        return "onePattern";
    }

    @PostMapping("/pattern/{pattern}")
    public String pattern(
            @RequestParam(name = "personalName", required = false) String name,
            @RequestParam(name = "author", required = false) String author,
            @RequestParam(name = "icons", required = false) Integer icons,
            @RequestParam(name = "color", required = false) String color,
            @RequestParam(name = "icon", required = false) String icon,
            @RequestParam Map<String,String> form,
            @PathVariable("pattern") Pattern pattern,
            Model model) throws IOException {

        model.addAttribute("name",name);
        model.addAttribute("author", author);
        model.addAttribute("pattern", pattern);

        if (icons == null){
            icons = 1;
        }

        String html = patternService.getHtmlPattern(name,author,icons,color,icon,pattern,form);

        String pdfName = pattern.getPdfFilename();

        String dest = String.format("%s" + pdfName,target);
        HtmlConverter.convertToPdf(html,new FileOutputStream(dest));

        return "getPattern";
    }

}
