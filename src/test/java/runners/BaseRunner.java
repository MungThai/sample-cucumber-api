package runners;

import automation.library.cucumber.api.RunnerClassAPISequential;
import automation.library.reporting.TextReport;
import io.cucumber.testng.CucumberOptions;
import org.testng.annotations.AfterSuite;

@CucumberOptions(
        plugin = {"automation.library.reporting.adapter.ExtentCucumberAdapter:"},
        features = {"classpath:features"},
        glue = {"steps", "hooks"}
)

public class BaseRunner extends RunnerClassAPISequential {

    //TestNG after hook
    @AfterSuite
    public void teardown() {
        TextReport tr = new TextReport();
        tr.createReport(true);
    }
}