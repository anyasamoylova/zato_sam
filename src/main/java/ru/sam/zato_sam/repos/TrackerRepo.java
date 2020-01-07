package ru.sam.zato_sam.repos;

import org.springframework.data.repository.CrudRepository;
import ru.sam.zato_sam.domain.Tracker;
import ru.sam.zato_sam.domain.User;

import java.util.List;
import java.util.Optional;

public interface TrackerRepo extends CrudRepository<Tracker,Long> {

    List<Tracker> findByTrackerNameAndIsPublic(String name, boolean isPublic);
    List<Tracker> findByIsPublic(boolean isPublic);
    List<Tracker> findByAuthorAndIsPublic(User user, boolean isPublic);
    List<Tracker> findByAuthor(User user);
}
