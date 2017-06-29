package org.spring.smarthome.web.controller;

import org.spring.smarthome.web.dao.StateDao;
import org.spring.smarthome.web.model.State;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	StateDao stateDao;
	
	@RequestMapping(method=RequestMethod.GET)
	public String showHomePage(@PathVariable String entity_id){
	
		return "index";
		
	}
	
	@RequestMapping(value="/environment/",method=RequestMethod.GET)
	public ModelAndView showEnvironment(){
		ModelAndView model = new ModelAndView();
		model.setViewName("env");
		
		String entity_id = "sensor.mqtt_sensor";
		State st = stateDao.getStateByEntityId(entity_id);
		model.addObject("environment_midroom_photon",st);
		
		entity_id = "sensor.temperaturemidroom";
		st = stateDao.getStateByEntityId(entity_id);
		model.addObject("environment_midroom_temperature", st);
		
		entity_id = "sensor.humiditymidroom";
		st = stateDao.getStateByEntityId(entity_id);
		model.addObject("environment_midroom_humidity", st);
				
		return model;
	}
	
	
	@RequestMapping(value="/environment/midroom/temperature/{entity_id}",method=RequestMethod.GET)
	public @ResponseBody String showTemperatureMidroom(@PathVariable String entity_id){
		
		State st = stateDao.getStateByEntityId("sensor.temperaturemidroom");
		System.out.println("\nshowTemperatureMidRoomCalled\n");
		return st.getState();
	}
	
	@RequestMapping(value="/environment/midroom/humidity/{entity_id}",method=RequestMethod.GET)
	public @ResponseBody String showHumidityMidroom(@PathVariable String entity_id){
		
		State st = stateDao.getStateByEntityId("sensor.humiditymidroom");
		System.out.println("\nshowHumidityMidRoomCalled\n");
		return st.getState();
	}
	
	@RequestMapping(value="/environment/midroom/photon/{entity_id}",method=RequestMethod.GET)
	public @ResponseBody String showPhotonMidroom(@PathVariable String entity_id){
		
		State st = stateDao.getStateByEntityId("sensor.mqtt_sensor");
		System.out.println("\nshowHumidityMidRoomCalled\n");
		return st.getState();
	}
}
