package org.spring.smarthome.web.model;

import java.util.List;
import java.util.Map;

public class State {

	private final long state_id;
	private final String domain;
	private final String entity_id;
	private final String state;
	private final String attributes;	
	//	private final String object_id;
	//	private final String name;

	public State(long state_id, String domain, String entity_id,
					String state, String attributes) {
		this.state_id = state_id;
		this.domain = domain;
		this.entity_id = entity_id;
		this.state = state;
		this.attributes = attributes;
	}

	public String getEntity_id() {
		return entity_id;
	}

	public String getDomain() {
		return domain;
	}
	public long getState_id() {
		return state_id;
	}
	public String getState() {
		return state;
	}
	public String getAttributes() {
		return attributes;
	}
}
