package com.trashbox.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	
//	@RequestMapping(path = "/error", produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
//	@ResponseBody
//	public Map<String, Object> handle(HttpServletRequest request) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("status", request.getAttribute("javax.servlet.error.status_code"));
//		map.put("reason", request.getAttribute("javax.servlet.error.message"));
//
//
//		return map;
//	}
//	

//	@RequestMapping(path = "/error")
//	public String handle(HttpServletRequest request, Model model) {
//		
//		model.addAttribute("status", request.getAttribute("javax.servlet.error.status_code"));
//		model.addAttribute("reason", request.getAttribute("javax.servlet.error.message"));
//		
//		
//
//		return "error/default";
//	}
//	
	@RequestMapping(path = "/error")
	public String handle (HttpServletRequest request, Model model) {
		
		model.addAttribute("status", request.getAttribute("javax.servlet.error.status_code"));
		model.addAttribute("reason", request.getAttribute("javax.servlet.error.message"));
		
		

		return "error/" +  request.getAttribute("javax.servlet.error.status_code");
	}

	

}
