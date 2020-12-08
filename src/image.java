 

/*
* To change this template, choose Tools | Templates
* and open the template in the editor.
*/

/**
*
* @author pc
*/
import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class image {
private long i=1;
Connection connection = null;

String connectionURL = "jdbc:mysql://localhost/oass1";

ResultSet rs = null;

PreparedStatement psmnt = null;

FileInputStream fis;

String str="";
String str1 ="";
public String image_upload(String ipath,String desc,String iname){

int s=0;
try {
Class.forName("com.mysql.jdbc.Driver");

connection = DriverManager.getConnection(connectionURL, "root", "");

File image = new File(ipath);

str = "INSERT INTO image_upload(image,sid,description,imagename) VALUES(?,?,?,?)";
psmnt = connection.prepareStatement(str);
fis = new FileInputStream(image);
psmnt.setBinaryStream(1, (InputStream)fis, (int)(image.length())); //set Blob type in database of Image file if want to store in Binary form..
psmnt.setLong(2, i);
psmnt.setString(3, desc);
psmnt.setString(4, iname);
s = psmnt.executeUpdate();

if(s>0) {
//System.out.println("Uploaded successfully !");

}
else {
System.out.println("unsucessfull to upload image.");
}
return str;
} catch (FileNotFoundException ex) {
Logger.getLogger(image.class.getName()).log(Level.SEVERE, null, ex);
} catch (SQLException ex) {
Logger.getLogger(image.class.getName()).log(Level.SEVERE, null, ex);
} catch (ClassNotFoundException ex) {
Logger.getLogger(image.class.getName()).log(Level.SEVERE, null, ex);
}
return str;
}

}

