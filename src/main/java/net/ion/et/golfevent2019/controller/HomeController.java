package net.ion.et.golfevent2019.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController
{
    @GetMapping("/")
    public String home()
    {
        return "record-view";
    }

    @GetMapping("/login")
    public String login()
    {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam("userId") String userId,
                               @RequestParam("passwd") String password,
                               HttpSession session)
    {
        if (userId.equals("admin") && password.equals("1111"))
        {
            session.setAttribute("loginId", "admin");
            return "redirect:/admin";
        }
        else
        {
            return "redirect:/login";
        }
    }


    @GetMapping("/admin")
    public String admin(HttpSession session)
    {
        if (session.getAttribute("loginId") != null && session.getAttribute("loginId").equals("admin"))
            return "record-register";
        else
            return "redirect:/login";
    }
}
