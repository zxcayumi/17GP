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
      services.AddScoped<IServices.IAdminService, Service.AdminService>();
      services.AddScoped<IServices.IDefenceNoteService, Service.DefenceNoteService>();
      services.AddScoped<IServices.IDefenceResultService, Service.DefenceResultService>();
      services.AddScoped<IServices.IFileService, Service.FileService>();
      services.AddScoped<IServices.IRecorderService, Service.RecorderService>();
      services.AddScoped<IServices.IStudentService, Service.StudentService>();
      services.AddScoped<IServices.ITeacherService, Service.TeacherService>();



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


      //services.AddAuthentication("Bearer")
      //  .AddIdentityServerAuthentication(options =>//需引入IdentityServer4.AccessTokenValidation包//.AddJwtBearer("Bearer", options =>
      //  {
      //    //options.Authority = "https://api.zwxt.top/AuthService";    //配置Identityserver的授权地址
      //    options.RequireHttpsMetadata = true;           //不需要https    
      //    options.ApiName = "NDolls.ZWXT.CourseService";  //api的name，需要和config的名称相同
      //  });



    }



    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			if (env.IsDevelopment())
			{
        IdentityModelEventSource.ShowPII = true;
        app.UseDeveloperExceptionPage();
			}

			app.UseRouting();

      //app.UseCors("any");
      //app.UseHealthChecks("/Health");
      //app.UseAuthentication();
      //app.UseAuthorization();


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
