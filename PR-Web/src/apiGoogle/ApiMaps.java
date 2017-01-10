package apiGoogle;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;

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
			//System.out.println(result);
			System.out.println("ici0 \n");
			JSONObject obj = new JSONObject(result);
			System.out.println("ici1 \n");
			JSONArray arr = obj.getJSONArray("routes");
			System.out.println("ici2 \n");
			obj = arr.getJSONObject(0);
			System.out.println("ici3 \n");
			arr = (JSONArray) obj.get("legs");
			System.out.println("ici4 \n");
			obj = (JSONObject) arr.getJSONObject(0).get("distance");
			System.out.println("ici5 \n");
			String distance = (String) obj.get("text");
			System.out.println("ici6 \n");
			distance = distance.replace(" km", "");
			System.out.println("ici7 \n");
			float dist = Float.parseFloat(distance);
			System.out.println("ici8 \n ");
			System.out.println("LA DISTANCE EST" + dist);
			return dist;
		} catch ( IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
	
}
