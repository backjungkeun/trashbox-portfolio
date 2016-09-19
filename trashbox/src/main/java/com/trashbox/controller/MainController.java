package com.trashbox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	
	@RequestMapping({ "/", "/main" })
	public String main(Model model){
		/* tiles */
		model.addAttribute("headerName", "Main");
		model.addAttribute("title", "Main");
		
		return "main";
	}
	
	@RequestMapping("/accessDenied")
	public String accessDenied() throws Exception {
		return "error/accessDenied";
	}	
	
	@RequestMapping("/.well-known/acme-challenge/{key}")
	@ResponseBody
	public String letsencypt(@PathVariable String key) throws Exception {
		return key + ".lSAuRegBGSPmjAx8w4P3VTjhIzEAtZORMInFxGoTX2A";
	}

}
