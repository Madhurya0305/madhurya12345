package com.klef.jfsd.sdp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.klef.jfsd.sdp.model.Events;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.repository.EventsRepository;
import com.klef.jfsd.sdp.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private EventsRepository eventsRepository;

    @Override
    public List<Events> viewAllEvents() {
        return eventsRepository.findAll();
    }

    @Override
    public String registerForEvent(int studentId, int eventId) {
        // Logic to register the student for an event
        return "Student registered for the event successfully";
    }

    @Override
    public String updateStudent(Student student) {
        if (studentRepository.existsById(student.getId())) {
            studentRepository.save(student);
            return "Student updated successfully";
        }
        return "Student not found";
    }

    @Override
    public Student checkstudentlogin(String email, String password) {
        return studentRepository.checkstudentlogin(email, password);
    }

    @Override
    public List<Events> getRegisteredEventsByStudent(String email) {
        // Fetch student by email
        Student student = studentRepository.findByEmail(email);

        if (student != null) {
            return student.getRegisteredEvents(); // Return the registered events for this student
        }
        return null;
    }
}
