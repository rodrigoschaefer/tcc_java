package br.com.igit.tcc;
 
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;


import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONObject;

 
@Path("/tcc")
public class TccRest {
	
	
	@GET
	@Path("/db")
	@Produces("application/json")
	public Response consultaDb() {
		
		JSONArray g = conect();
		
		String result = "@Produces(\"application/json\") Output: \n\nF to C Converter Output: \n\n" + g;
		return Response.status(200).entity(result).build();
	}
 
	
	@GET
	@Path("/no_db")
	@Produces("application/json")
	public Response consultaSemDb() {
		
		String result = "[{\"id\":1,\"nome\":\"i1\"},{\"id\":2,\"nome\":\"i2\"},{\"id\":3,\"nome\":\"i3\"}]";
		return Response.status(200).entity(result).build();
		
	}
	
	
	private JSONArray conect(){
		
		Connection c = null;
		Statement stmt = null;
		JSONArray jSONArray = new JSONArray();

		System.out.println("-------- PostgreSQL "
				+ "JDBC Connection Testing ------------");

		try {

			Class.forName("org.postgresql.Driver");
//			System.out.println("PostgreSQL JDBC Driver Registered!");
			c = DriverManager.getConnection(
					"jdbc:postgresql://localhost:5432/tcc", "postgres",
					"123456");
			if (c != null) {
				System.out.println("You made it, take control your database now!");
			} else {
				System.out.println("Failed to make connection!");
			}
			stmt = c.createStatement();
			
	         ResultSet rs = stmt.executeQuery( "SELECT * FROM tb_item;" );
	         while ( rs.next() ) {
	            int id = rs.getInt("id");
	            String  nome = rs.getString("nome");
	//            System.out.println("id:"+id + " , nome:" + nome);
	            JSONObject jsonObject = new  JSONObject();
	            jsonObject.put("id", id); 
		 		jsonObject.put("nome", nome);
		 		jSONArray.put(jsonObject);
	         }
	         rs.close();
	         stmt.close();
	         c.close();
			

		} catch (SQLException e) {

		//	System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			

		} catch (ClassNotFoundException e) {

			System.out.println("Where is your PostgreSQL JDBC Driver? "
					+ "Include in your library path!");
			e.printStackTrace();
			

		}

		return jSONArray;

	}
	
}