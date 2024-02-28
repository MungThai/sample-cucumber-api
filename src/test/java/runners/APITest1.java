package runners;

import io.cucumber.testng.CucumberOptions;

@CucumberOptions(tags = {"@books", "not @ignore"})

public class APITest1 extends BaseRunner {}