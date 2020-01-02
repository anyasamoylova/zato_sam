package ru.sam.zato_sam.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.sam.zato_sam.domain.User;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
