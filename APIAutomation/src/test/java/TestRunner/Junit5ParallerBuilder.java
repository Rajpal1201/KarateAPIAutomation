package TestRunner;


import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner.Builder;



public class Junit5ParallerBuilder {
	@Test
	public void ParallerBuilder ()
	{
		Builder aRunner = new Builder();
		//aRunner.path("classpath:Featurefiles");
		aRunner.path("classpath:Featurefiles").tags("~@ignore");
		//To run scenarios with Jira and Regression tags-- work like logical AND
		//aRunner.path("classpath:Featurefiles").tags("@Jira", "@Regression");
		aRunner.parallel(5);
		 
		
	}
	
	
}
