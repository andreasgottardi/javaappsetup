package javalibexport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

public class JavaLibExport {

	private static final Logger logger = LoggerFactory.getLogger(JavaLibExport.class);

	public boolean methodUsingExternalLibs(SimpleModel simplemodel) {
		Gson gson = new Gson();
		String json = gson.toJson(simplemodel);
		logger.info("Model serialzied: {}", json);
		return json.length() > 0;
	}

	public static void main(String[] args) {
		logger.info("Application started!");
		SimpleModel simplemodel = new SimpleModel();
		simplemodel.setMember1("Member value 1");
		simplemodel.setMember2("Member value 2");
		simplemodel.setMember3(4711.4711);
		JavaLibExport jle = new JavaLibExport();
		jle.methodUsingExternalLibs(simplemodel);
		logger.info("Application stopped!");
	}
}
