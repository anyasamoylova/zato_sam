package ru.sam.zato_sam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.sam.zato_sam.domain.Tracker;
import ru.sam.zato_sam.domain.User;
import ru.sam.zato_sam.repos.TrackerRepo;
import ru.sam.zato_sam.service.TrackerService;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Controller
public class TrackerController {
    @Autowired
    TrackerService trackerService;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        model.addAttribute("trackers", trackerService.getTrackers(filter));
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam("file")MultipartFile file,
            @RequestParam Map<String, String> form,
            @Valid Tracker tracker,
            BindingResult bindingResult,
            Model model) throws IOException {
        trackerService.addTracker(user,file,form,tracker);
        tracker.setAuthor(user);

        if(bindingResult.hasErrors()){
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("tracker",tracker);
        }else {
            trackerService.addTracker(user,file,form,tracker);
            model.addAttribute("tracker", null);
        }
        model.addAttribute("trackers", trackerService.getAllTrackers());

        return "main";
    }

    @GetMapping("/user-trackers/{user}")
    public String userTrackers(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user, //запрашиваемый пользователь
            Model model) {
        List<Tracker> trackers = null;
        if(currentUser.equals(user)){
            trackers = user.getTrackers();
        } else
            trackers = trackerService.getTrackersByUser(user);
        model.addAttribute("trackers", trackers);
        model.addAttribute("isCurrentUser", currentUser.equals(user));
        return "userTrackers";
    }

    @GetMapping("/like/{tracker}")
    public String likeTracker(
            @AuthenticationPrincipal User user,
            @PathVariable Tracker tracker){
        trackerService.likeTracker(user, tracker);
        return "redirect:/main";
    }

}








