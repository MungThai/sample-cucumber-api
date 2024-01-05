package runners;

import io.cucumber.testng.CucumberOptions;

@CucumberOptions(tags = {"@github", "not @ignore"})

public class APITest3 extends BaseRunner {}