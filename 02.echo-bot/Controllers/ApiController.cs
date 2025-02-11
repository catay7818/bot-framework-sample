using Microsoft.AspNetCore.Mvc;

namespace Microsoft.BotBuilderSamples.Controllers
{
    [Route("api/feedback")]
    [ApiController]
    public class ApiController : ControllerBase
    {
        [HttpGet]
        public string GetAsync()
        {
            return "Hello from the API";
        }
    }
    S
}
