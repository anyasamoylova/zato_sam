package ru.sam.zato_sam.repos;

import org.springframework.data.repository.CrudRepository;
import ru.sam.zato_sam.domain.Pattern;

import java.util.List;

public interface PatternRepo extends CrudRepository<Pattern,Long> {
    List<Pattern> findAll();
}
