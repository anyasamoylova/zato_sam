package ru.sam.zato_sam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
import ru.sam.zato_sam.service.TrackerService;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Map;

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

    @PostMapping("/user-trackers/{user}")
    public String add(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user,
            @Valid Tracker tracker,
            BindingResult bindingResult,
            Model model,
            @RequestParam(name = "file", required = false) MultipartFile file,
            @RequestParam (name = "str", required = false) String str) throws IOException {
        String strReturn = "redirect:/user-trackers/" + currentUser.getId();
        if (bindingResult.hasErrors()){
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            strReturn = "userTrackers";
            model.addAttribute("message", "error");
        }else {
            if (user.equals(currentUser)) {
                trackerService.addTracker(tracker, str, file, currentUser);
            }
            model.addAttribute("message", null);
        }
        model.addAttribute("trackers", currentUser.getTrackers());
        model.addAttribute("isCurrentUser", currentUser.equals(user));
        return strReturn;
    }

    @GetMapping("/user-trackers/{user}")
    public String userTrackers(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user, //запрашиваемый пользователь
            Model model) {
        List<Tracker> trackers = null;
        if(currentUser.equals(user)){
            trackers = trackerService.getTrackersByUser(currentUser);
        } else
            trackers = trackerService.getTrackersByUserPublic(user);
        model.addAttribute("trackers", trackers);
        model.addAttribute("isCurrentUser", currentUser.equals(user));
        return "userTrackers";
    }

    @GetMapping("tracker/{tracker}")
    public String tracker(
            @AuthenticationPrincipal User user,
            @PathVariable Tracker tracker,
            Model model){
        model.addAttribute("tracker", tracker);
        model.addAttribute("isPublic", tracker.isPublic());
        model.addAttribute("isCurrentUser", tracker.getAuthor().equals(user));
        return "oneTracker";
    }

    @GetMapping("/edit/{tracker}")
    public String editTracker(
            @AuthenticationPrincipal User user,
            @PathVariable Tracker tracker,
            Model model
    ){
        model.addAttribute("isPublic", tracker.isPublic());
        model.addAttribute("tracker",tracker);
        model.addAttribute("isCurrentUser",tracker.getAuthor().equals(user));
        return "editTracker";
    }


    @PostMapping("/edit/{tracker}")
    public String editTracker1(
            @AuthenticationPrincipal User user,
            @PathVariable Tracker tracker,
            @RequestParam(name = "trackerName", required = false) String trackerName,
            @RequestParam(name = "description", required = false) String description,
            @RequestParam(name = "file", required = false) MultipartFile file,
            @RequestParam(name = "isPublic", required = false) String str,
            Model model
    ) throws IOException {
        if (tracker.getAuthor().equals(user)){
            trackerService.update(tracker, trackerName, description, file, str);
        }
        model.addAttribute("tracker",tracker);
        model.addAttribute("isPublic", tracker.isPublic());
        model.addAttribute("isCurrentUser", tracker.getAuthor().equals(user));
        return "redirect:/tracker/" + tracker.getId();
    }

    @GetMapping("/delete/{tracker}")
    public String deleteTracker(
            @AuthenticationPrincipal User user,
            @PathVariable Tracker tracker,
            Model model){
        model.addAttribute("tracker",tracker);
        model.addAttribute("isCurrentUser", tracker.getAuthor().equals(user));
        return "deleteTracker";
    }

    @PostMapping("/delete")
    public String deleteTracker1(
            @RequestParam(name = "trackerId") Tracker tracker,
            @AuthenticationPrincipal User user,
            Model model
    ){
        if(user.equals(tracker.getAuthor())) {
            trackerService.deleteTracker(tracker);
            model.addAttribute("trackers", user.getTrackers());
            model.addAttribute("isCurrentUser", true);
        }
        return "redirect:/user-trackers/" + user.getId();
    }


}
