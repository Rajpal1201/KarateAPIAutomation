package TestRunner;


import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;


public class Junit5ParallerRunner {
	
	@Test
	public void ParallerRunner()
	{
		 
		Results result= Runner.path("classpath:Featurefiles").parallel(5);
		System.out.println(result.getFeaturesTotal());
		System.out.println(result.getScenariosTotal());
		System.out.println(result.getScenariosPassed());
		Assertions.assertEquals(0, result.getFailCount(), "There are some failed scenarios");
	}
	
	
	
}
