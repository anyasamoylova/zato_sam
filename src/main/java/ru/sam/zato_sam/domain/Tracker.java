package ru.sam.zato_sam.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Tracker {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Пожалуйста, заполни название")
    @Length(max = 255, message = "Слишком длинное название")
    private String trackerName;
    private Integer price;
    private String filename;
    @NotNull
    @Column(name = "is_public")
    private boolean isPublic;
    @ManyToMany
    @JoinTable(
            name = "trackers_likes",
            joinColumns = {@JoinColumn(name = "tracker_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")}
    )
    private Set<User> likes = new HashSet<>();

    @ManyToOne(fetch = FetchType.EAGER) // получая сообщение, сразу же хочу получать информацию об авторе
    @JoinColumn(name = "user_id")
    private User author;

    public Tracker() {
    }

    public Long getId() {
        return id;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getAuthorName(){
        if(author != null){
            return author.getUsername();
        } else return "<none>";
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTrackerName() {
        return trackerName;
    }

    public void setTrackerName(String name) {
        this.trackerName = name;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }

    public Set<User> getLikes() {
        return likes;
    }

    public boolean hasLike (User user){
        if (likes.contains(user)){
            return true;
        }
        return false;
    }

    public void setLikes(Set<User> likes) {
        this.likes = likes;
    }
}
