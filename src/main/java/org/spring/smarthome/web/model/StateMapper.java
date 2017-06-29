package org.spring.smarthome.web.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;

public class StateMapper implements RowMapper<State>{

	@Override
	public State mapRow(ResultSet rs, int rowNum) throws SQLException {
		State state = new State(
				rs.getInt("state_id"),
				rs.getString("domain"),
				rs.getString("entity_id"),
				rs.getString("state"),
				rs.getString("attributes")				
		);
		return state;	
	}
	
}
