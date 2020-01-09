package ru.sam.zato_sam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
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

    @Value("src/main/resources/uploads/")
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

    public void addTracker(Tracker tracker, String str, MultipartFile file, User user) throws IOException {
        boolean isPublic;
        if (str == null){
            isPublic = false;
        } else {
            if (str.equals("on")) {
                isPublic = true;
            } else
                isPublic = false;
        }

        tracker.setPublic(isPublic);
        tracker.setAuthor(user);
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

    public List<Tracker> getTrackersByUserPublic(User user){return trackerRepo.findByAuthorAndIsPublic(user, true);}

    @PreAuthorize("hasAuthority('PAINTER')")
    public void deleteTracker(Tracker tracker){
        File oldFile = new File (uploadPath + "/" + tracker.getFilename());
        oldFile.delete();
        trackerRepo.delete(tracker);
    }

    public List<Tracker> getTrackersByUser(User currentUser) {
        return trackerRepo.findByAuthor(currentUser);
    }

    @PreAuthorize("hasAuthority('PAINTER')")
    public void update(Tracker tracker, String trackerName, String description, MultipartFile file, String str) throws IOException {
        boolean isPublic;
        if (str == null){
            isPublic = false;
        } else {
            if (str.equals("on")) {
                isPublic = true;
            } else
                isPublic = false;
        }

        tracker.setPublic(isPublic);

        if(trackerName != null && !trackerName.isEmpty()){
            tracker.setTrackerName(trackerName);
        }

        if(description != null && !description.isEmpty()){
            tracker.setDescription(description);
        }

        if (file != null && !file.getOriginalFilename().isEmpty()) { //загружаем контент

            File oldFile = new File (uploadPath + "/" + tracker.getFilename());
            oldFile.delete();

            String uuidFile = UUID.randomUUID().toString(); //universe uniq id
            String resultFileName = uuidFile + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFileName));

            tracker.setFilename(resultFileName);
        }

        trackerRepo.save(tracker);
    }

}
