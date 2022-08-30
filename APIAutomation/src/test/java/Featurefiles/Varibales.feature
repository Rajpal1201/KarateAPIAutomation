Feature: Variable concepts in Karate framework

  Background: To define variables which can used in all the scenarios
   * def Global_int_var = 20
   * def Global_string_var = "Global String"

  # <Gherkin keyword> <def> <Variable name> = <value>
  # * <def> <variable_name> = <value>
  Scenario: To create a varibale
    # Use variable for repeating value
    # Storing the data from external file
    # In the matcher expression
    # Passing the data from one feature file to another
    Given def var_int = 10
    And def var_string = "Karate"
    Then print "Int Variable ==>", var_int
    And print "String variable ==>", var_string
    * def var_int2 = var_int + 10
    And print "New Variable ==>", var_int2
    And print "int Global var in Background==>", Global_int_var
     And print "String global var in Background==>", Global_string_var
    
    Scenario: To validate access of variables
     Given def var_int3 = 20
     Then print "Int variable==>", var_int3
     And print "int Global var in Background==>", Global_int_var
     And print "String global var in Background==>", Global_string_var
     And print "int var_int==>", var_int
     
     

    