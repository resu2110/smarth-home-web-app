package org.spring.smarthome.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.spring.smarthome.web.model.State;
import org.spring.smarthome.web.model.StateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class StateDao {
	private DataSource dataSource;
	private JdbcTemplate templateObject;

	@Autowired
	StateMapper stateMapper;
	
	public DataSource getDataSource() {
		return dataSource;
	}
	
	public State getStateByEntityId(String entity_id){
		String sql = "SELECT MAX(state_id) as state_id FROM states"
				+ " WHERE entity_id = '"+entity_id+"'";
			
		Long state_id = templateObject.queryForObject(sql, Long.class);
		sql = "SELECT state_id,domain,entity_id,state,attributes from states where state_id = "+state_id;
		
		return templateObject.queryForObject(sql, stateMapper);
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		templateObject = new JdbcTemplate(dataSource);		
	}
}
