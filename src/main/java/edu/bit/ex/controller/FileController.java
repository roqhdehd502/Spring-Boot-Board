package edu.bit.ex.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/file/*")
public class FileController {
	// private FileService fileservice;

	@GetMapping("upload")
	public ModelAndView upload_view(ModelAndView mav) {
		log.info("upload_view..");
		mav.setViewName("uploadFiles/upload_view");
		return mav;
	}

	/*
	 * @PostMapping("uploadAccess") public String upload(MultipartFile[] uploadfiles, ModelAndView mav) { String result = "";
	 * 
	 * for(MultipartFile f : uploadfiles){ result += saveFile(f); }
	 * 
	 * mav.addObject("result",result);
	 * 
	 * return "redirect:upload"; }
	 */
}