using Microsoft.AspNetCore.Mvc;

namespace mydotnetapi.Controllers;

[ApiController]
[Route("[controller]")]
public class HelloController : ControllerBase
{
    private readonly ILogger<HelloController> _logger;

    public HelloController(ILogger<HelloController> logger)
    {
        _logger = logger;
    }

    [HttpGet(Name = "GetHelloWorld")]
    public ActionResult Get()
    {
        _logger.Log(LogLevel.Information, "Hello Logger!");
        return Content("Hello World!");
    }
}
