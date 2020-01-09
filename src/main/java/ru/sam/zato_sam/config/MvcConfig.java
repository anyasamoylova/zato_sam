package ru.sam.zato_sam.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {
    @Value("${upload.path}")
    private String uploadPath;

    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/img/**") //все запросы img направляем
                .addResourceLocations("classpath:/uploads/"); //вот сюда
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/"); //ресурсы будут искаться в дереве проекта
        registry.addResourceHandler("/patternImg/**")
                .addResourceLocations("classpath:/uploads/pattern/img");
        registry.addResourceHandler("/patternPdf/**")
                .addResourceLocations("classpath:/uploads/pattern/pdf");
    }
}