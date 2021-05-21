package bddgof;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
//@CucumberOptions(plugin = {"pretty"})
@CucumberOptions(plugin = {"pretty", "json:target/cucumber.json"}) 
public class RunCucumberTest {
    
}
