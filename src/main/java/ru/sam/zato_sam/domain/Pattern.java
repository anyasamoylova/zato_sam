package ru.sam.zato_sam.domain;

import javax.persistence.*;

@Entity
public class Pattern {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private String description;
    @Column(name="img_filename")
    private String imgFilename;
    @Column(name="html_filename")
    private String htmlFilename;
    @Column(name = "pdf_filename")
    private String pdfFilename;
    private String type;

    public Pattern(){

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgFilename() {
        return imgFilename;
    }

    public void setImgFilename(String imgFilename) {
        this.imgFilename = imgFilename;
    }

    public String getHtmlFilename() {
        return htmlFilename;
    }

    public void setHtmlFilename(String htmlFilename) {
        this.htmlFilename = htmlFilename;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPdfFilename() {
        return pdfFilename;
    }

    public void setPdfFilename(String pdfFilename) {
        this.pdfFilename = pdfFilename;
    }
}
