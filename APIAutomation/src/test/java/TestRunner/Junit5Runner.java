package TestRunner;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;


public class Junit5Runner {
	//@Test
	public Karate runTestusingClassPath()
	{
		return Karate.run("classpath:Featurefiles/first.feature");
		
	}
	
	@Test
	public Karate runWithBackgroundAndPath()
	{
		return Karate.run("classpath:Featurefiles/GetRequest_Basics_Matcher_FuzzyMatcher.feature","classpath:Featurefiles/Varibales.feature");
	}
}
