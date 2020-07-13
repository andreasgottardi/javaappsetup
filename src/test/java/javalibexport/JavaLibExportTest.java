package javalibexport;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

class JavaLibExportTest {

	@Test
	void test() {
		JavaLibExport jle = new JavaLibExport();
		SimpleModel simplemodel = new SimpleModel();
		simplemodel.setMember1("Member value 1");
		simplemodel.setMember2("Member value 2");
		simplemodel.setMember3(4711.4711);
		assertTrue(jle.methodUsingExternalLibs(simplemodel));
	}
}