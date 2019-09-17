package book;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class DemoDB {

	public static void main (String []args){
		try{
			Class.forName("org.postgresql.Driver");
			Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/Tutor","postgres","Nebulous1");
			PreparedStatement stmt=con.prepareStatement("Select * from class");
			ResultSet Rs=stmt.executeQuery();
			while(Rs.next()){
				System.out.println(Rs.getInt(1)+" "+Rs.getString(2));
			}
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			
		}
		
	}
	public static String insert(Profile profile){
		
		try{
			Class.forName("org.postgresql.Driver");
			    Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/Tutor","postgres","Nebulous1");
			PreparedStatement stmt=con.prepareStatement("INSERT INTO Profile (ID, Name, Email) VALUES " + "(" +profile.getID() + "," +"'"+ profile.getName()+"'" + "," +"'"+ profile.getEmail() +"'"+ ")"+" returning name");
			ResultSet Rs=stmt.executeQuery();
			while(Rs.next()){
				return Rs.getString(1);
			}
			
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			
		}
		
		return null;
	}
}
