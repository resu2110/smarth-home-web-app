package org.spring.smarthome.web.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer{
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// TODO Auto-generated method stub
		registry.enableSimpleBroker("/topic");	//prefix for @SendTo
		registry.setApplicationDestinationPrefixes("/app"); //desginate the PREFIX bounds for @MessageMapping
															// >> /app/hello
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry endpoint) {
		// TODO Auto-generated method stub
		endpoint.addEndpoint("/smarthome-web").withSockJS();
	}
}
