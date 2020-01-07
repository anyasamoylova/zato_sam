package ru.sam.zato_sam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import ru.sam.zato_sam.domain.Role;
import ru.sam.zato_sam.domain.Tracker;
import ru.sam.zato_sam.domain.User;
import ru.sam.zato_sam.repos.UserRepo;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private TrackerService trackerService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public boolean addUser(User user){
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if (userFromDb != null) {
           return false;
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
        return true;
    }

    public List<User> findAll(){
        return userRepo.findAll();
    }

    public void saveUser(User user, String username, Map<String, String> form){
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);
    }

    public void updateProfile(User user, String password, String firstName, String lastName){
        if(!StringUtils.isEmpty(password)){
            user.setPassword(passwordEncoder.encode(password));
        }
        if(!StringUtils.isEmpty(firstName)){
            user.setFirstName(firstName);
        }
        if(!StringUtils.isEmpty(lastName)){
            user.setLastName(lastName);
        }
        userRepo.save(user);
    }

    public void deleteUser(User user) {
        List<Tracker> trackers = user.getTrackers();
        for (Tracker i: trackers){
            trackerService.deleteTracker(i);
        }
        userRepo.delete(user);
    }
}
