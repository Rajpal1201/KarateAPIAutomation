package TestRunner;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;


public class Junit5Runner {
	//@Test
	public Karate runTestusingClassPath()
	{
		return Karate.run("classpath:Featurefiles/first.feature");
		
	}
	
	//@Test
	public Karate runWithBackgroundAndPath()
	{
		return Karate.run("classpath:Featurefiles/GetRequest_Basics_Matcher_FuzzyMatcher.feature","classpath:Featurefiles/Varibales.feature","classpath:Featurefiles/PostRequest.feature");
	}
	
	//@Test
	public Karate JavaScriptExecutorRunner()
	{
		return Karate.run("classpath:Featurefiles/JavaScript_Executor.feature","classpath:Featurefiles/JsonPath.feature");
	}
	
	//@Test
	public Karate JiraAPIRunner()
	{
		return Karate.run("classpath:Featurefiles/JiraAPI_FileUpload.feature");
	}
	
	//@Test
	public Karate JiraAPIRunner_PUT()
	{
		return Karate.run("classpath:Featurefiles/JiraAPIPUT.feature");
	}
	
	@Test
		public Karate JiraAPIRunner_Delete()
		{
			return Karate.run("classpath:Featurefiles/JiraAPIDelete.feature");
		}
		
	
	@Test
	public Karate AccessingFeatureFileRunner()
	{
		return Karate.run("classpath:Featurefiles/AccessingFeatureFile.feature");
	}
}
