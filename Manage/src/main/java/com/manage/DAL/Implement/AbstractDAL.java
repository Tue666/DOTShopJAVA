package com.manage.DAL.Implement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.manage.Mapper.IMapper;

public class AbstractDAL {
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbUrl = "jdbc:mysql://localhost:3306/dotshop_java";
			String username = "root";
			String password = "";
			return DriverManager.getConnection(dbUrl, username, password);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	// Return list data type T
		public <T> List<T> ExecuteQuery(String query, IMapper<T> mapper, Object... params) {
			List<T> data = new ArrayList<T>();
			Connection connection = getConnection();
			try {
				PreparedStatement statement = connection.prepareStatement(query);
				setParametres(statement, params);
				ResultSet resultSet = statement.executeQuery();
				while (resultSet.next()) {
					data.add(mapper.mapRow(resultSet));
				}
				return data;
			} catch (Exception e) {
				System.out.println(e);
				return null;
			} finally {
				try {
					connection.close();
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		}

		// Return single data type T
		public <T> T ExecuteOne(String query, IMapper<T> mapper, Object... params) {
			Connection connection = getConnection();
			try {
				PreparedStatement statement = connection.prepareStatement(query);
				setParametres(statement, params);
				ResultSet resultSet = statement.executeQuery();
				resultSet.next();
				return mapper.mapRow(resultSet);
			} catch (Exception e) {
				System.out.println(e);
				return null;
			} finally {
				try {
					connection.close();
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		}

		// Return numbers of row selected
		public int ExecuteSelected(String query, Object... params) {
			Connection connection = getConnection();
			try {
				PreparedStatement statement = connection.prepareStatement(query);
				setParametres(statement, params);
				ResultSet resultSet = statement.executeQuery();
				resultSet.next();
				int total = resultSet.getInt(1);
				return total;
			} catch (Exception e) {
				System.out.println(e);
				return 0;
			} finally {
				try {
					connection.close();
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		}

		// Return ID of model that have been inserted (For auto increment ID only)
		public int ExecuteInsert(String query, Object... params) {
			Connection connection = getConnection();
			try {
				PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
				setParametres(statement, params);
				int affectedRows = statement.executeUpdate();
				if (affectedRows == 0) {
					throw new Exception("Creating failed, no rows affected.");
				}
				ResultSet generatedKeys = statement.getGeneratedKeys();
				generatedKeys.next();
				return generatedKeys.getInt(1);
			} catch (Exception e) {
				System.out.println(e);
				return 0;
			} finally {
				try {
					connection.close();
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		}

		// Returns the number of row changed
		public int ExecuteUpdate(String query, Object... params) {
			Connection connection = getConnection();
			try {
				PreparedStatement statement = connection.prepareStatement(query);
				setParametres(statement, params);
				return statement.executeUpdate();
			} catch (Exception e) {
				System.out.println(e);
				return 0;
			} finally {
				try {
					connection.close();
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		}

		private void setParametres(PreparedStatement statement, Object... params) {
			try {
				for (int i = 0; i < params.length; i++) {
					if (params[i] instanceof Integer) {
						statement.setInt(i + 1, (int) params[i]);
					} else if (params[i] instanceof String) {
						statement.setString(i + 1, (String) params[i]);
					} else if (params[i] instanceof Boolean) {
						statement.setBoolean(i + 1, (Boolean) params[i]);
					}
					// Add more type here if needed
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	
}
