using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.Configuration;
using System.Configuration;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Logging;
using DPMS.Models;

namespace DPMS
{
	public class Startup
	{
    public Startup(Microsoft.Extensions.Configuration.IConfiguration configuration)
    {
      Configuration = configuration;
    }

    public Microsoft.Extensions.Configuration.IConfiguration Configuration { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices(IServiceCollection services)
    {
      String connectionString = Configuration.GetConnectionString("Default");
      services.AddDbContext<DPMSContext>(options => { options.UseSqlServer(connectionString); });

      //注册AutoMapper
      services.AddAutoMapper(typeof(ModelsDTO.DTOProfile));

      //注册自己写的Service服务类
      services.AddScoped<IServices.IDefenceService, Service.DefenceService>();


      services.AddHealthChecks();
      services.AddCors(options =>
      {
        options.AddPolicy("any", builder =>
        {
          builder.AllowAnyOrigin()
          .AllowAnyMethod()
          .AllowAnyHeader(); //允许任何来源的主机访问
        });
      });
    }



    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			if (env.IsDevelopment())
			{
				app.UseDeveloperExceptionPage();
			}

			app.UseRouting();

			app.UseEndpoints(endpoints =>
			{
				endpoints.MapGet("/", async context =>
				{
					await context.Response.WriteAsync("Hello World!");
				});
			});
		}
	}
}
