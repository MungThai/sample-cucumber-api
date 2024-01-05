package runners;

import io.cucumber.testng.CucumberOptions;

@CucumberOptions(tags = {"@petstore", "not @ignore"})

public class APITest2 extends BaseRunner {}