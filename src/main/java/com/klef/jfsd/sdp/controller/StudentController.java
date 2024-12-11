package com.klef.jfsd.sdp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Events;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping("studentlogin")
    public ModelAndView studentlogin() {
        return new ModelAndView("studentlogin");
    }

    @GetMapping("studentlogout")
    public ModelAndView studentlogout() {
        return new ModelAndView("studentlogin");
    }

    @GetMapping("studenthome")
    public ModelAndView studenthome() {
        return new ModelAndView("studenthome");
    }

    @PostMapping("checkstudentlogin")
    public ModelAndView checkstudentlogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Student student = studentService.checkstudentlogin(email, password);

        if (student != null) {
            mv.setViewName("studenthome");
        } else {
            mv.setViewName("studentloginfail");
            mv.addObject("message", "Login Failed");
        }

        return mv;
    }

    @GetMapping("stueventreg")
    public ModelAndView studentEventRegistration() {
        ModelAndView mv = new ModelAndView();

        // Fetch and filter events
        List<Events> eventList = studentService.viewAllEvents();
        mv.setViewName("stueventreg");
        mv.addObject("eventList", eventList);

        return mv;
    }

    @PostMapping("registerevent")
    public ModelAndView registerEvent(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        int eventId = Integer.parseInt(request.getParameter("eventid"));
        String studentEmail = (String) request.getSession().getAttribute("email");

        boolean registrationSuccess = studentService.registerForEvent(studentEmail, eventId); // Updated method call

        if (registrationSuccess) {
            mv.setViewName("stueventregsuccess");
            mv.addObject("registrationMessage", "Registration Successful!");
        } else {
            mv.setViewName("stueventregfail");
            mv.addObject("registrationMessage", "Registration Failed. Event might be full or already registered.");
        }

        return mv;
    }

    @GetMapping("viewregevents")
    public ModelAndView viewRegisteredEvents(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        // Get the logged-in student's email from the session
        String studentEmail = (String) request.getSession().getAttribute("email");

        // Fetch registered events for the student
        List<Events> registeredEventList = studentService.getRegisteredEventsByStudent(studentEmail);

        // Set the view name and add the registered event list to the ModelAndView
        mv.setViewName("viewregevents");
        mv.addObject("registeredEventList", registeredEventList);

        return mv;
    }

    @GetMapping("stuviewallevents")
    public ModelAndView viewAllEvents() {
        ModelAndView mv = new ModelAndView();
        List<Events> eventList = studentService.viewAllEvents();
        mv.setViewName("stuviewallevents");
        mv.addObject("eventList", eventList);
        return mv;
    }
}
