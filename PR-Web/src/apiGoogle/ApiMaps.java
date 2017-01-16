package apiGoogle;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;
import model.Tuple;

import org.json.*;

public class ApiMaps {
	private static String API_Key = "AIzaSyB7AHMCAg7cGpafgiCmuGETMzWyLaiOEtg";

	
	public static float getDistance(String add1, String add2) {
		String URLString = "https://maps.googleapis.com/maps/api/directions/json?units=metric&origin="+ add1 +"&destination="+ add2 +"&key="+API_Key;
		try {
			URL url = new URL(URLString);
			URLConnection conn = url.openConnection();
			InputStream is = conn.getInputStream();
			Scanner s = new Scanner(is).useDelimiter("\\A");
			String result = s.hasNext() ? s.next() : "";
			JSONObject obj = new JSONObject(result);
			JSONArray arr = obj.getJSONArray("routes");
			obj = arr.getJSONObject(0);
			arr = (JSONArray) obj.get("legs");
			
			
			
			//Extract distance from start to end location
			obj = (JSONObject) arr.getJSONObject(0).get("distance");
			String distance = (String) obj.get("text");
			distance = distance.replace(" km", "");
			float dist = Float.parseFloat(distance);
			s.close();
			return dist;
		} catch ( IOException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public static Tuple<Location,Location> getLocation(String add1, String add2) {
		String URLString = "https://maps.googleapis.com/maps/api/directions/json?units=metric&origin="+ add1 +"&destination="+ add2 +"&key="+API_Key;
		try {
			URL url = new URL(URLString);
			URLConnection conn = url.openConnection();
			InputStream is = conn.getInputStream();
			Scanner s = new Scanner(is).useDelimiter("\\A");
			String result = s.hasNext() ? s.next() : "";
			JSONObject obj = new JSONObject(result);
			JSONArray arr = obj.getJSONArray("routes");
			obj = arr.getJSONObject(0);
			arr = (JSONArray) obj.get("legs");
		
		//Extract latitude and logitude from start and end location
		JSONObject loc1 = (JSONObject)arr.getJSONObject(0).get("start_location");
		JSONObject loc2 = (JSONObject)arr.getJSONObject(0).get("end_location");
		Location location1 = new Location((Double) loc1.get("lng"), (Double) loc1.get("lat"));
		Location location2 = new Location((Double) loc2.get("lng"), (Double) loc2.get("lat"));
		
		return new Tuple<Location, Location>(location1, location2);
		} catch ( IOException e) {
			e.printStackTrace();
		}
		return new Tuple<Location, Location>(new Location(-1.0, -1.0),new Location(-1.0, -1.0));
	}
	public static void main(String[] args) {
		getDistance("9+impasse+de+Niaux+Toulouse", "rue+camichel+Toulouse");
	}
	
}
