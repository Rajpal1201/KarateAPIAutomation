package Featurefiles;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class Junit5R {

	

	//@Test
	public Karate runTest()
	{
		return Karate.run("JiraBasicAuth").relativeTo(getClass());
	}
	
	//@Test
	public Karate runTestusingClassPath()
	{
		return Karate.run("classpath:Featurefiles/first.feature");
		
	}
	
	//@Test
	public Karate runTestJobApplication()
	{
		return Karate.run("JobApplication").relativeTo(getClass());
	}
	
	@Test
	public Karate runkarateConfig()
	{
		return Karate.run("KarateConfigJS").relativeTo(getClass());
	}
}
