package TestRunner;


import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;



public class Junit5Runner_CucumberReport {
	@Test
	public void ParallerBuilder ()
	{
		Builder aRunner = new Builder();
		//aRunner.path("classpath:Featurefiles");
		aRunner.path("classpath:Featurefiles").outputCucumberJson(true).tags("~@ignore");
		//To run scenarios with Jira and Regression tags-- work like logical AND
		//aRunner.path("classpath:Featurefiles").tags("@Jira", "@Regression");
		Results result= aRunner.parallel(5);
		
		//To generate cucumber report
		generateCucumberReport(result.getReportDir());
		
	}
	
	private void generateCucumberReport(String reportDirLocation) {
		
		File reportDir = new File(reportDirLocation);
		Collection<File> jsonCollection= FileUtils.listFiles(reportDir, new String[] {"json"}, true);
		
		List<String> jsonFiles = new ArrayList<String>();
		jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
		
		Configuration configuration = new Configuration(reportDir, "Karate Run");
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		reportBuilder.generateReports();
		
	}
	
}
