using DPMS.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using System.ComponentModel;

namespace DPMS
{
	public class Startup
	{
    public Startup(IConfiguration configuration)
    {
      Configuration = configuration;
    }


    public IConfiguration Configuration { get; }


    // This method gets called by the runtime. Use this method to add services to the container.
    // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
    public void ConfigureServices(IServiceCollection services)
		{
      //数据库连接字段
      String connectionString = Configuration.GetConnectionString("Default");
      services.AddDbContext<DPMSContext>(options => { options.UseSqlServer(connectionString); });

      //注册AutoMapper
      services.AddAutoMapper(typeof(ModelsDTO.DTOProfile));

      //注册自己的Service服务类
      services.AddControllers();
      services.AddTransient<IServices.IAdminService, Service.AdminService>();
      services.AddTransient<IServices.IDefenceNoteService, Service.DefenceNoteService>();
      services.AddTransient<IServices.IDefenceResultService, Service.DefenceResultService>();
      services.AddTransient<IServices.IDefenceService, Service.DefenceService>();
      services.AddTransient<IServices.IFileService, Service.FileService>();
      services.AddTransient<IServices.IRecorderService, Service.RecorderService>();
      services.AddTransient<IServices.IStudentService, Service.StudentService>();
      services.AddTransient<IServices.ITeacherService, Service.TeacherService>();
      services.AddTransient<IServices.IViewDefenceStuService, Service.ViewDefenceStuService>();
      services.AddTransient<IServices.IViewNoteDefenceService, Service.ViewNoteDefenceService>();
      services.AddTransient<IServices.IViewStuResultService, Service.ViewStuResultService>();



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

		// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
		public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			if (env.IsDevelopment())
			{
				app.UseDeveloperExceptionPage();
			}

			app.UseRouting();

      app.UseEndpoints(endpoints =>
      {
        endpoints.MapControllers();
      });
    }
	}
}
