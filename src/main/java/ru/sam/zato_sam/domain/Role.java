package ru.sam.zato_sam.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER, ADMIN, PAINTER;

    @Override
    public String getAuthority() {
        return name(); //строковое представление значения
    }
}
