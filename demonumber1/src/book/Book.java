package book;
//annotations,

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/profile")
public class Book {
	
	@GET 
	@Produces (MediaType.APPLICATION_JSON)
	
	public String sayHelloJSON(){
		String response="{name\" : \"ayush}";// name table name ayush is value
		return response;
	}
	
	@POST 
	public String Create(Profile profile){
		DemoDB db= new DemoDB();
		
		String results=db.insert(profile);
		return "Profile Sucessfully created for name:"+results;
		}

}

