package hooks;

import io.cucumber.core.api.Scenario;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import java.io.IOException;

public class Hooks {
    @Before(order=40)
    public void startUp(Scenario scenario) throws IOException {
    }

    @After(order=40)
    public void closeDown(Scenario scenario) throws InterruptedException {
    }
}