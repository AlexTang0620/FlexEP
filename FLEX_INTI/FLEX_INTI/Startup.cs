using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FLEX_INTI.Startup))]
namespace FLEX_INTI
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
