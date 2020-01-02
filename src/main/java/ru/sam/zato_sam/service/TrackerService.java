package ru.sam.zato_sam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;
import ru.sam.zato_sam.controller.ControllerUtils;
import ru.sam.zato_sam.domain.Tracker;
import ru.sam.zato_sam.domain.User;
import ru.sam.zato_sam.repos.TrackerRepo;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Service
public class TrackerService {
    @Autowired
    private TrackerRepo trackerRepo;

    @Value("${upload.path}")
    private String uploadPath;


    public List<Tracker> getTrackers(String filter){
        List<Tracker> trackers;

        if (filter != null && !filter.isEmpty()) {
            trackers = trackerRepo.findByTrackerNameAndIsPublic(filter,true);
        } else {
            trackers = trackerRepo.findByIsPublic(true);
        }
        return trackers;
    }

    public void addTracker(User user, MultipartFile file, Map<String, String> form, Tracker tracker) throws IOException {
        tracker.setAuthor(user);
        if (form.containsKey("Видно всем")) {
            tracker.setPublic(true);
        } else
            tracker.setPublic(false);

        if (file != null && !file.getOriginalFilename().isEmpty()) { //загружаем контент
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString(); //universe uniq id
            String resultFileName = uuidFile + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFileName));

            tracker.setFilename(resultFileName);

            trackerRepo.save(tracker);
        }
    }

    public List<Tracker> getTrackersByUser(User user){return (List<Tracker>) trackerRepo.findByAuthorAndIsPublic(user, true);}

    public List<Tracker> getAllTrackers(){
        return (List<Tracker>) trackerRepo.findAll();
    }

    public void likeTracker(User user, Tracker tracker) {
        Set<Tracker> likedTrackers = user.getLikedTrackers();
        if(likedTrackers.contains(tracker)) {
            likedTrackers.remove(tracker);
        } else
            likedTrackers.add(tracker);
        user.setLikedTrackers(likedTrackers);
    }

}
