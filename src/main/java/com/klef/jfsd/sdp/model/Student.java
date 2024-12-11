package com.klef.jfsd.sdp.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "student_table")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_id")
    private int id;

    @Column(name = "student_name", nullable = false, length = 50)
    private String name;

    @Column(name = "student_password", nullable = false, length = 50)
    private String password;

    @Column(name = "student_email", nullable = false, unique = true, length = 50)
    private String email;

    @ManyToMany
    @JoinTable(
        name = "student_event", 
        joinColumns = @JoinColumn(name = "student_id"), 
        inverseJoinColumns = @JoinColumn(name = "event_id")
    )
    private List<Events> registeredEvents; // This will store the events the student has registered for

    @Column(name = "student_department", nullable = false, length = 50)
    private String department;

    @Column(name = "student_contactno", nullable = false, unique = true, length = 20)
    private String contactno;

    @Column(name = "student_gender", nullable = false, length = 10)
    private String gender;

    @Column(name = "student_dob", nullable = false, length = 20)
    private String dob;

    // Getters and setters
    public List<Events> getRegisteredEvents() {
        return registeredEvents;
    }

    public void setRegisteredEvents(List<Events> registeredEvents) {
        this.registeredEvents = registeredEvents;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getContactno() {
        return contactno;
    }

    public void setContactno(String contactno) {
        this.contactno = contactno;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
}
